import 'package:drift/drift.dart';

import '../converters.dart';

/// Key/value settings with JSON values (plan §7.3, §10.4).
///
/// `portable` keys go into backups; `device` keys never leave the device.
@DataClassName('SettingRow')
class Settings extends Table {
  TextColumn get key => text()();

  /// JSON-encoded value.
  TextColumn get value => text()();

  /// `portable` | `device`.
  TextColumn get scope => text()();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {key};

  @override
  List<String> get customConstraints => ["CHECK (scope IN ('portable', 'device'))"];
}

/// Device-only ledger of scheduled notifications (plan §8.6.1). Never exported.
@DataClassName('ScheduledNotificationRow')
class ScheduledNotifications extends Table {
  /// Stable key, e.g. `rtn:{routineId}:{date}`.
  TextColumn get key => text()();

  /// The 31-bit platform notification ID, allocated sequentially.
  IntColumn get platformId => integer().unique()();
  IntColumn get fireAtUtc => integer().map(const InstantConverter())();
  TextColumn get contentHash => text()();

  @override
  Set<Column> get primaryKey => {key};

  @override
  List<String> get customConstraints => ['CHECK (platform_id BETWEEN 1 AND 2147483647)'];
}
