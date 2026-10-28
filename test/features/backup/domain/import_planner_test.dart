// Replace vs Merge (plan §10.7, §11.4 merge scenarios, J16).
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_plan.dart';
import 'package:planyar/src/features/backup/domain/entities/import_report.dart';
import 'package:planyar/src/features/backup/domain/services/backup_format.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_reader.dart';
import 'package:planyar/src/features/backup/domain/services/import_planner.dart';

import '../backup_test_data.dart';

void main() {
  const planner = ImportPlanner();
  final now = Instant.parse('2026-10-27T12:00:00Z');

  ImportPlan plan(
    BackupData file, {
    BackupData current = const BackupData(),
    ImportMode mode = ImportMode.merge,
    bool importSettings = false,
  }) => planner.plan(
    file: const BackupJsonReader().read(dataJson(file)),
    current: current,
    mode: mode,
    importSettings: importSettings,
    now: now,
    newId: uuidSequence(),
  );

  group('replace', () {
    test('writes every record and reports what it removes', () {
      final local = BackupData(labels: [label(90, 'Local')], entries: [entry(91, label: 90), entry(92, label: 90)]);
      final result = plan(sampleData(), current: local, mode: ImportMode.replace);
      expect(result.replaceAll, isTrue);
      expect(result.upserts, sampleData().copyWith(settings: const {}));
      expect(result.settings, sampleData().settings);
      expect(result.summary.settingsImported, isTrue);
      expect(result.summary.of(BackupTable.entries), const TableSummary(added: 5, removed: 2));
      expect(result.summary.of(BackupTable.labels), const TableSummary(added: 4, removed: 1));
      expect(result.summary.issues, isEmpty);
      expect(result.summary.repairs, isEmpty);
    });

    test('references must resolve inside the file', () {
      final file = BackupData(
        labels: [label(10, 'Study', category: 1)],
        taskReminders: [reminder(33, task: 31)],
        routineExceptions: [sampleData().routineExceptions.single],
        entries: [
          entry(50, label: 99, task: 31),
          occurrence(52, routine: 40, date: '2026-10-25', label: 10),
          entry(53, label: 10, source: 'from_plan', plannedEntry: 77),
        ],
      );
      // The device has all of them — irrelevant when replacing.
      final local = BackupData(
        categories: [category(1, 'Learning')],
        labels: [label(99, 'Ghost')],
        tasks: [task(31)],
        routines: [routine(40)],
      );
      final result = plan(file, current: local, mode: ImportMode.replace);
      final s = result.summary;
      expect(
        s.issues.map((i) => (i.table, i.reason, i.field)),
        unorderedEquals([
          (BackupTable.taskReminders, IssueReason.missingReference, 'taskId'),
          (BackupTable.routineExceptions, IssueReason.missingReference, 'routineId'),
          (BackupTable.entries, IssueReason.missingReference, 'routineId'),
        ]),
      );
      expect(
        s.repairs.map((r) => (r.id, r.kind, r.field)),
        unorderedEquals([
          (uuid(10), RepairKind.referenceCleared, 'categoryId'),
          (uuid(50), RepairKind.placeholderLabel, 'labelId'),
          (uuid(50), RepairKind.referenceCleared, 'taskId'),
          (uuid(53), RepairKind.referenceCleared, 'plannedEntryId'),
        ]),
      );
      // The missing label becomes the archived placeholder (§10.6).
      final placeholder = result.upserts.labels.singleWhere((l) => l.name == BackupFormat.placeholderLabelName);
      expect(placeholder.isArchived, isTrue);
      expect(placeholder.colorKey, 'gray');
      expect(result.upserts.entries.firstWhere((e) => e.id == uuid(50)).labelId, placeholder.id);
      expect(s.of(BackupTable.labels).added, 2);
      expect(s.of(BackupTable.entries).invalid, 1);
    });

    test('one placeholder for all missing labels, reusing one in the file', () {
      final file = BackupData(
        labels: [label(15, BackupFormat.placeholderLabelName, archived: true, color: 'gray')],
        routines: [routine(40, label: 98)],
        entries: [entry(50, label: 99), entry(51, label: 98)],
      );
      final result = plan(file, mode: ImportMode.replace);
      expect(result.upserts.labels.map((l) => l.id), [uuid(15)]);
      expect({...result.upserts.entries.map((e) => e.labelId), result.upserts.routines.single.labelId}, {uuid(15)});
    });
  });

  group('merge', () {
    test('new → added, same → unchanged, changed → overwritten; local records are kept', () {
      final local = BackupData(
        labels: [label(10, 'Study'), label(11, 'Exercise'), label(90, 'Local only')],
        entries: [
          entry(50, label: 10),
          entry(51, label: 10, note: 'old'),
          entry(91, label: 90),
        ],
      );
      final file = BackupData(
        labels: [
          label(10, 'Study'),
          label(11, 'Exercise', color: 'green'),
          label(12, 'Reading'),
        ],
        entries: [
          entry(50, label: 10),
          entry(51, label: 10, note: 'new'),
          entry(52, label: 12),
        ],
      );
      final result = plan(file, current: local);
      expect(result.replaceAll, isFalse);
      expect(result.summary.of(BackupTable.labels), const TableSummary(added: 1, overwritten: 1, unchanged: 1));
      expect(result.summary.of(BackupTable.entries), const TableSummary(added: 1, overwritten: 1, unchanged: 1));
      expect(result.upserts.entries.map((e) => e.id), [uuid(51), uuid(52)]);
      expect(result.deleteEntryIds, isEmpty);
    });

    test('same ID edited later on this device is still overwritten, with a warning', () {
      final local = BackupData(
        labels: [label(10, 'Study')],
        entries: [entry(50, label: 10, note: 'mine', updated: t1)],
      );
      final result = plan(
        BackupData(
          labels: [label(10, 'Study')],
          entries: [entry(50, label: 10, note: 'theirs')],
        ),
        current: local,
      );
      expect(result.upserts.entries.single.note, 'theirs');
      expect(result.summary.localNewer, 1);
    });

    test('same name, different ID → matched by name; references remapped (J16 AC3, D-25)', () {
      final local = BackupData(categories: [category(1, 'Learning')], labels: [label(10, 'Study', category: 1)]);
      final file = BackupData(
        categories: [category(2, 'learning', color: 'teal')],
        labels: [label(11, 'study', color: 'violet', icon: 'book', category: 2)],
        routines: [routine(40, label: 11)],
        entries: [entry(50, label: 11, categoryOverride: 2)],
      );
      final result = plan(file, current: local);
      expect(result.summary.of(BackupTable.labels).matchedByName, 1);
      expect(result.summary.of(BackupTable.categories).matchedByName, 1);
      // The local label keeps its ID and name and takes the imported style.
      final merged = result.upserts.labels.single;
      expect(
        (merged.id, merged.name, merged.colorKey, merged.iconKey, merged.categoryId),
        (uuid(10), 'Study', 'violet', 'book', uuid(1)),
      );
      expect(result.upserts.categories.single.id, uuid(1));
      expect(result.upserts.entries.single.labelId, uuid(10));
      expect(result.upserts.entries.single.categoryOverrideId, uuid(1));
      expect(result.upserts.routines.single.labelId, uuid(10));
    });

    test('a rename onto a name used on this device is left out; the fix-up repeats', () {
      // Local: Work(1), Study(2). The file renames Work → "Study" (taken by a
      // label it doesn't change) and adds a new "Work" — which then matches
      // the local Work, because that label keeps its name.
      final local = BackupData(labels: [label(1, 'Work'), label(2, 'Study')]);
      final file = BackupData(
        labels: [
          label(1, 'Study'),
          label(5, 'Work', color: 'red'),
        ],
        entries: [entry(50, label: 5)],
      );
      final result = plan(file, current: local);
      expect(
        result.summary.issues.single,
        RecordIssue(table: BackupTable.labels, id: uuid(1), reason: IssueReason.nameUsedOnDevice, field: 'name'),
      );
      expect(result.summary.of(BackupTable.labels).matchedByName, 1);
      expect(result.upserts.labels.single, label(1, 'Work', color: 'red'));
      expect(result.upserts.entries.single.labelId, uuid(1));
    });

    test('swapping two names is allowed (the database step uses temporary keys)', () {
      final local = BackupData(labels: [label(1, 'Work'), label(2, 'Study')]);
      final result = plan(BackupData(labels: [label(1, 'Study'), label(2, 'Work')]), current: local);
      expect(result.summary.issues, isEmpty);
      expect(result.summary.of(BackupTable.labels).overwritten, 2);
    });

    test('exact duplicate entries with a new ID are skipped; plan links move to the twin (D-27)', () {
      final local = BackupData(
        labels: [label(10, 'Study')],
        entries: [
          entry(60, label: 10, kind: 'planned', note: 'x'),
          entry(61, label: 10, note: 'kept'),
        ],
      );
      final file = BackupData(
        labels: [label(10, 'Study')],
        entries: [
          entry(50, label: 10, kind: 'planned', note: 'x'),
          entry(
            51,
            label: 10,
            source: 'from_plan',
            plannedEntry: 50,
            start: '2026-10-25T08:00:00Z',
            end: '2026-10-25T09:00:00Z',
          ),
          entry(52, label: 10, note: 'different'),
        ],
      );
      final result = plan(file, current: local);
      expect(result.summary.of(BackupTable.entries).duplicates, 1);
      expect(result.upserts.entries.map((e) => e.id), [uuid(51), uuid(52)]);
      expect(result.upserts.entries.first.plannedEntryId, uuid(60));
    });

    test('an occurrence for the same routine and date replaces the local one; links are re-pointed', () {
      final local = BackupData(
        labels: [label(20, 'Sleep')],
        routines: [routine(40)],
        entries: [
          occurrence(60, routine: 40, date: '2026-10-25'),
          entry(61, label: 20, source: 'from_plan', plannedEntry: 60),
        ],
      );
      final file = BackupData(
        labels: [label(20, 'Sleep')],
        routines: [routine(40)],
        entries: [occurrence(52, routine: 40, date: '2026-10-25')],
      );
      final result = plan(file, current: local);
      expect(result.deleteEntryIds, [uuid(60)]);
      expect(result.summary.of(BackupTable.entries).replacedByKey, 1);
      expect(result.upserts.entries.map((e) => (e.id, e.plannedEntryId)), [(uuid(52), null), (uuid(61), uuid(52))]);
    });

    test('an exception for the same routine and date replaces the local one', () {
      final x = sampleData().routineExceptions.single;
      final local = BackupData(
        labels: [label(20, 'Sleep')],
        routines: [routine(40)],
        routineExceptions: [x.copyWith(id: uuid(70))],
      );
      final result = plan(BackupData(routineExceptions: [x]), current: local);
      expect(result.deleteRoutineExceptionIds, [uuid(70)]);
      expect(result.upserts.routineExceptions.single.id, uuid(41));
    });

    test('a second unfinished task in a series: the local one is detached', () {
      final local = BackupData(
        taskSeries: [series(30)],
        tasks: [
          task(35, series: 30),
          task(36, series: 30, status: 'completed'),
        ],
      );
      final result = plan(
        BackupData(taskSeries: [series(30)], tasks: [task(31, series: 30)]),
        current: local,
      );
      expect(result.upserts.tasks.map((t) => (t.id, t.seriesId)), [(uuid(31), uuid(30)), (uuid(35), null)]);
      expect(result.summary.repairs.single.kind, RepairKind.detachedFromSeries);
    });

    test('references may resolve against this device', () {
      final local = BackupData(
        categories: [category(1, 'Learning')],
        labels: [label(10, 'Study')],
        tasks: [task(31)],
        routines: [routine(40, label: 10)],
        entries: [occurrence(60, routine: 40, date: '2026-10-24', label: 10)],
      );
      final file = BackupData(
        taskReminders: [reminder(33, task: 31)],
        entries: [
          entry(50, label: 10, task: 31, categoryOverride: 1),
          entry(51, label: 10, source: 'from_plan', plannedEntry: 60),
          occurrence(52, routine: 40, date: '2026-10-25', label: 10),
        ],
      );
      final result = plan(file, current: local);
      expect(result.summary.issues, isEmpty);
      expect(result.summary.repairs, isEmpty);
      expect(result.upserts.entries, hasLength(3));
    });

    test('local rows the plan rewrites count as updated (detached tasks, re-pointed entries)', () {
      final local = BackupData(
        labels: [label(20, 'Sleep')],
        routines: [routine(40)],
        taskSeries: [series(30)],
        tasks: [task(35, series: 30)],
        entries: [
          occurrence(60, routine: 40, date: '2026-10-25'),
          entry(61, label: 20, source: 'from_plan', plannedEntry: 60),
        ],
      );
      final file = BackupData(
        labels: [label(20, 'Sleep')],
        routines: [routine(40)],
        taskSeries: [series(30)],
        tasks: [task(31, series: 30)],
        entries: [occurrence(52, routine: 40, date: '2026-10-25')],
      );
      final result = plan(file, current: local);
      expect(result.summary.writtenCount, result.upserts.counts.values.fold(0, (a, b) => a + b));
      expect(result.summary.of(BackupTable.tasks), const TableSummary(added: 1, overwritten: 1, unchanged: 0));
    });

    test('a routine change replaced for the same day warns when the local one is newer', () {
      final x = sampleData().routineExceptions.single;
      final local = BackupData(
        labels: [label(20, 'Sleep')],
        routines: [routine(40)],
        routineExceptions: [x.copyWith(id: uuid(70), updatedAt: t1)],
      );
      expect(plan(BackupData(routineExceptions: [x]), current: local).summary.localNewer, 1);
    });

    test('a note of "null" is not the same as no note (D-27)', () {
      final local = BackupData(
        labels: [label(10, 'Study')],
        entries: [entry(60, label: 10, note: 'null')],
      );
      final result = plan(
        BackupData(labels: [label(10, 'Study')], entries: [entry(50, label: 10)]),
        current: local,
      );
      expect(result.summary.of(BackupTable.entries).duplicates, 0);
      expect(result.upserts.entries.single.id, uuid(50));
    });

    test('duplicates are found after a label is matched by name (D-25 + D-27)', () {
      final local = BackupData(
        labels: [label(10, 'Study')],
        entries: [entry(60, label: 10, note: 'x')],
      );
      final file = BackupData(
        labels: [label(11, 'study')],
        entries: [entry(50, label: 11, note: 'x')],
      );
      final result = plan(file, current: local);
      expect(result.summary.of(BackupTable.entries).duplicates, 1);
      expect(result.upserts.entries, isEmpty);
    });

    test('repairs are listed only for records that are written, under the ID they get', () {
      final local = BackupData(
        labels: [label(1, 'Run'), label(3, 'Running'), label(10, 'Study')],
        entries: [entry(60, label: 10, note: 'x')],
      );
      final file = BackupData(
        labels: [
          // Rejected (takes a local name): its cleared category isn't listed.
          label(1, 'Running', category: 98),
          // Matched by name to label 10: listed as label 10.
          label(11, 'study', category: 99),
        ],
        // A duplicate of entry 60 whose task is missing: skipped, not listed.
        entries: [entry(50, label: 11, note: 'x', task: 77)],
      );
      final repairs = plan(file, current: local).summary.repairs;
      expect(repairs.map((r) => (r.table, r.id, r.kind)), [
        (BackupTable.labels, uuid(10), RepairKind.referenceCleared),
      ]);
    });

    test('settings are kept unless "also import settings" is ticked (D-26)', () {
      expect(plan(sampleData()).settings, isNull);
      expect(plan(sampleData()).summary.settingsImported, isFalse);
      expect(plan(sampleData(), importSettings: true).settings, sampleData().settings);
    });

    test('importing the same file twice changes nothing the second time', () {
      final first = plan(sampleData(), current: const BackupData());
      final afterFirst = first.upserts.copyWith(settings: const {});
      final second = plan(sampleData(), current: afterFirst);
      expect(second.summary.writtenCount, 0);
      expect(second.upserts.hasNoRecords, isTrue);
      expect(second.summary.of(BackupTable.entries).unchanged, 5);
    });

    test('the plan is the same however often it is computed', () {
      final local = BackupData(labels: [label(1, 'Work'), label(2, 'Study')]);
      final file = BackupData(labels: [label(1, 'Study'), label(5, 'Work')], entries: [entry(50, label: 99)]);
      expect(plan(file, current: local), plan(file, current: local));
    });
  });
}
