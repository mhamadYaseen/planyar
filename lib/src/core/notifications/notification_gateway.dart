import '../time/instant.dart';

/// Android notification channels (plan §9.2). Created once at startup; the
/// IDs must never change, because users' sound/importance choices hang on them.
enum NotificationChannel {
  routines('routines'),
  tasks('tasks'),
  checkIns('check_ins'),
  backups('backups');

  const NotificationChannel(this.id);

  final String id;
}

/// What the OS currently allows.
final class NotificationPermissions {
  const NotificationPermissions({required this.notificationsAllowed, required this.exactAlarmsAllowed});

  final bool notificationsAllowed;

  /// Always true when `USE_EXACT_ALARM` is declared (D-40), except on
  /// devices that revoke it; false means reminders fall back to inexact.
  final bool exactAlarmsAllowed;

  @override
  bool operator ==(Object other) =>
      other is NotificationPermissions &&
      other.notificationsAllowed == notificationsAllowed &&
      other.exactAlarmsAllowed == exactAlarmsAllowed;

  @override
  int get hashCode => Object.hash(notificationsAllowed, exactAlarmsAllowed);
}

/// The only way app code talks to the notifications plugin (plan §8.6.1),
/// so tests use a fake and the plugin can be swapped.
abstract interface class NotificationGateway {
  /// Initializes the plugin and channels. Never prompts for permission.
  Future<void> initialize({required Map<NotificationChannel, String> channelNames});

  Future<NotificationPermissions> permissions();

  /// Shows the OS prompt (Android 13+ / iOS). Returns whether it was granted.
  Future<bool> requestPermission();

  Future<void> showNow({
    required int id,
    required String title,
    required String body,
    required NotificationChannel channel,
    String? payload,
  });

  /// Schedules a one-shot notification. Uses exact timing when allowed,
  /// otherwise inexact (can be up to ~1 h late on Android 12+).
  Future<void> schedule({
    required int id,
    required Instant at,
    required String title,
    required String body,
    required NotificationChannel channel,
    String? payload,
  });

  Future<int> pendingCount();

  /// Cancels pending (not yet delivered) notifications.
  Future<void> cancelAllPending();
}
