import 'package:drift/drift.dart';

import '../converters.dart';
import 'categories_labels.dart';

/// The repeat rule shared by a repeating task's instances (plan §6.10).
@DataClassName('TaskSeriesRow')
class TaskSeries extends Table {
  TextColumn get id => text()();

  /// `daily` | `weekly` | `monthly` | `yearly`.
  TextColumn get freq => text()();
  IntColumn get interval => integer()();

  /// `schedule` | `after_completion`.
  TextColumn get mode => text()();

  /// The first instance's start; defines day of month / weekday.
  TextColumn get anchorDate => text().map(const LocalDateConverter())();
  TextColumn get endsOn => text().nullable().map(const LocalDateConverter())();

  /// False after "stop repeating" or when the end is reached.
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  IntColumn get createdAt => integer().map(const InstantConverter())();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    "CHECK (freq IN ('daily', 'weekly', 'monthly', 'yearly'))",
    'CHECK (interval >= 1)',
    "CHECK (mode IN ('schedule', 'after_completion'))",
    'CHECK (ends_on IS NULL OR ends_on >= anchor_date)',
  ];
}

/// Long-term tasks (plan §7.3, TSK-*). Never shown as time blocks.
@DataClassName('TaskRow')
@TableIndex(name: 'tasks_status', columns: {#status})
@TableIndex(name: 'tasks_start_date', columns: {#startDate})
@TableIndex(name: 'tasks_deadline_date', columns: {#deadlineDate})
@TableIndex(name: 'tasks_series_id', columns: {#seriesId})
@TableIndex.sql(
  'CREATE UNIQUE INDEX tasks_one_open_per_series ON tasks (series_id) '
  "WHERE status != 'completed' AND series_id IS NOT NULL",
)
class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get seriesId => text().nullable().references(TaskSeries, #id)();
  TextColumn get title => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get startDate => text().map(const LocalDateConverter())();
  TextColumn get deadlineDate => text().nullable().map(const LocalDateConverter())();

  /// Optional time of day for the deadline, minutes since midnight.
  IntColumn get deadlineMinute => integer().nullable()();

  /// `not_started` | `in_progress` | `completed`.
  TextColumn get status => text()();

  /// `low` | `normal` | `high`.
  TextColumn get priority => text().withDefault(const Constant('normal'))();
  TextColumn get categoryId => text().nullable().references(Categories, #id)();
  IntColumn get estimateMin => integer().nullable()();

  /// Manual adjustment for unlogged work; may be negative (TSK-11).
  IntColumn get actualAdjustMin => integer().withDefault(const Constant(0))();
  IntColumn get completedAt => integer().nullable().map(const InstantConverter())();
  IntColumn get createdAt => integer().map(const InstantConverter())();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (length(title) BETWEEN 1 AND 120)',
    'CHECK (notes IS NULL OR length(notes) <= 5000)',
    'CHECK (deadline_date IS NULL OR deadline_date >= start_date)',
    'CHECK (deadline_minute IS NULL OR '
        '(deadline_date IS NOT NULL AND deadline_minute BETWEEN 0 AND 1439))',
    "CHECK (status IN ('not_started', 'in_progress', 'completed'))",
    "CHECK (priority IN ('low', 'normal', 'high'))",
    'CHECK (estimate_min IS NULL OR estimate_min > 0)',
    "CHECK ((status = 'completed') = (completed_at IS NOT NULL))",
  ];
}

/// Up to three reminders per task (plan §7.3, TSK-09).
@DataClassName('TaskReminderRow')
@TableIndex(name: 'task_reminders_task_id', columns: {#taskId})
class TaskReminders extends Table {
  TextColumn get id => text()();
  TextColumn get taskId => text().references(Tasks, #id, onDelete: KeyAction.cascade)();

  /// `at_start` | `before_deadline` | `on_deadline` | `custom`.
  TextColumn get type => text()();

  /// Days before the deadline, for `before_deadline` (1–30).
  IntColumn get offsetDays => integer().nullable()();

  /// Time of day for the relative types.
  IntColumn get minuteOfDay => integer().nullable()();
  IntColumn get customAtUtc => integer().nullable().map(const InstantConverter())();
  BoolColumn get ignoreQuiet => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer().map(const InstantConverter())();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (minute_of_day IS NULL OR minute_of_day BETWEEN 0 AND 1439)',
    "CHECK ((type = 'custom' AND custom_at_utc IS NOT NULL AND offset_days IS NULL) "
        "OR (type IN ('at_start', 'on_deadline') AND minute_of_day IS NOT NULL "
        'AND offset_days IS NULL AND custom_at_utc IS NULL) '
        "OR (type = 'before_deadline' AND offset_days IS NOT NULL AND offset_days BETWEEN 1 AND 30 "
        'AND minute_of_day IS NOT NULL AND custom_at_utc IS NULL))',
  ];
}
