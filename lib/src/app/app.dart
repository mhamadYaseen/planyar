import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../flavors.dart';
import '../config/localization/l10n/generated/app_localizations.dart';
import 'theme/app_theme.dart';

class PlanyarApp extends StatelessWidget {
  const PlanyarApp({required this.router, super.key});

  final GoRouter router;

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    onGenerateTitle: (_) => F.title,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    // SET-01 (System / Light / Dark setting) arrives with the settings screen.
    themeMode: ThemeMode.system,
    // Not AppLocalizations.localizationsDelegates: that list holds the SDK's
    // Material localizations, which material_ui widgets can't see.
    localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
    supportedLocales: AppLocalizations.supportedLocales,
    routerConfig: router,
    debugShowCheckedModeBanner: false,
    builder: (context, child) =>
        F.isDev ? Banner(message: 'DEV', location: BannerLocation.topEnd, child: child!) : child!,
  );
}
