/// Route names and paths (plan §5.1). Notification deep links (§8.6.6) will
/// target these paths, so keep them stable.
abstract final class RouteNames {
  static const today = 'today';
  static const calendar = 'calendar';
  static const tasks = 'tasks';
  static const reports = 'reports';
  static const settings = 'settings';
  static const devTools = 'dev-tools';
  static const toFinish = 'to-finish';
  static const labels = 'labels';
  static const labelNew = 'label-new';
  static const labelEdit = 'label-edit';
  static const categoryNew = 'category-new';
  static const categoryEdit = 'category-edit';
  static const appearance = 'appearance';
  static const onboarding = 'onboarding';
  static const onboardingRestore = 'onboarding-restore';
  static const backup = 'backup';
  static const backupImport = 'backup-import';
  static const about = 'about';
  static const erase = 'erase';
}

abstract final class RoutePaths {
  static const today = '/today';
  static const calendar = '/calendar';
  static const tasks = '/tasks';
  static const reports = '/reports';
  static const settings = '/settings';
  static const devTools = '/settings/dev-tools';
  static const toFinish = '/today/to-finish';
  static const labels = '/settings/labels';
  static const appearance = '/settings/appearance';
  static const onboarding = '/onboarding';
  static const backup = '/settings/backup';
  static const backupImport = '/settings/backup/import';
  static const about = '/settings/about';
  static const erase = '/settings/about/erase';
}
