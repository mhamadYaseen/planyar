import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../entities/backup_manifest.dart';
import '../entities/backup_records.dart';
import 'backup_format.dart';

/// Turns records into the `data.json` / `manifest.json` objects (plan §10.4).
///
/// The output is canonical — records sorted by ID, fields in a fixed order,
/// settings keys sorted — so the same data always gives the same bytes
/// (the round-trip test compares them). Field names are camelCase and
/// independent of database columns; instants are ISO-8601 UTC with `Z`.
abstract final class BackupJsonWriter {
  static Map<String, Object?> data(BackupData data) => {
    'categories': _sorted(data.categories, (r) => r.id).map(_category).toList(),
    'labels': _sorted(data.labels, (r) => r.id).map(_label).toList(),
    'entries': _sorted(data.entries, (r) => r.id).map(_entry).toList(),
    'routines': _sorted(data.routines, (r) => r.id).map(_routine).toList(),
    'routineExceptions': _sorted(data.routineExceptions, (r) => r.id).map(_routineException).toList(),
    'taskSeries': _sorted(data.taskSeries, (r) => r.id).map(_taskSeries).toList(),
    'tasks': _sorted(data.tasks, (r) => r.id).map(_task).toList(),
    'taskReminders': _sorted(data.taskReminders, (r) => r.id).map(_taskReminder).toList(),
    'settings': _canonical(data.settings),
  };

  static Map<String, Object?> manifest(BackupManifest m) => {
    'format': BackupFormat.name,
    'formatVersion': m.formatVersion,
    'appVersion': m.appVersion,
    'dbSchemaVersion': m.dbSchemaVersion,
    'createdAtUtc': _instant(m.createdAt),
    'deviceTimeZone': m.deviceTimeZone,
    'platform': m.platform,
    'counts': {for (final table in BackupTable.values) table.name: m.counts[table] ?? 0},
    'dataFile': BackupFormat.dataFile,
    'dataSha256': m.dataSha256,
    'encryption': BackupFormat.encryptionNone,
  };

  static Map<String, Object?> _category(CategoryRecord r) => {
    'id': r.id,
    'name': r.name,
    'colorKey': r.colorKey,
    'sortOrder': r.sortOrder,
    'createdAtUtc': _instant(r.createdAt),
    'updatedAtUtc': _instant(r.updatedAt),
  };

  static Map<String, Object?> _label(LabelRecord r) => {
    'id': r.id,
    'name': r.name,
    'colorKey': r.colorKey,
    'iconKey': r.iconKey,
    'categoryId': r.categoryId,
    'isArchived': r.isArchived,
    'sortOrder': r.sortOrder,
    'createdAtUtc': _instant(r.createdAt),
    'updatedAtUtc': _instant(r.updatedAt),
  };

  static Map<String, Object?> _entry(EntryRecord r) => {
    'id': r.id,
    'kind': r.kind,
    'labelId': r.labelId,
    'categoryOverrideId': r.categoryOverrideId,
    'startUtc': _instant(r.start),
    'endUtc': _instant(r.end),
    'tzId': r.tzId,
    'utcOffsetMin': r.utcOffsetMin,
    'note': r.note,
    'taskId': r.taskId,
    'source': r.source,
    'routineId': r.routineId,
    'occurrenceDate': _date(r.occurrenceDate),
    'plannedEntryId': r.plannedEntryId,
    'createdAtUtc': _instant(r.createdAt),
    'updatedAtUtc': _instant(r.updatedAt),
  };

  static Map<String, Object?> _routine(RoutineRecord r) => {
    'id': r.id,
    'name': r.name,
    'labelId': r.labelId,
    'startMinute': r.startMinute,
    'endMinute': r.endMinute,
    'recurrenceFreq': r.recurrenceFreq,
    'recurrenceInterval': r.recurrenceInterval,
    'weekdaysMask': r.weekdaysMask,
    'startsOn': _date(r.startsOn),
    'endsOn': _date(r.endsOn),
    'isPaused': r.isPaused,
    'isArchived': r.isArchived,
    'note': r.note,
    'reminderOffsetMin': r.reminderOffsetMin,
    'reminderIgnoreQuiet': r.reminderIgnoreQuiet,
    'createdAtUtc': _instant(r.createdAt),
    'updatedAtUtc': _instant(r.updatedAt),
  };

  static Map<String, Object?> _routineException(RoutineExceptionRecord r) => {
    'id': r.id,
    'routineId': r.routineId,
    'occurrenceDate': _date(r.occurrenceDate),
    'type': r.type,
    'startOffsetMin': r.startOffsetMin,
    'endOffsetMin': r.endOffsetMin,
    'labelId': r.labelId,
    'note': r.note,
    'createdAtUtc': _instant(r.createdAt),
    'updatedAtUtc': _instant(r.updatedAt),
  };

  static Map<String, Object?> _taskSeries(TaskSeriesRecord r) => {
    'id': r.id,
    'freq': r.freq,
    'interval': r.interval,
    'mode': r.mode,
    'anchorDate': _date(r.anchorDate),
    'endsOn': _date(r.endsOn),
    'isActive': r.isActive,
    'createdAtUtc': _instant(r.createdAt),
    'updatedAtUtc': _instant(r.updatedAt),
  };

  static Map<String, Object?> _task(TaskRecord r) => {
    'id': r.id,
    'seriesId': r.seriesId,
    'title': r.title,
    'notes': r.notes,
    'startDate': _date(r.startDate),
    'deadlineDate': _date(r.deadlineDate),
    'deadlineMinute': r.deadlineMinute,
    'status': r.status,
    'priority': r.priority,
    'categoryId': r.categoryId,
    'estimateMin': r.estimateMin,
    'actualAdjustMin': r.actualAdjustMin,
    'completedAtUtc': _instant(r.completedAt),
    'createdAtUtc': _instant(r.createdAt),
    'updatedAtUtc': _instant(r.updatedAt),
  };

  static Map<String, Object?> _taskReminder(TaskReminderRecord r) => {
    'id': r.id,
    'taskId': r.taskId,
    'type': r.type,
    'offsetDays': r.offsetDays,
    'minuteOfDay': r.minuteOfDay,
    'customAtUtc': _instant(r.customAt),
    'ignoreQuiet': r.ignoreQuiet,
    'createdAtUtc': _instant(r.createdAt),
    'updatedAtUtc': _instant(r.updatedAt),
  };

  static String? _instant(Instant? i) => i?.toString();

  static String? _date(LocalDate? d) => d?.toIso();

  static List<T> _sorted<T>(List<T> records, String Function(T) id) =>
      [...records]..sort((a, b) => id(a).compareTo(id(b)));

  /// Sorts map keys at every depth.
  static Object? _canonical(Object? value) => switch (value) {
    final Map<Object?, Object?> map => {
      for (final key in map.keys.map((k) => k.toString()).toList()..sort()) key: _canonical(map[key]),
    },
    final List<Object?> list => [for (final item in list) _canonical(item)],
    _ => value,
  };
}
