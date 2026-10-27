import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../flavors.dart';
import '../../features/calendar/presentation/pages/calendar_page.dart';
import '../../features/day_view/presentation/pages/today_page.dart';
import '../../features/dev_tools/presentation/pages/dev_tools_page.dart';
import '../../features/entries/presentation/pages/to_finish_page.dart';
import '../../features/labels/presentation/pages/category_editor_page.dart';
import '../../features/labels/presentation/pages/label_editor_page.dart';
import '../../features/labels/presentation/pages/labels_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/reports/presentation/pages/reports_page.dart';
import '../../features/settings/presentation/bloc/app_settings_bloc.dart';
import '../../features/settings/presentation/pages/appearance_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/tasks/presentation/pages/tasks_page.dart';
import '../shell/app_shell.dart';
import 'route_names.dart';

/// Four tabs in a `StatefulShellRoute` (each keeps its own stack), Settings
/// above the shell, and onboarding until it's done (plan §5.1).
class AppRouter {
  AppRouter({required this.flavor, required this._settings});

  final Flavor flavor;
  final AppSettingsBloc _settings;

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.today,
    refreshListenable: _OnboardingChanges(_settings),
    redirect: (context, state) {
      final done = _settings.state.onboardingCompleted;
      final atOnboarding = state.matchedLocation == RoutePaths.onboarding;
      if (!done && !atOnboarding) return RoutePaths.onboarding;
      if (done && atOnboarding) return RoutePaths.today;
      return null;
    },
    routes: [
      GoRoute(path: RoutePaths.onboarding, name: RouteNames.onboarding, builder: (_, _) => const OnboardingPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.today,
                name: RouteNames.today,
                builder: (_, _) => const TodayPage(),
                routes: [
                  GoRoute(path: 'to-finish', name: RouteNames.toFinish, builder: (_, _) => const ToFinishPage()),
                ],
              ),
            ],
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
          GoRoute(
            path: 'labels',
            name: RouteNames.labels,
            builder: (_, _) => const LabelsPage(),
            routes: [
              GoRoute(path: 'new', name: RouteNames.labelNew, builder: (_, _) => const LabelEditorPage()),
              GoRoute(
                path: 'categories/new',
                name: RouteNames.categoryNew,
                builder: (_, _) => const CategoryEditorPage(),
              ),
              GoRoute(
                path: 'categories/:id',
                name: RouteNames.categoryEdit,
                builder: (_, state) => CategoryEditorPage(categoryId: state.pathParameters['id']),
              ),
              GoRoute(
                path: ':id',
                name: RouteNames.labelEdit,
                builder: (_, state) => LabelEditorPage(labelId: state.pathParameters['id']),
              ),
            ],
          ),
          GoRoute(path: 'appearance', name: RouteNames.appearance, builder: (_, _) => const AppearancePage()),
          if (flavor == Flavor.dev)
            GoRoute(path: 'dev-tools', name: RouteNames.devTools, builder: (_, _) => const DevToolsPage()),
        ],
      ),
    ],
  );
}

/// Re-runs the redirect when onboarding completes.
class _OnboardingChanges extends ChangeNotifier {
  _OnboardingChanges(AppSettingsBloc settings) : _done = settings.state.onboardingCompleted {
    _sub = settings.stream.listen((s) {
      if (s.onboardingCompleted != _done) {
        _done = s.onboardingCompleted;
        notifyListeners();
      }
    });
  }

  bool _done;
  late final StreamSubscription<Object?> _sub;

  @override
  void dispose() {
    unawaited(_sub.cancel());
    super.dispose();
  }
}
