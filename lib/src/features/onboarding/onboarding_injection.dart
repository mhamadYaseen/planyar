import 'package:get_it/get_it.dart';

import 'domain/usecases/onboarding_usecases.dart';
import 'presentation/bloc/onboarding_bloc.dart';

void registerOnboardingFeature(GetIt sl) {
  sl
    ..registerLazySingleton(() => FinishOnboarding(sl(), sl(), sl()))
    ..registerFactory(() => OnboardingBloc(sl()));
}
