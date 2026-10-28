import '../../../../core/error/failures.dart';
import '../../../../core/files/file_gateway.dart';
import '../../../../core/files/safety_backup.dart';
import '../../../../core/notifications/notification_gateway.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/usecases/guard.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../core/utils/id_generator.dart';
import '../entities/backup_actions.dart';
import '../entities/backup_files.dart';
import '../entities/backup_manifest.dart';
import '../entities/import_plan.dart';
import '../repositories/backup_files_repository.dart';
import '../repositories/backup_repository.dart';
import '../services/import_planner.dart';

/// File problems reach the UI as `Failure.validation` with the
/// [BackupFileProblem] as reason; anything else is a platform failure.
Failure backupFileFailure(Object error) => error is BackupFileException
    ? Failure.validation(error.toString(), reason: error.problem)
    : Failure.platform(error.toString());

final class ExportParams {
  const ExportParams(this.destination, {this.anchor});

  final ExportDestination destination;
  final ShareAnchor? anchor;
}

/// BAK-01: everything into one ZIP, then the share sheet or "Save as". The
/// export date is recorded once the file is handed over (BAK-05); the
/// temporary file is deleted either way.
final class ExportBackup implements UseCase<DataState<ExportResult>, ExportParams> {
  const ExportBackup(this._backups, this._files);

  final BackupRepository _backups;
  final BackupFilesRepository _files;

  @override
  Future<DataState<ExportResult>> call(ExportParams params) => guard(() async {
    final file = await _files.writeExport(await _backups.readSnapshot(), at: Instant.now());
    try {
      final completed = switch (params.destination) {
        // "Unknown" (the platform can't tell) counts: better than nagging.
        ExportDestination.share => await _files.share(file, anchor: params.anchor) != ShareOutcome.dismissed,
        ExportDestination.device => await _files.saveToDevice(file),
      };
      if (completed) await _backups.recordExport(Instant.now());
      return ExportResult(fileName: file.fileName, recordCount: file.recordCount, completed: completed);
    } finally {
      await _files.discard(file);
    }
  }, onError: backupFileFailure);
}

/// Opens the system picker. Null when the user cancels.
final class PickBackupFile implements UseCase<DataState<ImportSource?>, NoParams> {
  const PickBackupFile(this._files);

  final BackupFilesRepository _files;

  @override
  Future<DataState<ImportSource?>> call(NoParams params) => guard(() async {
    final picked = await _files.pick();
    return picked == null ? null : ImportSource(path: picked.path, fileName: picked.name, isTemporaryCopy: true);
  }, onError: backupFileFailure);
}

/// Stages 1–6 (plan §10.6): reads and validates the file, then previews both
/// modes against this device. Nothing is written.
final class PrepareImport implements UseCase<DataState<ImportPreview>, ImportSource> {
  const PrepareImport(this._backups, this._files, this._ids, {this._planner = const ImportPlanner()});

  final BackupRepository _backups;
  final BackupFilesRepository _files;
  final IdGenerator _ids;
  final ImportPlanner _planner;

  @override
  Future<DataState<ImportPreview>> call(ImportSource source) => guard(() async {
    try {
      final backup = await _files.read(source.path, fileName: source.fileName);
      final current = await _backups.readSnapshot();
      final now = Instant.now();
      ImportSummary preview(ImportMode mode) => _planner
          .plan(file: backup.parsed, current: current, mode: mode, importSettings: false, now: now, newId: _ids.newId)
          .summary;
      return ImportPreview(
        backup: backup,
        replace: preview(ImportMode.replace),
        merge: preview(ImportMode.merge),
        localRecordCount: current.counts.values.fold(0, (sum, n) => sum + n),
      );
    } finally {
      if (source.isTemporaryCopy) await _files.deleteTemporary(source.path);
    }
  }, onError: backupFileFailure);
}

final class RunImportParams {
  const RunImportParams({required this.backup, required this.mode, this.importSettings = false});

  final ReadBackup backup;
  final ImportMode mode;

  /// Merge only: also take the file's settings (D-26). Replace always does.
  final bool importSettings;
}

/// Stages 8–11 (plan §10.6): safety backup, one-transaction apply, checks,
/// log. A failed safety backup returns `Failure.platform` before anything is
/// written; a failed apply returns `Failure.database` — the transaction was
/// rolled back, so the data is unchanged either way.
final class RunImport implements UseCase<DataState<ImportResult>, RunImportParams> {
  const RunImport(this._backups, this._files, this._ids, {this._planner = const ImportPlanner()});

  final BackupRepository _backups;
  final BackupFilesRepository _files;
  final IdGenerator _ids;
  final ImportPlanner _planner;

  @override
  Future<DataState<ImportResult>> call(RunImportParams params) async {
    final now = Instant.now();
    final DataState<SafetyBackup?> safety = await guard(() async {
      if (!await _backups.hasRecords()) return null;
      return _files.writeSafetyBackup(await _backups.readSnapshot(), reason: SafetyReason.import, at: now);
    }, onError: (e) => Failure.platform('Safety backup failed: $e'));
    if (safety case DataError(:final failure)) return DataState.error(failure);
    final safetyBackup = (safety as DataSuccess<SafetyBackup?>).data;

    return guard(() async {
      final plan = await _backups.applyImport(
        (current) => _planner.plan(
          file: params.backup.parsed,
          current: current,
          mode: params.mode,
          importSettings: params.importSettings,
          now: now,
          newId: _ids.newId,
        ),
      );
      final integrityOk = await _backups.quickCheck();
      final summary = plan.summary;
      await _backups.recordImport(
        ImportLogEntry(
          at: now,
          mode: params.mode,
          fileName: params.backup.fileName,
          written: summary.writtenCount,
          skipped: summary.tables.values.fold(0, (sum, t) => sum + t.unchanged + t.duplicates),
          invalid: summary.invalidCount,
          safetyBackupName: safetyBackup?.fileName,
        ),
      );
      return ImportResult(summary: summary, safetyBackup: safetyBackup, integrityOk: integrityOk);
    });
  }
}

/// SET-06: a safety backup first (nothing is erased if it fails), then every
/// record and setting goes, and pending notifications are cancelled. Returns
/// the safety backup (null when there was nothing to save).
final class EraseAllData implements UseCase<DataState<SafetyBackup?>, NoParams> {
  const EraseAllData(this._backups, this._files, this._notifications);

  final BackupRepository _backups;
  final BackupFilesRepository _files;
  final NotificationGateway _notifications;

  @override
  Future<DataState<SafetyBackup?>> call(NoParams params) async {
    final DataState<SafetyBackup?> safety = await guard(() async {
      if (!await _backups.hasRecords()) return null;
      return _files.writeSafetyBackup(await _backups.readSnapshot(), reason: SafetyReason.erase, at: Instant.now());
    }, onError: (e) => Failure.platform('Safety backup failed: $e'));
    if (safety is DataError) return safety;
    return guard(() async {
      await _backups.eraseAll();
      await _notifications.cancelAllPending();
      return (safety as DataSuccess<SafetyBackup?>).data;
    });
  }
}

final class ListSafetyBackups implements UseCase<DataState<List<SafetyBackup>>, NoParams> {
  const ListSafetyBackups(this._files);

  final BackupFilesRepository _files;

  @override
  Future<DataState<List<SafetyBackup>>> call(NoParams params) =>
      guard(_files.listSafetyBackups, onError: backupFileFailure);
}

final class ShareSafetyBackupParams {
  const ShareSafetyBackupParams(this.backup, {this.anchor});

  final SafetyBackup backup;
  final ShareAnchor? anchor;
}

final class ShareSafetyBackup implements UseCase<DataState<ShareOutcome>, ShareSafetyBackupParams> {
  const ShareSafetyBackup(this._files);

  final BackupFilesRepository _files;

  @override
  Future<DataState<ShareOutcome>> call(ShareSafetyBackupParams params) =>
      guard(() => _files.shareSafetyBackup(params.backup, anchor: params.anchor), onError: backupFileFailure);
}

final class WatchBackupStatus implements StreamUseCase<BackupStatus, NoParams> {
  const WatchBackupStatus(this._backups);

  final BackupRepository _backups;

  @override
  Stream<BackupStatus> call(NoParams params) => _backups.watchStatus();
}
