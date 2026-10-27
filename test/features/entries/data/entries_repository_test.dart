// EntriesRepositoryImpl against an in-memory database (plan §7.3, §8.5).
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/features/entries/data/datasource/entries_dao.dart';
import 'package:planyar/src/features/entries/data/repositories/entries_repository_impl.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/entities/entry_draft.dart';
import 'package:planyar/src/features/labels/data/datasource/labels_dao.dart';
import 'package:planyar/src/features/labels/data/repositories/labels_repository_impl.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../helpers/test_database.dart';

Instant at(String local) => Instant.parse('$local+03:00');

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late AppDatabase db;
  late TimeZoneService zones;
  late EntriesRepositoryImpl repo;
  late String work;
  late String sleep;

  setUp(() async {
    db = newTestDatabase();
    zones = await baghdadTimeZones();
    repo = EntriesRepositoryImpl(EntriesDao(db), SequentialIds(), zones);
    final labels = LabelsRepositoryImpl(
      LabelsDao(db),
      SequentialIds()
        ..newId()
        ..newId()
        ..newId(),
    );
    work = (await labels.create(name: 'Work')).id;
    sleep = (await labels.create(name: 'Sleep')).id;
  });

  tearDown(() => db.close());

  Future<Entry> add(String from, String? to, {EntryKind kind = EntryKind.actual, String? label}) =>
      repo.create(EntryDraft(kind: kind, labelId: label ?? work, start: at(from), end: to == null ? null : at(to)));
  InstantRange day(int d) => zones.dayMath.dayBounds(LocalDate(2026, 10, d));

  test('create sets ID, time zone, offset and timestamps from the clock', () async {
    final created = await withClock(
      Clock.fixed(DateTime.utc(2026, 10, 25, 12)),
      () => add('2026-10-25T14:00:00', '2026-10-25T16:00:00'),
    );
    expect(created.id, 'id-1');
    expect((created.tzId, created.utcOffsetMin), ('Asia/Baghdad', 180));
    expect(created.createdAt, Instant.parse('2026-10-25T12:00:00Z'));
    expect(created.source, EntrySource.manual);
    expect(await repo.byId('id-1'), created);
  });

  test('day query: overnight from yesterday yes, ending at midnight no, open only on its start day (§7.3)', () async {
    await add('2026-10-24T23:10:00', '2026-10-25T06:50:00', label: sleep); // id-1: overnight into Sunday
    await add('2026-10-24T22:00:00', '2026-10-25T00:00:00'); // id-2: ends exactly at Sunday 00:00
    await add('2026-10-25T14:00:00', null); // id-3: open on Sunday
    await add('2026-10-24T20:00:00', null); // id-4: open on Saturday
    await add('2026-10-25T23:00:00', '2026-10-26T01:00:00'); // id-5: Sunday into Monday
    await add('2026-10-26T00:00:00', '2026-10-26T01:00:00'); // id-6: Monday only
    final sunday = await repo.inRange(day(25));
    expect(sunday.map((e) => e.id), ['id-1', 'id-3', 'id-5']);
    final saturday = await repo.inRange(day(24));
    expect(saturday.map((e) => e.id), ['id-4', 'id-2', 'id-1']); // by start time
  });

  test('a 7-day entry still shows on its last day', () async {
    await add('2026-10-18T12:00:00', '2026-10-25T12:00:00');
    expect(await repo.inRange(day(25)), hasLength(1));
  });

  test('watchRange re-emits after a change', () async {
    final emissions = repo.watchRange(day(25)).map((list) => list.length);
    final check = expectLater(emissions, emitsInOrder([0, 1]));
    await pumpEventQueue();
    await add('2026-10-25T09:00:00', '2026-10-25T10:00:00');
    await check;
  });

  test('open entries come oldest first (To finish)', () async {
    await add('2026-10-25T14:00:00', null);
    await add('2026-10-23T09:00:00', null);
    await add('2026-10-25T08:00:00', '2026-10-25T09:00:00');
    expect((await repo.watchOpen().first).map((e) => e.id), ['id-2', 'id-1']);
  });

  test('update saves fields and bumps updatedAt; blank notes become null', () async {
    final created = await add('2026-10-25T14:00:00', null);
    final later = DateTime.utc(2026, 10, 25, 13);
    final updated = await withClock(
      Clock.fixed(later),
      () => repo.update(created.copyWith(end: at('2026-10-25T15:30:00'), note: '   ')),
    );
    expect(updated.end, at('2026-10-25T15:30:00'));
    expect(updated.note, isNull);
    expect(updated.updatedAt, Instant.fromDateTime(later));
    expect(await repo.byId(created.id), updated);
  });

  test('delete returns the row and restore puts it back unchanged (Undo)', () async {
    final created = await add('2026-10-25T14:00:00', '2026-10-25T15:00:00');
    final deleted = await repo.delete(created.id);
    expect(deleted, created);
    expect(await repo.byId(created.id), isNull);
    await repo.restore(deleted!);
    expect(await repo.byId(created.id), created);
    expect(await repo.delete('missing'), isNull);
  });

  test('quick-add helpers: latest actual end, last planned duration, recent label use', () async {
    await add('2026-10-25T09:00:00', '2026-10-25T11:00:00');
    await add('2026-10-25T12:00:00', '2026-10-25T14:05:00');
    await add('2026-10-25T13:00:00', '2026-10-25T18:00:00', kind: EntryKind.planned);
    await add('2026-10-20T10:00:00', '2026-10-20T10:45:00', kind: EntryKind.planned, label: sleep);
    expect(
      await repo.latestActualEnd(from: at('2026-10-25T02:20:00'), to: at('2026-10-25T14:20:00')),
      at('2026-10-25T14:05:00'),
    );
    expect(await repo.latestActualEnd(from: at('2026-10-25T14:10:00'), to: at('2026-10-25T14:20:00')), isNull);
    expect(await repo.lastPlannedDuration(sleep), const Duration(minutes: 45));
    expect(await repo.lastPlannedDuration(work), const Duration(hours: 5));
    expect(await repo.labelUseSince(at('2026-10-24T00:00:00')), {work: 3});
  });
}
