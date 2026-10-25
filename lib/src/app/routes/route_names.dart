/// Route names and paths (plan §5.1). Notification deep links (§8.6.6) will
/// target these paths, so keep them stable.
abstract final class RouteNames {
  static const today = 'today';
  static const calendar = 'calendar';
  static const tasks = 'tasks';
  static const reports = 'reports';
  static const settings = 'settings';
  static const devTools = 'dev-tools';
}

abstract final class RoutePaths {
  static const today = '/today';
  static const calendar = '/calendar';
  static const tasks = '/tasks';
  static const reports = '/reports';
  static const settings = '/settings';
  static const devTools = '/settings/dev-tools';
}
