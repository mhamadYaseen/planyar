import 'package:flutter/foundation.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:material_ui/material_ui.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../flavors.dart';
import '../core/database/database_connection.dart';
import '../core/di/injection.dart';
import '../core/files/file_gateway.dart';
import '../core/files/platform_file_gateway.dart';
import '../core/time/time_zone_service.dart';
import '../features/backup/recovery_injection.dart';
import '../features/settings/presentation/bloc/app_settings_bloc.dart';
import 'app.dart';
import 'recovery_app.dart';
import 'routes/app_router.dart';
import 'startup_failure_app.dart';

/// Startup order (plan §8.4.4): binding → database → dependencies →
/// time zone and notifications → runApp.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startPlanyar();
}

/// Sets everything up and runs the app. A database that can't be opened,
/// migrated or checked shows the Recovery screen (S28); any other failure
/// shows the startup failure screen. Both retry by calling this again, and
/// neither ever deletes data.
Future<void> startPlanyar({FileGateway files = const PlatformFileGateway()}) async {
  Future<void> retry() => startPlanyar(files: files);
  await sl.reset();
  try {
    await setupDependencies(flavor: F.appFlavor, files: files);
  } on DatabaseOpenException catch (error) {
    if (kDebugMode) debugPrint('Database failed: $error\n${error.stackTrace}');
    await sl.reset();
    final timeZones = await _deviceTimeZones();
    runApp(
      RecoveryApp(
        createBloc: () => createRecoveryBloc(files: files, timeZones: timeZones),
        timeZones: timeZones,
        details: '${error.cause}',
        onRetry: retry,
      ),
    );
    return;
  } on Object catch (error, stack) {
    if (kDebugMode) debugPrint('Startup failed: $error\n$stack');
    await sl.reset();
    runApp(StartupFailureApp(details: error.toString(), onRetry: retry));
    return;
  }
  runApp(PlanyarApp(router: sl<AppRouter>().router, settings: sl<AppSettingsBloc>(), timeZones: sl<TimeZoneService>()));
}

/// The device's zone for the Recovery screen's dates; UTC if even that fails.
Future<TimeZoneService> _deviceTimeZones() async {
  tzdata.initializeTimeZones();
  final zones = TimeZoneService(() async => (await FlutterTimezone.getLocalTimezone()).identifier);
  try {
    await zones.refresh();
  } on Object {
    // Keep the UTC default.
  }
  return zones;
}
