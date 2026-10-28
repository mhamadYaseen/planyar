// Property (plan §10.6 stage 4–9): whatever the reader accepts, the planned
// writes apply — an import leaves bad records out but never aborts on a
// database constraint. Hundreds of randomly mutated backups, both modes,
// against a device that shares IDs and names with the file.
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_manifest.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_plan.dart';
import 'package:planyar/src/features/backup/domain/entities/import_report.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_reader.dart';
import 'package:planyar/src/features/backup/domain/services/import_planner.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../backup_deps.dart';
import '../backup_test_data.dart';

/// More of everything than sampleData, so mutations collide in many ways.
BackupData richData() {
  final base = sampleData();
  return base.copyWith(
    categories: [
      ...base.categories,
      category(3, 'Personal', color: 'rose'),
    ],
    labels: [
      ...base.labels,
      label(12, 'Reading', category: 3),
      label(13, 'Walk', icon: 'walk'),
    ],
    routines: [...base.routines, routine(41, label: 12)],
    routineExceptions: [
      ...base.routineExceptions,
      RoutineExceptionRecord(
        id: uuid(42),
        routineId: uuid(41),
        occurrenceDate: LocalDate(2026, 10, 25),
        type: 'skip',
        createdAt: t0,
        updatedAt: t0,
      ),
    ],
    taskSeries: [...base.taskSeries, series(39)],
    tasks: [
      ...base.tasks,
      task(34, series: 30, status: 'completed'),
      task(36, series: 39),
    ],
    taskReminders: [
      ...base.taskReminders,
      TaskReminderRecord(
        id: uuid(37),
        taskId: uuid(34),
        type: 'custom',
        customAt: Instant.parse('2026-10-30T09:00:00Z'),
        createdAt: t0,
        updatedAt: t0,
      ),
    ],
    entries: [
      ...base.entries,
      occurrence(55, routine: 40, date: '2026-10-24'),
      occurrence(56, routine: 41, date: '2026-10-25', label: 12),
      entry(57, label: 12, kind: 'planned', start: '2026-10-27T08:00:00Z', end: '2026-10-27T09:00:00Z'),
      entry(58, label: 13, start: '2026-10-27T10:00:00Z', end: '2026-10-27T10:30:00Z', note: 'park'),
      entry(
        59,
        label: 20,
        source: 'from_plan',
        plannedEntry: 55,
        start: '2026-10-24T20:30:00Z',
        end: '2026-10-25T04:00:00Z',
      ),
    ],
  );
}

/// The device: shares some IDs (changed), some names (different IDs) and has
/// records of its own.
BackupData deviceData() {
  final base = richData();
  return base.copyWith(
    labels: [
      for (final l in base.labels)
        if (l.id == uuid(13))
          label(14, 'walk', color: 'lime')
        else if (l.id == uuid(12))
          l.copyWith(colorKey: 'red', updatedAt: t1)
        else
          l,
    ],
    entries: [
      for (final e in base.entries)
        if (e.id == uuid(58))
          e.copyWith(labelId: uuid(14))
        else if (e.id == uuid(50))
          e.copyWith(note: 'edited', updatedAt: t1)
        else
          e,
      entry(80, label: 10, note: 'only here'),
      occurrence(81, routine: 41, date: '2026-10-26', label: 12),
    ],
    tasks: [
      for (final t in base.tasks)
        if (t.id == uuid(36)) t.copyWith(status: 'completed', completedAt: t1) else t,
    ],
  );
}

final _pool = <Object?>[
  null, '', ' ', '  Study  ', 'x', 'study', 'STUDY', 'Reading', 'walk', 'Imported – unknown label', //
  '\u0000', '\u0000abc', 'a\u0000', '\u0001', '\t\n', '\ud83c', 'ok 🏃', 'x' * 41, 'x' * 121, 'x' * 2001,
  0, -1, 1, 7, 8, 59, 60, 1439, 1440, 2880, 2881, -720, -721, 9999999999, 3.5, 5.0, true, false,
  <Object?>[], <String, Object?>{}, 'not-a-uuid', '2026-10-25', '2026-02-30', '2026-10-26', '2026-10-24',
  '2026-10-25T10:00:00Z', '2026-10-25T10:00:30Z', '2026-10-25T09:59:00Z', '2026-11-02T06:00:00Z',
  '1970-01-01T00:00:00Z', '2199-12-31T23:59:00Z', '2026-10-25T10:00:00+03:00',
  'planned', 'actual', 'manual', 'routine', 'from_plan', 'skip', 'modify', 'completed', 'in_progress',
  'not_started', 'custom', 'on_deadline', 'before_deadline', 'at_start', 'daily', 'weekly', 'schedule',
  'gray', 'chartreuse', 'study', 'walk', 'low', 'high',
];

void main() {
  setUpAll(tzdata.initializeTimeZones);

  test('every file the reader accepts applies cleanly, in both modes', () async {
    final random = Random(20261027);
    final deps = await BackupDeps.create();
    addTearDown(deps.close);
    await deps.seed(deviceData());
    final ids = [for (var n = 1; n < 100; n++) uuid(n)];
    final failures = <String>[];
    var applied = 0;

    for (var round = 0; round < 1500; round++) {
      final json = dataJson(richData());
      final log = <String>[];
      for (var m = 0; m < 1 + random.nextInt(4); m++) {
        final tables = BackupTable.values.map((t) => t.name).toList();
        final table = tables[random.nextInt(tables.length)];
        final rows = json[table]! as List<Object?>;
        if (rows.isEmpty) continue;
        final index = random.nextInt(rows.length);
        final row = rows[index]! as Map<String, Object?>;
        final fields = row.keys.toList();
        final field = fields[random.nextInt(fields.length)];
        switch (random.nextInt(6)) {
          case 0:
            row.remove(field);
            log.add('$table[$index].$field removed');
          case 1:
            rows.add({...row});
            log.add('$table[$index] duplicated');
          case 2:
            final other = rows[random.nextInt(rows.length)]! as Map<String, Object?>;
            row[field] = other[field];
            log.add('$table[$index].$field = another row\'s');
          case 3:
            row[field] = ids[random.nextInt(ids.length)];
            log.add('$table[$index].$field = some ID');
          default:
            final value = _pool[random.nextInt(_pool.length)];
            row[field] = value;
            log.add('$table[$index].$field = ${'$value'.length > 20 ? '${'$value'.substring(0, 20)}…' : value}');
        }
      }

      final ParsedBackup parsed;
      try {
        parsed = const BackupJsonReader().read(json);
      } on BackupFileException {
        continue; // the whole file is refused: also fine
      }
      for (final mode in ImportMode.values) {
        try {
          // Apply inside an outer transaction that is always rolled back, so
          // every round starts from the same device.
          await deps.db.transaction(() async {
            await deps.backups.applyImport(
              (current) => const ImportPlanner().plan(
                file: parsed,
                current: current,
                mode: mode,
                importSettings: true,
                now: Instant.parse('2026-10-27T12:00:00Z'),
                newId: deps.ids.newId,
              ),
            );
            applied++;
            throw const _RollBack();
          });
        } on _RollBack {
          // expected
        } on Object catch (e) {
          failures.add('round $round, ${mode.name}: ${log.join('; ')}\n  → $e');
        }
      }
    }
    expect(failures, isEmpty, reason: failures.take(5).join('\n'));
    expect(applied, greaterThan(2200), reason: 'most mutated files are still readable');
    expect(dataJson(await deps.backups.readSnapshot()), dataJson(deviceData()), reason: 'every round was rolled back');
  }, timeout: const Timeout(Duration(minutes: 3)));
}

final class _RollBack implements Exception {
  const _RollBack();
}
