// TimelineLayout (plan §6.2, §6.3, §6.6, §6.9, §8.7; J4, J5). Baghdad (+03:00)
// unless stated. Fri 23 Oct … Sun 25 Oct 2026; "now" is Sun 14:20.
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/day_math.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/tz_time_zone_rules.dart';
import 'package:planyar/src/core/time/wall_time.dart';
import 'package:planyar/src/features/day_view/domain/entities/day_layout.dart';
import 'package:planyar/src/features/day_view/domain/services/timeline_layout.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../../helpers/entry_factory.dart';

final now = Instant.parse('2026-10-25T14:20:00+03:00');
final sunday = LocalDate(2026, 10, 25);
Entry e(String id, String from, String? to, {EntryKind kind = EntryKind.actual}) =>
    makeEntry(id, kind: kind, start: '$from+03:00', end: to == null ? null : '$to+03:00');
String sun(String hhmm) => '2026-10-25T$hhmm:00';

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late TimelineLayout layout;
  setUp(() => layout = TimelineLayout(DayMath(TzTimeZoneRules.named('Asia/Baghdad'))));

  DayLayout build(List<Entry> entries, {LocalDate? date, LaneMode mode = LaneMode.split}) =>
      layout.build(date: date ?? sunday, entries: entries, now: now, laneMode: mode);
  TimelineSegment seg(DayLayout day, String id) => day.segments.singleWhere((s) => s.entry.id == id);

  test('a normal day: 24 hour marks, now line, nothing else', () {
    final day = build(const []);
    expect(day.totalMinutes, 1440);
    expect(day.hours.map((h) => h.minute).take(3), [0, 60, 120]);
    expect(day.hours, hasLength(24));
    expect(day.nowMinute, 14 * 60 + 20);
    expect(build(const [], date: LocalDate(2026, 10, 24)).nowMinute, isNull);
  });

  test('J4: overnight entry is clipped with continuation markers on both days', () {
    final sleep = e('sleep', '2026-10-23T23:10:00', '2026-10-24T06:50:00');
    final friday = seg(build([sleep], date: LocalDate(2026, 10, 23)), 'sleep');
    expect((friday.startMinute, friday.endMinute), (23 * 60 + 10, 1440));
    expect(friday.continuesToNextDay, isTrue);
    expect(friday.continuesFromPreviousDay, isFalse);
    final saturday = seg(build([sleep], date: LocalDate(2026, 10, 24)), 'sleep');
    expect((saturday.startMinute, saturday.endMinute), (0, 6 * 60 + 50));
    expect(saturday.continuesFromPreviousDay, isTrue);
    expect(saturday.continuesToNextDay, isFalse);
  });

  test('J4 AC4: ending exactly at midnight does not appear on the next day', () {
    final late = e('late', '2026-10-24T22:00:00', '2026-10-25T00:00:00');
    expect(build([late]).segments, isEmpty);
    expect(seg(build([late], date: LocalDate(2026, 10, 24)), 'late').continuesToNextDay, isFalse);
  });

  test('J5: overlapping actual entries sit side by side with a warning', () {
    final day = build([
      e('work', sun('14:00'), sun('17:00')),
      e('call', sun('15:00'), sun('16:00')),
      e('gym', sun('18:00'), sun('19:00')),
    ]);
    final work = seg(day, 'work');
    final call = seg(day, 'call');
    final gym = seg(day, 'gym');
    expect((work.column, work.columnCount, work.hasOverlap), (0, 2, true));
    expect((call.column, call.columnCount, call.hasOverlap), (1, 2, true));
    expect((gym.column, gym.columnCount, gym.hasOverlap), (0, 1, false));
    expect(work.lane, TimelineLane.actual);
  });

  test('split lanes keep plan and actual apart; combined shares columns without warnings (VIEW-03)', () {
    final entries = [
      e('plan', sun('14:00'), sun('17:00'), kind: EntryKind.planned),
      e('act', sun('15:00'), sun('16:00')),
    ];
    final split = build(entries);
    expect(seg(split, 'plan').lane, TimelineLane.plan);
    expect((seg(split, 'plan').columnCount, seg(split, 'act').columnCount), (1, 1));
    final combined = build(entries, mode: LaneMode.combined);
    expect(seg(combined, 'plan').lane, TimelineLane.combined);
    expect((seg(combined, 'plan').column, seg(combined, 'act').column, seg(combined, 'act').columnCount), (0, 1, 2));
    expect(combined.segments.any((s) => s.hasOverlap), isFalse);
  });

  test('three-way overlap uses three columns; a later block reuses a free column', () {
    final day = build([
      e('a', sun('09:00'), sun('12:00')),
      e('b', sun('10:00'), sun('11:00')),
      e('c', sun('10:30'), sun('11:30')),
      e('d', sun('11:00'), sun('12:00')),
    ]);
    expect(['a', 'b', 'c', 'd'].map((id) => seg(day, id).column), [0, 1, 2, 1]);
    expect(day.segments.map((s) => s.columnCount).toSet(), {3});
  });

  test('columns are stable for the same input in any order', () {
    final entries = [
      e('x', sun('09:00'), sun('10:00')),
      e('y', sun('09:00'), sun('10:00')),
      e('z', sun('09:30'), sun('11:00')),
    ];
    List<(String, int)> cols(List<Entry> list) => [for (final s in build(list).segments) (s.entry.id, s.column)];
    expect(cols(entries.reversed.toList()), cols(entries));
  });

  test('open entry today runs to now; on another day it gets a 1 h tail (§6.9)', () {
    final today = seg(build([e('study', sun('14:05'), null)]), 'study');
    expect((today.startMinute, today.endMinute, today.isOpen), (14 * 60 + 5, 14 * 60 + 20, true));
    final yesterday = seg(build([e('old', '2026-10-24T22:30:00', null)], date: LocalDate(2026, 10, 24)), 'old');
    expect((yesterday.startMinute, yesterday.endMinute), (22 * 60 + 30, 23 * 60 + 30));
    final nearMidnight = seg(build([e('late', '2026-10-24T23:30:00', null)], date: LocalDate(2026, 10, 24)), 'late');
    expect(nearMidnight.endMinute, 1440);
  });

  test('open entries take part in columns but never in warnings', () {
    final day = build([e('open', sun('14:05'), null), e('work', sun('14:00'), sun('17:00'))]);
    expect(seg(day, 'open').columnCount, 2);
    expect(day.segments.any((s) => s.hasOverlap), isFalse);
  });

  test('DST days: 25 h with a repeated 01:00, 23 h without 02:00 (§6.4)', () {
    final ny = TimelineLayout(DayMath(TzTimeZoneRules.named('America/New_York')));
    final fallBack = ny.build(date: LocalDate(2026, 11, 1), entries: const [], now: now, laneMode: LaneMode.split);
    expect(fallBack.totalMinutes, 1500);
    expect(fallBack.hours, hasLength(25));
    final repeated = fallBack.hours.where((h) => h.wallTime == WallTime(1, 0)).toList();
    expect(repeated.map((h) => (h.minute, h.isRepeated)), [(60, false), (120, true)]);
    final springForward = ny.build(date: LocalDate(2026, 3, 8), entries: const [], now: now, laneMode: LaneMode.split);
    expect(springForward.totalMinutes, 1380);
    expect(springForward.hours.map((h) => h.wallTime.hour), isNot(contains(2)));
    expect(springForward.hours, hasLength(23));
  });

  test('half-hour DST (Lord Howe) still labels whole hours', () {
    final lh = TimelineLayout(DayMath(TzTimeZoneRules.named('Australia/Lord_Howe')));
    final day = lh.build(date: LocalDate(2026, 10, 4), entries: const [], now: now, laneMode: LaneMode.split);
    expect(day.totalMinutes, 1410);
    expect(day.hours.every((h) => h.wallTime.minute == 0), isTrue);
    expect(day.hours.map((h) => h.wallTime.hour).toList(), [0, 1, for (var h = 3; h < 24; h++) h]);
  });
}
