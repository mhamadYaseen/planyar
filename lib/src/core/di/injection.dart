import 'package:drift/drift.dart' show QueryExecutor;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../flavors.dart';
import '../../app/routes/app_router.dart';
import '../../config/localization/l10n/generated/app_localizations.dart';
import '../../features/backup/backup_injection.dart';
import '../../features/day_view/day_view_injection.dart';
import '../../features/dev_tools/dev_tools_injection.dart';
import '../../features/entries/entries_injection.dart';
import '../../features/labels/labels_injection.dart';
import '../../features/onboarding/onboarding_injection.dart';
import '../../features/settings/presentation/bloc/app_settings_bloc.dart';
import '../../features/settings/settings_injection.dart';
import '../database/app_database.dart';
import '../database/database_connection.dart';
import '../database/open_app_database.dart';
import '../files/file_gateway.dart';
import '../files/platform_file_gateway.dart';
import '../files/safety_backup_store.dart';
import '../notifications/flutter_local_notifications_gateway.dart';
import '../notifications/notification_gateway.dart';
import '../time/minute_ticker.dart';
import '../time/time_zone_service.dart';
import '../utils/id_generator.dart';

/// The service locator (team baseline). Widgets don't use it directly;
/// pages and sheets use it only to create their Bloc.
final GetIt sl = GetIt.instance;

/// Registers everything in the startup order of plan §8.4.4. Throws a
/// [DatabaseOpenException] if the database can't be opened, migrated or
/// fails its integrity check, so bootstrap can show the Recovery screen.
///
/// Tests pass an in-memory [database], fake [notifications] and [files], a
/// fixed [readTimeZone] and a hand-driven [ticker].
Future<void> setupDependencies({
  required Flavor flavor,
  QueryExecutor? database,
  NotificationGateway? notifications,
  FileGateway? files,
  Future<String> Function()? readTimeZone,
  MinuteTicker? ticker,
}) async {
  // 0. Files: the safety folder must exist before a migration can run.
  final fileGateway = files ?? const PlatformFileGateway();
  final safety = SafetyBackupStore(fileGateway.supportDirectory);
  sl
    ..registerSingleton<FileGateway>(fileGateway)
    ..registerSingleton<SafetyBackupStore>(safety);

  // 1. Database — opened now (not lazily) so migration errors surface here.
  final db = await openAppDatabase(
    database ?? openDatabaseConnection(() async => databaseFilePath(await fileGateway.documentsDirectory())),
    safety: safety,
  );
  sl
    ..registerSingleton<AppDatabase>(db, dispose: (db) => db.close())
    ..registerLazySingleton<IdGenerator>(() => const UuidV7IdGenerator())
    ..registerLazySingleton<MinuteTicker>(() => ticker ?? const ClockMinuteTicker());

  // 2. Time zone (also sets the zone used for scheduling notifications).
  tzdata.initializeTimeZones();
  final timeZones = TimeZoneService(readTimeZone ?? () async => (await FlutterTimezone.getLocalTimezone()).identifier);
  await timeZones.refresh();
  sl.registerSingleton<TimeZoneService>(timeZones);

  // 3. Notifications — initialize never prompts for permission.
  final gateway = notifications ?? FlutterLocalNotificationsGateway();
  final l10n = lookupAppLocalizations(const Locale('en'));
  await gateway.initialize(
    channelNames: {
      NotificationChannel.routines: l10n.channelRoutines,
      NotificationChannel.tasks: l10n.channelTasks,
      NotificationChannel.checkIns: l10n.channelCheckIns,
      NotificationChannel.backups: l10n.channelBackups,
    },
  );
  sl.registerSingleton<NotificationGateway>(gateway);

  // 4. Features.
  await registerSettingsFeature(sl);
  registerLabelsFeature(sl);
  registerEntriesFeature(sl);
  registerDayViewFeature(sl);
  registerOnboardingFeature(sl);
  registerBackupFeature(sl);
  if (flavor == Flavor.dev) registerDevToolsFeature(sl);

  // 5. Routing.
  sl.registerSingleton<AppRouter>(AppRouter(flavor: flavor, settings: sl<AppSettingsBloc>()));
}
