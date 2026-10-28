import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';

part 'backup_records.freezed.dart';

/// The record arrays of a backup (plan §10.4), in **dependency order**: an
/// import inserts them in this order (§10.6 stage 9). The names are the JSON
/// keys of `data.json` and of the manifest's `counts`.
enum BackupTable { categories, labels, taskSeries, tasks, taskReminders, routines, routineExceptions, entries }

// The records mirror the database rows field for field, minus device-only
// columns (`generatedThrough`) and derived ones (`nameKey`). They are their
// own layer (§7.5): feature entities can change without changing the file.
// Enum-like fields hold their file/database strings (`'actual'`,
// `'from_plan'`, …); the reader checks them against `BackupFormat`.

@freezed
abstract class CategoryRecord with _$CategoryRecord {
  const factory CategoryRecord({
    required String id,
    required String name,
    String? colorKey,
    @Default(0) int sortOrder,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _CategoryRecord;
}

@freezed
abstract class LabelRecord with _$LabelRecord {
  const factory LabelRecord({
    required String id,
    required String name,
    required String colorKey,
    String? iconKey,
    String? categoryId,
    @Default(false) bool isArchived,
    @Default(0) int sortOrder,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _LabelRecord;
}

@freezed
abstract class EntryRecord with _$EntryRecord {
  const factory EntryRecord({
    required String id,

    /// `planned` | `actual`.
    required String kind,
    required String labelId,
    String? categoryOverrideId,
    required Instant start,

    /// Null for an open entry.
    Instant? end,
    required String tzId,
    required int utcOffsetMin,
    String? note,
    String? taskId,

    /// `manual` | `routine` | `from_plan`.
    required String source,
    String? routineId,
    LocalDate? occurrenceDate,
    String? plannedEntryId,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _EntryRecord;
}

@freezed
abstract class RoutineRecord with _$RoutineRecord {
  const factory RoutineRecord({
    required String id,
    String? name,
    required String labelId,
    required int startMinute,
    required int endMinute,
    @Default('daily') String recurrenceFreq,
    @Default(1) int recurrenceInterval,
    int? weekdaysMask,
    required LocalDate startsOn,
    LocalDate? endsOn,
    @Default(false) bool isPaused,
    @Default(false) bool isArchived,
    String? note,
    int? reminderOffsetMin,
    @Default(false) bool reminderIgnoreQuiet,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _RoutineRecord;
}

@freezed
abstract class RoutineExceptionRecord with _$RoutineExceptionRecord {
  const factory RoutineExceptionRecord({
    required String id,
    required String routineId,
    required LocalDate occurrenceDate,

    /// `skip` | `modify`.
    required String type,
    int? startOffsetMin,
    int? endOffsetMin,
    String? labelId,
    String? note,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _RoutineExceptionRecord;
}

@freezed
abstract class TaskSeriesRecord with _$TaskSeriesRecord {
  const factory TaskSeriesRecord({
    required String id,

    /// `daily` | `weekly` | `monthly` | `yearly`.
    required String freq,
    required int interval,

    /// `schedule` | `after_completion`.
    required String mode,
    required LocalDate anchorDate,
    LocalDate? endsOn,
    @Default(true) bool isActive,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _TaskSeriesRecord;
}

@freezed
abstract class TaskRecord with _$TaskRecord {
  const factory TaskRecord({
    required String id,
    String? seriesId,
    required String title,
    String? notes,
    required LocalDate startDate,
    LocalDate? deadlineDate,
    int? deadlineMinute,

    /// `not_started` | `in_progress` | `completed`.
    required String status,

    /// `low` | `normal` | `high`.
    @Default('normal') String priority,
    String? categoryId,
    int? estimateMin,
    @Default(0) int actualAdjustMin,
    Instant? completedAt,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _TaskRecord;

  const TaskRecord._();

  bool get isOpen => status != 'completed';
}

@freezed
abstract class TaskReminderRecord with _$TaskReminderRecord {
  const factory TaskReminderRecord({
    required String id,
    required String taskId,

    /// `at_start` | `before_deadline` | `on_deadline` | `custom`.
    required String type,
    int? offsetDays,
    int? minuteOfDay,
    Instant? customAt,
    @Default(false) bool ignoreQuiet,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _TaskReminderRecord;
}

/// Everything a backup holds: every record plus the portable settings
/// (key → decoded JSON value).
@freezed
abstract class BackupData with _$BackupData {
  const factory BackupData({
    @Default(<CategoryRecord>[]) List<CategoryRecord> categories,
    @Default(<LabelRecord>[]) List<LabelRecord> labels,
    @Default(<TaskSeriesRecord>[]) List<TaskSeriesRecord> taskSeries,
    @Default(<TaskRecord>[]) List<TaskRecord> tasks,
    @Default(<TaskReminderRecord>[]) List<TaskReminderRecord> taskReminders,
    @Default(<RoutineRecord>[]) List<RoutineRecord> routines,
    @Default(<RoutineExceptionRecord>[]) List<RoutineExceptionRecord> routineExceptions,
    @Default(<EntryRecord>[]) List<EntryRecord> entries,
    @Default(<String, Object?>{}) Map<String, Object?> settings,
  }) = _BackupData;

  const BackupData._();

  int countOf(BackupTable table) => switch (table) {
    BackupTable.categories => categories.length,
    BackupTable.labels => labels.length,
    BackupTable.taskSeries => taskSeries.length,
    BackupTable.tasks => tasks.length,
    BackupTable.taskReminders => taskReminders.length,
    BackupTable.routines => routines.length,
    BackupTable.routineExceptions => routineExceptions.length,
    BackupTable.entries => entries.length,
  };

  Map<BackupTable, int> get counts => {for (final table in BackupTable.values) table: countOf(table)};

  /// True when there are no records (settings don't count).
  bool get hasNoRecords => BackupTable.values.every((t) => countOf(t) == 0);
}
