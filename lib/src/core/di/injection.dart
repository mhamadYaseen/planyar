import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../flavors.dart';
import '../../app/routes/app_router.dart';
import '../../config/localization/l10n/generated/app_localizations.dart';
import '../../features/dev_tools/dev_tools_injection.dart';
import '../database/app_database.dart';
import '../database/database_connection.dart';
import '../notifications/flutter_local_notifications_gateway.dart';
import '../notifications/notification_gateway.dart';
import '../time/time_zone_service.dart';
import '../utils/id_generator.dart';

/// The service locator (team baseline). Widgets don't use it directly;
/// pages use it only to create their Bloc.
final GetIt sl = GetIt.instance;

/// Registers everything in the startup order of plan §8.4.4. Throws if the
/// database can't be opened, so bootstrap can show the failure screen.
Future<void> setupDependencies({required Flavor flavor}) async {
  // 1. Database — opened now (not lazily) so migration errors surface here.
  final database = AppDatabase(openDatabaseConnection());
  await database.customSelect('SELECT 1').get();
  sl
    ..registerSingleton<AppDatabase>(database, dispose: (db) => db.close())
    ..registerLazySingleton<IdGenerator>(() => const UuidV7IdGenerator());

  // 2. Time zone (also sets the zone used for scheduling notifications).
  tzdata.initializeTimeZones();
  final timeZones = TimeZoneService(() async => (await FlutterTimezone.getLocalTimezone()).identifier);
  await timeZones.refresh();
  sl.registerSingleton<TimeZoneService>(timeZones);

  // 3. Notifications — initialize never prompts for permission.
  final l10n = lookupAppLocalizations(const Locale('en'));
  final notifications = FlutterLocalNotificationsGateway();
  await notifications.initialize(
    channelNames: {
      NotificationChannel.routines: l10n.channelRoutines,
      NotificationChannel.tasks: l10n.channelTasks,
      NotificationChannel.checkIns: l10n.channelCheckIns,
      NotificationChannel.backups: l10n.channelBackups,
    },
  );
  sl.registerSingleton<NotificationGateway>(notifications);

  // 4. Features.
  if (flavor == Flavor.dev) registerDevToolsFeature(sl);

  // 5. Routing.
  sl.registerSingleton<AppRouter>(AppRouter(flavor: flavor));
}
