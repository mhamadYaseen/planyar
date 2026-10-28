import 'dart:io' show Platform;

import 'package:get_it/get_it.dart';

import '../../core/app_info.dart';
import '../../core/database/app_database.dart';
import '../../core/files/file_gateway.dart';
import '../../core/files/safety_backup_store.dart';
import '../../core/notifications/notification_gateway.dart';
import '../../core/time/time_zone_service.dart';
import 'data/datasource/backup_dao.dart';
import 'data/repositories/backup_files_repository_impl.dart';
import 'data/repositories/backup_repository_impl.dart';
import 'domain/repositories/backup_files_repository.dart';
import 'domain/repositories/backup_repository.dart';
import 'domain/usecases/backup_usecases.dart';
import 'presentation/bloc/backup_bloc.dart';
import 'presentation/bloc/erase_bloc.dart';
import 'presentation/bloc/import_bloc.dart';

/// Backup, import, safety backups and erase (plan §10.4–10.8, Phase 2).
void registerBackupFeature(GetIt sl) {
  sl
    ..registerLazySingleton<BackupRepository>(() => BackupRepositoryImpl(BackupDao(sl<AppDatabase>())))
    ..registerLazySingleton<BackupFilesRepository>(
      () => BackupFilesRepositoryImpl(
        files: sl<FileGateway>(),
        safety: sl<SafetyBackupStore>(),
        timeZones: sl<TimeZoneService>(),
        appVersion: AppInfo.version,
        dbSchemaVersion: sl<AppDatabase>().schemaVersion,
        platform: Platform.operatingSystem,
      ),
    )
    ..registerLazySingleton(() => ExportBackup(sl(), sl()))
    ..registerLazySingleton(() => PickBackupFile(sl()))
    ..registerLazySingleton(() => PrepareImport(sl(), sl(), sl()))
    ..registerLazySingleton(() => RunImport(sl(), sl(), sl()))
    ..registerLazySingleton(() => EraseAllData(sl(), sl(), sl<NotificationGateway>()))
    ..registerLazySingleton(() => ListSafetyBackups(sl()))
    ..registerLazySingleton(() => ShareSafetyBackup(sl()))
    ..registerLazySingleton(() => WatchBackupStatus(sl()))
    ..registerFactory(
      () => BackupBloc(watchStatus: sl(), export: sl(), pick: sl(), listSafety: sl(), shareSafety: sl()),
    )
    ..registerFactory(() => ImportBloc(prepare: sl(), run: sl()))
    ..registerFactory(() => EraseBloc(export: sl(), erase: sl()));
}
