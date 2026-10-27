import 'package:get_it/get_it.dart';

import '../../core/database/app_database.dart';
import 'data/datasource/settings_dao.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'domain/repositories/settings_repository.dart';
import 'domain/usecases/settings_usecases.dart';
import 'presentation/bloc/app_settings_bloc.dart';

/// Loads the stored settings first, so the app starts with the right theme
/// and the right first route (onboarding or Today).
Future<void> registerSettingsFeature(GetIt sl) async {
  sl
    ..registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(SettingsDao(sl<AppDatabase>())))
    ..registerLazySingleton(() => WatchSettings(sl()))
    ..registerLazySingleton(() => UpdateSettings(sl()));
  final initial = await sl<SettingsRepository>().load();
  sl.registerSingleton<AppSettingsBloc>(
    AppSettingsBloc(initial: initial, watch: sl(), update: sl())..add(const AppSettingsEvent.started()),
    dispose: (bloc) => bloc.close(),
  );
}
