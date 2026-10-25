import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/wall_time.dart';

void main() {
  test('builds from hour and minute', () {
    final t = WallTime(23, 0);
    expect(t.minutes, 1380);
    expect(t.hour, 23);
    expect(t.minute, 0);
  });

  test('fromMinutes accepts 0…1439 only', () {
    expect(WallTime.fromMinutes(0), WallTime.midnight);
    expect(WallTime.fromMinutes(1439).toString(), '23:59');
    expect(() => WallTime.fromMinutes(-1), throwsArgumentError);
    expect(() => WallTime.fromMinutes(1440), throwsArgumentError);
    expect(() => WallTime(24, 0), throwsArgumentError);
    expect(() => WallTime(7, 60), throwsArgumentError);
  });

  test('formats and parses HH:mm', () {
    expect(WallTime(7, 5).toString(), '07:05');
    expect(WallTime.parse('23:00'), WallTime(23, 0));
    expect(WallTime.tryParse('7:00'), isNull);
    expect(WallTime.tryParse('24:00'), isNull);
    expect(WallTime.tryParse('12:60'), isNull);
    expect(() => WallTime.parse('noon'), throwsFormatException);
  });

  test('ordering and equality', () {
    expect(WallTime(7, 0) < WallTime(23, 0), isTrue);
    expect(WallTime(7, 0).compareTo(WallTime(7, 0)), 0);
    expect(WallTime(7, 0), WallTime.fromMinutes(420));
    expect(WallTime(7, 0).hashCode, WallTime.fromMinutes(420).hashCode);
  });
}
