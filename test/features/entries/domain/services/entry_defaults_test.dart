// Smart defaults for quick add (ENT-02, ENT-10, ENT-11, J1 AC2).
// "Now" is Sun 25 Oct 2026 14:22 Baghdad (+03:00).
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/day_math.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/tz_time_zone_rules.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/services/entry_defaults.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

Instant at(String local) => Instant.parse('$local+03:00');

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late EntryDefaults defaults;
  final now = at('2026-10-25T14:22:40');
  final today = LocalDate(2026, 10, 25);

  setUp(() => defaults = EntryDefaults(DayMath(TzTimeZoneRules.named('Asia/Baghdad'))));

  test('J1: start at the end of today\'s latest actual entry, end now rounded down to 5 min', () {
    final d = defaults.forDate(date: today, now: now, latestActualEnd: at('2026-10-25T14:05:00'));
    expect(d.kind, EntryKind.actual);
    expect(d.start, at('2026-10-25T14:05:00'));
    expect(d.end, at('2026-10-25T14:20:00'));
  });

  test('nothing logged recently: start now (rounded), no end yet', () {
    final d = defaults.forDate(date: today, now: now);
    expect(d.kind, EntryKind.actual);
    expect(d.start, at('2026-10-25T14:20:00'));
    expect(d.end, isNull);
  });

  test('ignores an actual that ended more than 12 h ago or yesterday', () {
    expect(
      defaults.forDate(date: today, now: now, latestActualEnd: at('2026-10-25T02:00:00')).start,
      at('2026-10-25T14:20:00'),
    );
    final lateNight = defaults.forDate(
      date: LocalDate(2026, 10, 26),
      now: at('2026-10-26T01:00:00'),
      latestActualEnd: at('2026-10-25T23:30:00'),
    );
    expect(lateNight.start, at('2026-10-26T01:00:00'));
  });

  test('an entry that ended in the last 5 minutes leaves the end open', () {
    final d = defaults.forDate(date: today, now: now, latestActualEnd: at('2026-10-25T14:21:00'));
    expect(d.start, at('2026-10-25T14:21:00'));
    expect(d.end, at('2026-10-25T14:22:00'));
  });

  test('a past day: same time of day, actual, 1 hour', () {
    final d = defaults.forDate(date: LocalDate(2026, 10, 20), now: now);
    expect(d.kind, EntryKind.actual);
    expect(d.start, at('2026-10-20T14:20:00'));
    expect(d.end, at('2026-10-20T15:20:00'));
  });

  test('a future day: planned, the label\'s last duration or 1 hour (ENT-10)', () {
    final d = defaults.forDate(date: LocalDate(2026, 10, 27), now: now);
    expect(d.kind, EntryKind.planned);
    expect(d.start, at('2026-10-27T14:20:00'));
    expect(d.end, at('2026-10-27T15:20:00'));
    expect(defaults.plannedEnd(d.start, const Duration(minutes: 45)), at('2026-10-27T15:05:00'));
  });

  test('kind follows the start: actual if start ≤ now, planned if later (ENT-02)', () {
    expect(EntryDefaults.kindFor(at('2026-10-25T14:22:40'), now), EntryKind.actual);
    expect(EntryDefaults.kindFor(at('2026-10-25T14:23:00'), now), EntryKind.planned);
  });

  test('gap fill uses the gap bounds (ENT-11)', () {
    final past = defaults.forGap(InstantRange(at('2026-10-25T12:00:00'), at('2026-10-25T13:30:00')), now);
    expect((past.kind, past.start, past.end), (EntryKind.actual, at('2026-10-25T12:00:00'), at('2026-10-25T13:30:00')));
    final future = defaults.forGap(InstantRange(at('2026-10-25T18:00:00'), at('2026-10-25T19:00:00')), now);
    expect(future.kind, EntryKind.planned);
  });
}
