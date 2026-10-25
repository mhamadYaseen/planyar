import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes/route_names.dart';
import '../../config/localization/l10n/generated/app_localizations.dart';

/// The gear in each tab's app bar (plan §5.1).
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.settings_outlined),
    tooltip: AppLocalizations.of(context).openSettings,
    onPressed: () => context.pushNamed(RouteNames.settings),
  );
}
