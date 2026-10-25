import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/routes/route_names.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';

/// Settings hub (S20). Phase 0 shows the privacy statement and, in the dev
/// flavor, the developer tools. Real sections arrive with their features.
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
          ListTile(leading: const Icon(Icons.lock_outline), title: Text(l10n.settingsPrivacy)),
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
