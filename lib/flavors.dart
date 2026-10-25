/// Build flavors (plan §8.12). `dev` installs beside `prod` with its own
/// application ID and database, so it never touches real data.
enum Flavor {
  dev,
  prod;

  /// Maps Flutter's `appFlavor` (from `--flavor`). Anything unknown — e.g.
  /// tests or a build without a flavor — is treated as dev, which is the
  /// safe side: dev can't see production data.
  static Flavor fromName(String? name) => name == 'prod' ? Flavor.prod : Flavor.dev;
}

abstract final class F {
  static Flavor appFlavor = Flavor.dev;

  static bool get isDev => appFlavor == Flavor.dev;

  /// Launcher/task-switcher title. Matches the Android `app_name` per flavor.
  static String get title => switch (appFlavor) {
    Flavor.dev => 'Planyar Dev',
    Flavor.prod => 'Planyar',
  };
}
