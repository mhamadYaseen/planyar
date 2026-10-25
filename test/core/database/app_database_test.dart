// Schema v1 constraint tests (plan §7.3). The database itself rejects
// impossible data, so bugs fail loudly instead of corrupting history.

import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';

final t0 = Instant.parse('2026-10-25T11:00:00Z');
Instant at(int minutes) => t0 + Duration(minutes: minutes);

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late AppDatabase db;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db.into(db.categories).insert(
      CategoriesCompanion.insert(id: 'cat-1', name: 'Learning', nameKey: 'learning', createdAt: t0, updatedAt: t0),
    );
    await db.into(db.labels).insert(
      LabelsCompanion.insert(
        id: 'lbl-1',
        name: 'Study',
        nameKey: 'study',
        colorKey: 'indigo',
        categoryId: const Value('cat-1'),
        createdAt: t0,
        updatedAt: t0,
      ),
    );
    await db.into(db.routines).insert(
      RoutinesCompanion.insert(
        id: 'rtn-1',
        labelId: 'lbl-1',
        startMinute: 1380,
        endMinute: 420,
        startsOn: LocalDate(2026, 10, 1),
        createdAt: t0,
        updatedAt: t0,
      ),
    );
  });

  tearDown(() => db.close());

  EntriesCompanion entry({
    required String id,
    String kind = 'actual',
    String source = 'manual',
    Instant? start,
    Value<Instant?> end = const Value.absent(),
    Value<String?> routineId = const Value.absent(),
    Value<LocalDate?> occurrenceDate = const Value.absent(),
    Value<String?> plannedEntryId = const Value.absent(),
    Value<String?> taskId = const Value.absent(),
  }) => EntriesCompanion.insert(
    id: id,
    kind: kind,
    labelId: 'lbl-1',
    startUtc: start ?? t0,
    endUtc: end,
    tzId: 'Asia/Baghdad',
    utcOffsetMin: 180,
    source: source,
    routineId: routineId,
    occurrenceDate: occurrenceDate,
    plannedEntryId: plannedEntryId,
    taskId: taskId,
    createdAt: t0,
    updatedAt: t0,
  );

  Future<void> insert(EntriesCompanion e) => db.into(db.entries).insert(e);
  Matcher rejected() => throwsA(isA<SqliteException>());

  test('foreign keys are enforced', () async {
    final rows = await db.customSelect('PRAGMA foreign_keys').get();
    expect(rows.single.data.values.single, 1);
  });

  group('entries', () {
    test('accepts a normal actual entry and an open entry', () async {
      await insert(entry(id: 'e1', end: Value(at(120))));
      await insert(entry(id: 'e2', start: at(180)));
      final open = await (db.select(db.entries)..where((e) => e.endUtc.isNull())).get();
      expect(open.map((e) => e.id), ['e2']);
      expect(open.single.startUtc, at(180));
    });

    test('rejects end before or equal to start', () async {
      expect(insert(entry(id: 'e1', end: Value(t0))), rejected());
      expect(insert(entry(id: 'e2', end: Value(at(-1)))), rejected());
    });

    test('rejects entries longer than 7 days', () async {
      await insert(entry(id: 'ok', end: Value(at(7 * 24 * 60))));
      expect(insert(entry(id: 'long', end: Value(at(7 * 24 * 60 + 1)))), rejected());
    });

    test('rejects times that are not minute-aligned', () async {
      expect(insert(entry(id: 'e1', start: t0 + const Duration(seconds: 30))), rejected());
    });

    test('rejects unknown kind and source', () async {
      expect(insert(entry(id: 'e1', kind: 'maybe')), rejected());
      expect(insert(entry(id: 'e2', source: 'import')), rejected());
    });

    test('routine fields only on planned routine occurrences', () async {
      // routine source without routine fields
      expect(insert(entry(id: 'a', kind: 'planned', source: 'routine')), rejected());
      // actual entry claiming to be a routine occurrence
      expect(
        insert(
          entry(
            id: 'b',
            source: 'routine',
            routineId: const Value('rtn-1'),
            occurrenceDate: Value(LocalDate(2026, 10, 25)),
          ),
        ),
        rejected(),
      );
      // manual entry carrying a routine id
      expect(insert(entry(id: 'c', routineId: const Value('rtn-1'))), rejected());
    });

    test('one occurrence per (routine, date) — duplicates are impossible', () async {
      EntriesCompanion occurrence(String id) => entry(
        id: id,
        kind: 'planned',
        source: 'routine',
        start: at(600),
        end: Value(at(1080)),
        routineId: const Value('rtn-1'),
        occurrenceDate: Value(LocalDate(2026, 10, 25)),
      );
      await insert(occurrence('occ-1'));
      expect(insert(occurrence('occ-2')), rejected());
    });

    test('plan links: only actual from_plan entries, cleared when the plan is deleted', () async {
      await insert(entry(id: 'plan', kind: 'planned', end: Value(at(60))));
      expect(insert(entry(id: 'bad', plannedEntryId: const Value('plan'))), rejected());
      await insert(entry(id: 'log', source: 'from_plan', end: Value(at(60)), plannedEntryId: const Value('plan')));
      await (db.delete(db.entries)..where((e) => e.id.equals('plan'))).go();
      final log = await (db.select(db.entries)..where((e) => e.id.equals('log'))).getSingle();
      expect(log.plannedEntryId, isNull);
    });

    test('rejects notes over 2,000 characters', () async {
      final e = entry(id: 'e1').copyWith(note: Value('x' * 2001));
      expect(insert(e), rejected());
    });
  });

  group('labels and categories', () {
    test('label names are unique by name key', () async {
      final dup = LabelsCompanion.insert(
        id: 'lbl-2',
        name: 'study',
        nameKey: 'study',
        colorKey: 'teal',
        createdAt: t0,
        updatedAt: t0,
      );
      expect(db.into(db.labels).insert(dup), rejected());
    });

    test('names must be 1–40 trimmed characters', () async {
      LabelsCompanion label(String id, String name) => LabelsCompanion.insert(
        id: id,
        name: name,
        nameKey: id,
        colorKey: 'teal',
        createdAt: t0,
        updatedAt: t0,
      );
      expect(db.into(db.labels).insert(label('a', '')), rejected());
      expect(db.into(db.labels).insert(label('b', ' Study')), rejected());
      expect(db.into(db.labels).insert(label('c', 'x' * 41)), rejected());
      await db.into(db.labels).insert(label('d', 'x' * 40));
    });

    test('a label in use cannot be deleted (LBL-04)', () async {
      await insert(entry(id: 'e1', end: Value(at(60))));
      final routineFree = db.delete(db.labels)..where((l) => l.id.equals('lbl-1'));
      expect(routineFree.go(), rejected());
    });
  });

  group('routines and exceptions', () {
    RoutineExceptionsCompanion exception(String id, {String type = 'skip', int? start, int? end}) =>
        RoutineExceptionsCompanion.insert(
          id: id,
          routineId: 'rtn-1',
          occurrenceDate: LocalDate(2026, 10, 25),
          type: type,
          startOffsetMin: Value(start),
          endOffsetMin: Value(end),
          createdAt: t0,
          updatedAt: t0,
        );

    test('one exception per routine and date', () async {
      await db.into(db.routineExceptions).insert(exception('x1'));
      expect(db.into(db.routineExceptions).insert(exception('x2')), rejected());
    });

    test('offsets stay within −720…2880 and end after start', () async {
      await db.into(db.routineExceptions).insert(exception('ok', type: 'modify', start: 1470, end: 1920));
      await db.delete(db.routineExceptions).go();
      expect(db.into(db.routineExceptions).insert(exception('a', type: 'modify', start: -721)), rejected());
      expect(db.into(db.routineExceptions).insert(exception('b', type: 'modify', end: 2881)), rejected());
      expect(db.into(db.routineExceptions).insert(exception('c', type: 'modify', start: 600, end: 600)), rejected());
      expect(db.into(db.routineExceptions).insert(exception('d', type: 'skip', start: 600)), rejected());
    });

    test('exceptions are deleted with their routine', () async {
      await db.into(db.routineExceptions).insert(exception('x1'));
      await (db.delete(db.routines)..where((r) => r.id.equals('rtn-1'))).go();
      expect(await db.select(db.routineExceptions).get(), isEmpty);
    });

    test('routine times must differ and stay within a day', () async {
      RoutinesCompanion routine(String id, int start, int end) => RoutinesCompanion.insert(
        id: id,
        labelId: 'lbl-1',
        startMinute: start,
        endMinute: end,
        startsOn: LocalDate(2026, 10, 1),
        createdAt: t0,
        updatedAt: t0,
      );
      expect(db.into(db.routines).insert(routine('a', 600, 600)), rejected());
      expect(db.into(db.routines).insert(routine('b', 1440, 60)), rejected());
    });
  });

  group('tasks', () {
    TasksCompanion task(String id, {String status = 'not_started', Instant? completedAt, String? seriesId}) =>
        TasksCompanion.insert(
          id: id,
          title: 'Renew passport',
          startDate: LocalDate(2026, 10, 1),
          status: status,
          completedAt: Value(completedAt),
          seriesId: Value(seriesId),
          createdAt: t0,
          updatedAt: t0,
        );

    test('completedAt is required exactly when completed', () async {
      await db.into(db.tasks).insert(task('t1'));
      await db.into(db.tasks).insert(task('t2', status: 'completed', completedAt: t0));
      expect(db.into(db.tasks).insert(task('t3', status: 'completed')), rejected());
      expect(db.into(db.tasks).insert(task('t4', completedAt: t0)), rejected());
    });

    test('deadline cannot be before the start date', () async {
      final bad = task('t1').copyWith(deadlineDate: Value(LocalDate(2026, 9, 30)));
      expect(db.into(db.tasks).insert(bad), rejected());
    });

    test('only one open instance per series', () async {
      await db.into(db.taskSeries).insert(
        TaskSeriesCompanion.insert(
          id: 's1',
          freq: 'monthly',
          interval: 1,
          mode: 'schedule',
          anchorDate: LocalDate(2026, 10, 1),
          createdAt: t0,
          updatedAt: t0,
        ),
      );
      await db.into(db.tasks).insert(task('t1', seriesId: 's1'));
      await db.into(db.tasks).insert(task('t2', seriesId: 's1', status: 'completed', completedAt: t0));
      expect(db.into(db.tasks).insert(task('t3', seriesId: 's1')), rejected());
    });

    test('deleting a task keeps linked entries and clears the link', () async {
      await db.into(db.tasks).insert(task('t1'));
      await insert(entry(id: 'e1', end: Value(at(60)), taskId: const Value('t1')));
      await (db.delete(db.tasks)..where((t) => t.id.equals('t1'))).go();
      final e = await db.select(db.entries).getSingle();
      expect(e.taskId, isNull);
    });

    test('reminder fields must match the reminder type', () async {
      await db.into(db.tasks).insert(task('t1'));
      TaskRemindersCompanion reminder(String id, String type, {int? days, int? minute, Instant? custom}) =>
          TaskRemindersCompanion.insert(
            id: id,
            taskId: 't1',
            type: type,
            offsetDays: Value(days),
            minuteOfDay: Value(minute),
            customAtUtc: Value(custom),
            createdAt: t0,
            updatedAt: t0,
          );
      await db.into(db.taskReminders).insert(reminder('r1', 'before_deadline', days: 1, minute: 540));
      await db.into(db.taskReminders).insert(reminder('r2', 'custom', custom: t0));
      expect(db.into(db.taskReminders).insert(reminder('r3', 'before_deadline', minute: 540)), rejected());
      expect(db.into(db.taskReminders).insert(reminder('r4', 'at_start')), rejected());
      expect(db.into(db.taskReminders).insert(reminder('r5', 'custom')), rejected());
      expect(db.into(db.taskReminders).insert(reminder('r6', 'before_deadline', days: 31, minute: 540)), rejected());
    });
  });

  test('settings scope is portable or device', () async {
    await db.into(db.settings).insert(
      SettingsCompanion.insert(key: 'themeMode', value: '"system"', scope: 'portable', updatedAt: t0),
    );
    expect(
      db.into(db.settings).insert(SettingsCompanion.insert(key: 'x', value: '1', scope: 'cloud', updatedAt: t0)),
      rejected(),
    );
  });
}
