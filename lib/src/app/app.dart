import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../flavors.dart';
import '../config/localization/l10n/generated/app_localizations.dart';
import '../core/time/time_zone_service.dart';
import '../core/widgets/time_scope.dart';
import '../features/settings/domain/entities/app_settings.dart';
import '../features/settings/presentation/bloc/app_settings_bloc.dart';
import 'theme/app_theme.dart';

class PlanyarApp extends StatelessWidget {
  const PlanyarApp({required this.router, required this.settings, required this.timeZones, super.key});

  final GoRouter router;
  final AppSettingsBloc settings;
  final TimeZoneService timeZones;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: settings,
    child: BlocBuilder<AppSettingsBloc, AppSettings>(
      buildWhen: (a, b) => a.themeMode != b.themeMode,
      builder: (context, state) => MaterialApp.router(
        onGenerateTitle: (_) => F.title,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: switch (state.themeMode) {
          AppThemeMode.system => ThemeMode.system,
          AppThemeMode.light => ThemeMode.light,
          AppThemeMode.dark => ThemeMode.dark,
        },
        // Not AppLocalizations.localizationsDelegates: that list holds the SDK's
        // Material localizations, which material_ui widgets can't see.
        localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        // When the first package built on package:flutter/material.dart arrives
        // (table_calendar, fl_chart, printing), wrap `child` in
        // MaterialUiCompatibilityBridge here — see docs/decisions.md (Material spike).
        builder: (context, child) {
          final scoped = TimeScope(timeZones: timeZones, child: child!);
          return F.isDev ? Banner(message: 'DEV', location: BannerLocation.topEnd, child: scoped) : scoped;
        },
      ),
    ),
  );
}
