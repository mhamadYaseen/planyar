import 'package:go_router/go_router.dart';

import '../../../flavors.dart';
import '../../features/calendar/presentation/pages/calendar_page.dart';
import '../../features/day_view/presentation/pages/today_page.dart';
import '../../features/dev_tools/presentation/pages/dev_tools_page.dart';
import '../../features/reports/presentation/pages/reports_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/tasks/presentation/pages/tasks_page.dart';
import '../shell/app_shell.dart';
import 'route_names.dart';

/// Four tabs in a `StatefulShellRoute` (each keeps its own stack), and
/// Settings above the shell, opened from the gear in each tab's app bar.
class AppRouter {
  AppRouter({required this.flavor});

  final Flavor flavor;

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.today,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: RoutePaths.today, name: RouteNames.today, builder: (_, _) => const TodayPage())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: RoutePaths.calendar, name: RouteNames.calendar, builder: (_, _) => const CalendarPage()),
            ],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: RoutePaths.tasks, name: RouteNames.tasks, builder: (_, _) => const TasksPage())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: RoutePaths.reports, name: RouteNames.reports, builder: (_, _) => const ReportsPage()),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.settings,
        name: RouteNames.settings,
        builder: (_, _) => SettingsPage(showDevTools: flavor == Flavor.dev),
        routes: [
          if (flavor == Flavor.dev)
            GoRoute(path: 'dev-tools', name: RouteNames.devTools, builder: (_, _) => const DevToolsPage()),
        ],
      ),
    ],
  );
}
