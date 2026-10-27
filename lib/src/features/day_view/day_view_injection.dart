import 'package:get_it/get_it.dart';

import '../../core/time/local_date.dart';
import '../settings/domain/entities/app_settings.dart';
import 'domain/usecases/day_usecases.dart';
import 'presentation/bloc/day_view_bloc.dart';
import 'presentation/bloc/today_bloc.dart';

void registerDayViewFeature(GetIt sl) {
  sl
    ..registerLazySingleton(() => WatchDayEntries(sl(), sl(), sl()))
    ..registerLazySingleton(() => WatchOpenEntriesWithLabels(sl(), sl()))
    ..registerFactory(() => TodayBloc(watchOpen: sl(), timeZones: sl(), ticker: sl()))
    ..registerFactoryParam<DayViewBloc, LocalDate, LaneMode>(
      (date, laneMode) => DayViewBloc(date: date, laneMode: laneMode, watchDay: sl(), timeZones: sl(), ticker: sl()),
    );
}
