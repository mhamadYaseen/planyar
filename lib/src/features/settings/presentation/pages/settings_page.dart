import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/routes/route_names.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';

/// Settings hub (S20). More sections arrive with their features.
class SettingsPage extends StatelessWidget {
  const SettingsPage({required this.showDevTools, super.key});

  final bool showDevTools;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.label_outline),
            title: Text(l10n.labelsAndCategories),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(RouteNames.labels),
          ),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(l10n.appearanceAndTime),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(RouteNames.appearance),
          ),
          ListTile(
            leading: const Icon(Icons.settings_backup_restore),
            title: Text(l10n.settingsBackup),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(RouteNames.backup),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: Text(l10n.settingsAbout),
            subtitle: Text(l10n.settingsPrivacy),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(RouteNames.about),
          ),
          if (showDevTools)
            ListTile(
              leading: const Icon(Icons.build_outlined),
              title: Text(l10n.settingsDevTools),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.pushNamed(RouteNames.devTools),
            ),
        ],
      ),
    );
  }
}
