// DayMath tests (plan §6.2–§6.4, §11.2, §11.3).
//
// Expected instants were computed independently with Python's `zoneinfo`
// (system tz database), not with the Dart `timezone` package under test.
// 2026 transitions used below:
//   America/New_York    gap 2026-03-08 02:00→03:00; repeat 2026-11-01 01:00–01:59
//   Europe/London       gap 2026-03-29 01:00→02:00; repeat 2026-10-25 01:00–01:59
//   America/Santiago    repeat 2026-04-04 23:00–23:59; gap 2026-09-06 00:00→01:00
//   Australia/Lord_Howe repeat 2026-04-05 01:30–01:59; gap 2026-10-04 02:00→02:30
//   Asia/Kathmandu      +05:45, no DST;  Asia/Baghdad +03:00, no DST

import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/day_math.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/time_zone_rules.dart';
import 'package:planyar/src/core/time/tz_time_zone_rules.dart';
import 'package:planyar/src/core/time/wall_time.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

Instant utc(String iso) => Instant.parse(iso);
LocalDate d(int y, int m, int day) => LocalDate(y, m, day);
const h = Duration(hours: 1);

void main() {
  setUpAll(tzdata.initializeTimeZones);

  DayMath zone(String id) => DayMath(TzTimeZoneRules.named(id));

  group('UTC baseline', () {
    final math = DayMath(const FixedOffsetTimeZoneRules(Duration.zero));

    test('day bounds are midnight to midnight', () {
      final b = math.dayBounds(d(2026, 10, 25));
      expect(b.start, utc('2026-10-25T00:00:00Z'));
      expect(b.end, utc('2026-10-26T00:00:00Z'));
      expect(math.dayLength(d(2026, 10, 25)), const Duration(hours: 24));
    });

    test('31 Dec → 1 Jan and 29 Feb', () {
      expect(math.dateOf(utc('2026-12-31T23:59:59.999Z')), d(2026, 12, 31));
      expect(math.dateOf(utc('2027-01-01T00:00:00Z')), d(2027, 1, 1));
      expect(math.dayBounds(d(2028, 2, 29)).end, utc('2028-03-01T00:00:00Z'));
    });
  });

  group('Asia/Baghdad (+03:00, owner zone)', () {
    late DayMath math;
    setUp(() => math = zone('Asia/Baghdad'));

    test('day bounds', () {
      final b = math.dayBounds(d(2026, 10, 25));
      expect(b.start, utc('2026-10-24T21:00:00Z'));
      expect(b.end, utc('2026-10-25T21:00:00Z'));
    });

    test('local(D, m) with next-day and previous-day minutes', () {
      expect(math.local(d(2026, 10, 25), 1380), utc('2026-10-25T20:00:00Z'));
      expect(math.local(d(2026, 10, 25), 1860), utc('2026-10-26T04:00:00Z'));
      expect(math.local(d(2026, 10, 25), 2880), utc('2026-10-26T21:00:00Z'));
      expect(math.local(d(2026, 10, 25), -60), utc('2026-10-24T20:00:00Z'));
      expect(math.local(d(2026, 10, 25), -720), utc('2026-10-24T09:00:00Z'));
      expect(math.at(d(2026, 10, 25), WallTime(14, 5)), utc('2026-10-25T11:05:00Z'));
    });

    test('dateOf / wallTimeOf at the day edges', () {
      expect(math.dateOf(utc('2026-10-24T21:00:00Z')), d(2026, 10, 25));
      expect(math.dateOf(utc('2026-10-24T20:59:59.999Z')), d(2026, 10, 24));
      expect(math.wallTimeOf(utc('2026-10-25T11:05:59Z')), WallTime(14, 5));
      expect(math.offsetAt(utc('2026-10-25T11:05:00Z')), const Duration(hours: 3));
    });

    test('today() uses package:clock', () {
      withClock(Clock.fixed(DateTime.utc(2026, 10, 24, 21, 30)), () {
        expect(math.today(), d(2026, 10, 25));
      });
      withClock(Clock.fixed(DateTime.utc(2026, 10, 24, 20, 59)), () {
        expect(math.today(), d(2026, 10, 24));
      });
    });
  });

  group('America/New_York (DST at 02:00)', () {
    late DayMath math;
    setUp(() => math = zone('America/New_York'));

    test('spring-forward day is 23 hours', () {
      final b = math.dayBounds(d(2026, 3, 8));
      expect(b.start, utc('2026-03-08T05:00:00Z'));
      expect(b.end, utc('2026-03-09T04:00:00Z'));
      expect(math.dayLength(d(2026, 3, 8)), const Duration(hours: 23));
    });

    test('fall-back day is 25 hours', () {
      final b = math.dayBounds(d(2026, 11, 1));
      expect(b.start, utc('2026-11-01T04:00:00Z'));
      expect(b.end, utc('2026-11-02T05:00:00Z'));
      expect(math.dayLength(d(2026, 11, 1)), const Duration(hours: 25));
    });

    test('times in the gap move forward to the first valid minute (03:00)', () {
      final transition = utc('2026-03-08T07:00:00Z');
      expect(math.local(d(2026, 3, 8), 120), transition); // 02:00
      expect(math.local(d(2026, 3, 8), 150), transition); // 02:30
      expect(math.local(d(2026, 3, 8), 179), transition); // 02:59
      expect(math.local(d(2026, 3, 8), 180), transition); // 03:00
      expect(math.local(d(2026, 3, 8), 119), utc('2026-03-08T06:59:00Z'));
      expect(math.wallTimeOf(transition), WallTime(3, 0));
    });

    test('repeated hour resolves to the first occurrence', () {
      expect(math.local(d(2026, 11, 1), 90), utc('2026-11-01T05:30:00Z'));
      expect(math.local(d(2026, 11, 1), 120), utc('2026-11-01T07:00:00Z'));
    });

    test('isRepeatedWallTime marks only the second occurrence', () {
      expect(math.isRepeatedWallTime(utc('2026-11-01T04:30:00Z')), isFalse);
      expect(math.isRepeatedWallTime(utc('2026-11-01T05:30:00Z')), isFalse);
      expect(math.isRepeatedWallTime(utc('2026-11-01T06:30:00Z')), isTrue);
      expect(math.wallTimeOf(utc('2026-11-01T06:30:00Z')), WallTime(1, 30));
      expect(math.isRepeatedWallTime(utc('2026-11-01T07:00:00Z')), isFalse);
    });

    test('Sleep 23:00 → 07:00 lasts 9 h on fall-back night, 7 h on spring-forward', () {
      Duration sleep(LocalDate date) =>
          math.local(date, 1860).difference(math.local(date, 1380));
      expect(sleep(d(2026, 10, 31)), const Duration(hours: 9));
      expect(sleep(d(2026, 3, 7)), const Duration(hours: 7));
      expect(sleep(d(2026, 6, 1)), const Duration(hours: 8));
    });
  });

  group('Europe/London (DST at 01:00, offset 0/+1)', () {
    late DayMath math;
    setUp(() => math = zone('Europe/London'));

    test('spring-forward', () {
      expect(math.dayLength(d(2026, 3, 29)), const Duration(hours: 23));
      expect(math.local(d(2026, 3, 29), 90), utc('2026-03-29T01:00:00Z'));
    });

    test('fall-back', () {
      final b = math.dayBounds(d(2026, 10, 25));
      expect(b.start, utc('2026-10-24T23:00:00Z'));
      expect(b.end, utc('2026-10-26T00:00:00Z'));
      expect(math.local(d(2026, 10, 25), 90), utc('2026-10-25T00:30:00Z'));
      expect(math.isRepeatedWallTime(utc('2026-10-25T01:30:00Z')), isTrue);
    });
  });

  group('America/Santiago (DST at midnight)', () {
    late DayMath math;
    setUp(() => math = zone('America/Santiago'));

    test('a day whose midnight does not exist starts at 01:00', () {
      final b = math.dayBounds(d(2026, 9, 6));
      expect(b.start, utc('2026-09-06T04:00:00Z'));
      expect(math.wallTimeOf(b.start), WallTime(1, 0));
      expect(b.end, utc('2026-09-07T03:00:00Z'));
      expect(math.dayLength(d(2026, 9, 6)), const Duration(hours: 23));
    });

    test('the day before keeps 24 hours', () {
      final b = math.dayBounds(d(2026, 9, 5));
      expect(b.start, utc('2026-09-05T04:00:00Z'));
      expect(b.end, utc('2026-09-06T04:00:00Z'));
      expect(math.dateOf(utc('2026-09-06T03:59:59.999Z')), d(2026, 9, 5));
      expect(math.dateOf(utc('2026-09-06T04:00:00Z')), d(2026, 9, 6));
    });

    test('repeated 23:00 hour at the end of 4 Apr', () {
      expect(math.dayLength(d(2026, 4, 4)), const Duration(hours: 25));
      expect(math.local(d(2026, 4, 4), 1410), utc('2026-04-05T02:30:00Z'));
      expect(math.isRepeatedWallTime(utc('2026-04-05T03:30:00Z')), isTrue);
    });
  });

  group('Australia/Lord_Howe (30-minute DST)', () {
    late DayMath math;
    setUp(() => math = zone('Australia/Lord_Howe'));

    test('23.5-hour day with a 30-minute gap', () {
      final b = math.dayBounds(d(2026, 10, 4));
      expect(b.start, utc('2026-10-03T13:30:00Z'));
      expect(b.end, utc('2026-10-04T13:00:00Z'));
      expect(math.dayLength(d(2026, 10, 4)), const Duration(hours: 23, minutes: 30));
      expect(math.local(d(2026, 10, 4), 135), utc('2026-10-03T15:30:00Z'));
    });

    test('24.5-hour day with a repeated half hour', () {
      expect(math.dayLength(d(2026, 4, 5)), const Duration(hours: 24, minutes: 30));
      expect(math.local(d(2026, 4, 5), 105), utc('2026-04-04T14:45:00Z'));
    });
  });

  group('Asia/Kathmandu (+05:45)', () {
    test('quarter-hour offset', () {
      final math = zone('Asia/Kathmandu');
      expect(math.dayBounds(d(2026, 10, 25)).start, utc('2026-10-24T18:15:00Z'));
      expect(math.wallTimeOf(utc('2026-10-25T00:00:00Z')), WallTime(5, 45));
      expect(math.dayLength(d(2026, 10, 25)), const Duration(hours: 24));
    });
  });

  group('splitByDay (§6.2, §6.3)', () {
    late DayMath math;
    setUp(() => math = zone('Asia/Baghdad'));

    InstantRange local(LocalDate date, int startMin, LocalDate endDate, int endMin) =>
        InstantRange(math.local(date, startMin), math.local(endDate, endMin));

    test('entry within one day → one slice, no continuation', () {
      final slices = math.splitByDay(local(d(2026, 10, 25), 840, d(2026, 10, 25), 960));
      expect(slices, hasLength(1));
      expect(slices.single.date, d(2026, 10, 25));
      expect(slices.single.part.duration, h * 2);
      expect(slices.single.continuesFromPreviousDay, isFalse);
      expect(slices.single.continuesToNextDay, isFalse);
    });

    test('overnight entry → two slices with markers', () {
      final slices = math.splitByDay(local(d(2026, 10, 24), 1380, d(2026, 10, 25), 420));
      expect(slices.map((s) => s.date), [d(2026, 10, 24), d(2026, 10, 25)]);
      expect(slices[0].part.duration, h * 1);
      expect(slices[0].continuesToNextDay, isTrue);
      expect(slices[0].continuesFromPreviousDay, isFalse);
      expect(slices[1].part.duration, h * 7);
      expect(slices[1].continuesFromPreviousDay, isTrue);
      expect(slices[1].continuesToNextDay, isFalse);
    });

    test('two midnights → middle day is a full day with both markers', () {
      final slices = math.splitByDay(local(d(2026, 10, 23), 1320, d(2026, 10, 25), 120));
      expect(slices, hasLength(3));
      expect(slices[1].part, slices[1].day);
      expect(slices[1].continuesFromPreviousDay && slices[1].continuesToNextDay, isTrue);
      final total = slices.fold(Duration.zero, (sum, s) => sum + s.part.duration);
      expect(total, const Duration(hours: 28));
    });

    test('seven-day entry → eight slices', () {
      final slices = math.splitByDay(local(d(2026, 10, 18), 30, d(2026, 10, 25), 30));
      expect(slices, hasLength(8));
      expect(slices.first.date, d(2026, 10, 18));
      expect(slices.last.date, d(2026, 10, 25));
    });

    test('ending exactly at midnight belongs only to the earlier day', () {
      final slices = math.splitByDay(local(d(2026, 10, 25), 1320, d(2026, 10, 26), 0));
      expect(slices.map((s) => s.date), [d(2026, 10, 25)]);
      expect(slices.single.continuesToNextDay, isFalse);
    });

    test('starting exactly at midnight belongs to that day', () {
      final slices = math.splitByDay(local(d(2026, 10, 26), 0, d(2026, 10, 26), 60));
      expect(slices.map((s) => s.date), [d(2026, 10, 26)]);
      expect(slices.single.continuesFromPreviousDay, isFalse);
    });

    test('durations come from instants on DST days', () {
      final ny = zone('America/New_York');
      final wholeDay = ny.dayBounds(d(2026, 3, 8));
      final slices = ny.splitByDay(wholeDay);
      expect(slices.single.part.duration, const Duration(hours: 23));
      final nightIn = InstantRange(ny.local(d(2026, 10, 31), 1380), ny.local(d(2026, 10, 31), 1860));
      final parts = ny.splitByDay(nightIn);
      expect(parts.map((s) => s.part.duration), [h * 1, h * 8]);
    });
  });

  group('rangeBounds', () {
    test('custom range 1–7 Oct means [1 Oct 00:00, 8 Oct 00:00)', () {
      final math = zone('Asia/Baghdad');
      final r = math.rangeBounds(d(2026, 10, 1), d(2026, 10, 7));
      expect(r.start, utc('2026-09-30T21:00:00Z'));
      expect(r.end, utc('2026-10-07T21:00:00Z'));
      expect(() => math.rangeBounds(d(2026, 10, 7), d(2026, 10, 1)), throwsArgumentError);
    });
  });

  group('invariants for every day of 2026 in seven zones', () {
    const zones = [
      'UTC',
      'Asia/Baghdad',
      'America/New_York',
      'Europe/London',
      'America/Santiago',
      'Australia/Lord_Howe',
      'Asia/Kathmandu',
    ];

    for (final id in zones) {
      test(id, () {
        final math = zone(id);
        var date = d(2026, 1, 1);
        while (date.year == 2026) {
          final b = math.dayBounds(date);
          expect(math.dateOf(b.start), date, reason: '$id $date start');
          expect(math.dateOf(b.end - const Duration(milliseconds: 1)), date, reason: '$id $date end');
          expect(b.duration.inMinutes, inInclusiveRange(22 * 60, 26 * 60), reason: '$id $date length');
          for (var m = 0; m < 1440; m += 30) {
            final t = math.local(date, m);
            expect(math.dateOf(t), date, reason: '$id $date $m');
            final back = math.wallTimeOf(t).minutes;
            // Equal, unless m fell in a DST gap (then it moved forward).
            expect(back >= m, isTrue, reason: '$id $date $m → $back');
            if (back != m) {
              expect(math.offsetAt(t) > math.offsetAt(t - const Duration(minutes: 1)), isTrue,
                  reason: '$id $date $m moved without a gap');
            }
          }
          date = date.addDays(1);
        }
      });
    }
  });
}
