import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/flavors.dart';
import 'package:planyar/src/features/settings/domain/entities/app_settings.dart';

import '../helpers/app_harness.dart';

void main() {
  testWidgets('first run shows onboarding; skipping lands on Today', (tester) async {
    await pumpPlanyar(tester, settings: const AppSettings());
    expect(find.text('Welcome to Planyar'), findsOneWidget);
    await tester.tap(find.text('Get started'));
    await settle(tester);
    expect(find.text('Pick some labels'), findsOneWidget);
    await tester.tap(find.text('Skip'));
    await settle(tester);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('switches between the four tabs', (tester) async {
    await pumpPlanyar(tester);
    expect(find.byType(NavigationBar), findsOneWidget);
    await tester.tap(find.text('Tasks'));
    await settle(tester);
    expect(find.text('No tasks yet. Long-running tasks with deadlines will live here.'), findsOneWidget);
    await tester.tap(find.text('Reports'));
    await settle(tester);
    expect(find.text('Reports appear once you have logged some time.'), findsOneWidget);
    await tester.tap(find.text('Calendar'));
    await settle(tester);
    expect(find.text('Your month at a glance will appear here.'), findsOneWidget);
  });

  testWidgets('the gear opens Settings; prod has no developer tools', (tester) async {
    await pumpPlanyar(tester);
    await tester.tap(find.byTooltip('Open settings'));
    await settle(tester);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Labels & categories'), findsOneWidget);
    expect(find.text('Developer tools'), findsNothing);
    expect(find.byType(Banner), findsNothing);
  });

  testWidgets('tablets get a navigation rail (plan §5.6)', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await pumpPlanyar(tester, phone: false);
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('theme follows the setting (SET-01)', (tester) async {
    await pumpPlanyar(tester, settings: const AppSettings(onboardingCompleted: true, themeMode: AppThemeMode.dark));
    final context = tester.element(find.byType(NavigationBar));
    expect(Theme.of(context).colorScheme.surface, const Color(0xFF211F1A));
  });

  testWidgets('dev flavor: DEV banner and the notification spike page', (tester) async {
    final gateway = await pumpPlanyar(tester, flavor: Flavor.dev);
    expect(find.byType(Banner), findsOneWidget);
    await tester.tap(find.byTooltip('Open settings'));
    await settle(tester);
    await tester.tap(find.text('Developer tools'));
    await settle(tester);
    expect(find.text('Time zone: Asia/Baghdad'), findsOneWidget);
    await tester.tap(find.text('Schedule test in 1 minute'));
    await settle(tester);
    expect(gateway.scheduled, hasLength(1));
  });

  group('accessibility guidelines (plan §11.5)', () {
    for (final mode in [AppThemeMode.light, AppThemeMode.dark]) {
      testWidgets('Today in ${mode.name} theme', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpPlanyar(tester, settings: AppSettings(onboardingCompleted: true, themeMode: mode));
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        handle.dispose();
      });
    }
  });
}
