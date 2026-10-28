/// Facts about this build that the app shows or records.
abstract final class AppInfo {
  /// The `version:` from pubspec.yaml (a test keeps the two equal). Shown in
  /// About and written into backup manifests.
  static const version = '1.0.0+1';
}
