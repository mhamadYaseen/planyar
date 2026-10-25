import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../config/localization/l10n/generated/app_localizations.dart';

/// Bottom navigation bar on phones; navigation rail from 600 dp (plan §5.6).
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const railBreakpoint = 600.0;

  void _onSelected(int index) =>
      navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final destinations = [
      (Icons.today_outlined, Icons.today, l10n.tabToday),
      (Icons.calendar_month_outlined, Icons.calendar_month, l10n.tabCalendar),
      (Icons.task_alt_outlined, Icons.task_alt, l10n.tabTasks),
      (Icons.insights_outlined, Icons.insights, l10n.tabReports),
    ];

    final useRail = MediaQuery.sizeOf(context).width >= railBreakpoint;
    if (useRail) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: _onSelected,
                labelType: NavigationRailLabelType.all,
                destinations: [
                  for (final (icon, selected, label) in destinations)
                    NavigationRailDestination(icon: Icon(icon), selectedIcon: Icon(selected), label: Text(label)),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onSelected,
        destinations: [
          for (final (icon, selected, label) in destinations)
            NavigationDestination(icon: Icon(icon), selectedIcon: Icon(selected), label: label),
        ],
      ),
    );
  }
}
