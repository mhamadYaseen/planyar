import 'package:freezed_annotation/freezed_annotation.dart';

import 'backup_records.dart';

part 'import_report.freezed.dart';

/// Why one record is left out of an import (plan §10.6 stages 4–5).
enum IssueReason {
  /// The array item isn't a JSON object.
  notAnObject,
  missingField,
  wrongType,

  /// Not a valid UUID.
  badId,

  /// Outside the allowed values or range (enums, minutes, lengths ≥ 1, …).
  badValue,

  /// Text over its length limit.
  tooLong,

  /// Not an ISO-8601 time with a zone, or out of range.
  badTime,

  /// Not a `YYYY-MM-DD` date.
  badDate,
  endNotAfterStart,
  longerThan7Days,

  /// Another record of the same type in the file has this ID.
  duplicateId,

  /// Another label/category in the file has the same name; references were
  /// moved to that one.
  duplicateName,

  /// Another routine occurrence or exception in the file is for the same
  /// routine and date.
  duplicateOccurrence,

  /// Points at a record that's neither in the file nor (when merging) on
  /// this device, and can't be repaired.
  missingReference,

  /// Merge only: would rename a record to a name another one on this device
  /// already has.
  nameUsedOnDevice,
}

/// A record left out of the import. [index] is its position in the file's
/// array (set for problems found while reading it); [id] is null when the
/// record had no readable ID.
@freezed
abstract class RecordIssue with _$RecordIssue {
  const factory RecordIssue({
    required BackupTable table,
    int? index,
    String? id,
    required IssueReason reason,

    /// The file field at fault, e.g. `endUtc`.
    String? field,
  }) = _RecordIssue;
}

/// A safe automatic fix, always listed in the preview (plan §10.6).
enum RepairKind {
  /// Unknown color key → `gray`.
  colorReplaced,

  /// Unknown icon key → no icon.
  iconRemoved,

  /// A time with seconds → rounded to the minute.
  roundedToMinute,

  /// Missing label → the archived "Imported – unknown label".
  placeholderLabel,

  /// Missing optional reference (category, task, plan, label override) → none.
  referenceCleared,

  /// A completed task without a completion time → its last-updated time.
  completedAtSet,

  /// An unfinished task with a completion time → the time is dropped.
  completedAtCleared,

  /// A second unfinished task in one repeating series → a standalone task.
  detachedFromSeries,
}

@freezed
abstract class RecordRepair with _$RecordRepair {
  const factory RecordRepair({
    required BackupTable table,
    required String id,
    required RepairKind kind,
    String? field,
  }) = _RecordRepair;
}

/// The records of a file after stages 3–5 that don't depend on the import
/// mode: every record here is well-formed, IDs and names are unique, and
/// references to duplicate-name records already point at the kept one.
/// References to records missing from the file are resolved later, per mode.
@freezed
abstract class ParsedBackup with _$ParsedBackup {
  const factory ParsedBackup({
    required BackupData data,
    @Default(<RecordIssue>[]) List<RecordIssue> issues,
    @Default(<RecordRepair>[]) List<RecordRepair> repairs,
  }) = _ParsedBackup;
}
