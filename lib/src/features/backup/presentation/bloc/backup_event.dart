part of 'backup_bloc.dart';

@freezed
sealed class BackupEvent with _$BackupEvent {
  /// Loads the safety backups and follows the export/import status.
  const factory BackupEvent.started() = _Started;

  /// After returning from an import, which may have added a safety backup.
  const factory BackupEvent.safetyBackupsRefreshed() = _SafetyBackupsRefreshed;

  /// "Export all data" (share sheet) or "Save to device".
  const factory BackupEvent.exportPressed(ExportDestination destination, {ShareAnchor? anchor}) = _ExportPressed;

  /// "Import a backup…": opens the system picker.
  const factory BackupEvent.importPressed() = _ImportPressed;

  /// Restore = a Replace import of that safety backup (plan §10.8).
  const factory BackupEvent.restorePressed(SafetyBackup backup) = _RestorePressed;

  const factory BackupEvent.safetySharePressed(SafetyBackup backup, {ShareAnchor? anchor}) = _SafetySharePressed;

  /// The page showed [BackupState.notice].
  const factory BackupEvent.noticeShown() = _NoticeShown;

  /// The page opened [BackupState.pendingImport].
  const factory BackupEvent.importOpened() = _ImportOpened;
}
