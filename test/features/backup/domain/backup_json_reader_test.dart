// Import validation, the parts that don't depend on the mode (plan §10.6
// stages 4–5, §11.4). Every case leaves the bad record out with a reason
// and keeps the rest.
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_manifest.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_report.dart';
import 'package:planyar/src/features/backup/domain/services/backup_format.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_reader.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_writer.dart';

import '../backup_test_data.dart';

void main() {
  const reader = BackupJsonReader();

  ParsedBackup read(Map<String, Object?> json) => reader.read(json);

  /// Reads [json] and expects exactly one issue.
  RecordIssue onlyIssue(Map<String, Object?> json) {
    final parsed = read(json);
    expect(parsed.issues, hasLength(1), reason: parsed.issues.join('\n'));
    return parsed.issues.single;
  }

  group('valid data', () {
    test('writer → reader gives the same records back', () {
      final parsed = read(dataJson(sampleData()));
      expect(parsed.issues, isEmpty);
      expect(parsed.repairs, isEmpty);
      expect(parsed.data, sampleData());
    });

    test('writer output is canonical: sorted by ID, settings keys sorted', () {
      final shuffled = sampleData().copyWith(
        labels: sampleData().labels.reversed.toList(),
        settings: {'firstDayOfWeek': 5, 'themeMode': 'dark'},
      );
      expect(jsonEncode(BackupJsonWriter.data(shuffled)), jsonEncode(BackupJsonWriter.data(sampleData())));
      final labels = BackupJsonWriter.data(sampleData())['labels']! as List<Object?>;
      expect([for (final l in labels) (l! as Map)['id']], [uuid(10), uuid(11), uuid(20), uuid(21)]);
    });

    test('instants are ISO-8601 UTC with Z; dates are YYYY-MM-DD', () {
      final json = dataJson(sampleData());
      expect(record(json, 'entries')['startUtc'], '2026-10-25T06:00:00.000Z');
      expect(record(json, 'entries', 2)['occurrenceDate'], '2026-10-25');
      expect(record(json, 'routines')['startsOn'], '2026-10-01');
    });

    test('missing arrays are empty; missing optional fields take defaults', () {
      final json = dataJson(BackupData(labels: [label(10, 'Study')]));
      json.remove('entries');
      record(json, 'labels')
        ..remove('isArchived')
        ..remove('sortOrder')
        ..remove('iconKey');
      final parsed = read(json);
      expect(parsed.issues, isEmpty);
      expect(parsed.data.labels.single.isArchived, isFalse);
      expect(parsed.data.labels.single.sortOrder, 0);
    });

    test('IDs are lower-cased so references still match', () {
      final json = dataJson(BackupData(labels: [label(10, 'Study')], entries: [entry(50, label: 10)]));
      record(json, 'labels')['id'] = uuid(10).toUpperCase();
      final parsed = read(json);
      expect(parsed.data.labels.single.id, uuid(10));
      expect(parsed.data.entries.single.labelId, uuid(10));
    });

    test('names are cleaned like the app does', () {
      final json = dataJson(BackupData(labels: [label(10, 'Study')]));
      record(json, 'labels')['name'] = '  Deep   work ';
      expect(read(json).data.labels.single.name, 'Deep work');
    });

    test('integral doubles are accepted as integers', () {
      final json = dataJson(BackupData(labels: [label(10, 'Study')], entries: [entry(50, label: 10)]));
      record(json, 'entries')['utcOffsetMin'] = 180.0;
      expect(read(json).data.entries.single.utcOffsetMin, 180);
    });
  });

  group('broken structure → damaged file', () {
    void expectDamaged(Object? json) => expect(
      () => reader.read(json),
      throwsA(isA<BackupFileException>().having((e) => e.problem, 'problem', BackupFileProblem.damaged)),
    );

    test('top level not an object', () => expectDamaged(<Object?>[]));
    test('an array that is not an array', () => expectDamaged(<String, Object?>{'entries': 'oops'}));
    test('settings not an object', () => expectDamaged(<String, Object?>{'settings': 3}));
  });

  group('invalid records are left out with a reason (J17 AC2)', () {
    Map<String, Object?> withEntry(void Function(Map<String, Object?> e) change) {
      final json = dataJson(
        BackupData(labels: [label(10, 'Study')], entries: [entry(50, label: 10), entry(51, label: 10)]),
      );
      change(record(json, 'entries'));
      return json;
    }

    void expectIssue(Map<String, Object?> json, IssueReason reason, {String? field}) {
      final issue = onlyIssue(json);
      expect(issue.reason, reason);
      if (field != null) expect(issue.field, field);
    }

    test('not an object', () {
      final json = withEntry((_) {});
      (json['entries']! as List<Object?>)[0] = 'text';
      final issue = onlyIssue(json);
      expect(issue, const RecordIssue(table: BackupTable.entries, index: 0, reason: IssueReason.notAnObject));
    });

    test(
      'missing required field',
      () => expectIssue(withEntry((e) => e.remove('startUtc')), IssueReason.missingField, field: 'startUtc'),
    );
    test('wrong type', () => expectIssue(withEntry((e) => e['utcOffsetMin'] = '180'), IssueReason.wrongType));
    test('non-integral number', () => expectIssue(withEntry((e) => e['utcOffsetMin'] = 1.5), IssueReason.wrongType));
    test('invalid enum', () => expectIssue(withEntry((e) => e['kind'] = 'maybe'), IssueReason.badValue, field: 'kind'));
    test('bad UUID', () => expectIssue(withEntry((e) => e['id'] = 'id-1'), IssueReason.badId, field: 'id'));
    test('bad reference UUID', () => expectIssue(withEntry((e) => e['labelId'] = '../etc'), IssueReason.badId));
    test(
      'time without a zone',
      () => expectIssue(withEntry((e) => e['startUtc'] = '2026-10-25T06:00:00'), IssueReason.badTime),
    );
    test(
      'time out of range',
      () => expectIssue(withEntry((e) => e['startUtc'] = '1969-12-31T23:00:00Z'), IssueReason.badTime),
    );
    test('bad date', () {
      final json = dataJson(BackupData(routines: [routine(40)]));
      record(json, 'routines')['startsOn'] = '2026-02-30';
      expectIssue(json, IssueReason.badDate, field: 'startsOn');
    });

    test(
      'end before start',
      () => expectIssue(withEntry((e) => e['endUtc'] = '2026-10-25T05:00:00.000Z'), IssueReason.endNotAfterStart),
    );
    test(
      'end equal to start',
      () => expectIssue(withEntry((e) => e['endUtc'] = e['startUtc']), IssueReason.endNotAfterStart),
    );
    test(
      '8-day entry',
      () => expectIssue(withEntry((e) => e['endUtc'] = '2026-11-02T06:01:00.000Z'), IssueReason.longerThan7Days),
    );
    test('huge note', () => expectIssue(withEntry((e) => e['note'] = 'x' * 2001), IssueReason.tooLong, field: 'note'));
    test(
      'a 10 MB string',
      () => expectIssue(withEntry((e) => e['tzId'] = 'x' * (10 * 1024 * 1024)), IssueReason.tooLong),
    );
    test(
      'routine source without routine',
      () => expectIssue(withEntry((e) => e['source'] = 'routine'), IssueReason.badValue),
    );
    test('plan link on a planned entry', () {
      expectIssue(
        withEntry(
          (e) => e
            ..['kind'] = 'planned'
            ..['plannedEntryId'] = uuid(51),
        ),
        IssueReason.badValue,
      );
    });

    test('the issue keeps the readable ID and the array position', () {
      final issue = onlyIssue(withEntry((e) => e['kind'] = 'maybe'));
      expect(issue.id, uuid(50));
      expect(issue.index, 0);
      expect(issue.table, BackupTable.entries);
    });

    test('label name: empty and too long', () {
      final json = dataJson(BackupData(labels: [label(10, 'A'), label(11, 'B')]));
      record(json, 'labels')['name'] = '   ';
      record(json, 'labels', 1)['name'] = 'x' * 41;
      expect(read(json).issues.map((i) => i.reason), [IssueReason.badValue, IssueReason.tooLong]);
    });

    test('routine: same start and end minute, minute out of range', () {
      final json = dataJson(BackupData(routines: [routine(40), routine(41)]));
      record(json, 'routines')['endMinute'] = 23 * 60;
      record(json, 'routines', 1)['startMinute'] = 1440;
      expect(read(json).issues.map((i) => i.field), ['endMinute', 'startMinute']);
    });

    test('exception: skip with times, end before start', () {
      final base = sampleData().routineExceptions.single;
      final json = dataJson(
        BackupData(
          routineExceptions: [
            base,
            base.copyWith(id: uuid(42), occurrenceDate: base.occurrenceDate.addDays(1)),
          ],
        ),
      );
      record(json, 'routineExceptions')['type'] = 'skip';
      record(json, 'routineExceptions', 1)['endOffsetMin'] = 0;
      expect(read(json).issues.map((i) => i.reason), [IssueReason.badValue, IssueReason.endNotAfterStart]);
    });

    test('task: deadline before start, deadline time without a date', () {
      final json = dataJson(BackupData(tasks: [task(31), task(32)]));
      record(json, 'tasks')['deadlineDate'] = '2026-09-01';
      record(json, 'tasks', 1)['deadlineDate'] = null;
      expect(read(json).issues.map((i) => i.field), ['deadlineDate', 'deadlineMinute']);
    });

    test('task reminder: fields that do not fit its type', () {
      final json = dataJson(BackupData(taskReminders: [reminder(33, task: 31)]));
      record(json, 'taskReminders')['type'] = 'custom';
      expectIssue(json, IssueReason.badValue, field: 'type');
    });
  });

  group('safe repairs are made and listed', () {
    test('unknown color → gray, unknown icon → none', () {
      final json = dataJson(
        BackupData(
          categories: [category(1, 'Learning')],
          labels: [label(10, 'Study', icon: 'study')],
        ),
      );
      record(json, 'labels')
        ..['colorKey'] = 'chartreuse'
        ..['iconKey'] = 'unicorn';
      record(json, 'categories')['colorKey'] = 'mauve';
      final parsed = read(json);
      expect(parsed.issues, isEmpty);
      expect(parsed.data.labels.single.colorKey, BackupFormat.fallbackColorKey);
      expect(parsed.data.labels.single.iconKey, isNull);
      expect(parsed.data.categories.single.colorKey, BackupFormat.fallbackColorKey);
      expect(
        parsed.repairs.map((r) => r.kind),
        unorderedEquals([RepairKind.colorReplaced, RepairKind.iconRemoved, RepairKind.colorReplaced]),
      );
    });

    test('entry times with seconds are rounded to the minute', () {
      final json = dataJson(BackupData(entries: [entry(50, label: 10)]));
      record(json, 'entries')
        ..['startUtc'] = '2026-10-25T06:00:29.999Z'
        ..['endUtc'] = '2026-10-25T06:59:30Z';
      final parsed = read(json);
      expect(parsed.data.entries.single.start, Instant.parse('2026-10-25T06:00:00Z'));
      expect(parsed.data.entries.single.end, Instant.parse('2026-10-25T07:00:00Z'));
      expect(parsed.repairs.map((r) => r.field), ['startUtc', 'endUtc']);
    });

    test('completed task without a completion time gets its last-updated time', () {
      final json = dataJson(
        BackupData(
          tasks: [task(32, status: 'completed', updated: t1)],
        ),
      );
      record(json, 'tasks')['completedAtUtc'] = null;
      final parsed = read(json);
      expect(parsed.data.tasks.single.completedAt, t1);
      expect(parsed.repairs.single.kind, RepairKind.completedAtSet);
    });

    test('unfinished task with a completion time loses it', () {
      final json = dataJson(BackupData(tasks: [task(31)]));
      record(json, 'tasks')['completedAtUtc'] = '2026-10-20T08:00:00Z';
      final parsed = read(json);
      expect(parsed.data.tasks.single.completedAt, isNull);
      expect(parsed.repairs.single.kind, RepairKind.completedAtCleared);
    });
  });

  group('inside the file (stage 5)', () {
    test('duplicate IDs: the first is kept', () {
      final parsed = read(
        dataJson(
          BackupData(
            entries: [
              entry(50, label: 10),
              entry(50, label: 10, note: 'twin'),
            ],
          ),
        ),
      );
      expect(parsed.data.entries.single.note, isNull);
      expect(parsed.issues.single.reason, IssueReason.duplicateId);
    });

    test('label name clash: folded into the first, references moved', () {
      final json = dataJson(
        BackupData(
          labels: [label(10, 'Study'), label(11, 'Sleep')],
          routines: [routine(40, label: 11)],
          entries: [entry(50, label: 11)],
        ),
      );
      record(json, 'labels', 1)['name'] = ' STUDY ';
      final parsed = read(json);
      expect(parsed.data.labels.map((l) => l.id), [uuid(10)]);
      expect(parsed.data.entries.single.labelId, uuid(10));
      expect(parsed.data.routines.single.labelId, uuid(10));
      expect(
        parsed.issues.single,
        RecordIssue(
          table: BackupTable.labels,
          index: 1,
          id: uuid(11),
          reason: IssueReason.duplicateName,
          field: 'name',
        ),
      );
    });

    test('category name clash: references from labels, tasks and entries move', () {
      final parsed = read(
        dataJson(
          BackupData(
            categories: [category(1, 'Learning'), category(2, 'learning')],
            labels: [label(10, 'Study', category: 2)],
            tasks: [task(31, category: 2)],
            entries: [entry(50, label: 10, categoryOverride: 2)],
          ),
        ),
      );
      expect(parsed.data.categories.map((c) => c.id), [uuid(1)]);
      expect(parsed.data.labels.single.categoryId, uuid(1));
      expect(parsed.data.tasks.single.categoryId, uuid(1));
      expect(parsed.data.entries.single.categoryOverrideId, uuid(1));
    });

    test('two occurrences for one routine and date: the second is left out, its links move', () {
      final parsed = read(
        dataJson(
          BackupData(
            entries: [
              occurrence(52, routine: 40, date: '2026-10-25'),
              occurrence(55, routine: 40, date: '2026-10-25'),
              entry(53, label: 20, source: 'from_plan', plannedEntry: 55),
            ],
          ),
        ),
      );
      expect(parsed.data.entries.map((e) => e.id), [uuid(52), uuid(53)]);
      expect(parsed.data.entries.last.plannedEntryId, uuid(52));
      expect(parsed.issues.single.reason, IssueReason.duplicateOccurrence);
    });

    test('two exceptions for one routine and date', () {
      final x = sampleData().routineExceptions.single;
      final parsed = read(
        dataJson(
          BackupData(
            routineExceptions: [
              x,
              x.copyWith(id: uuid(42)),
            ],
          ),
        ),
      );
      expect(parsed.data.routineExceptions.single.id, uuid(41));
      expect(parsed.issues.single.reason, IssueReason.duplicateOccurrence);
    });

    test('two unfinished tasks in one series: the second becomes standalone', () {
      final parsed = read(
        dataJson(
          BackupData(
            tasks: [
              task(31, series: 30),
              task(34, series: 30),
              task(35, series: 30, status: 'completed'),
            ],
          ),
        ),
      );
      expect(parsed.data.tasks.map((t) => t.seriesId), [uuid(30), null, uuid(30)]);
      expect(
        parsed.repairs.single,
        RecordRepair(table: BackupTable.tasks, id: uuid(34), kind: RepairKind.detachedFromSeries, field: 'seriesId'),
      );
    });
  });

  group('text the database would store differently (review fixes)', () {
    test('control characters are removed from names, like the app does', () {
      final json = dataJson(
        BackupData(labels: [label(10, 'Study'), label(11, 'Sleep')], categories: [category(1, 'A')]),
      );
      record(json, 'labels')['name'] = '\u0000Study';
      record(json, 'labels', 1)['name'] = '\u0001\u007f';
      record(json, 'categories')['name'] = 'Le\u0085arn';
      final parsed = read(json);
      expect(parsed.data.labels.single.name, 'Study');
      expect(parsed.data.categories.single.name, 'Learn');
      expect(
        parsed.issues.single,
        RecordIssue(table: BackupTable.labels, index: 1, id: uuid(11), reason: IssueReason.badValue, field: 'name'),
      );
    });

    test('U+0000 is refused where SQLite length() CHECKs would fail', () {
      final json = dataJson(BackupData(tasks: [task(31), task(32)], routines: [routine(40)]));
      record(json, 'tasks')['title'] = '\u0000';
      record(json, 'tasks', 1)['title'] = 'a\u0000b';
      record(json, 'routines')['name'] = '\u0000Night';
      expect(read(json).issues.map((i) => (i.table, i.field)), [
        (BackupTable.tasks, 'title'),
        (BackupTable.tasks, 'title'),
        (BackupTable.routines, 'name'),
      ]);
    });

    test('notes keep what the app stored, including U+0000', () {
      final json = dataJson(BackupData(entries: [entry(50, label: 10)]));
      record(json, 'entries')['note'] = 'a\u0000b\nline two';
      expect(read(json).data.entries.single.note, 'a\u0000b\nline two');
    });

    test('lone surrogates are refused anywhere (SQLite would store U+FFFD)', () {
      final json = dataJson(BackupData(labels: [label(10, 'Run'), label(11, 'Walk')], entries: [entry(50, label: 10)]));
      record(json, 'labels')['name'] = 'Run \ud83c';
      record(json, 'labels', 1)['name'] = 'Run \ud83d';
      record(json, 'entries')['note'] = 'cut \udfff here';
      final parsed = read(json);
      expect(parsed.issues.map((i) => (i.table, i.reason, i.field)), [
        (BackupTable.labels, IssueReason.badValue, 'name'),
        (BackupTable.labels, IssueReason.badValue, 'name'),
        (BackupTable.entries, IssueReason.badValue, 'note'),
      ]);
      // A real pair is fine.
      record(json, 'labels')['name'] = 'Run 🏃';
      expect(read(json).data.labels.single.name, 'Run 🏃');
    });

    test('times must be ISO-8601 with a time and a zone', () {
      final json = dataJson(BackupData(entries: [entry(50, label: 10), entry(51, label: 10), entry(52, label: 10)]));
      record(json, 'entries')['startUtc'] = '2026-10-25';
      record(json, 'entries', 1)['createdAtUtc'] = '2026-13-45T99:99:99Z';
      record(json, 'entries', 2)['updatedAtUtc'] = '2026-10-25T10:00+99:99';
      expect(read(json).issues.map((i) => i.reason), everyElement(IssueReason.badTime));
      expect(read(json).issues, hasLength(3));
    });
  });

  group('settings', () {
    test('values need the right shape; nothing deep is ever encoded', () {
      Object nested = 'dark';
      for (var i = 0; i < 10000; i++) {
        nested = [nested];
      }
      final json = dataJson(sampleData());
      json['settings'] = {'themeMode': nested, 'firstDayOfWeek': 5.0, 'laneMode': 3, 'timelineMode': 'x' * 40};
      expect(read(json).data.settings, {'firstDayOfWeek': 5});
      json['settings'] = {'firstDayOfWeek': 8, 'themeMode': 'sepia'};
      expect(read(json).data.settings, {'themeMode': 'sepia'}, reason: 'an unknown name falls back when read');
    });

    test('only portable keys are taken', () {
      final json = dataJson(sampleData());
      json['settings'] = {
        'themeMode': 'dark',
        'onboardingCompleted': false,
        'lastExportAt': 1,
        'somethingNew': true,
        'laneMode': null,
        'timelineMode': 'x' * 20000,
      };
      expect(read(json).data.settings, {'themeMode': 'dark'});
    });
  });
}
