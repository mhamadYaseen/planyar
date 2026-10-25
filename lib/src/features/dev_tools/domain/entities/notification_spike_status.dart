import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/notifications/notification_gateway.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/wall_time.dart';

part 'notification_spike_status.freezed.dart';

/// What the notification spike screen shows (plan §13 Phase 0, §11.7).
@freezed
abstract class NotificationSpikeStatus with _$NotificationSpikeStatus {
  const factory NotificationSpikeStatus({
    required NotificationPermissions permissions,
    required String timeZoneId,
    required int pendingCount,
  }) = _NotificationSpikeStatus;
}

/// A scheduled test reminder: when it fires, and that moment's local time.
@freezed
abstract class ScheduledTestNotification with _$ScheduledTestNotification {
  const factory ScheduledTestNotification({required Instant at, required WallTime localTime}) =
      _ScheduledTestNotification;
}
