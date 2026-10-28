import 'dart:io' show Platform;

import '../../core/app_info.dart';
import '../../core/database/app_database.dart';
import '../../core/database/database_connection.dart';
import '../../core/database/open_app_database.dart';
import '../../core/files/file_gateway.dart';
import '../../core/files/safety_backup_store.dart';
import '../../core/time/time_zone_service.dart';
import '../../core/utils/id_generator.dart';
import 'data/repositories/backup_files_repository_impl.dart';
import 'data/repositories/database_recovery_impl.dart';
import 'domain/usecases/backup_usecases.dart';
import 'domain/usecases/recovery_usecases.dart';
import 'presentation/bloc/recovery_bloc.dart';

/// Builds the Recovery screen's Bloc without the service locator: it runs
/// when setup failed at the database, so nothing else is registered.
RecoveryBloc createRecoveryBloc({required FileGateway files, required TimeZoneService timeZones}) {
  final safety = SafetyBackupStore(files.supportDirectory);
  final backupFiles = BackupFilesRepositoryImpl(
    files: files,
    safety: safety,
    timeZones: timeZones,
    appVersion: AppInfo.version,
    dbSchemaVersion: AppDatabase.currentSchemaVersion,
    platform: Platform.operatingSystem,
  );
  final recovery = DatabaseRecoveryImpl(
    files: files,
    openDatabase: (path) => openAppDatabase(openDatabaseConnection(() async => path), safety: safety),
    ids: const UuidV7IdGenerator(),
  );
  return RecoveryBloc(
    listSafety: ListSafetyBackups(backupFiles),
    pick: PickBackupFile(backupFiles),
    read: ReadBackupFile(backupFiles),
    restore: RestoreDatabase(recovery),
    exportDatabase: ExportDatabaseFile(recovery),
  )..add(const RecoveryEvent.started());
}
