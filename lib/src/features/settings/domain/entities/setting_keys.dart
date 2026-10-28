/// Stable keys of the `settings` table (plan §7.3, §10.4). Backups store
/// them, so they must never be renamed.
abstract final class SettingKeys {
  static const themeMode = 'themeMode';
  static const firstDayOfWeek = 'firstDayOfWeek';
  static const timelineMode = 'timelineMode';
  static const laneMode = 'laneMode';

  /// Device-only from here on: never exported or imported.
  static const onboardingCompleted = 'onboardingCompleted';
  static const lastExportAt = 'lastExportAt';
  static const importLog = 'importLog';

  /// The keys that go into backups (§10.4 "included settings"). An import
  /// only ever writes these, whatever else the file contains.
  static const portable = {themeMode, firstDayOfWeek, timelineMode, laneMode};

  /// The shape a portable value must have to be imported. Whether an enum
  /// name is known is decided when settings are read (unknown → default),
  /// so a newer app's value doesn't make the backup unreadable.
  static bool acceptsPortable(String key, Object? value) => switch (key) {
    themeMode || timelineMode || laneMode => value is String && value.length <= 32,
    firstDayOfWeek => value is int && value >= DateTime.monday && value <= DateTime.sunday,
    _ => false,
  };
}
