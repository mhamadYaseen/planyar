import 'package:planyar/src/core/notifications/notification_gateway.dart';
import 'package:planyar/src/core/time/instant.dart';

/// In-memory [NotificationGateway] for tests.
class FakeNotificationGateway implements NotificationGateway {
  bool notificationsAllowed = false;
  bool exactAlarmsAllowed = true;
  bool grantOnRequest = true;
  Object? throwOnSchedule;

  final shown = <({int id, String title, NotificationChannel channel})>[];
  final scheduled = <({int id, Instant at, String title, NotificationChannel channel})>[];

  @override
  Future<void> initialize({required Map<NotificationChannel, String> channelNames}) async {}

  @override
  Future<NotificationPermissions> permissions() async =>
      NotificationPermissions(notificationsAllowed: notificationsAllowed, exactAlarmsAllowed: exactAlarmsAllowed);

  @override
  Future<bool> requestPermission() async {
    if (grantOnRequest) notificationsAllowed = true;
    return notificationsAllowed;
  }

  @override
  Future<void> showNow({
    required int id,
    required String title,
    required String body,
    required NotificationChannel channel,
    String? payload,
  }) async => shown.add((id: id, title: title, channel: channel));

  @override
  Future<void> schedule({
    required int id,
    required Instant at,
    required String title,
    required String body,
    required NotificationChannel channel,
    String? payload,
  }) async {
    if (throwOnSchedule case final error?) throw error;
    scheduled
      ..removeWhere((n) => n.id == id)
      ..add((id: id, at: at, title: title, channel: channel));
  }

  @override
  Future<int> pendingCount() async => scheduled.length;

  @override
  Future<void> cancelAllPending() async => scheduled.clear();
}
