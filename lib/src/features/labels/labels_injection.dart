import 'package:get_it/get_it.dart';

import '../../core/database/app_database.dart';
import 'data/datasource/labels_dao.dart';
import 'data/repositories/labels_repository_impl.dart';
import 'domain/repositories/labels_repository.dart';
import 'domain/usecases/label_usecases.dart';
import 'presentation/bloc/category_editor_bloc.dart';
import 'presentation/bloc/label_editor_bloc.dart';
import 'presentation/bloc/label_picker_bloc.dart';
import 'presentation/bloc/labels_bloc.dart';

void registerLabelsFeature(GetIt sl) {
  sl
    ..registerLazySingleton(() => LabelsDao(sl<AppDatabase>()))
    ..registerLazySingleton<LabelsRepository>(() => LabelsRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<CategoriesRepository>(() => CategoriesRepositoryImpl(sl(), sl()))
    ..registerLazySingleton(() => WatchLabels(sl()))
    ..registerLazySingleton(() => CreateLabel(sl()))
    ..registerLazySingleton(() => UpdateLabel(sl()))
    ..registerLazySingleton(() => SetLabelArchived(sl()))
    ..registerLazySingleton(() => DeleteLabel(sl()))
    ..registerLazySingleton(() => GetLabelUsage(sl()))
    ..registerLazySingleton(() => WatchLabelEntryCounts(sl()))
    ..registerLazySingleton(() => GetRecentLabelUse(sl()))
    ..registerLazySingleton(() => WatchCategories(sl()))
    ..registerLazySingleton(() => CreateCategory(sl()))
    ..registerLazySingleton(() => UpdateCategory(sl()))
    ..registerLazySingleton(() => GetCategoryUsage(sl()))
    ..registerLazySingleton(() => DeleteCategory(sl()))
    ..registerFactory(() => LabelPickerBloc(watchLabels: sl(), recentUse: sl(), create: sl(), setArchived: sl()))
    ..registerFactory(() => LabelsBloc(labels: sl(), categories: sl(), counts: sl()))
    ..registerFactory(
      () => LabelEditorBloc(
        labels: sl(),
        categories: sl(),
        create: sl(),
        update: sl(),
        setArchived: sl(),
        delete: sl(),
        usage: sl(),
      ),
    )
    ..registerFactory(
      () => CategoryEditorBloc(categories: sl(), create: sl(), update: sl(), usage: sl(), delete: sl()),
    );
}
