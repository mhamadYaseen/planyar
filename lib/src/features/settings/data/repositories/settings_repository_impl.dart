import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/time/instant.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/entities/setting_keys.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasource/settings_dao.dart';

/// Settings as JSON values in the `settings` table (plan §8.5, §10.4).
/// Unknown or malformed values fall back to defaults, never fail.
final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._dao);

  final SettingsDao _dao;

  static const _portable = 'portable';
  static const _device = 'device';

  /// Key → (scope, value from settings). Keys are stable: backups use them.
  static Map<String, (String, Object)> _entries(AppSettings s) => {
    SettingKeys.themeMode: (_portable, s.themeMode.name),
    SettingKeys.firstDayOfWeek: (_portable, s.firstDayOfWeek),
    SettingKeys.timelineMode: (_portable, s.dayViewMode.name),
    SettingKeys.laneMode: (_portable, s.laneMode.name),
    SettingKeys.onboardingCompleted: (_device, s.onboardingCompleted),
  };

  @override
  Stream<AppSettings> watch() => _dao.watchAll().map(_parse).distinct();

  @override
  Future<AppSettings> load() async => _parse(await _dao.all());

  @override
  Future<void> save(AppSettings settings) => _dao.transaction(() async {
    final stored = {for (final row in await _dao.all()) row.key: row.value};
    final now = Instant.now();
    for (final MapEntry(:key, value: (scope, value)) in _entries(settings).entries) {
      final encoded = jsonEncode(value);
      if (stored[key] == encoded) continue;
      await _dao.upsert(
        SettingsCompanion(key: Value(key), value: Value(encoded), scope: Value(scope), updatedAt: Value(now)),
      );
    }
  });

  static AppSettings _parse(List<SettingRow> rows) {
    final values = <String, Object?>{};
    for (final row in rows) {
      try {
        values[row.key] = jsonDecode(row.value);
      } on FormatException {
        // Ignore a corrupt value; the default applies.
      }
    }
    T pick<T extends Enum>(List<T> options, Object? raw, T fallback) =>
        options.firstWhere((o) => o.name == raw, orElse: () => fallback);
    const defaults = AppSettings();
    final firstDay = values[SettingKeys.firstDayOfWeek];
    return AppSettings(
      themeMode: pick(AppThemeMode.values, values[SettingKeys.themeMode], defaults.themeMode),
      firstDayOfWeek: firstDay is int && firstDay >= DateTime.monday && firstDay <= DateTime.sunday
          ? firstDay
          : defaults.firstDayOfWeek,
      dayViewMode: pick(DayViewMode.values, values[SettingKeys.timelineMode], defaults.dayViewMode),
      laneMode: pick(LaneMode.values, values[SettingKeys.laneMode], defaults.laneMode),
      onboardingCompleted: values[SettingKeys.onboardingCompleted] == true,
    );
  }
}
