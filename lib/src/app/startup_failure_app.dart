import 'package:material_ui/material_ui.dart';

import '../config/localization/l10n/generated/app_localizations.dart';
import 'theme/app_theme.dart';

/// Shown when the database can't be opened at startup. It depends on
/// nothing from dependency injection, so it works when setup failed.
class StartupFailureApp extends StatelessWidget {
  const StartupFailureApp({required this.details, super.key});

  final String details;

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
    supportedLocales: AppLocalizations.supportedLocales,
    debugShowCheckedModeBanner: false,
    home: Builder(
      builder: (context) {
        final l10n = AppLocalizations.of(context);
        final theme = Theme.of(context);
        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsetsDirectional.all(24),
              children: [
                Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
                const SizedBox(height: 16),
                Text(l10n.startupFailureTitle, style: theme.textTheme.headlineSmall),
                const SizedBox(height: 12),
                Text(l10n.startupFailureBody, style: theme.textTheme.bodyLarge),
                const SizedBox(height: 24),
                SelectableText(details, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        );
      },
    ),
  );
}
