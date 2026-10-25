import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../../core/widgets/settings_button.dart';

/// Reports (S17) — built in Phase 4.
class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tabReports), actions: const [SettingsButton()]),
      body: SafeArea(
        child: EmptyView(icon: Icons.insights_outlined, message: l10n.reportsEmpty),
      ),
    );
  }
}
