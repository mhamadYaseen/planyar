import 'package:get_it/get_it.dart';

import '../../core/database/app_database.dart';
import 'data/datasource/entries_dao.dart';
import 'data/repositories/entries_repository_impl.dart';
import 'domain/repositories/entries_repository.dart';
import 'domain/usecases/entry_usecases.dart';
import 'presentation/bloc/entry_actions_bloc.dart';
import 'presentation/bloc/entry_form_bloc.dart';
import 'presentation/bloc/to_finish_bloc.dart';

void registerEntriesFeature(GetIt sl) {
  sl
    ..registerLazySingleton<EntriesRepository>(() => EntriesRepositoryImpl(EntriesDao(sl<AppDatabase>()), sl(), sl()))
    ..registerLazySingleton(() => SaveEntry(sl(), sl()))
    ..registerLazySingleton(() => DeleteEntry(sl()))
    ..registerLazySingleton(() => RestoreEntry(sl()))
    ..registerLazySingleton(() => RevertEntry(sl()))
    ..registerLazySingleton(() => SetEntryEnd(sl()))
    ..registerLazySingleton(() => FindOverlaps(sl()))
    ..registerLazySingleton(() => GetEntryDefaults(sl(), sl()))
    ..registerLazySingleton(() => GetPlannedDuration(sl()))
    ..registerLazySingleton(() => GetEntry(sl()))
    ..registerLazySingleton(() => WatchOpenEntries(sl()))
    ..registerFactory(
      () => EntryFormBloc(
        getDefaults: sl(),
        getPlannedDuration: sl(),
        getEntry: sl(),
        findOverlaps: sl(),
        save: sl(),
        delete: sl(),
        watchLabels: sl(),
        recentUse: sl(),
        watchCategories: sl(),
        timeZones: sl(),
      ),
    )
    ..registerFactory(() => EntryActionsBloc(setEnd: sl(), delete: sl(), restore: sl(), revert: sl()))
    ..registerFactory(() => ToFinishBloc(sl()));
}
