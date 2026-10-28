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

  @override
  String get devSampleDataSection => 'Sample data';

  @override
  String get devSeedButton => 'Add ~5,000 sample entries';

  @override
  String devSeeded(int count) {
    return 'Added $count entries.';
  }

  @override
  String get devFrameTimingSection => 'Frame timing';

  @override
  String get devFrameHint => 'Tap Start, scroll the timeline and swipe days for a while, then come back and tap Stop.';

  @override
  String get devFrameRecording => 'Recording… go scroll Today, then come back.';

  @override
  String get devFrameStart => 'Start recording';

  @override
  String get devFrameStop => 'Stop and show results';

  @override
  String devFrameResult(int frames, String p50, String p90, String p99, String slow) {
    return '$frames frames · median $p50 ms · 90% $p90 ms · 99% $p99 ms · over 16.7 ms: $slow%';
  }

  @override
  String get settingsBackup => 'Backup & restore';

  @override
  String get settingsAbout => 'About & privacy';

  @override
  String get backupTitle => 'Backup & restore';

  @override
  String backupLastExport(String when) {
    return 'Last full export: $when';
  }

  @override
  String backupDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days ago',
      one: 'yesterday',
      zero: 'today',
    );
    return '$_temp0';
  }

  @override
  String get backupNeverExported => 'No full export yet';

  @override
  String get backupExportIntro =>
      'One file with all your entries, labels, routines, tasks and settings. Keep a copy somewhere other than this phone.';

  @override
  String get backupExportButton => 'Export all data';

  @override
  String get backupSaveButton => 'Save to device';

  @override
  String get backupPlainNote => 'Backups aren\'t encrypted: anyone with the file can read it.';

  @override
  String get backupExporting => 'Preparing the backup…';

  @override
  String backupShared(String fileName) {
    return 'Backup ready: $fileName';
  }

  @override
  String backupSavedToDevice(String fileName) {
    return 'Saved $fileName';
  }

  @override
  String get backupExportFailed => 'Couldn\'t export your data.';

  @override
  String get backupRestoreSection => 'Restore';

  @override
  String get backupImportButton => 'Import a backup…';

  @override
  String get backupImportHint => 'You\'ll see what\'s in the file before anything changes.';

  @override
  String get backupSafetySection => 'Safety backups';

  @override
  String get backupSafetyIntro =>
      'Planyar saves your data by itself before every import and before erasing. The last 5 are kept on this phone; they\'re removed if you uninstall the app.';

  @override
  String get backupSafetyNone => 'None yet.';

  @override
  String backupSafetyTitle(String reason, String when) {
    return '$reason · $when';
  }

  @override
  String get safetyReasonImport => 'Before an import';

  @override
  String get safetyReasonErase => 'Before erasing all data';

  @override
  String get safetyReasonMigration => 'Before an app update (database file)';

  @override
  String get safetyRestore => 'Restore';

  @override
  String get safetyShare => 'Share';

  @override
  String get safetyActions => 'Actions for this safety backup';

  @override
  String get backupHistorySection => 'Recent imports';

  @override
  String importLogMerged(String fileName) {
    return 'Merged $fileName';
  }

  @override
  String importLogReplaced(String fileName) {
    return 'Replaced with $fileName';
  }

  @override
  String importLogCounts(String when, int written, int skipped, int invalid) {
    return '$when · $written added or updated, $skipped unchanged, $invalid left out';
  }

  @override
  String get backupProblemNotABackup => 'This file isn\'t a Planyar backup or is damaged.';

  @override
  String get backupProblemNewer => 'This backup was made by a newer version of Planyar. Update the app to import it.';

  @override
  String get backupProblemTooLarge => 'This file is too large to be a Planyar backup.';

  @override
  String get backupProblemUnreadable => 'Couldn\'t open this file. Try picking it again.';

  @override
  String get backupNothingChanged => 'Nothing was changed.';

  @override
  String get importTitle => 'Import a backup';

  @override
  String get importReading => 'Checking the file…';

  @override
  String importFileCreated(String when) {
    return 'Made $when';
  }

  @override
  String importFileOrigin(String platform, String version, String zone) {
    return '$platform · Planyar $version · $zone';
  }

  @override
  String importFileSize(String size, int count) {
    return '$size · $count records';
  }

  @override
  String get importModeTitle => 'How to import';

  @override
  String get importModeMerge => 'Merge';

  @override
  String get importModeMergeHint => 'Adds new records and updates ones that changed. Nothing on this phone is deleted.';

  @override
  String get importModeReplace => 'Replace';

  @override
  String get importModeReplaceHint => 'Deletes all data on this phone, then restores this backup.';

  @override
  String get importRestoreHint => 'Restoring a safety backup replaces all data on this phone with the data it saved.';

  @override
  String get importWhatHappens => 'What will happen';

  @override
  String get tableCategories => 'Categories';

  @override
  String get tableLabels => 'Labels';

  @override
  String get tableEntries => 'Entries';

  @override
  String get tableRoutines => 'Routines';

  @override
  String get tableRoutineExceptions => 'Routine changes';

  @override
  String get tableTaskSeries => 'Repeating tasks';

  @override
  String get tableTasks => 'Tasks';

  @override
  String get tableTaskReminders => 'Task reminders';

  @override
  String countNew(int count) {
    return '$count new';
  }

  @override
  String countUpdated(int count) {
    return '$count updated';
  }

  @override
  String countUnchanged(int count) {
    return '$count unchanged';
  }

  @override
  String countInvalid(int count) {
    return '$count left out';
  }

  @override
  String countDuplicates(int count) {
    return '$count already on this phone';
  }

  @override
  String countMatchedByName(int count) {
    return '$count matched by name';
  }

  @override
  String countReplacedByKey(int count) {
    return '$count replace this phone\'s for the same day';
  }

  @override
  String countRemoved(int count) {
    return '$count deleted from this phone';
  }

  @override
  String get importNothingNew => 'Everything in this backup is already on this phone.';

  @override
  String importLocalNewer(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records on this phone were changed after this backup was made and will be overwritten.',
      one: '1 record on this phone was changed after this backup was made and will be overwritten.',
    );
    return '$_temp0';
  }

  @override
  String importMatchedByName(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count labels or categories have the same name as ones on this phone and will be combined with them.',
      one: '1 label or category has the same name as one on this phone and will be combined with it.',
    );
    return '$_temp0';
  }

  @override
  String importDuplicates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries are already on this phone and will be skipped.',
      one: '1 entry is already on this phone and will be skipped.',
    );
    return '$_temp0';
  }

  @override
  String importReplaceRemoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records on this phone aren\'t in the backup and will be deleted.',
      one: '1 record on this phone isn\'t in the backup and will be deleted.',
    );
    return '$_temp0';
  }

  @override
  String get importAlsoSettings => 'Also import settings';

  @override
  String get importAlsoSettingsHint =>
      'Theme, first day of week and view options. Otherwise this phone\'s settings stay.';

  @override
  String get importReplaceSettings =>
      'The backup\'s settings replace this phone\'s (theme, first day of week, view options).';

  @override
  String importInvalidTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records can\'t be imported',
      one: '1 record can\'t be imported',
    );
    return '$_temp0';
  }

  @override
  String get importSkipInvalid => 'Import without them';

  @override
  String importRepairsTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count small fixes will be made',
      one: '1 small fix will be made',
    );
    return '$_temp0';
  }

  @override
  String get importSafetyNote => 'A safety backup of this phone\'s data is saved first.';

  @override
  String importRecordAt(String type, int position) {
    return '$type #$position';
  }

  @override
  String importRecordId(String type, String id) {
    return '$type $id';
  }

  @override
  String importIssueLine(String record, String reason) {
    return '$record: $reason';
  }

  @override
  String get recordCategory => 'Category';

  @override
  String get recordLabel => 'Label';

  @override
  String get recordEntry => 'Entry';

  @override
  String get recordRoutine => 'Routine';

  @override
  String get recordRoutineException => 'Routine change';

  @override
  String get recordTaskSeries => 'Repeating task';

  @override
  String get recordTask => 'Task';

  @override
  String get recordTaskReminder => 'Task reminder';

  @override
  String get issueNotAnObject => 'isn\'t a record';

  @override
  String issueMissingField(String field) {
    return '“$field” is missing';
  }

  @override
  String issueWrongType(String field) {
    return '“$field” has the wrong type';
  }

  @override
  String issueBadId(String field) {
    return '“$field” isn\'t a valid ID';
  }

  @override
  String issueBadValue(String field) {
    return '“$field” has a value that isn\'t allowed';
  }

  @override
  String issueTooLong(String field) {
    return '“$field” is too long';
  }

  @override
  String issueBadTime(String field) {
    return '“$field” isn\'t a valid time';
  }

  @override
  String issueBadDate(String field) {
    return '“$field” isn\'t a valid date';
  }

  @override
  String get issueEndNotAfterStart => 'ends before it starts';

  @override
  String get issueLongerThan7Days => 'is longer than 7 days';

  @override
  String get issueDuplicateId => 'has the same ID as another record';

  @override
  String get issueDuplicateName => 'has the same name as another one in the file; they are combined';

  @override
  String get issueDuplicateOccurrence => 'is a second copy for the same routine and day';

  @override
  String get issueMissingReference => 'refers to something that\'s neither in the backup nor on this phone';

  @override
  String get issueNameUsedOnDevice => 'would take a name that another one on this phone already has';

  @override
  String get repairColorReplaced => 'unknown color, gray is used';

  @override
  String get repairIconRemoved => 'unknown icon, shown without one';

  @override
  String get repairRoundedToMinute => 'time rounded to the minute';

  @override
  String get repairPlaceholderLabel => 'its label is missing, so it goes under “Imported – unknown label”';

  @override
  String get repairReferenceCleared => 'a link to a missing record is removed';

  @override
  String get repairCompletedAtSet => 'completion time set to its last change';

  @override
  String get repairCompletedAtCleared => 'completion time removed (not completed)';

  @override
  String get repairDetachedFromSeries => 'becomes a one-off task (its series already has an open one)';

  @override
  String get importMergeButton => 'Merge';

  @override
  String get importReplaceButton => 'Replace';

  @override
  String get importReplaceConfirmTitle => 'Replace all data?';

  @override
  String importReplaceConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'The data on this phone is replaced with the backup, and $count records that aren\'t in it are deleted. A safety backup is saved first.',
      one: 'The data on this phone is replaced with the backup, and 1 record that isn\'t in it is deleted. A safety backup is saved first.',
      zero: 'The data on this phone is replaced with the backup. A safety backup is saved first.',
    );
    return '$_temp0';
  }

  @override
  String get importRunning => 'Importing…';

  @override
  String get importDoneTitle => 'Import complete';

  @override
  String importDoneSummary(int written, int skipped, int invalid) {
    return '$written added or updated, $skipped unchanged, $invalid left out.';
  }

  @override
  String importDoneSafety(String name) {
    return 'Safety backup of the earlier data: $name';
  }

  @override
  String get importIntegrityWarning =>
      'A check after the import found a problem. If anything looks wrong, restore the safety backup from Backup & restore.';

  @override
  String get importSafetyFailed =>
      'Couldn\'t save a safety backup first, so nothing was imported. Your data was not changed.';

  @override
  String get importFailed => 'The import failed. Your data was not changed.';

  @override
  String get done => 'Done';

  @override
  String get aboutTitle => 'About & privacy';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutPrivacyTitle => 'Privacy';

  @override
  String get aboutPrivacyBody =>
      'Your data never leaves this device unless you export it. Planyar has no account, no ads and no analytics, and it can\'t use the internet.';

  @override
  String get aboutLicenses => 'Open-source licenses';

  @override
  String get aboutDangerSection => 'Start over';

  @override
  String get eraseTitle => 'Erase all data';

  @override
  String get eraseBody =>
      'This deletes every entry, label, routine, task and setting on this phone. Planyar then starts again from the welcome screen.';

  @override
  String get eraseExportFirst => 'Export a backup first';

  @override
  String eraseExported(String fileName) {
    return 'Backup ready: $fileName';
  }

  @override
  String get eraseSafetyNote =>
      'A safety backup is also saved on this phone first. You can restore it from Backup & restore.';

  @override
  String get eraseTypeLabel => 'Type ERASE to confirm';

  @override
  String get eraseButton => 'Erase everything';

  @override
  String get eraseRunning => 'Erasing…';

  @override
  String get eraseSafetyFailed => 'Couldn\'t save a safety backup first, so nothing was erased.';

  @override
  String get eraseFailed => 'Couldn\'t erase your data. Nothing was deleted.';

  @override
  String get recoveryBody =>
      'Something went wrong while opening the database. Nothing has been deleted. You can try again, restore a backup, or keep a copy of the database file.';

  @override
  String get recoveryRetry => 'Try again';

  @override
  String get recoveryRestoreLatest => 'Restore the latest safety backup';

  @override
  String recoveryRestoreLatestHint(String when) {
    return '$when: your data as it was then';
  }

  @override
  String get recoveryExportDatabase => 'Export the database file';

  @override
  String get recoveryExportDatabaseHint => 'A copy to look at on a computer or to send to the developer.';

  @override
  String get recoveryImport => 'Import a backup…';

  @override
  String get recoveryConfirmTitle => 'Restore this backup?';

  @override
  String recoveryConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'The current database file is moved aside (not deleted) and the backup is restored: $count records.',
      one: 'The current database file is moved aside (not deleted) and the backup is restored: 1 record.',
    );
    return '$_temp0';
  }

  @override
  String get recoveryRestore => 'Restore';

  @override
  String get recoveryWorking => 'Working…';

  @override
  String get recoveryActionFailed => 'That didn\'t work. Nothing was changed.';

  @override
  String get recoveryDetails => 'Technical details';

  @override
  String get onboardingRestore => 'Restore from a backup';

  @override
  String importMoreIssues(int count) {
    return '…and $count more';
  }
}
