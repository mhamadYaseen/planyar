import 'package:drift/drift.dart';

import '../converters.dart';
import 'categories_labels.dart';

/// Repeating templates (plan §7.3, RTN-*). Not entries themselves.
@DataClassName('RoutineRow')
@TableIndex(name: 'routines_label_id', columns: {#labelId})
class Routines extends Table {
  TextColumn get id => text()();

  /// Defaults to the label name in the UI.
  TextColumn get name => text().nullable()();
  TextColumn get labelId => text().references(Labels, #id, onDelete: KeyAction.restrict)();

  /// Minutes since local midnight. `end ≤ start` means it ends the next day.
  IntColumn get startMinute => integer()();
  IntColumn get endMinute => integer()();

  /// `daily` in v1; weekdays come later through [weekdaysMask].
  TextColumn get recurrenceFreq => text().withDefault(const Constant('daily'))();
  IntColumn get recurrenceInterval => integer().withDefault(const Constant(1))();
  IntColumn get weekdaysMask => integer().nullable()();
  TextColumn get startsOn => text().map(const LocalDateConverter())();
  TextColumn get endsOn => text().nullable().map(const LocalDateConverter())();
  BoolColumn get isPaused => boolean().withDefault(const Constant(false))();

  /// Ended / deleted-with-history routines.
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  TextColumn get note => text().nullable()();

  /// NULL = off; 0 = at start; 5–60 = minutes before.
  IntColumn get reminderOffsetMin => integer().nullable()();
  BoolColumn get reminderIgnoreQuiet => boolean().withDefault(const Constant(false))();

  /// Device bookkeeping; never imported (recomputed).
  TextColumn get generatedThrough => text().nullable().map(const LocalDateConverter())();
  IntColumn get createdAt => integer().map(const InstantConverter())();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (name IS NULL OR length(name) BETWEEN 1 AND 60)',
    'CHECK (start_minute BETWEEN 0 AND 1439)',
    'CHECK (end_minute BETWEEN 0 AND 1439)',
    'CHECK (start_minute != end_minute)',
    "CHECK (recurrence_freq IN ('daily'))",
    'CHECK (recurrence_interval >= 1)',
    'CHECK (weekdays_mask IS NULL OR weekdays_mask BETWEEN 1 AND 127)',
    'CHECK (ends_on IS NULL OR ends_on >= starts_on)',
    'CHECK (reminder_offset_min IS NULL OR reminder_offset_min BETWEEN 0 AND 60)',
    'CHECK (note IS NULL OR length(note) <= 2000)',
  ];
}

/// One-day changes to a routine occurrence: skip or modify (plan §6.7).
@DataClassName('RoutineExceptionRow')
class RoutineExceptions extends Table {
  TextColumn get id => text()();
  TextColumn get routineId => text().references(Routines, #id, onDelete: KeyAction.cascade)();
  TextColumn get occurrenceDate => text().map(const LocalDateConverter())();

  /// `skip` | `modify`.
  TextColumn get type => text()();

  /// Minutes from the occurrence date's midnight, −720…2880.
  IntColumn get startOffsetMin => integer().nullable()();
  IntColumn get endOffsetMin => integer().nullable()();
  TextColumn get labelId => text().nullable().references(Labels, #id, onDelete: KeyAction.restrict)();
  TextColumn get note => text().nullable()();
  IntColumn get createdAt => integer().map(const InstantConverter())();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
    {routineId, occurrenceDate},
  ];

  @override
  List<String> get customConstraints => [
    "CHECK (type IN ('skip', 'modify'))",
    'CHECK (start_offset_min IS NULL OR start_offset_min BETWEEN -720 AND 2880)',
    'CHECK (end_offset_min IS NULL OR end_offset_min BETWEEN -720 AND 2880)',
    'CHECK (start_offset_min IS NULL OR end_offset_min IS NULL OR end_offset_min > start_offset_min)',
    "CHECK (type = 'modify' OR (start_offset_min IS NULL AND end_offset_min IS NULL "
        'AND label_id IS NULL AND note IS NULL))',
    'CHECK (note IS NULL OR length(note) <= 2000)',
  ];
}
