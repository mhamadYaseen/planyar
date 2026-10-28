import 'dart:async';

import 'package:drift/drift.dart' show DatabaseConnection;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/flavors.dart';
import 'package:planyar/src/app/app.dart';
import 'package:planyar/src/app/routes/app_router.dart';
import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/di/injection.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/minute_ticker.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/features/settings/domain/entities/app_settings.dart';
import 'package:planyar/src/features/settings/domain/usecases/settings_usecases.dart';
import 'package:planyar/src/features/settings/presentation/bloc/app_settings_bloc.dart';

import 'fake_file_gateway.dart';
import 'fake_notification_gateway.dart';

/// A ticker the test drives by hand (no real timers left pending).
class ManualTicker implements MinuteTicker {
  final _controller = StreamController<Instant>.broadcast();

  void tick(Instant now) => _controller.add(now);

  @override
  Stream<Instant> ticks() => _controller.stream;
}

/// A typical phone: 411 × 891 dp. The default test surface (800 × 600) is
/// wider than the 600 dp rail breakpoint.
void usePhoneSize(WidgetTester tester) {
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 1080 / 411;
  addTearDown(tester.view.reset);
}

/// Starts the real app (real DI, repositories and router) on an in-memory
/// database in Asia/Baghdad. [settings] are saved before the first frame;
/// [seed] runs after setup, before the first frame. [files] defaults to a
/// fresh [FakeFileGateway] over temporary folders.
Future<FakeNotificationGateway> pumpPlanyar(
  WidgetTester tester, {
  Flavor flavor = Flavor.prod,
  AppSettings settings = const AppSettings(onboardingCompleted: true),
  Future<void> Function()? seed,
  bool phone = true,
  FakeFileGateway? files,
}) async {
  if (phone) usePhoneSize(tester);
  F.appFlavor = flavor;
  final notifications = FakeNotificationGateway();
  final fileGateway = files ?? FakeFileGateway();
  if (files == null) addTearDown(fileGateway.dispose);
  await tester.runAsync(() async {
    await sl.reset();
    await setupDependencies(
      flavor: flavor,
      // Stops query streams right away, so no drift timer outlives the test.
      database: DatabaseConnection(NativeDatabase.memory(), closeStreamsSynchronously: true),
      notifications: notifications,
      files: fileGateway,
      readTimeZone: () async => 'Asia/Baghdad',
      ticker: ManualTicker(),
    );
    await sl<UpdateSettings>()((_) => settings);
    final bloc = sl<AppSettingsBloc>();
    if (bloc.state != settings) {
      await bloc.stream.firstWhere((s) => s == settings).timeout(const Duration(seconds: 5));
    }
    await seed?.call();
  });
  addTearDown(() async {
    await tester.runAsync(() async {
      await sl<AppDatabase>().close();
      await sl.reset(dispose: false);
    });
    F.appFlavor = Flavor.dev;
  });
  await tester.pumpWidget(
    PlanyarApp(router: sl<AppRouter>().router, settings: sl<AppSettingsBloc>(), timeZones: sl<TimeZoneService>()),
  );
  await settle(tester);
  return notifications;
}

/// Lets database streams deliver (they run outside the fake clock) and the
/// UI settle.
Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 5; i++) {
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
    await tester.pump(const Duration(milliseconds: 50));
  }
  await tester.pumpAndSettle();
}
