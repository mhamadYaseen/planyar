// Golden-test helper (plan §11.5). Chosen over `alchemist` in the Phase 0
// Material spike: alchemist's config takes the SDK ThemeData, so it only works
// with a hand-built scope; this helper needs no extra package.
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/src/app/theme/app_theme.dart';
import 'package:planyar/src/config/localization/l10n/generated/app_localizations.dart';

const Key _goldenKey = ValueKey<String>('planyar-golden');

String _scaleLabel(double scale) => scale == scale.roundToDouble() ? scale.toStringAsFixed(1) : '$scale';

/// Registers one golden test per brightness × text scale (light/dark × 1.0/2.0
/// by default), comparing against `goldens/<fileName>.<light|dark>.x<scale>.png`
/// next to the test file.
///
/// Fonts aren't loaded, so text renders in the deterministic test font and
/// goldens match across macOS and Linux CI.
/// Update with: `flutter test --update-goldens --tags golden`.
void goldenTest(
  String description, {
  required String fileName,
  required WidgetBuilder builder,
  Size surfaceSize = const Size(400, 800),
  List<Brightness> brightnesses = const [Brightness.light, Brightness.dark],
  List<double> textScales = const [1.0, 2.0],
  TransitionBuilder? appBuilder,
  Future<void> Function(WidgetTester tester)? beforeCapture,
  bool skip = false,
}) {
  for (final brightness in brightnesses) {
    for (final scale in textScales) {
      final variant = '${brightness.name}.x${_scaleLabel(scale)}';
      testWidgets('$description [$variant]', skip: skip, tags: const ['golden'], (tester) async {
        tester.view
          ..physicalSize = surfaceSize
          ..devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (context, child) {
              final scaled = MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale)),
                child: child!,
              );
              return appBuilder == null ? scaled : appBuilder(context, scaled);
            },
            home: RepaintBoundary(
              key: _goldenKey,
              child: Scaffold(body: SafeArea(child: Builder(builder: builder))),
            ),
          ),
        );
        await tester.pumpAndSettle();
        if (beforeCapture != null) await beforeCapture(tester);

        await expectLater(find.byKey(_goldenKey), matchesGoldenFile('goldens/$fileName.$variant.png'));
      });
    }
  }
}
