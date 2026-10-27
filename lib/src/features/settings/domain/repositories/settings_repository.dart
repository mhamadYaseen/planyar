import '../entities/app_settings.dart';

abstract interface class SettingsRepository {
  /// Current settings; defaults fill in keys that were never saved.
  Stream<AppSettings> watch();

  Future<AppSettings> load();

  /// Writes every key whose value differs from what's stored.
  Future<void> save(AppSettings settings);
}
