import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/flavors.dart';
import 'package:planyar/src/app/app.dart';
import 'package:planyar/src/app/routes/app_router.dart';
import 'package:planyar/src/core/di/injection.dart';
import 'package:planyar/src/core/notifications/notification_gateway.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/features/dev_tools/dev_tools_injection.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../helpers/fake_notification_gateway.dart';

void main() {
  setUpAll(tzdata.initializeTimeZones);

  /// A typical phone: 411 × 891 dp. The default test surface (800 × 600)
  /// is wider than the rail breakpoint.
  void usePhoneSize(WidgetTester tester) {
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 1080 / 411;
    addTearDown(tester.view.reset);
  }

  Future<void> pumpApp(WidgetTester tester, {Flavor flavor = Flavor.prod, bool phone = true}) async {
    if (phone) usePhoneSize(tester);
    F.appFlavor = flavor;
    await tester.pumpWidget(PlanyarApp(router: AppRouter(flavor: flavor).router));
    await tester.pumpAndSettle();
  }

  tearDown(() async {
    await sl.reset();
    F.appFlavor = Flavor.dev;
  });

  testWidgets('opens on Today and switches between the four tabs', (tester) async {
    await pumpApp(tester);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Nothing logged yet. Tap + or tap the timeline to add what you did.'), findsOneWidget);

    await tester.tap(find.text('Tasks'));
    await tester.pumpAndSettle();
    expect(find.text('No tasks yet. Long-running tasks with deadlines will live here.'), findsOneWidget);

    await tester.tap(find.text('Reports'));
    await tester.pumpAndSettle();
    expect(find.text('Reports appear once you have logged some time.'), findsOneWidget);

    await tester.tap(find.text('Calendar'));
    await tester.pumpAndSettle();
    expect(find.text('Your month at a glance will appear here.'), findsOneWidget);
  });

  testWidgets('the gear opens Settings; prod has no developer tools', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.byTooltip('Open settings'));
    await tester.pumpAndSettle();
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Your data never leaves this device unless you export it.'), findsOneWidget);
    expect(find.text('Developer tools'), findsNothing);
    expect(find.byType(Banner), findsNothing);
  });

  testWidgets('tablets get a navigation rail (plan §5.6)', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await pumpApp(tester, phone: false);
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('dark theme follows the system', (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await pumpApp(tester);
    final context = tester.element(find.byType(NavigationBar));
    expect(Theme.of(context).colorScheme.surface, const Color(0xFF211F1A));
  });

  testWidgets('dev flavor: DEV banner and the notification spike page', (tester) async {
    final gateway = FakeNotificationGateway();
    final timeZones = TimeZoneService(() async => 'Asia/Baghdad');
    sl
      ..registerSingleton<NotificationGateway>(gateway)
      ..registerSingleton<TimeZoneService>(timeZones);
    registerDevToolsFeature(sl);

    await pumpApp(tester, flavor: Flavor.dev);
    expect(find.byType(Banner), findsOneWidget);

    await tester.tap(find.byTooltip('Open settings'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Developer tools'));
    await tester.pumpAndSettle();
    expect(find.text('Notification test'), findsOneWidget);
    expect(find.text('Time zone: Asia/Baghdad'), findsOneWidget);

    await tester.tap(find.text('Schedule test in 1 minute'));
    await tester.pumpAndSettle();
    expect(gateway.scheduled, hasLength(1));
    expect(find.text('Pending notifications: 1'), findsOneWidget);
  });

  group('accessibility guidelines (plan §11.5)', () {
    for (final brightness in Brightness.values) {
      testWidgets('Today in ${brightness.name} theme', (tester) async {
        tester.platformDispatcher.platformBrightnessTestValue = brightness;
        addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
        final handle = tester.ensureSemantics();
        await pumpApp(tester);
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        handle.dispose();
      });
    }
  });
}
