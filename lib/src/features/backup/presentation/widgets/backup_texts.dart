import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/files/file_gateway.dart';
import '../../../../core/files/safety_backup.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../domain/entities/backup_manifest.dart';
import '../../domain/entities/backup_records.dart';
import '../../domain/entities/import_report.dart';

/// Wording for backup values (problems, record types, issues, repairs).
extension BackupTexts on AppLocalizations {
  String fileProblem(BackupFileProblem problem) => switch (problem) {
    BackupFileProblem.notABackup || BackupFileProblem.damaged => backupProblemNotABackup,
    BackupFileProblem.newerVersion => backupProblemNewer,
    BackupFileProblem.tooLarge => backupProblemTooLarge,
    BackupFileProblem.unreadable => backupProblemUnreadable,
  };

  /// A file problem when [failure] is one, else null.
  String? fileProblemOf(Failure failure) => switch (failure) {
    ValidationFailure(reason: final BackupFileProblem problem) => fileProblem(problem),
    _ => null,
  };

  String safetyReason(SafetyReason reason) => switch (reason) {
    SafetyReason.import => safetyReasonImport,
    SafetyReason.erase => safetyReasonErase,
    SafetyReason.migration => safetyReasonMigration,
  };

  String tableName(BackupTable table) => switch (table) {
    BackupTable.categories => tableCategories,
    BackupTable.labels => tableLabels,
    BackupTable.taskSeries => tableTaskSeries,
    BackupTable.tasks => tableTasks,
    BackupTable.taskReminders => tableTaskReminders,
    BackupTable.routines => tableRoutines,
    BackupTable.routineExceptions => tableRoutineExceptions,
    BackupTable.entries => tableEntries,
  };

  String recordName(BackupTable table) => switch (table) {
    BackupTable.categories => recordCategory,
    BackupTable.labels => recordLabel,
    BackupTable.taskSeries => recordTaskSeries,
    BackupTable.tasks => recordTask,
    BackupTable.taskReminders => recordTaskReminder,
    BackupTable.routines => recordRoutine,
    BackupTable.routineExceptions => recordRoutineException,
    BackupTable.entries => recordEntry,
  };

  /// "Entry #8" (position in the file) or "Entry 018f3a2b" (start of its ID).
  String _record(BackupTable table, int? index, String? id) {
    final type = recordName(table);
    if (index != null) return importRecordAt(type, index + 1);
    if (id != null && id.isNotEmpty) return importRecordId(type, id.length > 8 ? id.substring(0, 8) : id);
    return type;
  }

  String issue(RecordIssue issue) {
    final field = issue.field ?? '';
    final reason = switch (issue.reason) {
      IssueReason.notAnObject => issueNotAnObject,
      IssueReason.missingField => issueMissingField(field),
      IssueReason.wrongType => issueWrongType(field),
      IssueReason.badId => issueBadId(field),
      IssueReason.badValue => issueBadValue(field),
      IssueReason.tooLong => issueTooLong(field),
      IssueReason.badTime => issueBadTime(field),
      IssueReason.badDate => issueBadDate(field),
      IssueReason.endNotAfterStart => issueEndNotAfterStart,
      IssueReason.longerThan7Days => issueLongerThan7Days,
      IssueReason.duplicateId => issueDuplicateId,
      IssueReason.duplicateName => issueDuplicateName,
      IssueReason.duplicateOccurrence => issueDuplicateOccurrence,
      IssueReason.missingReference => issueMissingReference,
      IssueReason.nameUsedOnDevice => issueNameUsedOnDevice,
    };
    return importIssueLine(_record(issue.table, issue.index, issue.id), reason);
  }

  String repair(RecordRepair repair) {
    final reason = switch (repair.kind) {
      RepairKind.colorReplaced => repairColorReplaced,
      RepairKind.iconRemoved => repairIconRemoved,
      RepairKind.roundedToMinute => repairRoundedToMinute,
      RepairKind.placeholderLabel => repairPlaceholderLabel,
      RepairKind.referenceCleared => repairReferenceCleared,
      RepairKind.completedAtSet => repairCompletedAtSet,
      RepairKind.completedAtCleared => repairCompletedAtCleared,
      RepairKind.detachedFromSeries => repairDetachedFromSeries,
    };
    return importIssueLine(_record(repair.table, null, repair.id), reason);
  }

  String platformName(String platform) => switch (platform) {
    'android' => 'Android',
    'ios' => 'iOS',
    '' => '?',
    _ => platform,
  };
}

/// "Sun 25 Oct, 17:30" in the device's zone.
String dayAndTimeOf(BuildContext context, Instant at) {
  final time = TimeScope.of(context);
  return '${time.day(time.math.dateOf(at))}, ${time.time(at)}';
}

/// "1.7 MB", "820 KB", "512 B".
String fileSizeText(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).round()} KB';
  return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
}

/// Where the share popover anchors on iPad: the widget behind [context].
ShareAnchor? shareAnchorOf(BuildContext context) {
  final box = context.findRenderObject();
  if (box is! RenderBox || !box.hasSize) return null;
  final topLeft = box.localToGlobal(Offset.zero);
  return ShareAnchor(left: topLeft.dx, top: topLeft.dy, width: box.size.width, height: box.size.height);
}
