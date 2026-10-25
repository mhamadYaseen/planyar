import 'package:drift/drift.dart';

import '../converters.dart';
import 'categories_labels.dart';
import 'routines.dart';
import 'tasks.dart';

/// Planned and actual blocks of time (plan §7.3, ENT-*).
///
/// Routine occurrences are planned entries with `source = 'routine'`; the
/// unique partial index on `(routine_id, occurrence_date)` makes duplicate
/// occurrences impossible (§6.7).
@DataClassName('EntryRow')
@TableIndex(name: 'entries_start_utc', columns: {#startUtc})
@TableIndex(name: 'entries_kind_start_utc', columns: {#kind, #startUtc})
@TableIndex(name: 'entries_label_id', columns: {#labelId})
@TableIndex(name: 'entries_task_id', columns: {#taskId})
@TableIndex(name: 'entries_planned_entry_id', columns: {#plannedEntryId})
@TableIndex.sql(
  'CREATE UNIQUE INDEX entries_routine_occurrence '
  'ON entries (routine_id, occurrence_date) WHERE routine_id IS NOT NULL',
)
@TableIndex.sql('CREATE INDEX entries_open ON entries (start_utc) WHERE end_utc IS NULL')
class Entries extends Table {
  TextColumn get id => text()();

  /// `planned` | `actual`.
  TextColumn get kind => text()();

  /// Labels in use can't be deleted (LBL-04).
  TextColumn get labelId => text().references(Labels, #id, onDelete: KeyAction.restrict)();
  TextColumn get categoryOverrideId => text().nullable().references(Categories, #id)();

  /// UTC ms, minute-aligned.
  IntColumn get startUtc => integer().map(const InstantConverter())();

  /// NULL = open entry (§6.9). Otherwise after start and at most 7 days later.
  IntColumn get endUtc => integer().nullable().map(const InstantConverter())();

  /// IANA zone and offset at save time — informational only (§6.1).
  TextColumn get tzId => text()();
  IntColumn get utcOffsetMin => integer()();
  TextColumn get note => text().nullable()();
  TextColumn get taskId => text().nullable().references(Tasks, #id, onDelete: KeyAction.setNull)();

  /// `manual` | `routine` | `from_plan`.
  TextColumn get source => text()();
  TextColumn get routineId => text().nullable().references(Routines, #id)();
  TextColumn get occurrenceDate => text().nullable().map(const LocalDateConverter())();

  /// Set on actual entries logged from a plan (ENT-09).
  TextColumn get plannedEntryId => text().nullable().references(Entries, #id, onDelete: KeyAction.setNull)();
  IntColumn get createdAt => integer().map(const InstantConverter())();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    "CHECK (kind IN ('planned', 'actual'))",
    "CHECK (source IN ('manual', 'routine', 'from_plan'))",
    'CHECK (start_utc % 60000 = 0)',
    'CHECK (end_utc IS NULL OR (end_utc % 60000 = 0 '
        'AND end_utc > start_utc AND end_utc <= start_utc + 604800000))',
    "CHECK ((source = 'routine') = "
        "(routine_id IS NOT NULL AND occurrence_date IS NOT NULL AND kind = 'planned'))",
    "CHECK (source = 'routine' OR (routine_id IS NULL AND occurrence_date IS NULL))",
    "CHECK (source != 'from_plan' OR kind = 'actual')",
    "CHECK (planned_entry_id IS NULL OR (kind = 'actual' AND source = 'from_plan'))",
    'CHECK (note IS NULL OR length(note) <= 2000)',
  ];
}
