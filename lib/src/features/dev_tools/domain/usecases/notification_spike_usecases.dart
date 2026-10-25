import '../../../../core/error/failures.dart';
import '../../../../core/notifications/notification_gateway.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../entities/notification_spike_status.dart';

/// Fixed IDs for the spike; the real ledger (plan §8.6.1) comes in Phase 6.
const _showNowId = 900001;
const _scheduledId = 900002;

final class GetNotificationSpikeStatus implements UseCase<DataState<NotificationSpikeStatus>, NoParams> {
  const GetNotificationSpikeStatus(this._gateway, this._timeZones);

  final NotificationGateway _gateway;
  final TimeZoneService _timeZones;

  @override
  Future<DataState<NotificationSpikeStatus>> call(NoParams params) => _guard(() async {
    await _timeZones.refresh();
    return NotificationSpikeStatus(
      permissions: await _gateway.permissions(),
      timeZoneId: _timeZones.zoneId,
      pendingCount: await _gateway.pendingCount(),
    );
  });
}

final class RequestNotificationPermission implements UseCase<DataState<bool>, NoParams> {
  const RequestNotificationPermission(this._gateway);

  final NotificationGateway _gateway;

  @override
  Future<DataState<bool>> call(NoParams params) => _guard(_gateway.requestPermission);
}

/// Text for a test notification; localized by the UI.
final class TestNotificationText {
  const TestNotificationText({required this.title, required this.body});

  final String title;
  final String body;
}

final class ShowTestNotification implements UseCase<DataState<void>, TestNotificationText> {
  const ShowTestNotification(this._gateway);

  final NotificationGateway _gateway;

  @override
  Future<DataState<void>> call(TestNotificationText params) => _guard(
    () => _gateway.showNow(
      id: _showNowId,
      title: params.title,
      body: params.body,
      channel: NotificationChannel.routines,
      payload: '/settings/dev-tools',
    ),
  );
}

final class ScheduleTestNotificationParams {
  const ScheduleTestNotificationParams({required this.text, this.delay = const Duration(minutes: 1)});

  final TestNotificationText text;
  final Duration delay;
}

/// Schedules a test reminder [ScheduleTestNotificationParams.delay] from now.
final class ScheduleTestNotification
    implements UseCase<DataState<ScheduledTestNotification>, ScheduleTestNotificationParams> {
  const ScheduleTestNotification(this._gateway, this._timeZones);

  final NotificationGateway _gateway;
  final TimeZoneService _timeZones;

  @override
  Future<DataState<ScheduledTestNotification>> call(ScheduleTestNotificationParams params) => _guard(() async {
    final at = Instant.now() + params.delay;
    await _gateway.schedule(
      id: _scheduledId,
      at: at,
      title: params.text.title,
      body: params.text.body,
      channel: NotificationChannel.routines,
      payload: '/settings/dev-tools',
    );
    return ScheduledTestNotification(at: at, localTime: _timeZones.dayMath.wallTimeOf(at));
  });
}

final class CancelTestNotifications implements UseCase<DataState<void>, NoParams> {
  const CancelTestNotifications(this._gateway);

  final NotificationGateway _gateway;

  @override
  Future<DataState<void>> call(NoParams params) => _guard(_gateway.cancelAllPending);
}

/// Platform calls can throw; use cases return failures instead (plan §8.4.2).
Future<DataState<T>> _guard<T>(Future<T> Function() action) async {
  try {
    return DataState.success(await action());
  } on Object catch (error) {
    return DataState.error(Failure.platform(error.toString()));
  }
}
