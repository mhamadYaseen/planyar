import '../../../../core/files/file_gateway.dart';
import '../../../../core/files/safety_backup.dart';
import '../../../../core/time/instant.dart';
import '../entities/backup_files.dart';
import '../entities/backup_records.dart';

/// The file side of backups: ZIPs, the share sheet, the picker and the
/// safety folder (plan §8.11, §10.4–10.8).
abstract interface class BackupFilesRepository {
  /// Writes a backup of [data] into the temporary folder, encoded off the UI
  /// isolate (§10.5).
  Future<ExportedBackup> writeExport(BackupData data, {required Instant at});

  Future<ShareOutcome> share(ExportedBackup file, {ShareAnchor? anchor});

  /// The system "Save as" dialog. True when saved.
  Future<bool> saveToDevice(ExportedBackup file);

  /// Deletes the temporary export.
  Future<void> discard(ExportedBackup file);

  /// The system picker (any file type); null when cancelled. Throws a
  /// `BackupFileException` (`tooLarge`) over the size limit.
  Future<PickedFile?> pick();

  /// Stages 1–5 of the import pipeline, off the UI isolate. Throws a
  /// `BackupFileException` for a file that can't be imported at all.
  Future<ReadBackup> read(String path, {required String fileName});

  /// Deletes a picked file's temporary copy.
  Future<void> deleteTemporary(String path);

  /// A full backup into the safety folder; the newest five are kept (BAK-04).
  Future<SafetyBackup> writeSafetyBackup(BackupData data, {required SafetyReason reason, required Instant at});

  /// Newest first.
  Future<List<SafetyBackup>> listSafetyBackups();

  Future<ShareOutcome> shareSafetyBackup(SafetyBackup backup, {ShareAnchor? anchor});
}
