// The database side of backups (plan §10.5–10.7, §11.4): snapshots, the
// one-transaction apply, round trip, all-or-nothing, erase and status.
import 'package:drift/drift.dart' hide isNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/utils/data_state.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_archive.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_plan.dart';
import 'package:planyar/src/features/backup/domain/entities/import_report.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_reader.dart';
import 'package:planyar/src/features/backup/domain/services/import_planner.dart';
import 'package:planyar/src/features/dev_tools/domain/usecases/seed_sample_data.dart';
import 'package:planyar/src/features/entries/data/datasource/entries_dao.dart';
import 'package:planyar/src/features/entries/data/repositories/entries_repository_impl.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/entities/entry_draft.dart';
import 'package:planyar/src/features/labels/data/datasource/labels_dao.dart';
import 'package:planyar/src/features/labels/data/repositories/labels_repository_impl.dart';
import 'package:planyar/src/features/onboarding/domain/entities/starter_label.dart';
import 'package:planyar/src/features/onboarding/domain/usecases/onboarding_usecases.dart';
import 'package:planyar/src/features/settings/data/datasource/settings_dao.dart';
import 'package:planyar/src/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:planyar/src/features/settings/domain/entities/app_settings.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../backup_deps.dart';
import '../backup_test_data.dart';

final now = Instant.parse('2026-10-27T12:00:00Z');

const info = ExportInfo(
  appVersion: '1.0.0+1',
  dbSchemaVersion: 1,
  createdAt: Instant.fromUtcMs(1793100000000),
  deviceTimeZone: 'Asia/Baghdad',
  platform: 'android',
);

void main() {
  late BackupDeps deps;

  setUpAll(tzdata.initializeTimeZones);
  setUp(() async => deps = await BackupDeps.create());
  tearDown(() => deps.close());

  Future<ImportPlan> apply(BackupDeps on, BackupData file, ImportMode mode, {bool importSettings = false}) =>
      on.backups.applyImport(
        (current) => const ImportPlanner().plan(
          file: const BackupJsonReader().read(dataJson(file)),
          current: current,
          mode: mode,
          importSettings: importSettings,
          now: now,
          newId: on.ids.newId,
        ),
      );

  /// Data made the way the app makes it: onboarding, settings, ~200 entries
  /// from the dev seeder, an open entry and a note with emoji.
  Future<void> seedLikeTheApp(BackupDeps on) async {
    final ids = UuidIds(0x9000);
    final labels = LabelsRepositoryImpl(LabelsDao(on.db), ids);
    final categories = CategoriesRepositoryImpl(LabelsDao(on.db), ids);
    final settings = SettingsRepositoryImpl(SettingsDao(on.db));
    final entries = EntriesRepositoryImpl(EntriesDao(on.db), ids, on.zones);
    expect(await FinishOnboarding(labels, categories, settings)(Starters.labels), isA<DataSuccess<void>>());
    await settings.save(
      (await settings.load()).copyWith(themeMode: AppThemeMode.dark, firstDayOfWeek: DateTime.monday),
    );
    expect(await SeedSampleData(entries, labels, on.zones)(30), isA<DataSuccess<int>>());
    final study = (await labels.all()).firstWhere((l) => l.name == 'Study');
    await entries.create(
      EntryDraft(
        kind: EntryKind.actual,
        labelId: study.id,
        start: Instant.parse('2026-10-27T09:00:00Z'),
        note: 'Ch. 3 ✍️ ok',
      ),
    );
  }

  group('snapshot and replace', () {
    test('a replace import stores every record exactly as in the file', () async {
      await apply(deps, sampleData(), ImportMode.replace);
      expect(await deps.backups.readSnapshot(), sampleData());
    });

    test('round trip: export → replace into an empty database → export is byte-identical (DoD)', () async {
      await seedLikeTheApp(deps);
      final snapshot = await deps.backups.readSnapshot();
      expect(snapshot.entries.length, greaterThan(150));
      final first = BackupArchive.encodeData(snapshot);

      final decoded = BackupArchive.decode(BackupArchive.encode(snapshot, info));
      expect(decoded.parsed.issues, isEmpty);
      expect(decoded.parsed.repairs, isEmpty);
      final fresh = await BackupDeps.create();
      addTearDown(fresh.close);
      await fresh.backups.applyImport(
        (current) => const ImportPlanner().plan(
          file: decoded.parsed,
          current: current,
          mode: ImportMode.replace,
          importSettings: true,
          now: now,
          newId: fresh.ids.newId,
        ),
      );
      expect(BackupArchive.encodeData(await fresh.backups.readSnapshot()), first);
    });

    test('replace keeps device-only settings and replaces portable ones', () async {
      await seedLikeTheApp(deps);
      await apply(deps, sampleData(), ImportMode.replace);
      final rows = {for (final r in await deps.db.select(deps.db.settings).get()) r.key: (r.scope, r.value)};
      expect(rows['onboardingCompleted'], ('device', 'true'));
      expect(rows['themeMode'], ('portable', '"dark"'));
      expect(rows['firstDayOfWeek'], ('portable', '5'));
      expect(rows.containsKey('timelineMode'), isFalse, reason: 'portable settings not in the file are reset');
    });

    test('imported routines start with no generated-through date (regenerated later)', () async {
      await apply(deps, sampleData(), ImportMode.replace);
      final routines = await deps.db.select(deps.db.routines).get();
      expect(routines.single.generatedThrough, isNull);
    });
  });

  group('merge at the database level', () {
    Future<List<(String, String)>> labelNames() async => [
      for (final l in await (deps.db.select(deps.db.labels)..orderBy([(l) => OrderingTerm(expression: l.id)])).get())
        (l.id, l.name),
    ];

    test('two labels can swap names, and a rename chain works', () async {
      await deps.seed(BackupData(labels: [label(1, 'Work'), label(2, 'Study'), label(3, 'Sleep')]));
      await apply(deps, BackupData(labels: [label(1, 'Study'), label(2, 'Sleep'), label(3, 'Work')]), ImportMode.merge);
      expect(await labelNames(), [(uuid(1), 'Study'), (uuid(2), 'Sleep'), (uuid(3), 'Work')]);
    });

    test('matched by name: entries in the file end up on the local label', () async {
      await deps.seed(BackupData(labels: [label(10, 'Study')]));
      await apply(
        deps,
        BackupData(
          labels: [label(11, 'study', color: 'violet')],
          entries: [entry(50, label: 11)],
        ),
        ImportMode.merge,
      );
      final entries = await deps.db.select(deps.db.entries).get();
      expect(entries.single.labelId, uuid(10));
      expect(await labelNames(), [(uuid(10), 'Study')]);
    });

    test('an occurrence for the same routine and date replaces the local one; logged entries follow', () async {
      await deps.seed(
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          entries: [
            occurrence(60, routine: 40, date: '2026-10-25'),
            entry(61, label: 20, source: 'from_plan', plannedEntry: 60),
          ],
        ),
      );
      await apply(
        deps,
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          entries: [occurrence(52, routine: 40, date: '2026-10-25')],
        ),
        ImportMode.merge,
      );
      final rows = {for (final e in await deps.db.select(deps.db.entries).get()) e.id: e.plannedEntryId};
      expect(rows, {uuid(52): null, uuid(61): uuid(52)});
    });

    test('two occurrences of one routine can swap dates', () async {
      await deps.seed(
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          entries: [
            occurrence(60, routine: 40, date: '2026-10-25'),
            occurrence(61, routine: 40, date: '2026-10-26'),
          ],
        ),
      );
      await apply(
        deps,
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          entries: [
            occurrence(60, routine: 40, date: '2026-10-26'),
            occurrence(61, routine: 40, date: '2026-10-25'),
          ],
        ),
        ImportMode.merge,
      );
      final rows = {for (final e in await deps.db.select(deps.db.entries).get()) e.id: e.occurrenceDate};
      expect(rows, {uuid(60): LocalDate(2026, 10, 26), uuid(61): LocalDate(2026, 10, 25)});
    });

    test('an exception for the same routine and date replaces the local one', () async {
      final x = sampleData().routineExceptions.single;
      await deps.seed(
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          routineExceptions: [x.copyWith(id: uuid(70))],
        ),
      );
      await apply(deps, BackupData(routineExceptions: [x]), ImportMode.merge);
      final rows = await deps.db.select(deps.db.routineExceptions).get();
      expect(rows.map((r) => r.id), [uuid(41)]);
    });

    test('open slots of task series can change hands', () async {
      await deps.seed(
        BackupData(taskSeries: [series(30), series(39)], tasks: [task(35, series: 30), task(36, series: 39)]),
      );
      // Series 30's open slot goes to a new task, 35 moves to series 39 and
      // 36 is completed there: every slot changes hands in one transaction.
      await apply(
        deps,
        BackupData(
          taskSeries: [series(30), series(39)],
          tasks: [
            task(31, series: 30),
            task(35, series: 39),
            task(36, series: 39, status: 'completed'),
          ],
        ),
        ImportMode.merge,
      );
      final rows = {for (final t in await deps.db.select(deps.db.tasks).get()) t.id: (t.seriesId, t.status)};
      expect(rows, {
        uuid(31): (uuid(30), 'not_started'),
        uuid(35): (uuid(39), 'not_started'),
        uuid(36): (uuid(39), 'completed'),
      });
    });

    test('an overwrite can clear fields: note, end, icon, category, color', () async {
      await deps.seed(
        BackupData(
          categories: [category(1, 'Learning', color: 'teal')],
          labels: [label(10, 'Study', icon: 'study', category: 1)],
          entries: [entry(50, label: 10, note: 'draft')],
        ),
      );
      await apply(
        deps,
        BackupData(
          categories: [category(1, 'Learning', color: null, updated: t1)],
          labels: [label(10, 'Study', updated: t1)],
          entries: [entry(50, label: 10, end: null, updated: t1)],
        ),
        ImportMode.merge,
      );
      final snap = await deps.backups.readSnapshot();
      expect(snap.categories.single.colorKey, isNull);
      expect((snap.labels.single.iconKey, snap.labels.single.categoryId), (null, null));
      expect((snap.entries.single.note, snap.entries.single.end), (null, null));
      // And the next merge of the same file finds nothing to do.
      final again = await apply(
        deps,
        BackupData(
          categories: [category(1, 'Learning', color: null, updated: t1)],
          labels: [label(10, 'Study', updated: t1)],
          entries: [entry(50, label: 10, end: null, updated: t1)],
        ),
        ImportMode.merge,
      );
      expect(again.summary.writtenCount, 0);
    });

    test('a completed task can be reopened; an exception can turn into a skip; a reminder can change type', () async {
      final modify = sampleData().routineExceptions.single;
      await deps.seed(
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          routineExceptions: [modify],
          tasks: [task(32, status: 'completed')],
          taskReminders: [reminder(33, task: 32)],
        ),
      );
      await apply(
        deps,
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          routineExceptions: [
            RoutineExceptionRecord(
              id: modify.id,
              routineId: modify.routineId,
              occurrenceDate: modify.occurrenceDate,
              type: 'skip',
              createdAt: t0,
              updatedAt: t1,
            ),
          ],
          tasks: [task(32, status: 'in_progress', updated: t1)],
          taskReminders: [reminder(33, task: 32).copyWith(type: 'on_deadline', offsetDays: null, updatedAt: t1)],
        ),
        ImportMode.merge,
      );
      final snap = await deps.backups.readSnapshot();
      expect((snap.tasks.single.status, snap.tasks.single.completedAt), ('in_progress', null));
      final x = snap.routineExceptions.single;
      expect((x.type, x.startOffsetMin, x.endOffsetMin, x.note), ('skip', null, null, null));
      expect((snap.taskReminders.single.type, snap.taskReminders.single.offsetDays), ('on_deadline', null));
    });

    test("an overwritten routine forgets how far it was generated (it's regenerated)", () async {
      await deps.seed(BackupData(labels: [label(20, 'Sleep')], routines: [routine(40)]));
      await deps.db.customStatement("UPDATE routines SET generated_through = '2026-11-10'");
      await apply(
        deps,
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40, updated: t1)],
        ),
        ImportMode.merge,
      );
      expect((await deps.db.select(deps.db.routines).get()).single.generatedThrough, isNull);
    });

    test('an occurrence can take the date of another that the file turns into a plain plan', () async {
      await deps.seed(
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          entries: [
            occurrence(60, routine: 40, date: '2026-10-26'),
            occurrence(61, routine: 40, date: '2026-10-25'),
          ],
        ),
      );
      await apply(
        deps,
        BackupData(
          labels: [label(20, 'Sleep')],
          routines: [routine(40)],
          entries: [
            occurrence(60, routine: 40, date: '2026-10-25'),
            entry(61, label: 20, kind: 'planned', start: '2026-10-25T20:00:00Z', end: '2026-10-26T04:00:00Z'),
          ],
        ),
        ImportMode.merge,
      );
      final rows = {for (final e in await deps.db.select(deps.db.entries).get()) e.id: (e.source, e.occurrenceDate)};
      expect(rows, {uuid(60): ('routine', LocalDate(2026, 10, 25)), uuid(61): ('manual', null)});
    });

    test('two exceptions of one routine can swap dates', () async {
      final x = sampleData().routineExceptions.single;
      final a = x.copyWith(id: uuid(71), occurrenceDate: LocalDate(2026, 10, 24));
      final b = x.copyWith(id: uuid(72), occurrenceDate: LocalDate(2026, 10, 25));
      await deps.seed(BackupData(labels: [label(20, 'Sleep')], routines: [routine(40)], routineExceptions: [a, b]));
      await apply(
        deps,
        BackupData(
          routineExceptions: [
            a.copyWith(occurrenceDate: LocalDate(2026, 10, 25)),
            b.copyWith(occurrenceDate: LocalDate(2026, 10, 24)),
          ],
        ),
        ImportMode.merge,
      );
      final rows = {for (final r in await deps.db.select(deps.db.routineExceptions).get()) r.id: r.occurrenceDate};
      expect(rows, {uuid(71): LocalDate(2026, 10, 25), uuid(72): LocalDate(2026, 10, 24)});
    });

    test('a broken reference that was already there does not block an import', () async {
      await deps.seed(BackupData(labels: [label(10, 'Study')]));
      // An orphan from long ago (foreign keys off), e.g. after a bad migration.
      await deps.db.customStatement('PRAGMA foreign_keys = OFF');
      await deps.db.customStatement(
        'INSERT INTO labels (id, name, name_key, color_key, category_id, is_archived, sort_order, created_at, updated_at) '
        "VALUES ('${uuid(11)}', 'Orphan', 'orphan', 'gray', '${uuid(99)}', 0, 0, 0, 0)",
      );
      await deps.db.customStatement('PRAGMA foreign_keys = ON');
      await apply(deps, BackupData(labels: [label(12, 'New')]), ImportMode.merge);
      expect((await deps.backups.readSnapshot()).labels, hasLength(3));
    });

    test('merging the same file twice changes nothing the second time', () async {
      await apply(deps, sampleData(), ImportMode.merge, importSettings: true);
      final once = await deps.backups.readSnapshot();
      final plan = await apply(deps, sampleData(), ImportMode.merge, importSettings: true);
      expect(plan.summary.writtenCount, 0);
      expect(await deps.backups.readSnapshot(), once);
    });
  });

  group('all or nothing (§10.6 stage 9, §11.4 failure injection)', () {
    Future<void> expectUnchanged(Future<Object?> Function() action) async {
      final before = await deps.backups.readSnapshot();
      final settingsBefore = await deps.db.select(deps.db.settings).get();
      await expectLater(action(), throwsA(anything));
      expect(await deps.backups.readSnapshot(), before);
      expect(await deps.db.select(deps.db.settings).get(), settingsBefore);
    }

    setUp(() => seedLikeTheApp(deps));

    test('a failing write after the replace deleted everything rolls it all back', () async {
      final broken = entry(50, label: 10).copyWith(end: Instant.parse('2026-10-25T05:00:00Z'));
      await expectUnchanged(
        () => deps.backups.applyImport(
          (_) => ImportPlan(
            summary: const ImportSummary(mode: ImportMode.replace, tables: {}),
            replaceAll: true,
            upserts: BackupData(labels: [label(10, 'Study')], entries: [broken]),
          ),
        ),
      );
    });

    test('a broken reference fails the foreign-key check at the end and rolls back', () async {
      await expectUnchanged(
        () => deps.backups.applyImport(
          (_) => ImportPlan(
            summary: const ImportSummary(mode: ImportMode.merge, tables: {}),
            upserts: BackupData(entries: [entry(50, label: 99)]),
          ),
        ),
      );
    });

    test('an error while planning changes nothing', () async {
      await expectUnchanged(() => deps.backups.applyImport((_) => throw StateError('boom')));
    });
  });

  group('erase and status', () {
    test('hasRecords: none on a new device, any record counts', () async {
      expect(await deps.backups.hasRecords(), isFalse);
      await deps.seed(BackupData(categories: [category(1, 'Learning')]));
      expect(await deps.backups.hasRecords(), isTrue);
    });

    test('erase removes every record, setting and scheduled-notification row', () async {
      await seedLikeTheApp(deps);
      await deps.db
          .into(deps.db.scheduledNotifications)
          .insert(ScheduledNotificationsCompanion.insert(key: 'k', platformId: 1, fireAtUtc: now, contentHash: 'h'));
      await deps.backups.eraseAll();
      expect(await deps.backups.hasRecords(), isFalse);
      expect(await deps.db.select(deps.db.settings).get(), isEmpty);
      expect(await deps.db.select(deps.db.scheduledNotifications).get(), isEmpty);
    });

    test('quick check passes on a healthy database', () async {
      await seedLikeTheApp(deps);
      expect(await deps.backups.quickCheck(), isTrue);
    });

    test('last export and the import log (newest first, five kept)', () async {
      final statuses = <Object>[];
      final sub = deps.backups.watchStatus().listen(statuses.add);
      addTearDown(sub.cancel);
      await deps.backups.recordExport(now);
      for (var i = 0; i < 7; i++) {
        await deps.backups.recordImport(
          ImportLogEntry(
            at: now + Duration(minutes: i),
            mode: ImportMode.merge,
            fileName: 'f$i.zip',
            written: i,
            skipped: 0,
            invalid: 0,
          ),
        );
      }
      await pumpEventQueue();
      final status = await deps.backups.watchStatus().first;
      expect(status.lastExportAt, now);
      expect(status.importLog.map((e) => e.fileName), ['f6.zip', 'f5.zip', 'f4.zip', 'f3.zip', 'f2.zip']);
    });
  });

  test('issues from the reader survive into the plan the database applies', () async {
    final plan = await apply(
      deps,
      BackupData(entries: [entry(50, label: 10).copyWith(kind: 'maybe')]),
      ImportMode.replace,
    );
    expect(plan.summary.issues.single.reason, IssueReason.badValue);
  });
}
