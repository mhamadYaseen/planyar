import '../../../../core/files/file_gateway.dart';
import '../entities/backup_files.dart';
import '../entities/import_plan.dart';

/// What the Recovery screen (S28) does to the database file. It works while
/// the database can't be opened (plan §10.8).
abstract interface class RecoveryRepository {
  /// Shares the raw database file and its `-wal`/`-shm` companions.
  Future<ShareOutcome> shareDatabaseFile({ShareAnchor? anchor});

  /// Moves the database file aside (it is never deleted), creates a new one
  /// and restores [backup] into it as a Replace import.
  Future<ImportSummary> replaceDatabaseWith(ReadBackup backup);
}
