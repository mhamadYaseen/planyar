import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables/categories_labels.dart';
import '../../../../core/database/tables/entries.dart';
import '../../../../core/database/tables/routines.dart';
import '../../../../core/database/tables/settings_notifications.dart';
import '../../../../core/database/tables/tasks.dart';
import '../../../../core/time/instant.dart';
import '../../../settings/domain/entities/setting_keys.dart';
import '../../domain/entities/backup_records.dart';
import '../../domain/entities/import_plan.dart';
import '../repositories/backup_record_mapper.dart';

part 'backup_dao.g.dart';

/// Whole-database reads and writes for backups (plan §10.5–10.7, SET-06).
@DriftAccessor(
  tables: [
    Categories,
    Labels,
    Entries,
    Routines,
    RoutineExceptions,
    TaskSeries,
    Tasks,
    TaskReminders,
    Settings,
    ScheduledNotifications,
  ],
)
class BackupDao extends DatabaseAccessor<AppDatabase> with _$BackupDaoMixin {
  BackupDao(super.attachedDatabase);

  static const _portable = 'portable';
  static const _device = 'device';

  /// SQLite's bound-variable limit is far higher; small chunks keep
  /// statements cheap to prepare.
  static const _chunk = 500;

  /// Children before parents, so RESTRICT foreign keys never fire.
  static const _deleteOrder = [
    'entries',
    'routine_exceptions',
    'routines',
    'task_reminders',
    'tasks',
    'task_series',
    'labels',
    'categories',
  ];

  Future<BackupData> readSnapshot() => transaction(_readAll);

  /// Every table ordered by ID, so equal data gives equal snapshots.
  Future<BackupData> _readAll() async {
    final portable = await (select(settings)..where((s) => s.scope.equals(_portable))).get();
    return BackupData(
      categories: [for (final r in await _all(categories, (t) => t.id)) BackupRecordMapper.category(r)],
      labels: [for (final r in await _all(labels, (t) => t.id)) BackupRecordMapper.label(r)],
      taskSeries: [for (final r in await _all(taskSeries, (t) => t.id)) BackupRecordMapper.taskSeries(r)],
      tasks: [for (final r in await _all(tasks, (t) => t.id)) BackupRecordMapper.task(r)],
      taskReminders: [for (final r in await _all(taskReminders, (t) => t.id)) BackupRecordMapper.taskReminder(r)],
      routines: [for (final r in await _all(routines, (t) => t.id)) BackupRecordMapper.routine(r)],
      routineExceptions: [
        for (final r in await _all(routineExceptions, (t) => t.id)) BackupRecordMapper.routineException(r),
      ],
      entries: [for (final r in await _all(entries, (t) => t.id)) BackupRecordMapper.entry(r)],
      settings: {
        for (final row in portable)
          if (SettingKeys.portable.contains(row.key))
            if (_decode(row.value) case (final Object value,)) row.key: value,
      },
    );
  }

  Future<List<R>> _all<T extends Table, R>(TableInfo<T, R> table, Expression<String> Function(T) id) =>
      (select(table)..orderBy([(t) => OrderingTerm(expression: id(t))])).get();

  /// A JSON value as a one-record, or null when it doesn't decode (a corrupt
  /// setting is left out rather than failing the export).
  static (Object,)? _decode(String json) {
    try {
      final value = jsonDecode(json);
      return value == null ? null : (value as Object,);
    } on FormatException {
      return null;
    }
  }

  Future<bool> hasRecords() async {
    final query = _deleteOrder.map((t) => 'EXISTS (SELECT 1 FROM $t)').join(' OR ');
    final row = await customSelect('SELECT ($query) AS any_rows').getSingle();
    return row.read<bool>('any_rows');
  }

  /// One write transaction (plan §10.6 stage 9): foreign keys are checked at
  /// commit; unique keys of rows about to be overwritten are freed first, so
  /// renames, name swaps and moved occurrences can't collide midway; rows are
  /// upserted by primary key (ON CONFLICT DO UPDATE — never REPLACE, which
  /// would fire ON DELETE actions). Any error rolls everything back.
  Future<ImportPlan> applyImport(ImportPlan Function(BackupData current) planFor) => transaction(() async {
    await customStatement('PRAGMA defer_foreign_keys = ON');
    // The check below is database-wide: compare with what was there before,
    // so an old orphan (e.g. left by a migration) can't block every import.
    final violationsBefore = await _foreignKeyViolations();
    final plan = planFor(await _readAll());
    final up = plan.upserts;
    final now = Instant.now();

    if (plan.replaceAll) {
      await _deleteAllRecords();
      await (delete(settings)..where((s) => s.scope.equals(_portable))).go();
    } else {
      await _deleteWhereIdIn('entries', plan.deleteEntryIds);
      await _deleteWhereIdIn('routine_exceptions', plan.deleteRoutineExceptionIds);
      // Park the unique keys of existing rows that are about to change. A
      // leading space can never start a real key (names are trimmed).
      await _updateWhereIdIn("labels SET name_key = ' ' || id", up.labels.map((r) => r.id));
      await _updateWhereIdIn("categories SET name_key = ' ' || id", up.categories.map((r) => r.id));
      await _updateWhereIdIn('tasks SET series_id = NULL', up.tasks.map((r) => r.id));
      // Every upserted entry that is an occurrence now (even if the file
      // turns it into something else).
      await _updateWhereIdIn(
        "entries SET occurrence_date = '~' || id",
        up.entries.map((r) => r.id),
        extraCondition: 'routine_id IS NOT NULL',
      );
      await _updateWhereIdIn(
        "routine_exceptions SET occurrence_date = '~' || id",
        up.routineExceptions.map((r) => r.id),
      );
    }

    await batch((b) {
      b
        ..insertAllOnConflictUpdate(categories, up.categories.map(BackupRecordMapper.categoryRow))
        ..insertAllOnConflictUpdate(labels, up.labels.map(BackupRecordMapper.labelRow))
        ..insertAllOnConflictUpdate(taskSeries, up.taskSeries.map(BackupRecordMapper.taskSeriesRow))
        // Tasks that leave a series' open slot go before ones that take it.
        ..insertAllOnConflictUpdate(tasks, [
          for (final t in up.tasks)
            if (!t.isOpen || t.seriesId == null) BackupRecordMapper.taskRow(t),
          for (final t in up.tasks)
            if (t.isOpen && t.seriesId != null) BackupRecordMapper.taskRow(t),
        ])
        ..insertAllOnConflictUpdate(taskReminders, up.taskReminders.map(BackupRecordMapper.taskReminderRow))
        ..insertAllOnConflictUpdate(routines, up.routines.map(BackupRecordMapper.routineRow))
        ..insertAllOnConflictUpdate(routineExceptions, up.routineExceptions.map(BackupRecordMapper.routineExceptionRow))
        ..insertAllOnConflictUpdate(entries, up.entries.map(BackupRecordMapper.entryRow));
      if (plan.settings case final imported?) {
        b.insertAllOnConflictUpdate(settings, [
          for (final MapEntry(:key, :value) in imported.entries)
            if (SettingKeys.portable.contains(key))
              SettingsCompanion.insert(key: key, value: jsonEncode(value), scope: _portable, updatedAt: now),
        ]);
      }
    });

    final added = (await _foreignKeyViolations()).difference(violationsBefore);
    if (added.isNotEmpty) throw StateError('Import left ${added.length} broken references, e.g. ${added.first}');
    return plan;
  });

  Future<Set<String>> _foreignKeyViolations() async => {
    for (final row in await customSelect('PRAGMA foreign_key_check').get()) row.data.values.join('|'),
  };

  /// Deletes every record and setting, and the notification ledger (SET-06).
  Future<void> eraseAll() => transaction(() async {
    await customStatement('PRAGMA defer_foreign_keys = ON');
    await _deleteAllRecords();
    await delete(settings).go();
    await delete(scheduledNotifications).go();
  });

  Future<bool> quickCheck() async {
    final rows = await customSelect('PRAGMA quick_check').get();
    return rows.length == 1 && rows.single.data.values.single == 'ok';
  }

  Stream<List<SettingRow>> watchSettings(List<String> keys) =>
      (select(settings)..where((s) => s.key.isIn(keys))).watch();

  Future<SettingRow?> setting(String key) => (select(settings)..where((s) => s.key.equals(key))).getSingleOrNull();

  Future<void> putDeviceSetting(String key, Object value) => into(settings)
      .insertOnConflictUpdate(SettingRow(key: key, value: jsonEncode(value), scope: _device, updatedAt: Instant.now()));

  Future<void> _deleteAllRecords() async {
    for (final table in _deleteOrder) {
      await customStatement('DELETE FROM $table');
    }
  }

  Future<void> _deleteWhereIdIn(String table, Iterable<String> ids) =>
      _forChunks(ids, (marks, args) => customStatement('DELETE FROM $table WHERE id IN ($marks)', args));

  /// `UPDATE <assignment> WHERE id IN (…)`; rows that don't exist are
  /// simply not matched.
  Future<void> _updateWhereIdIn(String assignment, Iterable<String> ids, {String? extraCondition}) => _forChunks(
    ids,
    (marks, args) => customStatement(
      'UPDATE $assignment WHERE id IN ($marks)${extraCondition == null ? '' : ' AND $extraCondition'}',
      args,
    ),
  );

  static Future<void> _forChunks(
    Iterable<String> ids,
    Future<void> Function(String marks, List<Object> args) run,
  ) async {
    final all = ids.toList();
    for (var i = 0; i < all.length; i += _chunk) {
      final part = all.sublist(i, i + _chunk > all.length ? all.length : i + _chunk);
      await run(List.filled(part.length, '?').join(', '), part);
    }
  }
}
