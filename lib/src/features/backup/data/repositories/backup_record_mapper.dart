import '../../../../core/database/app_database.dart';
import '../../../labels/domain/services/label_rules.dart';
import '../../domain/entities/backup_records.dart';

/// Database rows ↔ backup records (field for field). Derived columns
/// (`nameKey`) are recomputed; device-only ones (`generatedThrough`) are left
/// out on export and cleared on import, so the next routine run
/// regenerates occurrences (§10.4).
///
/// Records go into the database as companions with **every** column
/// present (`toCompanion(false)`): an upsert of a data class would leave out
/// its null columns, so an overwrite couldn't clear a field (a removed note,
/// a reopened task's completion time).
abstract final class BackupRecordMapper {
  static CategoryRecord category(CategoryRow r) => CategoryRecord(
    id: r.id,
    name: r.name,
    colorKey: r.colorKey,
    sortOrder: r.sortOrder,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );

  static CategoriesCompanion categoryRow(CategoryRecord r) => CategoryRow(
    id: r.id,
    name: r.name,
    nameKey: LabelRules.nameKeyOf(r.name),
    colorKey: r.colorKey,
    sortOrder: r.sortOrder,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  ).toCompanion(false);

  static LabelRecord label(LabelRow r) => LabelRecord(
    id: r.id,
    name: r.name,
    colorKey: r.colorKey,
    iconKey: r.iconKey,
    categoryId: r.categoryId,
    isArchived: r.isArchived,
    sortOrder: r.sortOrder,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );

  static LabelsCompanion labelRow(LabelRecord r) => LabelRow(
    id: r.id,
    name: r.name,
    nameKey: LabelRules.nameKeyOf(r.name),
    colorKey: r.colorKey,
    iconKey: r.iconKey,
    categoryId: r.categoryId,
    isArchived: r.isArchived,
    sortOrder: r.sortOrder,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  ).toCompanion(false);

  static EntryRecord entry(EntryRow r) => EntryRecord(
    id: r.id,
    kind: r.kind,
    labelId: r.labelId,
    categoryOverrideId: r.categoryOverrideId,
    start: r.startUtc,
    end: r.endUtc,
    tzId: r.tzId,
    utcOffsetMin: r.utcOffsetMin,
    note: r.note,
    taskId: r.taskId,
    source: r.source,
    routineId: r.routineId,
    occurrenceDate: r.occurrenceDate,
    plannedEntryId: r.plannedEntryId,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );

  static EntriesCompanion entryRow(EntryRecord r) => EntryRow(
    id: r.id,
    kind: r.kind,
    labelId: r.labelId,
    categoryOverrideId: r.categoryOverrideId,
    startUtc: r.start,
    endUtc: r.end,
    tzId: r.tzId,
    utcOffsetMin: r.utcOffsetMin,
    note: r.note,
    taskId: r.taskId,
    source: r.source,
    routineId: r.routineId,
    occurrenceDate: r.occurrenceDate,
    plannedEntryId: r.plannedEntryId,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  ).toCompanion(false);

  static RoutineRecord routine(RoutineRow r) => RoutineRecord(
    id: r.id,
    name: r.name,
    labelId: r.labelId,
    startMinute: r.startMinute,
    endMinute: r.endMinute,
    recurrenceFreq: r.recurrenceFreq,
    recurrenceInterval: r.recurrenceInterval,
    weekdaysMask: r.weekdaysMask,
    startsOn: r.startsOn,
    endsOn: r.endsOn,
    isPaused: r.isPaused,
    isArchived: r.isArchived,
    note: r.note,
    reminderOffsetMin: r.reminderOffsetMin,
    reminderIgnoreQuiet: r.reminderIgnoreQuiet,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );

  static RoutinesCompanion routineRow(RoutineRecord r) => RoutineRow(
    id: r.id,
    name: r.name,
    labelId: r.labelId,
    startMinute: r.startMinute,
    endMinute: r.endMinute,
    recurrenceFreq: r.recurrenceFreq,
    recurrenceInterval: r.recurrenceInterval,
    weekdaysMask: r.weekdaysMask,
    startsOn: r.startsOn,
    endsOn: r.endsOn,
    isPaused: r.isPaused,
    isArchived: r.isArchived,
    note: r.note,
    reminderOffsetMin: r.reminderOffsetMin,
    reminderIgnoreQuiet: r.reminderIgnoreQuiet,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  ).toCompanion(false);

  static RoutineExceptionRecord routineException(RoutineExceptionRow r) => RoutineExceptionRecord(
    id: r.id,
    routineId: r.routineId,
    occurrenceDate: r.occurrenceDate,
    type: r.type,
    startOffsetMin: r.startOffsetMin,
    endOffsetMin: r.endOffsetMin,
    labelId: r.labelId,
    note: r.note,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );

  static RoutineExceptionsCompanion routineExceptionRow(RoutineExceptionRecord r) => RoutineExceptionRow(
    id: r.id,
    routineId: r.routineId,
    occurrenceDate: r.occurrenceDate,
    type: r.type,
    startOffsetMin: r.startOffsetMin,
    endOffsetMin: r.endOffsetMin,
    labelId: r.labelId,
    note: r.note,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  ).toCompanion(false);

  static TaskSeriesRecord taskSeries(TaskSeriesRow r) => TaskSeriesRecord(
    id: r.id,
    freq: r.freq,
    interval: r.interval,
    mode: r.mode,
    anchorDate: r.anchorDate,
    endsOn: r.endsOn,
    isActive: r.isActive,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );

  static TaskSeriesCompanion taskSeriesRow(TaskSeriesRecord r) => TaskSeriesRow(
    id: r.id,
    freq: r.freq,
    interval: r.interval,
    mode: r.mode,
    anchorDate: r.anchorDate,
    endsOn: r.endsOn,
    isActive: r.isActive,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  ).toCompanion(false);

  static TaskRecord task(TaskRow r) => TaskRecord(
    id: r.id,
    seriesId: r.seriesId,
    title: r.title,
    notes: r.notes,
    startDate: r.startDate,
    deadlineDate: r.deadlineDate,
    deadlineMinute: r.deadlineMinute,
    status: r.status,
    priority: r.priority,
    categoryId: r.categoryId,
    estimateMin: r.estimateMin,
    actualAdjustMin: r.actualAdjustMin,
    completedAt: r.completedAt,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );

  static TasksCompanion taskRow(TaskRecord r) => TaskRow(
    id: r.id,
    seriesId: r.seriesId,
    title: r.title,
    notes: r.notes,
    startDate: r.startDate,
    deadlineDate: r.deadlineDate,
    deadlineMinute: r.deadlineMinute,
    status: r.status,
    priority: r.priority,
    categoryId: r.categoryId,
    estimateMin: r.estimateMin,
    actualAdjustMin: r.actualAdjustMin,
    completedAt: r.completedAt,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  ).toCompanion(false);

  static TaskReminderRecord taskReminder(TaskReminderRow r) => TaskReminderRecord(
    id: r.id,
    taskId: r.taskId,
    type: r.type,
    offsetDays: r.offsetDays,
    minuteOfDay: r.minuteOfDay,
    customAt: r.customAtUtc,
    ignoreQuiet: r.ignoreQuiet,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );

  static TaskRemindersCompanion taskReminderRow(TaskReminderRecord r) => TaskReminderRow(
    id: r.id,
    taskId: r.taskId,
    type: r.type,
    offsetDays: r.offsetDays,
    minuteOfDay: r.minuteOfDay,
    customAtUtc: r.customAt,
    ignoreQuiet: r.ignoreQuiet,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  ).toCompanion(false);
}
