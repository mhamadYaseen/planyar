import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../time/instant.dart';
import 'notification_gateway.dart';

/// [NotificationGateway] backed by `flutter_local_notifications` (plan §8.6).
///
/// Requires `initializeTimeZones()` and `tz.setLocalLocation(...)` first
/// (done by `TimeZoneService.refresh`).
final class FlutterLocalNotificationsGateway implements NotificationGateway {
  FlutterLocalNotificationsGateway([FlutterLocalNotificationsPlugin? plugin])
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  Map<NotificationChannel, String> _channelNames = const {};

  AndroidFlutterLocalNotificationsPlugin? get _android =>
      _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

  IOSFlutterLocalNotificationsPlugin? get _ios =>
      _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();

  @override
  Future<void> initialize({required Map<NotificationChannel, String> channelNames}) async {
    _channelNames = channelNames;
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      // Never prompt during initialize (plan §8.6.5).
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
    await _plugin.initialize(settings: settings);
    final android = _android;
    if (android != null) {
      for (final channel in NotificationChannel.values) {
        await android.createNotificationChannel(
          AndroidNotificationChannel(channel.id, _nameOf(channel), importance: _importanceOf(channel)),
        );
      }
    }
  }

  @override
  Future<NotificationPermissions> permissions() async {
    final android = _android;
    if (android != null) {
      return NotificationPermissions(
        notificationsAllowed: await android.areNotificationsEnabled() ?? false,
        exactAlarmsAllowed: await android.canScheduleExactNotifications() ?? false,
      );
    }
    final ios = _ios;
    if (ios != null) {
      final options = await ios.checkPermissions();
      return NotificationPermissions(notificationsAllowed: options?.isEnabled ?? false, exactAlarmsAllowed: true);
    }
    return const NotificationPermissions(notificationsAllowed: false, exactAlarmsAllowed: false);
  }

  @override
  Future<bool> requestPermission() async {
    final android = _android;
    if (android != null) return await android.requestNotificationsPermission() ?? false;
    final ios = _ios;
    if (ios != null) return await ios.requestPermissions(alert: true, badge: true, sound: true) ?? false;
    return false;
  }

  @override
  Future<void> showNow({
    required int id,
    required String title,
    required String body,
    required NotificationChannel channel,
    String? payload,
  }) => _plugin.show(id: id, title: title, body: body, notificationDetails: _detailsFor(channel), payload: payload);

  @override
  Future<void> schedule({
    required int id,
    required Instant at,
    required String title,
    required String body,
    required NotificationChannel channel,
    String? payload,
  }) async {
    final exact = (await permissions()).exactAlarmsAllowed;
    await _plugin.zonedSchedule(
      id: id,
      scheduledDate: tz.TZDateTime.fromMillisecondsSinceEpoch(tz.local, at.utcMs),
      notificationDetails: _detailsFor(channel),
      // Never `exact` (deferred in Doze) or `alarmClock` (plan §8.6.4).
      androidScheduleMode: exact ? AndroidScheduleMode.exactAllowWhileIdle : AndroidScheduleMode.inexactAllowWhileIdle,
      title: title,
      body: body,
      payload: payload,
    );
  }

  @override
  Future<int> pendingCount() async => (await _plugin.pendingNotificationRequests()).length;

  @override
  Future<void> cancelAllPending() => _plugin.cancelAllPendingNotifications();

  NotificationDetails _detailsFor(NotificationChannel channel) {
    final importance = _importanceOf(channel);
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        _nameOf(channel),
        importance: importance,
        priority: importance == Importance.high ? Priority.high : Priority.defaultPriority,
      ),
      iOS: const DarwinNotificationDetails(),
    );
  }

  String _nameOf(NotificationChannel channel) => _channelNames[channel] ?? channel.id;

  static Importance _importanceOf(NotificationChannel channel) => switch (channel) {
    NotificationChannel.routines || NotificationChannel.tasks => Importance.high,
    NotificationChannel.checkIns => Importance.defaultImportance,
    NotificationChannel.backups => Importance.low,
  };
}
