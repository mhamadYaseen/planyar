import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';

void main() {
  group('Instant', () {
    test('now() comes from package:clock', () {
      final fixed = DateTime.utc(2026, 10, 25, 14, 30);
      withClock(Clock.fixed(fixed), () {
        expect(Instant.now(), Instant.fromDateTime(fixed));
      });
    });

    test('arithmetic and comparison', () {
      final a = Instant.fromDateTime(DateTime.utc(2026, 10, 25, 14));
      final b = a + const Duration(hours: 2);
      expect(b.toUtcDateTime(), DateTime.utc(2026, 10, 25, 16));
      expect(b - const Duration(hours: 2), a);
      expect(b.difference(a), const Duration(hours: 2));
      expect(a < b && b > a && a <= a && b >= b, isTrue);
      expect(a.isBefore(b) && b.isAfter(a), isTrue);
      expect(Instant.earliest(a, b), a);
      expect(Instant.latest(a, b), b);
    });

    test('minute alignment', () {
      final a = Instant.fromDateTime(DateTime.utc(2026, 10, 25, 14, 5, 30));
      expect(a.isMinuteAligned, isFalse);
      expect(a.floorToMinute().toUtcDateTime(), DateTime.utc(2026, 10, 25, 14, 5));
      expect(a.floorToMinute().isMinuteAligned, isTrue);
      final before1970 = Instant.fromUtcMs(-90 * 1000);
      expect(before1970.floorToMinute().utcMs, -120 * 1000);
    });

    test('ISO-8601 UTC text', () {
      final a = Instant.fromDateTime(DateTime.utc(2026, 10, 25, 14, 30));
      expect(a.toString(), '2026-10-25T14:30:00.000Z');
      expect(Instant.parse('2026-10-25T14:30:00.000Z'), a);
      expect(Instant.parse('2026-10-25T17:30:00+03:00'), a);
      expect(() => Instant.parse('2026-10-25T14:30'), throwsFormatException);
    });

    test('parsing is strict: a time and a zone, with real field values (backups are untrusted)', () {
      final a = Instant.fromDateTime(DateTime.utc(2026, 10, 25, 14, 30));
      expect(Instant.parse('2026-10-25T14:30Z'), a);
      expect(Instant.parse('2026-10-25T14:30:00.123456789Z').utcMs, a.utcMs + 123);
      expect(Instant.parse('2024-02-29T00:00:00Z').toString(), '2024-02-29T00:00:00.000Z');
      for (final bad in [
        '2026-10-25', // date only: "-25" looked like a zone and read in local time
        '2026-1025T14:30Z',
        '+2026-10-25T14:30Z',
        '2026-10-25 14:30Z',
        '2026-13-01T00:00Z',
        '2026-02-30T00:00Z',
        '2025-02-29T00:00Z',
        '2026-10-25T24:00Z',
        '2026-10-25T14:60Z',
        '2026-10-25T14:30:60Z',
        '2026-10-25T14:30+99:99',
        '2026-10-25T14:30+0300',
        '',
      ]) {
        expect(() => Instant.parse(bad), throwsFormatException, reason: bad);
      }
    });
  });

  group('InstantRange', () {
    final t0 = Instant.fromDateTime(DateTime.utc(2026, 10, 25, 10));
    Instant h(int hours) => t0 + Duration(hours: hours);

    test('rejects empty or reversed ranges', () {
      expect(() => InstantRange(h(1), h(1)), throwsArgumentError);
      expect(() => InstantRange(h(2), h(1)), throwsArgumentError);
    });

    test('half-open containment', () {
      final r = InstantRange(h(0), h(2));
      expect(r.contains(h(0)), isTrue);
      expect(r.contains(h(1)), isTrue);
      expect(r.contains(h(2)), isFalse);
      expect(r.duration, const Duration(hours: 2));
    });

    test('touching ranges do not overlap', () {
      final a = InstantRange(h(0), h(1));
      final b = InstantRange(h(1), h(2));
      expect(a.overlaps(b), isFalse);
      expect(a.intersection(b), isNull);
      expect(a.overlapDuration(b), Duration.zero);
    });

    test('intersection of overlapping and nested ranges', () {
      final a = InstantRange(h(0), h(3));
      final b = InstantRange(h(2), h(5));
      expect(a.intersection(b), InstantRange(h(2), h(3)));
      final inner = InstantRange(h(1), h(2));
      expect(a.intersection(inner), inner);
      expect(a.overlapDuration(b), const Duration(hours: 1));
    });
  });
}
