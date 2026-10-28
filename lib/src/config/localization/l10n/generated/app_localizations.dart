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

  /// Button: save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Button: cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Button: delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Snackbar action: undo the last change.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// Snackbar after saving an entry (J1 AC4).
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// Snackbar after deleting an entry.
  ///
  /// In en, this message translates to:
  /// **'Entry deleted'**
  String get entryDeleted;

  /// Snackbar after closing an open entry.
  ///
  /// In en, this message translates to:
  /// **'Entry ended'**
  String get entryEnded;

  /// Generic error message.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// Duration like "2 h 05 m" (minutes are zero-padded by the app).
  ///
  /// In en, this message translates to:
  /// **'{hours} h {minutes} m'**
  String durationHoursMinutes(String hours, String minutes);

  /// Whole-hour duration like "8 h".
  ///
  /// In en, this message translates to:
  /// **'{hours} h'**
  String durationHours(String hours);

  /// Duration under an hour like "45 m".
  ///
  /// In en, this message translates to:
  /// **'{minutes} m'**
  String durationMinutes(String minutes);

  /// Entry kind: what happened.
  ///
  /// In en, this message translates to:
  /// **'Actual'**
  String get kindActual;

  /// Entry kind: what was planned.
  ///
  /// In en, this message translates to:
  /// **'Planned'**
  String get kindPlanned;

  /// Tooltip: go to the previous day.
  ///
  /// In en, this message translates to:
  /// **'Previous day'**
  String get previousDay;

  /// Tooltip: go to the next day.
  ///
  /// In en, this message translates to:
  /// **'Next day'**
  String get nextDay;

  /// Button: jump back to today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get goToToday;

  /// Tooltip on the date title.
  ///
  /// In en, this message translates to:
  /// **'Pick a date'**
  String get pickDate;

  /// Day header: actual time covered.
  ///
  /// In en, this message translates to:
  /// **'{duration} tracked'**
  String trackedSummary(String duration);

  /// Day header: planned time.
  ///
  /// In en, this message translates to:
  /// **'{duration} planned'**
  String plannedSummary(String duration);

  /// Day header chip (VIEW-05).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 overlap} other{{count} overlaps}}'**
  String overlapChip(int count);

  /// Chip for open entries (§6.9).
  ///
  /// In en, this message translates to:
  /// **'{count} to finish'**
  String toFinishChip(int count);

  /// Tooltip: switch the day view to List mode.
  ///
  /// In en, this message translates to:
  /// **'Show as list'**
  String get showAsList;

  /// Tooltip: switch the day view to the timeline.
  ///
  /// In en, this message translates to:
  /// **'Show timeline'**
  String get showAsTimeline;

  /// Menu: split lanes (VIEW-03).
  ///
  /// In en, this message translates to:
  /// **'Plan and actual side by side'**
  String get lanesSplit;

  /// Menu: combined lane (VIEW-03).
  ///
  /// In en, this message translates to:
  /// **'One combined lane'**
  String get lanesCombined;

  /// Timeline lane header.
  ///
  /// In en, this message translates to:
  /// **'PLAN'**
  String get lanePlan;

  /// Timeline lane header.
  ///
  /// In en, this message translates to:
  /// **'ACTUAL'**
  String get laneActual;

  /// FAB tooltip.
  ///
  /// In en, this message translates to:
  /// **'Add entry'**
  String get addEntry;

  /// Empty state for a day other than today.
  ///
  /// In en, this message translates to:
  /// **'Nothing on this day. Tap + to add what you did or plan to do.'**
  String get dayEmptyOtherDay;

  /// Hint at text scale ≥ 150% (§12.7).
  ///
  /// In en, this message translates to:
  /// **'Large text is on. List mode may be easier to read.'**
  String get largeTextHint;

  /// Pill on an open entry.
  ///
  /// In en, this message translates to:
  /// **'No end'**
  String get noEnd;

  /// Button on an open entry.
  ///
  /// In en, this message translates to:
  /// **'Set end'**
  String get setEnd;

  /// Marker at the bottom of an overnight entry.
  ///
  /// In en, this message translates to:
  /// **'continues until {time}'**
  String continuesUntil(String time);

  /// Marker at the top of an entry that started the day before.
  ///
  /// In en, this message translates to:
  /// **'from {time}'**
  String continuesFrom(String time);

  /// Hour label for the repeated hour on a fall-back DST day.
  ///
  /// In en, this message translates to:
  /// **'{time} (2nd)'**
  String repeatedHour(String time);

  /// Screen-reader label for an entry.
  ///
  /// In en, this message translates to:
  /// **'{kind}. {label}. {start} to {end}. {duration}.'**
  String entrySemantics(String kind, String label, String start, String end, String duration);

  /// Screen-reader label for an open entry.
  ///
  /// In en, this message translates to:
  /// **'{kind}. {label}. Started {start}. No end time.'**
  String openEntrySemantics(String kind, String label, String start);

  /// Screen-reader note for an overlapping entry.
  ///
  /// In en, this message translates to:
  /// **'Overlaps another entry.'**
  String get overlapSemantics;

  /// Fallback when a label is missing.
  ///
  /// In en, this message translates to:
  /// **'Unknown label'**
  String get unknownLabel;

  /// Section title in the entry editor.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get labelHeading;

  /// Start time field.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startLabel;

  /// End time field.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get endLabel;

  /// Chip: end at the current time.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get endNow;

  /// Chip: save as an open entry (ENT-05).
  ///
  /// In en, this message translates to:
  /// **'No end yet'**
  String get noEndYet;

  /// Chip: 15 minutes earlier.
  ///
  /// In en, this message translates to:
  /// **'−15'**
  String get minus15;

  /// Chip: 15 minutes later.
  ///
  /// In en, this message translates to:
  /// **'+15'**
  String get plus15;

  /// Tooltip for −15.
  ///
  /// In en, this message translates to:
  /// **'15 minutes earlier'**
  String get earlierBy15;

  /// Tooltip for +15.
  ///
  /// In en, this message translates to:
  /// **'15 minutes later'**
  String get laterBy15;

  /// Label search field / button.
  ///
  /// In en, this message translates to:
  /// **'Search labels'**
  String get searchLabels;

  /// Expander in quick add (opens the full editor).
  ///
  /// In en, this message translates to:
  /// **'Note, category'**
  String get moreOptions;

  /// Note field.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get noteLabel;

  /// Category override field (rarely needed, CAT-02).
  ///
  /// In en, this message translates to:
  /// **'Category for this entry'**
  String get categoryForEntry;

  /// Default option for the category override.
  ///
  /// In en, this message translates to:
  /// **'From the label'**
  String get categoryFromLabel;

  /// No category.
  ///
  /// In en, this message translates to:
  /// **'Uncategorized'**
  String get uncategorized;

  /// Editor warning (J5 AC1).
  ///
  /// In en, this message translates to:
  /// **'Overlaps with {label} {range}. That\'s OK — saving anyway.'**
  String overlapsWith(String label, String range);

  /// When several entries overlap.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{and 1 more} other{and {count} more}}'**
  String overlapsMore(int count);

  /// Non-blocking notice over 16 h (ENT-04).
  ///
  /// In en, this message translates to:
  /// **'Long entry — is the end time right?'**
  String get longEntryNotice;

  /// Blocking problem.
  ///
  /// In en, this message translates to:
  /// **'The end must be after the start.'**
  String get problemEndNotAfterStart;

  /// Blocking problem.
  ///
  /// In en, this message translates to:
  /// **'An entry can be at most 7 days long.'**
  String get problemTooLong;

  /// Blocking problem.
  ///
  /// In en, this message translates to:
  /// **'Pick a date from 2000 up to five years from now.'**
  String get problemOutOfRange;

  /// Blocking problem.
  ///
  /// In en, this message translates to:
  /// **'Notes can be up to 2,000 characters.'**
  String get problemNoteTooLong;

  /// Hint when no label is chosen.
  ///
  /// In en, this message translates to:
  /// **'Pick a label to save.'**
  String get pickLabelFirst;

  /// Editor title.
  ///
  /// In en, this message translates to:
  /// **'New entry'**
  String get newEntryTitle;

  /// Editor title.
  ///
  /// In en, this message translates to:
  /// **'Edit entry'**
  String get editEntryTitle;

  /// Editor action (ENT-12).
  ///
  /// In en, this message translates to:
  /// **'Duplicate'**
  String get duplicate;

  /// When an entry was deleted meanwhile.
  ///
  /// In en, this message translates to:
  /// **'This entry no longer exists.'**
  String get entryNotFound;

  /// Page title (S11).
  ///
  /// In en, this message translates to:
  /// **'To finish'**
  String get toFinishTitle;

  /// Empty state.
  ///
  /// In en, this message translates to:
  /// **'Nothing to finish. Entries without an end show up here.'**
  String get toFinishEmpty;

  /// Subtitle of an open entry.
  ///
  /// In en, this message translates to:
  /// **'Started {when} · {elapsed} ago'**
  String startedAgo(String when, String elapsed);

  /// Chip: end 30 minutes after the start.
  ///
  /// In en, this message translates to:
  /// **'+30m'**
  String get plus30m;

  /// Chip: end 1 hour after the start.
  ///
  /// In en, this message translates to:
  /// **'+1h'**
  String get plus1h;

  /// Chip: end 2 hours after the start.
  ///
  /// In en, this message translates to:
  /// **'+2h'**
  String get plus2h;

  /// Button: choose an end time.
  ///
  /// In en, this message translates to:
  /// **'Set end…'**
  String get setEndEllipsis;

  /// Picker row (J3 AC1).
  ///
  /// In en, this message translates to:
  /// **'Create \"{name}\"'**
  String createLabelNamed(String name);

  /// Picker row (LBL-05).
  ///
  /// In en, this message translates to:
  /// **'Restore archived \"{name}\"'**
  String restoreLabelNamed(String name);

  /// Picker section.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recentLabels;

  /// Picker section.
  ///
  /// In en, this message translates to:
  /// **'All labels'**
  String get allLabels;

  /// Link to Labels & categories.
  ///
  /// In en, this message translates to:
  /// **'Manage labels'**
  String get manageLabels;

  /// Picker empty state.
  ///
  /// In en, this message translates to:
  /// **'No labels yet. Type a name to create one.'**
  String get noLabelsYet;

  /// Settings entry and page title (S5).
  ///
  /// In en, this message translates to:
  /// **'Labels & categories'**
  String get labelsAndCategories;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'New label'**
  String get newLabel;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'New category'**
  String get newCategory;

  /// Section of archived labels.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get archivedLabels;

  /// Usage count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Not used yet} =1{1 entry} other{{count} entries}}'**
  String entryCount(int count);

  /// Page title (S6).
  ///
  /// In en, this message translates to:
  /// **'Edit label'**
  String get editLabel;

  /// Page title (S7).
  ///
  /// In en, this message translates to:
  /// **'Edit category'**
  String get editCategory;

  /// Name field.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// Color picker title.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get colorLabel;

  /// Icon picker title.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get iconLabel;

  /// Option: no icon.
  ///
  /// In en, this message translates to:
  /// **'No icon'**
  String get noIcon;

  /// Category field.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryLabel;

  /// Live preview title (S6).
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get previewLabel;

  /// Button (LBL-05).
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// Button (LBL-05).
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// Name problem.
  ///
  /// In en, this message translates to:
  /// **'Enter a name.'**
  String get nameEmpty;

  /// Name problem.
  ///
  /// In en, this message translates to:
  /// **'Use 40 characters or fewer.'**
  String get nameTooLong;

  /// Name problem.
  ///
  /// In en, this message translates to:
  /// **'That name is already used, maybe by an archived label.'**
  String get nameTaken;

  /// Part of the in-use reason.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 entry} other{{count} entries}}'**
  String usageEntries(int count);

  /// Part of the in-use reason.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 routine} other{{count} routines}}'**
  String usageRoutines(int count);

  /// Why Delete is disabled (J20 AC2).
  ///
  /// In en, this message translates to:
  /// **'Can\'t delete: used by {usage}. Archive it instead to hide it from pickers.'**
  String labelInUse(String usage);

  /// Joins two phrases.
  ///
  /// In en, this message translates to:
  /// **'{a} and {b}'**
  String andJoin(String a, String b);

  /// Confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"? This can\'t be undone.'**
  String deleteLabelConfirm(String name);

  /// Shown on archived labels.
  ///
  /// In en, this message translates to:
  /// **'Archived: hidden from pickers, still shown on past entries.'**
  String get labelArchivedNote;

  /// Category editor section.
  ///
  /// In en, this message translates to:
  /// **'Labels in this category'**
  String get labelsInCategory;

  /// Dialog title (CAT-04).
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String deleteCategoryTitle(String name);

  /// Dialog text (CAT-04).
  ///
  /// In en, this message translates to:
  /// **'Move its labels, tasks and entries to:'**
  String get moveCategoryItemsTo;

  /// Option: category without a color.
  ///
  /// In en, this message translates to:
  /// **'No color'**
  String get noColor;

  /// Onboarding step 1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Planyar'**
  String get onboardingWelcomeTitle;

  /// Onboarding step 1.
  ///
  /// In en, this message translates to:
  /// **'Log what you did, plan what you\'ll do, and see where your time goes. Everything stays on this phone.'**
  String get onboardingWelcomeBody;

  /// Onboarding button.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// Onboarding step 2.
  ///
  /// In en, this message translates to:
  /// **'Pick some labels'**
  String get starterTitle;

  /// Onboarding step 2.
  ///
  /// In en, this message translates to:
  /// **'Labels are what you log time with. Rename, recolor or add more any time.'**
  String get starterBody;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Settings entry and page title (S25).
  ///
  /// In en, this message translates to:
  /// **'Appearance & time'**
  String get appearanceAndTime;

  /// Setting.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// Theme option.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Theme option.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Theme option.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// Setting (SET-02).
  ///
  /// In en, this message translates to:
  /// **'First day of the week'**
  String get firstDayOfWeek;

  /// Dev tools section.
  ///
  /// In en, this message translates to:
  /// **'Sample data'**
  String get devSampleDataSection;

  /// Dev tools: fill the last 770 days.
  ///
  /// In en, this message translates to:
  /// **'Add ~5,000 sample entries'**
  String get devSeedButton;

  /// Dev tools: result.
  ///
  /// In en, this message translates to:
  /// **'Added {count} entries.'**
  String devSeeded(int count);

  /// Dev tools section.
  ///
  /// In en, this message translates to:
  /// **'Frame timing'**
  String get devFrameTimingSection;

  /// Dev tools hint.
  ///
  /// In en, this message translates to:
  /// **'Tap Start, scroll the timeline and swipe days for a while, then come back and tap Stop.'**
  String get devFrameHint;

  /// Dev tools: recording.
  ///
  /// In en, this message translates to:
  /// **'Recording… go scroll Today, then come back.'**
  String get devFrameRecording;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'Start recording'**
  String get devFrameStart;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'Stop and show results'**
  String get devFrameStop;

  /// Dev tools: frame stats.
  ///
  /// In en, this message translates to:
  /// **'{frames} frames · median {p50} ms · 90% {p90} ms · 99% {p99} ms · over 16.7 ms: {slow}%'**
  String devFrameResult(int frames, String p50, String p90, String p99, String slow);

  /// Settings hub tile (S22).
  ///
  /// In en, this message translates to:
  /// **'Backup & restore'**
  String get settingsBackup;

  /// Settings hub tile (S26).
  ///
  /// In en, this message translates to:
  /// **'About & privacy'**
  String get settingsAbout;

  /// S22 title.
  ///
  /// In en, this message translates to:
  /// **'Backup & restore'**
  String get backupTitle;

  /// BAK-05. when = backupDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'Last full export: {when}'**
  String backupLastExport(String when);

  /// Relative age of the last export.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =0{today} =1{yesterday} other{{days} days ago}}'**
  String backupDaysAgo(int days);

  /// BAK-05 when there was never an export.
  ///
  /// In en, this message translates to:
  /// **'No full export yet'**
  String get backupNeverExported;

  /// S22 explanation.
  ///
  /// In en, this message translates to:
  /// **'One file with all your entries, labels, routines, tasks and settings. Keep a copy somewhere other than this phone.'**
  String get backupExportIntro;

  /// BAK-01 button: opens the share sheet.
  ///
  /// In en, this message translates to:
  /// **'Export all data'**
  String get backupExportButton;

  /// BAK-01 button: the system "Save as" dialog.
  ///
  /// In en, this message translates to:
  /// **'Save to device'**
  String get backupSaveButton;

  /// Privacy note (§10.10).
  ///
  /// In en, this message translates to:
  /// **'Backups aren\'t encrypted: anyone with the file can read it.'**
  String get backupPlainNote;

  /// While exporting.
  ///
  /// In en, this message translates to:
  /// **'Preparing the backup…'**
  String get backupExporting;

  /// Snackbar after sharing.
  ///
  /// In en, this message translates to:
  /// **'Backup ready: {fileName}'**
  String backupShared(String fileName);

  /// Snackbar after Save to device.
  ///
  /// In en, this message translates to:
  /// **'Saved {fileName}'**
  String backupSavedToDevice(String fileName);

  /// Export error.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t export your data.'**
  String get backupExportFailed;

  /// S22 section.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get backupRestoreSection;

  /// BAK-03 button: opens the file picker.
  ///
  /// In en, this message translates to:
  /// **'Import a backup…'**
  String get backupImportButton;

  /// Under the import button.
  ///
  /// In en, this message translates to:
  /// **'You\'ll see what\'s in the file before anything changes.'**
  String get backupImportHint;

  /// S22 section (BAK-04).
  ///
  /// In en, this message translates to:
  /// **'Safety backups'**
  String get backupSafetySection;

  /// Safety backups explanation (§10.8).
  ///
  /// In en, this message translates to:
  /// **'Planyar saves your data by itself before every import and before erasing. The last 5 are kept on this phone; they\'re removed if you uninstall the app.'**
  String get backupSafetyIntro;

  /// No safety backups.
  ///
  /// In en, this message translates to:
  /// **'None yet.'**
  String get backupSafetyNone;

  /// Safety backup row.
  ///
  /// In en, this message translates to:
  /// **'{reason} · {when}'**
  String backupSafetyTitle(String reason, String when);

  /// Safety backup reason.
  ///
  /// In en, this message translates to:
  /// **'Before an import'**
  String get safetyReasonImport;

  /// Safety backup reason.
  ///
  /// In en, this message translates to:
  /// **'Before erasing all data'**
  String get safetyReasonErase;

  /// Safety backup reason: raw database copy.
  ///
  /// In en, this message translates to:
  /// **'Before an app update (database file)'**
  String get safetyReasonMigration;

  /// Safety backup action.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get safetyRestore;

  /// Safety backup action.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get safetyShare;

  /// Tooltip of the safety backup menu.
  ///
  /// In en, this message translates to:
  /// **'Actions for this safety backup'**
  String get safetyActions;

  /// Import log (last 5).
  ///
  /// In en, this message translates to:
  /// **'Recent imports'**
  String get backupHistorySection;

  /// Import log line.
  ///
  /// In en, this message translates to:
  /// **'Merged {fileName}'**
  String importLogMerged(String fileName);

  /// Import log line.
  ///
  /// In en, this message translates to:
  /// **'Replaced with {fileName}'**
  String importLogReplaced(String fileName);

  /// Import log details.
  ///
  /// In en, this message translates to:
  /// **'{when} · {written} added or updated, {skipped} unchanged, {invalid} left out'**
  String importLogCounts(String when, int written, int skipped, int invalid);

  /// J17 AC1.
  ///
  /// In en, this message translates to:
  /// **'This file isn\'t a Planyar backup or is damaged.'**
  String get backupProblemNotABackup;

  /// J17 AC3, BAK-06.
  ///
  /// In en, this message translates to:
  /// **'This backup was made by a newer version of Planyar. Update the app to import it.'**
  String get backupProblemNewer;

  /// Over 200 MB.
  ///
  /// In en, this message translates to:
  /// **'This file is too large to be a Planyar backup.'**
  String get backupProblemTooLarge;

  /// The file could not be read.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open this file. Try picking it again.'**
  String get backupProblemUnreadable;

  /// Reassurance after a refused file.
  ///
  /// In en, this message translates to:
  /// **'Nothing was changed.'**
  String get backupNothingChanged;

  /// S23 title.
  ///
  /// In en, this message translates to:
  /// **'Import a backup'**
  String get importTitle;

  /// While reading and validating.
  ///
  /// In en, this message translates to:
  /// **'Checking the file…'**
  String get importReading;

  /// When the backup was created.
  ///
  /// In en, this message translates to:
  /// **'Made {when}'**
  String importFileCreated(String when);

  /// Where the backup was made.
  ///
  /// In en, this message translates to:
  /// **'{platform} · Planyar {version} · {zone}'**
  String importFileOrigin(String platform, String version, String zone);

  /// File size and record count.
  ///
  /// In en, this message translates to:
  /// **'{size} · {count} records'**
  String importFileSize(String size, int count);

  /// Mode choice heading.
  ///
  /// In en, this message translates to:
  /// **'How to import'**
  String get importModeTitle;

  /// Mode.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get importModeMerge;

  /// Merge explanation (§10.7).
  ///
  /// In en, this message translates to:
  /// **'Adds new records and updates ones that changed. Nothing on this phone is deleted.'**
  String get importModeMergeHint;

  /// Mode.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get importModeReplace;

  /// Replace explanation (§10.7).
  ///
  /// In en, this message translates to:
  /// **'Deletes all data on this phone, then restores this backup.'**
  String get importModeReplaceHint;

  /// Safety backup restore is always Replace.
  ///
  /// In en, this message translates to:
  /// **'Restoring a safety backup replaces all data on this phone with the data it saved.'**
  String get importRestoreHint;

  /// Counts heading.
  ///
  /// In en, this message translates to:
  /// **'What will happen'**
  String get importWhatHappens;

  /// Record type.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get tableCategories;

  /// Record type.
  ///
  /// In en, this message translates to:
  /// **'Labels'**
  String get tableLabels;

  /// Record type.
  ///
  /// In en, this message translates to:
  /// **'Entries'**
  String get tableEntries;

  /// Record type.
  ///
  /// In en, this message translates to:
  /// **'Routines'**
  String get tableRoutines;

  /// Record type: one-day routine exceptions.
  ///
  /// In en, this message translates to:
  /// **'Routine changes'**
  String get tableRoutineExceptions;

  /// Record type: task series.
  ///
  /// In en, this message translates to:
  /// **'Repeating tasks'**
  String get tableTaskSeries;

  /// Record type.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tableTasks;

  /// Record type.
  ///
  /// In en, this message translates to:
  /// **'Task reminders'**
  String get tableTaskReminders;

  /// Preview count.
  ///
  /// In en, this message translates to:
  /// **'{count} new'**
  String countNew(int count);

  /// Preview count.
  ///
  /// In en, this message translates to:
  /// **'{count} updated'**
  String countUpdated(int count);

  /// Preview count.
  ///
  /// In en, this message translates to:
  /// **'{count} unchanged'**
  String countUnchanged(int count);

  /// Preview count: invalid records.
  ///
  /// In en, this message translates to:
  /// **'{count} left out'**
  String countInvalid(int count);

  /// Preview count: exact duplicate entries skipped (D-27).
  ///
  /// In en, this message translates to:
  /// **'{count} already on this phone'**
  String countDuplicates(int count);

  /// Preview count: D-25.
  ///
  /// In en, this message translates to:
  /// **'{count} matched by name'**
  String countMatchedByName(int count);

  /// Preview count: routine occurrence/exception key clash.
  ///
  /// In en, this message translates to:
  /// **'{count} replace this phone\'s for the same day'**
  String countReplacedByKey(int count);

  /// Replace preview count.
  ///
  /// In en, this message translates to:
  /// **'{count} deleted from this phone'**
  String countRemoved(int count);

  /// Merge with nothing to write.
  ///
  /// In en, this message translates to:
  /// **'Everything in this backup is already on this phone.'**
  String get importNothingNew;

  /// Merge warning (§10.6 stage 6).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 record on this phone was changed after this backup was made and will be overwritten.} other{{count} records on this phone were changed after this backup was made and will be overwritten.}}'**
  String importLocalNewer(int count);

  /// Merge note (D-25).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 label or category has the same name as one on this phone and will be combined with it.} other{{count} labels or categories have the same name as ones on this phone and will be combined with them.}}'**
  String importMatchedByName(int count);

  /// Merge note (D-27).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 entry is already on this phone and will be skipped.} other{{count} entries are already on this phone and will be skipped.}}'**
  String importDuplicates(int count);

  /// Replace warning: local records missing from the file.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 record on this phone isn\'t in the backup and will be deleted.} other{{count} records on this phone aren\'t in the backup and will be deleted.}}'**
  String importReplaceRemoves(int count);

  /// Merge option (D-26).
  ///
  /// In en, this message translates to:
  /// **'Also import settings'**
  String get importAlsoSettings;

  /// Merge option detail.
  ///
  /// In en, this message translates to:
  /// **'Theme, first day of week and view options. Otherwise this phone\'s settings stay.'**
  String get importAlsoSettingsHint;

  /// Replace note.
  ///
  /// In en, this message translates to:
  /// **'The backup\'s settings replace this phone\'s (theme, first day of week, view options).'**
  String get importReplaceSettings;

  /// Invalid records heading (J17 AC2).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 record can\'t be imported} other{{count} records can\'t be imported}}'**
  String importInvalidTitle(int count);

  /// Required confirmation when records are invalid (J17 AC2).
  ///
  /// In en, this message translates to:
  /// **'Import without them'**
  String get importSkipInvalid;

  /// Safe repairs heading (§10.6).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 small fix will be made} other{{count} small fixes will be made}}'**
  String importRepairsTitle(int count);

  /// Stage 8 reassurance.
  ///
  /// In en, this message translates to:
  /// **'A safety backup of this phone\'s data is saved first.'**
  String get importSafetyNote;

  /// Record named by its place in the file.
  ///
  /// In en, this message translates to:
  /// **'{type} #{position}'**
  String importRecordAt(String type, int position);

  /// Record named by the start of its ID.
  ///
  /// In en, this message translates to:
  /// **'{type} {id}'**
  String importRecordId(String type, String id);

  /// One invalid record or repair.
  ///
  /// In en, this message translates to:
  /// **'{record}: {reason}'**
  String importIssueLine(String record, String reason);

  /// Record type, singular.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get recordCategory;

  /// Record type, singular.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get recordLabel;

  /// Record type, singular.
  ///
  /// In en, this message translates to:
  /// **'Entry'**
  String get recordEntry;

  /// Record type, singular.
  ///
  /// In en, this message translates to:
  /// **'Routine'**
  String get recordRoutine;

  /// Record type, singular.
  ///
  /// In en, this message translates to:
  /// **'Routine change'**
  String get recordRoutineException;

  /// Record type, singular.
  ///
  /// In en, this message translates to:
  /// **'Repeating task'**
  String get recordTaskSeries;

  /// Record type, singular.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get recordTask;

  /// Record type, singular.
  ///
  /// In en, this message translates to:
  /// **'Task reminder'**
  String get recordTaskReminder;

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'isn\'t a record'**
  String get issueNotAnObject;

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'“{field}” is missing'**
  String issueMissingField(String field);

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'“{field}” has the wrong type'**
  String issueWrongType(String field);

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'“{field}” isn\'t a valid ID'**
  String issueBadId(String field);

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'“{field}” has a value that isn\'t allowed'**
  String issueBadValue(String field);

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'“{field}” is too long'**
  String issueTooLong(String field);

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'“{field}” isn\'t a valid time'**
  String issueBadTime(String field);

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'“{field}” isn\'t a valid date'**
  String issueBadDate(String field);

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'ends before it starts'**
  String get issueEndNotAfterStart;

  /// Invalid record reason (ENT-04).
  ///
  /// In en, this message translates to:
  /// **'is longer than 7 days'**
  String get issueLongerThan7Days;

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'has the same ID as another record'**
  String get issueDuplicateId;

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'has the same name as another one in the file; they are combined'**
  String get issueDuplicateName;

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'is a second copy for the same routine and day'**
  String get issueDuplicateOccurrence;

  /// Invalid record reason.
  ///
  /// In en, this message translates to:
  /// **'refers to something that\'s neither in the backup nor on this phone'**
  String get issueMissingReference;

  /// Invalid record reason (merge).
  ///
  /// In en, this message translates to:
  /// **'would take a name that another one on this phone already has'**
  String get issueNameUsedOnDevice;

  /// Repair.
  ///
  /// In en, this message translates to:
  /// **'unknown color, gray is used'**
  String get repairColorReplaced;

  /// Repair.
  ///
  /// In en, this message translates to:
  /// **'unknown icon, shown without one'**
  String get repairIconRemoved;

  /// Repair.
  ///
  /// In en, this message translates to:
  /// **'time rounded to the minute'**
  String get repairRoundedToMinute;

  /// Repair.
  ///
  /// In en, this message translates to:
  /// **'its label is missing, so it goes under “Imported – unknown label”'**
  String get repairPlaceholderLabel;

  /// Repair.
  ///
  /// In en, this message translates to:
  /// **'a link to a missing record is removed'**
  String get repairReferenceCleared;

  /// Repair.
  ///
  /// In en, this message translates to:
  /// **'completion time set to its last change'**
  String get repairCompletedAtSet;

  /// Repair.
  ///
  /// In en, this message translates to:
  /// **'completion time removed (not completed)'**
  String get repairCompletedAtCleared;

  /// Repair.
  ///
  /// In en, this message translates to:
  /// **'becomes a one-off task (its series already has an open one)'**
  String get repairDetachedFromSeries;

  /// Confirm button.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get importMergeButton;

  /// Confirm button.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get importReplaceButton;

  /// Extra confirmation for Replace (§10.6 stage 7).
  ///
  /// In en, this message translates to:
  /// **'Replace all data?'**
  String get importReplaceConfirmTitle;

  /// Replace confirmation.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{The data on this phone is replaced with the backup. A safety backup is saved first.} =1{The data on this phone is replaced with the backup, and 1 record that isn\'t in it is deleted. A safety backup is saved first.} other{The data on this phone is replaced with the backup, and {count} records that aren\'t in it are deleted. A safety backup is saved first.}}'**
  String importReplaceConfirmBody(int count);

  /// While the import runs.
  ///
  /// In en, this message translates to:
  /// **'Importing…'**
  String get importRunning;

  /// S24 title.
  ///
  /// In en, this message translates to:
  /// **'Import complete'**
  String get importDoneTitle;

  /// S24 summary.
  ///
  /// In en, this message translates to:
  /// **'{written} added or updated, {skipped} unchanged, {invalid} left out.'**
  String importDoneSummary(int written, int skipped, int invalid);

  /// S24: the safety backup (BAK-04).
  ///
  /// In en, this message translates to:
  /// **'Safety backup of the earlier data: {name}'**
  String importDoneSafety(String name);

  /// Post-import quick_check failed.
  ///
  /// In en, this message translates to:
  /// **'A check after the import found a problem. If anything looks wrong, restore the safety backup from Backup & restore.'**
  String get importIntegrityWarning;

  /// Stage 8 failure.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save a safety backup first, so nothing was imported. Your data was not changed.'**
  String get importSafetyFailed;

  /// Stage 9 failure (rolled back).
  ///
  /// In en, this message translates to:
  /// **'The import failed. Your data was not changed.'**
  String get importFailed;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// S26 title.
  ///
  /// In en, this message translates to:
  /// **'About & privacy'**
  String get aboutTitle;

  /// App version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String aboutVersion(String version);

  /// S26 section.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get aboutPrivacyTitle;

  /// SET-05 privacy statement.
  ///
  /// In en, this message translates to:
  /// **'Your data never leaves this device unless you export it. Planyar has no account, no ads and no analytics, and it can\'t use the internet.'**
  String get aboutPrivacyBody;

  /// S26 tile.
  ///
  /// In en, this message translates to:
  /// **'Open-source licenses'**
  String get aboutLicenses;

  /// S26 section with Erase all data.
  ///
  /// In en, this message translates to:
  /// **'Start over'**
  String get aboutDangerSection;

  /// SET-06 title and tile.
  ///
  /// In en, this message translates to:
  /// **'Erase all data'**
  String get eraseTitle;

  /// SET-06 explanation.
  ///
  /// In en, this message translates to:
  /// **'This deletes every entry, label, routine, task and setting on this phone. Planyar then starts again from the welcome screen.'**
  String get eraseBody;

  /// SET-06: offer an export first.
  ///
  /// In en, this message translates to:
  /// **'Export a backup first'**
  String get eraseExportFirst;

  /// After exporting from the erase page.
  ///
  /// In en, this message translates to:
  /// **'Backup ready: {fileName}'**
  String eraseExported(String fileName);

  /// SET-06 reassurance.
  ///
  /// In en, this message translates to:
  /// **'A safety backup is also saved on this phone first. You can restore it from Backup & restore.'**
  String get eraseSafetyNote;

  /// SET-06 confirmation field. Keep the word ERASE in English: the app checks for it.
  ///
  /// In en, this message translates to:
  /// **'Type ERASE to confirm'**
  String get eraseTypeLabel;

  /// SET-06 destructive button.
  ///
  /// In en, this message translates to:
  /// **'Erase everything'**
  String get eraseButton;

  /// While erasing.
  ///
  /// In en, this message translates to:
  /// **'Erasing…'**
  String get eraseRunning;

  /// Erase failure.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save a safety backup first, so nothing was erased.'**
  String get eraseSafetyFailed;

  /// Erase failure.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t erase your data. Nothing was deleted.'**
  String get eraseFailed;

  /// S28 explanation.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while opening the database. Nothing has been deleted. You can try again, restore a backup, or keep a copy of the database file.'**
  String get recoveryBody;

  /// S28 action.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get recoveryRetry;

  /// S28 action.
  ///
  /// In en, this message translates to:
  /// **'Restore the latest safety backup'**
  String get recoveryRestoreLatest;

  /// S28 action detail.
  ///
  /// In en, this message translates to:
  /// **'{when}: your data as it was then'**
  String recoveryRestoreLatestHint(String when);

  /// S28 action.
  ///
  /// In en, this message translates to:
  /// **'Export the database file'**
  String get recoveryExportDatabase;

  /// S28 action detail.
  ///
  /// In en, this message translates to:
  /// **'A copy to look at on a computer or to send to the developer.'**
  String get recoveryExportDatabaseHint;

  /// S28 action.
  ///
  /// In en, this message translates to:
  /// **'Import a backup…'**
  String get recoveryImport;

  /// S28 confirmation.
  ///
  /// In en, this message translates to:
  /// **'Restore this backup?'**
  String get recoveryConfirmTitle;

  /// S28 confirmation.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{The current database file is moved aside (not deleted) and the backup is restored: 1 record.} other{The current database file is moved aside (not deleted) and the backup is restored: {count} records.}}'**
  String recoveryConfirmBody(int count);

  /// S28 confirm button.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get recoveryRestore;

  /// S28 progress.
  ///
  /// In en, this message translates to:
  /// **'Working…'**
  String get recoveryWorking;

  /// S28 failure.
  ///
  /// In en, this message translates to:
  /// **'That didn\'t work. Nothing was changed.'**
  String get recoveryActionFailed;

  /// S28 expandable details.
  ///
  /// In en, this message translates to:
  /// **'Technical details'**
  String get recoveryDetails;

  /// Welcome step: moving from another phone.
  ///
  /// In en, this message translates to:
  /// **'Restore from a backup'**
  String get onboardingRestore;

  /// After the first 100 issues or fixes.
  ///
  /// In en, this message translates to:
  /// **'…and {count} more'**
  String importMoreIssues(int count);
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
