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
