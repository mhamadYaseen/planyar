// Phase 2 definition of done (plan §13): journeys J15–J17 (§4) and erase
// (SET-06) on the real app — real DI, repositories, router and widgets — over
// an in-memory database, with a fake share sheet and file picker.
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/src/core/di/injection.dart';
import 'package:planyar/src/core/files/safety_backup.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_archive.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_plan.dart';
import 'package:planyar/src/features/backup/domain/entities/import_report.dart';
import 'package:planyar/src/features/backup/domain/repositories/backup_files_repository.dart';
import 'package:planyar/src/features/backup/domain/repositories/backup_repository.dart';
import 'package:planyar/src/features/backup/domain/services/import_planner.dart';
import 'package:planyar/src/features/backup/presentation/pages/import_page.dart';
import 'package:planyar/src/features/day_view/presentation/pages/today_page.dart';
import 'package:planyar/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:planyar/src/features/settings/domain/entities/app_settings.dart';

import '../features/backup/backup_test_data.dart';
import '../features/backup/backup_zip_helpers.dart';
import '../helpers/app_harness.dart';
import '../helpers/fake_file_gateway.dart';

/// Pumps with real time (isolates, files and the database run outside the
/// fake clock) until [done]. Progress indicators spin meanwhile, so this
/// never uses pumpAndSettle; it ends by pumping through page transitions.
Future<void> waitUntil(WidgetTester tester, bool Function() done, {String? what}) async {
  final end = DateTime.now().add(const Duration(seconds: 15));
  while (!done()) {
    if (DateTime.now().isAfter(end)) throw TestFailure('Timed out waiting for ${what ?? 'a condition'}');
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 40)));
    await tester.pump(const Duration(milliseconds: 40));
  }
  for (var i = 0; i < 12; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

Future<void> waitFor(WidgetTester tester, Finder finder) =>
    waitUntil(tester, () => finder.evaluate().isNotEmpty, what: '$finder');

/// Taps without waiting for animations to stop (for actions that start
/// background work with a spinner); follow with [waitFor].
Future<void> tapOnly(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await tester.pump();
}

Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
  await tapOnly(tester, finder);
  await settle(tester);
}

Future<void> openBackup(WidgetTester tester) async {
  await tapAndSettle(tester, find.byTooltip('Open settings'));
  await tapOnly(tester, find.text('Backup & restore'));
  // The safety list loads from files.
  await waitUntil(
    tester,
    () => find.text('Safety backups').evaluate().isNotEmpty && find.byType(LinearProgressIndicator).evaluate().isEmpty,
    what: 'Backup & restore',
  );
}

Future<void> startImport(WidgetTester tester) async {
  await tapOnly(tester, find.text('Import a backup…'));
  await waitUntil(
    tester,
    () => find.text('Checking the file…').evaluate().isEmpty && find.byType(ImportPage).evaluate().isNotEmpty,
    what: 'the import preview',
  );
}

/// Replace → "Replace all data?" → Replace, then the result.
Future<void> confirmReplace(WidgetTester tester) async {
  await tapAndSettle(tester, find.widgetWithText(FilledButton, 'Replace'));
  expect(find.text('Replace all data?'), findsOneWidget);
  await tapOnly(tester, find.descendant(of: find.byType(AlertDialog), matching: find.text('Replace')));
  await waitFor(tester, find.text('Import complete'));
}

/// Writes [bytes] where the fake picker will "pick" them.
void putInPicker(FakeFileGateway files, List<int> bytes, {String name = 'planyar-backup.zip'}) =>
    files.fileToPick = File('${files.root.path}/$name')..writeAsBytesSync(bytes);

/// Runs [action] with real time while still pumping frames. Awaiting a
/// database call inside one `runAsync` can deadlock: the app's own stream
/// queries wait on the fake clock while holding the connection.
Future<T> real<T>(WidgetTester tester, Future<T> Function() action) async {
  var done = false;
  late T value;
  Object? error;
  await tester.runAsync(() async {
    unawaited(
      action().then(
        (v) {
          value = v;
          done = true;
        },
        onError: (Object e) {
          error = e;
          done = true;
        },
      ),
    );
  });
  while (!done) {
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
    await tester.pump(const Duration(milliseconds: 20));
  }
  if (error case final e?) throw e;
  return value;
}

Future<BackupData> snapshot(WidgetTester tester) => real(tester, () => sl<BackupRepository>().readSnapshot());

Future<List<SafetyBackup>> safetyBackups(WidgetTester tester) =>
    real(tester, () => sl<BackupFilesRepository>().listSafetyBackups());

/// The import preview's own list (not inner scrollables).
Finder get previewList => find.descendant(of: find.byType(ImportPage), matching: find.byType(Scrollable)).first;

Future<void> scrollTo(WidgetTester tester, Finder finder) async {
  await tester.scrollUntilVisible(finder, 200, scrollable: previewList);
  await tester.pump();
}

/// Writes [data] through the import path (a Replace into the empty test
/// database), so the app starts with it.
Future<void> seedData(BackupData data) => sl<BackupRepository>().applyImport(
  (current) => const ImportPlanner().plan(
    file: ParsedBackup(data: data),
    current: current,
    mode: ImportMode.replace,
    importSettings: true,
    now: Instant.parse('2026-10-25T12:00:00Z'),
    newId: uuidSequence(0x7000),
  ),
);

void main() {
  late FakeFileGateway files;

  setUp(() => files = FakeFileGateway());
  tearDown(() => files.dispose());

  testWidgets('J15 — export all data, then Replace on a fresh install restores every record', (tester) async {
    // A device with data: export it (AC1).
    await pumpPlanyar(tester, files: files, seed: () => seedData(sampleData()));
    await openBackup(tester);
    expect(find.text('No full export yet'), findsOneWidget);
    await tapOnly(tester, find.text('Export all data'));
    await waitFor(tester, find.textContaining('Backup ready: planyar-backup-'));
    expect(files.shared, hasLength(1));
    expect(find.textContaining('Last full export: today'), findsOneWidget);
    final exported = Uint8List.fromList(files.sharedBytes.single);
    expect(BackupArchive.decode(exported).manifest.counts, sampleData().counts);

    // A fresh install (AC2).
    final fresh = FakeFileGateway();
    addTearDown(fresh.dispose);
    await pumpPlanyar(tester, files: fresh);
    putInPicker(fresh, exported);
    await openBackup(tester);
    await startImport(tester);
    expect(find.text('planyar-backup.zip'), findsOneWidget);
    expect(find.text('5 new'), findsOneWidget, reason: 'entries');

    await tapAndSettle(tester, find.text('Replace').first);
    await confirmReplace(tester);
    expect(await snapshot(tester), sampleData());
    expect(await safetyBackups(tester), isEmpty, reason: 'nothing to save on an empty device');
    await tapAndSettle(tester, find.text('Done'));
    expect(find.text('Recent imports'), findsOneWidget);
  });

  testWidgets('J16 — merge with conflicts: counts, matched by name, safety backup first', (tester) async {
    await pumpPlanyar(
      tester,
      files: files,
      seed: () => seedData(
        BackupData(
          labels: [label(10, 'Study')],
          entries: [entry(50, label: 10, note: 'mine')],
        ),
      ),
    );
    putInPicker(
      files,
      backupOf(
        dataJson(
          BackupData(
            labels: [label(11, 'study', color: 'violet')],
            entries: [
              entry(50, label: 11, note: 'theirs'),
              entry(51, label: 11),
            ],
          ),
        ),
      ),
    );
    await openBackup(tester);
    await startImport(tester);

    // AC1–AC3 in the preview (Merge is the default).
    expect(find.text('1 new · 1 updated'), findsOneWidget);
    expect(find.text('1 updated · 1 matched by name'), findsOneWidget);
    expect(find.textContaining('same name as one on this phone'), findsOneWidget);
    expect(find.textContaining('A safety backup'), findsOneWidget);

    await tapOnly(tester, find.widgetWithText(FilledButton, 'Merge'));
    await waitFor(tester, find.text('Import complete'));
    // AC4: a safety backup exists and holds the earlier data.
    final safety = await safetyBackups(tester);
    expect(safety.single.reason, SafetyReason.import);
    final after = await snapshot(tester);
    expect(after.labels.single.id, uuid(10));
    expect(after.entries.map((e) => (e.id, e.labelId, e.note)), [
      (uuid(50), uuid(10), 'theirs'),
      (uuid(51), uuid(10), null),
    ]);
    expect(find.textContaining('Safety backup of the earlier data'), findsOneWidget);
  });

  group('J17 — malformed imports', () {
    testWidgets('AC1: a damaged file shows the message and changes nothing', (tester) async {
      await pumpPlanyar(tester, files: files, seed: () => seedData(sampleData()));
      putInPicker(files, backupOf(dataJson(sampleData())).sublist(0, 300));
      await openBackup(tester);
      await startImport(tester);
      expect(find.text("This file isn't a Planyar backup or is damaged."), findsOneWidget);
      expect(find.text('Nothing was changed.'), findsOneWidget);
      expect(await snapshot(tester), sampleData());
    });

    testWidgets('AC2: invalid records are listed; import goes ahead only once confirmed', (tester) async {
      await pumpPlanyar(tester, files: files);
      final json = dataJson(sampleData());
      record(json, 'entries')['endUtc'] = record(json, 'entries')['startUtc'];
      putInPicker(files, backupOf(json));
      await openBackup(tester);
      await startImport(tester);

      await scrollTo(tester, find.text("1 record can't be imported"));
      final merge = find.widgetWithText(FilledButton, 'Merge');
      expect(tester.widget<FilledButton>(merge).onPressed, isNull);
      await tapAndSettle(tester, find.text("1 record can't be imported"));
      expect(find.text('• Entry #1: ends before it starts'), findsOneWidget);

      await scrollTo(tester, find.text('Import without them'));
      await tapAndSettle(tester, find.text('Import without them'));
      expect(tester.widget<FilledButton>(merge).onPressed, isNotNull);
      await tapOnly(tester, merge);
      await waitFor(tester, find.text('Import complete'));
      expect((await snapshot(tester)).entries, hasLength(4));
    });

    testWidgets('AC3: a backup from a newer app version asks to update the app', (tester) async {
      await pumpPlanyar(tester, files: files);
      putInPicker(files, backupOf(dataJson(sampleData()), manifest: (m) => m['formatVersion'] = 2));
      await openBackup(tester);
      await startImport(tester);
      expect(find.textContaining('Update the app to import it'), findsOneWidget);
      expect(find.byType(ImportPage), findsOneWidget);
    });
  });

  testWidgets('restoring a safety backup is a Replace and brings the data back', (tester) async {
    await pumpPlanyar(tester, files: files, seed: () => seedData(sampleData()));
    putInPicker(files, backupOf(dataJson(BackupData(labels: [label(90, 'Only this')]))));
    await openBackup(tester);
    await startImport(tester);
    await tapAndSettle(tester, find.text('Replace').first);
    await confirmReplace(tester);
    await tapOnly(tester, find.text('Done'));
    await waitFor(tester, find.text('Before an import'));

    await tapAndSettle(tester, find.byTooltip('Actions for this safety backup'));
    // The menu item (the section is also called "Restore").
    await tapOnly(tester, find.widgetWithText(ListTile, 'Restore').last);
    await waitUntil(
      tester,
      () => find.textContaining('Restoring a safety backup replaces').evaluate().isNotEmpty,
      what: 'the restore preview',
    );
    expect(find.text('Merge'), findsNothing, reason: 'restore is always Replace');
    await confirmReplace(tester);
    expect(await snapshot(tester), sampleData());
  });

  testWidgets('SET-06 — erase all data: type ERASE, safety backup, back to onboarding', (tester) async {
    await pumpPlanyar(tester, files: files, seed: () => seedData(sampleData()));
    await tapAndSettle(tester, find.byTooltip('Open settings'));
    await tapAndSettle(tester, find.text('About & privacy'));
    await tapAndSettle(tester, find.text('Erase all data'));

    final erase = find.widgetWithText(FilledButton, 'Erase everything');
    expect(tester.widget<FilledButton>(erase).onPressed, isNull);
    await tester.enterText(find.byType(TextField), 'erase');
    await tester.pump();
    expect(tester.widget<FilledButton>(erase).onPressed, isNull, reason: 'the word must be ERASE');
    await tester.enterText(find.byType(TextField), 'ERASE');
    await tester.pump();
    await tapOnly(tester, erase);
    await waitFor(tester, find.byType(OnboardingPage));

    expect((await snapshot(tester)).hasNoRecords, isTrue);
    final safety = await safetyBackups(tester);
    expect(safety.single.reason, SafetyReason.erase);
  });

  testWidgets('a new phone: restore from a backup during onboarding, no starter labels', (tester) async {
    await pumpPlanyar(tester, files: files, settings: const AppSettings());
    expect(find.byType(OnboardingPage), findsOneWidget);
    putInPicker(files, backupOf(dataJson(sampleData())));

    await tapOnly(tester, find.text('Restore from a backup'));
    await waitUntil(
      tester,
      () => find.byType(ImportPage).evaluate().isNotEmpty && find.text('Checking the file…').evaluate().isEmpty,
      what: 'the import preview',
    );
    await tapOnly(tester, find.widgetWithText(FilledButton, 'Merge'));
    await waitFor(tester, find.text('Import complete'));
    await tapOnly(tester, find.text('Done'));
    await waitFor(tester, find.byType(TodayPage));

    final data = await snapshot(tester);
    expect(data.labels.map((l) => l.name), unorderedEquals(['Study', 'Exercise', 'Sleep', 'Old']));
    expect(data.entries, hasLength(5));
  });
}
