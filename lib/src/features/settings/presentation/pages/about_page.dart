import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../../flavors.dart';
import '../../../../app/routes/route_names.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/app_info.dart';

/// About & privacy (S26): version, privacy statement, licenses (SET-05) and
/// "Erase all data" (SET-06).
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final error = theme.colorScheme.error;
    Widget section(String title) => Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 8),
      child: Semantics(
        header: true,
        child: Text(title, style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.primary)),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text(l10n.aboutTitle)),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.event_note_outlined),
            title: Text(F.title, style: theme.textTheme.titleMedium),
            subtitle: Text(l10n.aboutVersion(AppInfo.version)),
          ),
          section(l10n.aboutPrivacyTitle),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: Text(l10n.aboutPrivacyBody, style: theme.textTheme.bodyMedium),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l10n.aboutLicenses),
            trailing: const Icon(Icons.chevron_right),
            onTap: () =>
                showLicensePage(context: context, applicationName: F.title, applicationVersion: AppInfo.version),
          ),
          section(l10n.aboutDangerSection),
          ListTile(
            leading: Icon(Icons.delete_forever_outlined, color: error),
            title: Text(l10n.eraseTitle, style: TextStyle(color: error)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(RouteNames.erase),
          ),
        ],
      ),
    );
  }
}
