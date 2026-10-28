import '../../../../core/time/instant.dart';
import '../entities/backup_files.dart';
import '../entities/backup_records.dart';
import '../entities/import_plan.dart';

/// The database side of backups.
abstract interface class BackupRepository {
  /// Every record plus the portable settings, read in one transaction so the
  /// snapshot is consistent (plan §10.5).
  Future<BackupData> readSnapshot();

  /// True when any record exists (settings don't count).
  Future<bool> hasRecords();

  /// Plans against the state read inside one write transaction and applies
  /// the plan there (§10.6 stage 9). Any error rolls everything back, so the
  /// database is either fully imported or unchanged. Returns the applied plan.
  Future<ImportPlan> applyImport(ImportPlan Function(BackupData current) planFor);

  /// `PRAGMA quick_check` (stage 10): true when the database is sound.
  Future<bool> quickCheck();

  /// Deletes every record and every setting (SET-06). The app returns to
  /// onboarding.
  Future<void> eraseAll();

  /// Last export and the import log (S22).
  Stream<BackupStatus> watchStatus();

  Future<void> recordExport(Instant at);

  /// Keeps the newest five.
  Future<void> recordImport(ImportLogEntry entry);
}
