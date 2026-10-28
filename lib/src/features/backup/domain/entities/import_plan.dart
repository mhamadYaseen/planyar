import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/instant.dart';
import 'backup_records.dart';
import 'import_report.dart';

part 'import_plan.freezed.dart';

/// Replace vs Merge (plan §10.7).
enum ImportMode {
  /// Delete all records on this device, then insert the file's.
  replace,

  /// "Imported wins" for matching records; local records not in the file
  /// are kept.
  merge,
}

/// What an import does to one record type (J16 AC1).
@freezed
abstract class TableSummary with _$TableSummary {
  const factory TableSummary({
    /// New records inserted.
    @Default(0) int added,

    /// Existing records replaced by the imported version.
    @Default(0) int overwritten,

    /// Same as on this device — skipped.
    @Default(0) int unchanged,

    /// Left out with a reason (see the issues list).
    @Default(0) int invalid,

    /// Labels/categories matched to an existing one by name (D-25). They're
    /// also counted as overwritten or identical.
    @Default(0) int matchedByName,

    /// Entries skipped as exact duplicates of a local one (D-27).
    @Default(0) int duplicates,

    /// Local routine occurrences/exceptions for the same routine and date,
    /// replaced by the imported one (§10.7).
    @Default(0) int replacedByKey,

    /// Replace only: records on this device that aren't in the file — the
    /// import deletes them.
    @Default(0) int removed,
  }) = _TableSummary;

  const TableSummary._();

  /// Records written by the import.
  int get written => added + overwritten;
}

/// The preview (stage 6) and the result (stage 11) of one mode.
@freezed
abstract class ImportSummary with _$ImportSummary {
  const factory ImportSummary({
    required ImportMode mode,
    required Map<BackupTable, TableSummary> tables,

    /// Overwritten records (or, merging, routine changes replaced for the
    /// same day) whose local version was edited later than the imported one
    /// ("312 local records are newer…").
    @Default(0) int localNewer,
    @Default(false) bool settingsImported,
    @Default(<RecordIssue>[]) List<RecordIssue> issues,
    @Default(<RecordRepair>[]) List<RecordRepair> repairs,
  }) = _ImportSummary;

  const ImportSummary._();

  TableSummary of(BackupTable table) => tables[table] ?? const TableSummary();

  int get invalidCount => issues.length;

  int get writtenCount => tables.values.fold(0, (sum, t) => sum + t.written);

  int get matchedByNameCount => tables.values.fold(0, (sum, t) => sum + t.matchedByName);

  int get duplicateCount => tables.values.fold(0, (sum, t) => sum + t.duplicates);

  int get removedCount => tables.values.fold(0, (sum, t) => sum + t.removed);
}

/// Exactly what to write, computed against the database state read inside
/// the import's write transaction.
@freezed
abstract class ImportPlan with _$ImportPlan {
  const factory ImportPlan({
    required ImportSummary summary,

    /// Replace: delete every record first.
    @Default(false) bool replaceAll,

    /// Records to insert or update, by primary key.
    @Default(BackupData()) BackupData upserts,

    /// Merge: local rows replaced by an imported one with the same key.
    @Default(<String>[]) List<String> deleteEntryIds,
    @Default(<String>[]) List<String> deleteRoutineExceptionIds,

    /// Portable settings to write; null leaves settings alone.
    Map<String, Object?>? settings,
  }) = _ImportPlan;
}

/// One line of the import log (last 5, plan §10.6 stage 11).
@freezed
abstract class ImportLogEntry with _$ImportLogEntry {
  const factory ImportLogEntry({
    required Instant at,
    required ImportMode mode,
    required String fileName,
    required int written,
    required int skipped,
    required int invalid,

    /// The safety backup made first, if there was data to save.
    String? safetyBackupName,
  }) = _ImportLogEntry;
}
