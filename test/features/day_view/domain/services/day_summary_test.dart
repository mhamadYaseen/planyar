// Day header summary (VIEW-05, D-35, D-08). Baghdad; Sun 25 Oct 2026.
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/day_math.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/tz_time_zone_rules.dart';
import 'package:planyar/src/features/day_view/domain/services/day_summary.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../../helpers/entry_factory.dart';

Entry e(String id, String from, String? to, {EntryKind kind = EntryKind.actual}) =>
    makeEntry(id, kind: kind, start: '$from+03:00', end: to == null ? null : '$to+03:00');

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late DayMath math;
  setUp(() => math = DayMath(TzTimeZoneRules.named('Asia/Baghdad')));

  DaySummary summarize(LocalDate date, List<Entry> entries) =>
      DaySummary.of(day: math.dayBounds(date), entries: entries);

  test('tracked time counts overlapping actual time once (D-35)', () {
    final s = summarize(LocalDate(2026, 10, 25), [
      e('work', '2026-10-25T14:00:00', '2026-10-25T17:00:00'),
      e('call', '2026-10-25T15:00:00', '2026-10-25T16:00:00'),
      e('plan', '2026-10-25T09:00:00', '2026-10-25T12:00:00', kind: EntryKind.planned),
    ]);
    expect(s.tracked, const Duration(hours: 3));
    expect(s.planned, const Duration(hours: 3));
    expect(s.overlapCount, 1);
  });

  test('J4 AC3: overnight entries count only their part of the day', () {
    final sleep = e('sleep', '2026-10-23T23:10:00', '2026-10-24T06:50:00');
    expect(summarize(LocalDate(2026, 10, 24), [sleep]).tracked, const Duration(hours: 6, minutes: 50));
    expect(summarize(LocalDate(2026, 10, 23), [sleep]).tracked, const Duration(minutes: 50));
  });

  test('open entries are excluded from totals and counted (D-08)', () {
    final s = summarize(LocalDate(2026, 10, 25), [e('open', '2026-10-25T14:05:00', null)]);
    expect(s.tracked, Duration.zero);
    expect(s.openCount, 1);
    expect(s.isEmpty, isFalse);
    expect(summarize(LocalDate(2026, 10, 25), const []).isEmpty, isTrue);
  });
}
