// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Planyar';

  @override
  String get tabToday => 'Today';

  @override
  String get tabCalendar => 'Calendar';

  @override
  String get tabTasks => 'Tasks';

  @override
  String get tabReports => 'Reports';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get openSettings => 'Open settings';

  @override
  String get todayEmpty => 'Nothing logged yet. Tap + or tap the timeline to add what you did.';

  @override
  String get calendarEmpty => 'Your month at a glance will appear here.';

  @override
  String get tasksEmpty => 'No tasks yet. Long-running tasks with deadlines will live here.';

  @override
  String get reportsEmpty => 'Reports appear once you have logged some time.';

  @override
  String get settingsPrivacy => 'Your data never leaves this device unless you export it.';

  @override
  String get settingsDevTools => 'Developer tools';

  @override
  String get channelRoutines => 'Routines';

  @override
  String get channelTasks => 'Tasks';

  @override
  String get channelCheckIns => 'Check-ins & summaries';

  @override
  String get channelBackups => 'Backups';

  @override
  String get startupFailureTitle => 'Planyar couldn\'t open your data';

  @override
  String get startupFailureBody =>
      'Nothing has been deleted. Please restart the app. If this keeps happening, keep this screen and contact the developer.';

  @override
  String get devToolsTitle => 'Developer tools';

  @override
  String get devNotificationsSection => 'Notification test';

  @override
  String devPermissionStatus(String allowed, String exact) {
    return 'Notifications allowed: $allowed · Exact alarms: $exact';
  }

  @override
  String devTimeZone(String zone) {
    return 'Time zone: $zone';
  }

  @override
  String devPendingCount(int count) {
    return 'Pending notifications: $count';
  }

  @override
  String get devRequestPermission => 'Allow notifications';

  @override
  String get devShowNow => 'Show test now';

  @override
  String get devScheduleInOneMinute => 'Schedule test in 1 minute';

  @override
  String get devCancelAll => 'Cancel pending';

  @override
  String devScheduledAt(String time) {
    return 'Scheduled for $time';
  }

  @override
  String get devTestTitle => 'Planyar test reminder';

  @override
  String get devTestBody => 'If you can read this, reminders work on this phone.';

  @override
  String get yes => 'yes';

  @override
  String get no => 'no';

  @override
  String somethingWentWrong(String details) {
    return 'Something went wrong: $details';
  }
}
