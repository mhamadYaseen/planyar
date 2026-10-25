import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../../core/widgets/settings_button.dart';

/// Hourly month calendar (S12) — built in Phase 3.
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tabCalendar), actions: const [SettingsButton()]),
      body: SafeArea(
        child: EmptyView(icon: Icons.calendar_month_outlined, message: l10n.calendarEmpty),
      ),
    );
  }
}
