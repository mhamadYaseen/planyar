import '../../../../core/usecases/guard.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../entities/app_settings.dart';
import '../repositories/settings_repository.dart';

final class WatchSettings implements StreamUseCase<AppSettings, NoParams> {
  const WatchSettings(this._settings);

  final SettingsRepository _settings;

  @override
  Stream<AppSettings> call(NoParams params) => _settings.watch();
}

/// Applies [change] to the stored settings and saves.
final class UpdateSettings implements UseCase<DataState<AppSettings>, AppSettings Function(AppSettings)> {
  const UpdateSettings(this._settings);

  final SettingsRepository _settings;

  @override
  Future<DataState<AppSettings>> call(AppSettings Function(AppSettings) change) => guard(() async {
    final updated = change(await _settings.load());
    await _settings.save(updated);
    return updated;
  });
}
