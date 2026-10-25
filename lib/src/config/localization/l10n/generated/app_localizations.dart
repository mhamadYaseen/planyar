import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// App name shown in the task switcher and About.
  ///
  /// In en, this message translates to:
  /// **'Planyar'**
  String get appTitle;

  /// Bottom navigation tab: today's day view.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get tabToday;

  /// Bottom navigation tab: hourly month calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get tabCalendar;

  /// Bottom navigation tab: long-term tasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tabTasks;

  /// Bottom navigation tab: reports and charts.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get tabReports;

  /// Settings page title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Tooltip / screen-reader label for the gear button in app bars.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get openSettings;

  /// Empty state on the Today tab (plan §12.8).
  ///
  /// In en, this message translates to:
  /// **'Nothing logged yet. Tap + or tap the timeline to add what you did.'**
  String get todayEmpty;

  /// Placeholder on the Calendar tab until it is built.
  ///
  /// In en, this message translates to:
  /// **'Your month at a glance will appear here.'**
  String get calendarEmpty;

  /// Empty state on the Tasks tab.
  ///
  /// In en, this message translates to:
  /// **'No tasks yet. Long-running tasks with deadlines will live here.'**
  String get tasksEmpty;

  /// Empty state on the Reports tab.
  ///
  /// In en, this message translates to:
  /// **'Reports appear once you have logged some time.'**
  String get reportsEmpty;

  /// Privacy statement (SET-05).
  ///
  /// In en, this message translates to:
  /// **'Your data never leaves this device unless you export it.'**
  String get settingsPrivacy;

  /// Dev-flavor-only entry to the debug tools.
  ///
  /// In en, this message translates to:
  /// **'Developer tools'**
  String get settingsDevTools;

  /// Android notification channel name for routine reminders.
  ///
  /// In en, this message translates to:
  /// **'Routines'**
  String get channelRoutines;

  /// Android notification channel name for task reminders.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get channelTasks;

  /// Android notification channel name for the evening check-in and weekly review.
  ///
  /// In en, this message translates to:
  /// **'Check-ins & summaries'**
  String get channelCheckIns;

  /// Android notification channel name for backup reminders.
  ///
  /// In en, this message translates to:
  /// **'Backups'**
  String get channelBackups;

  /// Shown when the database can't be opened at startup.
  ///
  /// In en, this message translates to:
  /// **'Planyar couldn\'t open your data'**
  String get startupFailureTitle;

  /// Body text of the startup failure screen.
  ///
  /// In en, this message translates to:
  /// **'Nothing has been deleted. Please restart the app. If this keeps happening, keep this screen and contact the developer.'**
  String get startupFailureBody;

  /// Dev tools page title (dev flavor only).
  ///
  /// In en, this message translates to:
  /// **'Developer tools'**
  String get devToolsTitle;

  /// Section header for the notification spike.
  ///
  /// In en, this message translates to:
  /// **'Notification test'**
  String get devNotificationsSection;

  /// Current permission state in the notification spike.
  ///
  /// In en, this message translates to:
  /// **'Notifications allowed: {allowed} · Exact alarms: {exact}'**
  String devPermissionStatus(String allowed, String exact);

  /// Device time zone in the notification spike.
  ///
  /// In en, this message translates to:
  /// **'Time zone: {zone}'**
  String devTimeZone(String zone);

  /// Number of pending scheduled notifications.
  ///
  /// In en, this message translates to:
  /// **'Pending notifications: {count}'**
  String devPendingCount(int count);

  /// Button: ask for notification permission.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications'**
  String get devRequestPermission;

  /// Button: show a notification immediately.
  ///
  /// In en, this message translates to:
  /// **'Show test now'**
  String get devShowNow;

  /// Button: schedule a notification one minute from now.
  ///
  /// In en, this message translates to:
  /// **'Schedule test in 1 minute'**
  String get devScheduleInOneMinute;

  /// Button: cancel all pending test notifications.
  ///
  /// In en, this message translates to:
  /// **'Cancel pending'**
  String get devCancelAll;

  /// Confirmation after scheduling a test notification.
  ///
  /// In en, this message translates to:
  /// **'Scheduled for {time}'**
  String devScheduledAt(String time);

  /// Title of the test notification.
  ///
  /// In en, this message translates to:
  /// **'Planyar test reminder'**
  String get devTestTitle;

  /// Body of the test notification.
  ///
  /// In en, this message translates to:
  /// **'If you can read this, reminders work on this phone.'**
  String get devTestBody;

  /// Generic yes, used in status lines.
  ///
  /// In en, this message translates to:
  /// **'yes'**
  String get yes;

  /// Generic no, used in status lines.
  ///
  /// In en, this message translates to:
  /// **'no'**
  String get no;

  /// Generic error message with technical details (dev tools).
  ///
  /// In en, this message translates to:
  /// **'Something went wrong: {details}'**
  String somethingWentWrong(String details);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
