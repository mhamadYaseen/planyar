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

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get undo => 'Undo';

  @override
  String get saved => 'Saved';

  @override
  String get entryDeleted => 'Entry deleted';

  @override
  String get entryEnded => 'Entry ended';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hours h $minutes m';
  }

  @override
  String durationHours(String hours) {
    return '$hours h';
  }

  @override
  String durationMinutes(String minutes) {
    return '$minutes m';
  }

  @override
  String get kindActual => 'Actual';

  @override
  String get kindPlanned => 'Planned';

  @override
  String get previousDay => 'Previous day';

  @override
  String get nextDay => 'Next day';

  @override
  String get goToToday => 'Today';

  @override
  String get pickDate => 'Pick a date';

  @override
  String trackedSummary(String duration) {
    return '$duration tracked';
  }

  @override
  String plannedSummary(String duration) {
    return '$duration planned';
  }

  @override
  String overlapChip(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count overlaps', one: '1 overlap');
    return '$_temp0';
  }

  @override
  String toFinishChip(int count) {
    return '$count to finish';
  }

  @override
  String get showAsList => 'Show as list';

  @override
  String get showAsTimeline => 'Show timeline';

  @override
  String get lanesSplit => 'Plan and actual side by side';

  @override
  String get lanesCombined => 'One combined lane';

  @override
  String get lanePlan => 'PLAN';

  @override
  String get laneActual => 'ACTUAL';

  @override
  String get addEntry => 'Add entry';

  @override
  String get dayEmptyOtherDay => 'Nothing on this day. Tap + to add what you did or plan to do.';

  @override
  String get largeTextHint => 'Large text is on. List mode may be easier to read.';

  @override
  String get noEnd => 'No end';

  @override
  String get setEnd => 'Set end';

  @override
  String continuesUntil(String time) {
    return 'continues until $time';
  }

  @override
  String continuesFrom(String time) {
    return 'from $time';
  }

  @override
  String repeatedHour(String time) {
    return '$time (2nd)';
  }

  @override
  String entrySemantics(String kind, String label, String start, String end, String duration) {
    return '$kind. $label. $start to $end. $duration.';
  }

  @override
  String openEntrySemantics(String kind, String label, String start) {
    return '$kind. $label. Started $start. No end time.';
  }

  @override
  String get overlapSemantics => 'Overlaps another entry.';

  @override
  String get unknownLabel => 'Unknown label';

  @override
  String get labelHeading => 'Label';

  @override
  String get startLabel => 'Start';

  @override
  String get endLabel => 'End';

  @override
  String get endNow => 'Now';

  @override
  String get noEndYet => 'No end yet';

  @override
  String get minus15 => '−15';

  @override
  String get plus15 => '+15';

  @override
  String get earlierBy15 => '15 minutes earlier';

  @override
  String get laterBy15 => '15 minutes later';

  @override
  String get searchLabels => 'Search labels';

  @override
  String get moreOptions => 'Note, category';

  @override
  String get noteLabel => 'Note';

  @override
  String get categoryForEntry => 'Category for this entry';

  @override
  String get categoryFromLabel => 'From the label';

  @override
  String get uncategorized => 'Uncategorized';

  @override
  String overlapsWith(String label, String range) {
    return 'Overlaps with $label $range. That\'s OK — saving anyway.';
  }

  @override
  String overlapsMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'and $count more', one: 'and 1 more');
    return '$_temp0';
  }

  @override
  String get longEntryNotice => 'Long entry — is the end time right?';

  @override
  String get problemEndNotAfterStart => 'The end must be after the start.';

  @override
  String get problemTooLong => 'An entry can be at most 7 days long.';

  @override
  String get problemOutOfRange => 'Pick a date from 2000 up to five years from now.';

  @override
  String get problemNoteTooLong => 'Notes can be up to 2,000 characters.';

  @override
  String get pickLabelFirst => 'Pick a label to save.';

  @override
  String get newEntryTitle => 'New entry';

  @override
  String get editEntryTitle => 'Edit entry';

  @override
  String get duplicate => 'Duplicate';

  @override
  String get entryNotFound => 'This entry no longer exists.';

  @override
  String get toFinishTitle => 'To finish';

  @override
  String get toFinishEmpty => 'Nothing to finish. Entries without an end show up here.';

  @override
  String startedAgo(String when, String elapsed) {
    return 'Started $when · $elapsed ago';
  }

  @override
  String get plus30m => '+30m';

  @override
  String get plus1h => '+1h';

  @override
  String get plus2h => '+2h';

  @override
  String get setEndEllipsis => 'Set end…';

  @override
  String createLabelNamed(String name) {
    return 'Create \"$name\"';
  }

  @override
  String restoreLabelNamed(String name) {
    return 'Restore archived \"$name\"';
  }

  @override
  String get recentLabels => 'Recent';

  @override
  String get allLabels => 'All labels';

  @override
  String get manageLabels => 'Manage labels';

  @override
  String get noLabelsYet => 'No labels yet. Type a name to create one.';

  @override
  String get labelsAndCategories => 'Labels & categories';

  @override
  String get newLabel => 'New label';

  @override
  String get newCategory => 'New category';

  @override
  String get archivedLabels => 'Archived';

  @override
  String entryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries',
      one: '1 entry',
      zero: 'Not used yet',
    );
    return '$_temp0';
  }

  @override
  String get editLabel => 'Edit label';

  @override
  String get editCategory => 'Edit category';

  @override
  String get nameLabel => 'Name';

  @override
  String get colorLabel => 'Color';

  @override
  String get iconLabel => 'Icon';

  @override
  String get noIcon => 'No icon';

  @override
  String get categoryLabel => 'Category';

  @override
  String get previewLabel => 'Preview';

  @override
  String get archive => 'Archive';

  @override
  String get restore => 'Restore';

  @override
  String get nameEmpty => 'Enter a name.';

  @override
  String get nameTooLong => 'Use 40 characters or fewer.';

  @override
  String get nameTaken => 'That name is already used, maybe by an archived label.';

  @override
  String usageEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count entries', one: '1 entry');
    return '$_temp0';
  }

  @override
  String usageRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count routines', one: '1 routine');
    return '$_temp0';
  }

  @override
  String labelInUse(String usage) {
    return 'Can\'t delete: used by $usage. Archive it instead to hide it from pickers.';
  }

  @override
  String andJoin(String a, String b) {
    return '$a and $b';
  }

  @override
  String deleteLabelConfirm(String name) {
    return 'Delete \"$name\"? This can\'t be undone.';
  }

  @override
  String get labelArchivedNote => 'Archived: hidden from pickers, still shown on past entries.';

  @override
  String get labelsInCategory => 'Labels in this category';

  @override
  String deleteCategoryTitle(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String get moveCategoryItemsTo => 'Move its labels, tasks and entries to:';

  @override
  String get noColor => 'No color';

  @override
  String get onboardingWelcomeTitle => 'Welcome to Planyar';

  @override
  String get onboardingWelcomeBody =>
      'Log what you did, plan what you\'ll do, and see where your time goes. Everything stays on this phone.';

  @override
  String get getStarted => 'Get started';

  @override
  String get starterTitle => 'Pick some labels';

  @override
  String get starterBody => 'Labels are what you log time with. Rename, recolor or add more any time.';

  @override
  String get skip => 'Skip';

  @override
  String get continueButton => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get appearanceAndTime => 'Appearance & time';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get firstDayOfWeek => 'First day of the week';
}
