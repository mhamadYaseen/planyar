import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../../core/widgets/settings_button.dart';

/// Today (S1): day view with timeline and list modes — built in Phase 1.
class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tabToday), actions: const [SettingsButton()]),
      body: SafeArea(
        child: EmptyView(icon: Icons.wb_sunny_outlined, message: l10n.todayEmpty),
      ),
    );
  }
}
