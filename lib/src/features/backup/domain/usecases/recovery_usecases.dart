import '../../../../core/error/failures.dart';
import '../../../../core/files/file_gateway.dart';
import '../../../../core/usecases/guard.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../entities/backup_actions.dart';
import '../entities/backup_files.dart';
import '../entities/import_plan.dart';
import '../repositories/backup_files_repository.dart';
import '../repositories/recovery_repository.dart';
import 'backup_usecases.dart';

/// Stages 1–5 only: reads and validates a backup without the database (the
/// Recovery screen has none to compare against).
final class ReadBackupFile implements UseCase<DataState<ReadBackup>, ImportSource> {
  const ReadBackupFile(this._files);

  final BackupFilesRepository _files;

  @override
  Future<DataState<ReadBackup>> call(ImportSource source) => guard(() async {
    try {
      return await _files.read(source.path, fileName: source.fileName);
    } finally {
      if (source.isTemporaryCopy) await _files.deleteTemporary(source.path);
    }
  }, onError: backupFileFailure);
}

/// "Export the database file" (S28).
final class ExportDatabaseFile implements UseCase<DataState<ShareOutcome>, ShareAnchor?> {
  const ExportDatabaseFile(this._recovery);

  final RecoveryRepository _recovery;

  @override
  Future<DataState<ShareOutcome>> call(ShareAnchor? anchor) =>
      guard(() => _recovery.shareDatabaseFile(anchor: anchor), onError: (e) => Failure.platform('$e'));
}

/// "Restore": a new database from [ReadBackup]; the old file is kept aside.
final class RestoreDatabase implements UseCase<DataState<ImportSummary>, ReadBackup> {
  const RestoreDatabase(this._recovery);

  final RecoveryRepository _recovery;

  @override
  Future<DataState<ImportSummary>> call(ReadBackup backup) => guard(() => _recovery.replaceDatabaseWith(backup));
}
