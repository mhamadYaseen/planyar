part of 'backup_bloc.dart';

/// Work that disables the export and import buttons while it runs.
enum BackupTask { exporting, picking }

/// A one-time message for a snackbar.
@freezed
sealed class BackupNotice with _$BackupNotice {
  const factory BackupNotice.exported({required String fileName, required ExportDestination destination}) =
      ExportedNotice;

  const factory BackupNotice.failed(Failure failure) = FailedNotice;
}

@freezed
abstract class BackupState with _$BackupState {
  const factory BackupState({
    @Default(BackupStatus()) BackupStatus status,
    @Default(DataState<List<SafetyBackup>>.initial()) DataState<List<SafetyBackup>> safetyBackups,
    BackupTask? busy,

    /// Shown once, then cleared with `noticeShown`.
    BackupNotice? notice,

    /// A file to open in the import preview; cleared with `importOpened`.
    ImportSource? pendingImport,
  }) = _BackupState;
}
