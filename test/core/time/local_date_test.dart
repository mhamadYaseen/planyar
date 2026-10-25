import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/local_date.dart';

void main() {
  group('LocalDate construction', () {
    test('valid dates keep their parts', () {
      final d = LocalDate(2026, 10, 25);
      expect(d.year, 2026);
      expect(d.month, 10);
      expect(d.day, 25);
    });

    test('rejects impossible dates', () {
      expect(() => LocalDate(2026, 2, 29), throwsArgumentError);
      expect(() => LocalDate(2026, 13, 1), throwsArgumentError);
      expect(() => LocalDate(2026, 4, 31), throwsArgumentError);
      expect(() => LocalDate(2026, 1, 0), throwsArgumentError);
      expect(() => LocalDate(0, 1, 1), throwsArgumentError);
      expect(() => LocalDate(10000, 1, 1), throwsArgumentError);
    });

    test('accepts leap days', () {
      expect(LocalDate(2028, 2, 29).day, 29);
      expect(LocalDate(2000, 2, 29).day, 29);
      expect(() => LocalDate(2100, 2, 29), throwsArgumentError);
    });

    test('epoch day round trip', () {
      expect(LocalDate(1970, 1, 1).epochDay, 0);
      expect(LocalDate(1969, 12, 31).epochDay, -1);
      expect(LocalDate(2026, 10, 25).epochDay, 20751);
      for (var e = -1000; e < 30000; e += 37) {
        expect(LocalDate.fromEpochDay(e).epochDay, e);
      }
    });
  });

  group('ISO text', () {
    test('formats with zero padding', () {
      expect(LocalDate(2026, 1, 5).toIso(), '2026-01-05');
      expect(LocalDate(987, 3, 9).toIso(), '0987-03-09');
      expect(LocalDate(2026, 10, 25).toString(), '2026-10-25');
    });

    test('parses strict YYYY-MM-DD', () {
      expect(LocalDate.parse('2026-10-25'), LocalDate(2026, 10, 25));
      expect(LocalDate.tryParse('2026-02-30'), isNull);
      expect(LocalDate.tryParse('2026-1-05'), isNull);
      expect(LocalDate.tryParse('2026-10-25T00:00'), isNull);
      expect(LocalDate.tryParse(' 2026-10-25'), isNull);
      expect(LocalDate.tryParse(''), isNull);
      expect(() => LocalDate.parse('nope'), throwsFormatException);
    });
  });

  group('arithmetic', () {
    test('addDays crosses months and years', () {
      expect(LocalDate(2026, 12, 31).addDays(1), LocalDate(2027, 1, 1));
      expect(LocalDate(2028, 3, 1).addDays(-1), LocalDate(2028, 2, 29));
      expect(LocalDate(2026, 10, 25).addDays(0), LocalDate(2026, 10, 25));
    });

    test('addMonths clamps to the last day of the month', () {
      expect(LocalDate(2026, 1, 31).addMonths(1), LocalDate(2026, 2, 28));
      expect(LocalDate(2028, 1, 31).addMonths(1), LocalDate(2028, 2, 29));
      expect(LocalDate(2026, 1, 31).addMonths(2), LocalDate(2026, 3, 31));
      expect(LocalDate(2026, 3, 31).addMonths(-1), LocalDate(2026, 2, 28));
      expect(LocalDate(2026, 11, 15).addMonths(3), LocalDate(2027, 2, 15));
      expect(LocalDate(2026, 2, 15).addMonths(-14), LocalDate(2024, 12, 15));
    });

    test('addYears clamps 29 Feb', () {
      expect(LocalDate(2028, 2, 29).addYears(1), LocalDate(2029, 2, 28));
      expect(LocalDate(2028, 2, 29).addYears(4), LocalDate(2032, 2, 29));
    });

    test('daysUntil', () {
      expect(LocalDate(2026, 10, 1).daysUntil(LocalDate(2026, 10, 25)), 24);
      expect(LocalDate(2026, 10, 25).daysUntil(LocalDate(2026, 10, 1)), -24);
    });

    test('daysInMonth and leap years', () {
      expect(LocalDate.daysInMonth(2026, 2), 28);
      expect(LocalDate.daysInMonth(2028, 2), 29);
      expect(LocalDate.daysInMonth(2026, 4), 30);
      expect(LocalDate.daysInMonth(2026, 12), 31);
      expect(LocalDate.isLeapYear(1900), isFalse);
      expect(LocalDate.isLeapYear(2000), isTrue);
    });
  });

  group('weekdays and weeks', () {
    test('weekday uses DateTime numbering (Mon = 1 … Sun = 7)', () {
      expect(LocalDate(2026, 10, 25).weekday, DateTime.sunday);
      expect(LocalDate(2026, 10, 23).weekday, DateTime.friday);
      expect(LocalDate(1970, 1, 1).weekday, DateTime.thursday);
      expect(LocalDate(1969, 12, 29).weekday, DateTime.monday);
    });

    test('weekday matches DateTime for many dates', () {
      for (var e = -800; e < 25000; e += 13) {
        final d = LocalDate.fromEpochDay(e);
        expect(d.weekday, DateTime.utc(d.year, d.month, d.day).weekday);
      }
    });

    test('startOfWeek for every first-day setting', () {
      final sunday = LocalDate(2026, 10, 25);
      expect(sunday.startOfWeek(DateTime.friday), LocalDate(2026, 10, 23));
      expect(sunday.startOfWeek(DateTime.saturday), LocalDate(2026, 10, 24));
      expect(sunday.startOfWeek(DateTime.sunday), LocalDate(2026, 10, 25));
      expect(sunday.startOfWeek(DateTime.monday), LocalDate(2026, 10, 19));
      final friday = LocalDate(2026, 10, 23);
      expect(friday.startOfWeek(DateTime.friday), friday);
      expect(friday.startOfWeek(DateTime.saturday), LocalDate(2026, 10, 17));
      expect(() => sunday.startOfWeek(0), throwsArgumentError);
      expect(() => sunday.startOfWeek(8), throwsArgumentError);
    });
  });

  group('comparison', () {
    test('ordering and equality', () {
      final a = LocalDate(2026, 10, 24);
      final b = LocalDate(2026, 10, 25);
      expect(a < b, isTrue);
      expect(a <= b, isTrue);
      expect(b > a, isTrue);
      expect(b >= b, isTrue);
      expect(a.compareTo(b), lessThan(0));
      expect(LocalDate(2026, 10, 25), b);
      expect(LocalDate(2026, 10, 25).hashCode, b.hashCode);
      expect(a.isBefore(b), isTrue);
      expect(b.isAfter(a), isTrue);
    });
  });
}
