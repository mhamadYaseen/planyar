import 'package:get_it/get_it.dart';

import '../../core/notifications/notification_gateway.dart';
import '../../core/time/time_zone_service.dart';
import 'domain/usecases/notification_spike_usecases.dart';
import 'presentation/bloc/dev_tools_bloc.dart';

/// Registered only in the dev flavor.
void registerDevToolsFeature(GetIt sl) {
  sl
    ..registerLazySingleton(() => GetNotificationSpikeStatus(sl<NotificationGateway>(), sl<TimeZoneService>()))
    ..registerLazySingleton(() => RequestNotificationPermission(sl<NotificationGateway>()))
    ..registerLazySingleton(() => ShowTestNotification(sl<NotificationGateway>()))
    ..registerLazySingleton(() => ScheduleTestNotification(sl<NotificationGateway>(), sl<TimeZoneService>()))
    ..registerLazySingleton(() => CancelTestNotifications(sl<NotificationGateway>()))
    ..registerFactory(
      () =>
          DevToolsBloc(getStatus: sl(), requestPermission: sl(), showTest: sl(), scheduleTest: sl(), cancelTests: sl()),
    );
}
