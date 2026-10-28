import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/files/safety_backup.dart';
import '../../../../core/time/instant.dart';
import 'backup_manifest.dart';
import 'import_plan.dart';
import 'import_report.dart';

part 'backup_files.freezed.dart';

/// A backup written to the temporary folder, ready to share or save.
@freezed
abstract class ExportedBackup with _$ExportedBackup {
  const factory ExportedBackup({
    required String path,

    /// e.g. `planyar-backup-2026-10-25-1730.zip` (local time).
    required String fileName,
    required int sizeBytes,
    required int recordCount,
  }) = _ExportedBackup;
}

/// A backup file that passed stages 1–5 (plan §10.6): what the preview shows.
@freezed
abstract class ReadBackup with _$ReadBackup {
  const factory ReadBackup({
    required String fileName,
    required int sizeBytes,
    required BackupManifest manifest,
    required ParsedBackup parsed,
  }) = _ReadBackup;
}

/// The preview of one file (S23): both modes, diffed against this device.
@freezed
abstract class ImportPreview with _$ImportPreview {
  const factory ImportPreview({
    required ReadBackup backup,
    required ImportSummary replace,
    required ImportSummary merge,

    /// Records on this device now (for "Replace deletes …").
    required int localRecordCount,
  }) = _ImportPreview;
}

/// What an import did (S24).
@freezed
abstract class ImportResult with _$ImportResult {
  const factory ImportResult({
    required ImportSummary summary,

    /// Null when there was nothing to save first (empty device).
    SafetyBackup? safetyBackup,

    /// False if the post-import `quick_check` reported a problem. The data is
    /// in place and the safety backup can undo it.
    @Default(true) bool integrityOk,
  }) = _ImportResult;
}

/// Backup & restore status (S22, BAK-05).
@freezed
abstract class BackupStatus with _$BackupStatus {
  const factory BackupStatus({Instant? lastExportAt, @Default(<ImportLogEntry>[]) List<ImportLogEntry> importLog}) =
      _BackupStatus;
}
