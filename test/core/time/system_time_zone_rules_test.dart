// Runs under the CI time-zone matrix (plan §11.3): `TZ=<zone> flutter test`.
// Checks that the system-clock fallback agrees with the tz database for the
// process zone, so either source gives the same days and times.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/day_math.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/time_zone_rules.dart';
import 'package:planyar/src/core/time/tz_time_zone_rules.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  final zoneId = Platform.environment['TZ'];

  setUpAll(tzdata.initializeTimeZones);

  test('system rules match the tz database for TZ=$zoneId', () {
    final tzRules = TzTimeZoneRules(tz.getLocation(zoneId!));
    const system = SystemTimeZoneRules();
    final start = Instant.parse('2026-01-01T00:00:00Z');
    for (var hour = 0; hour < 366 * 24; hour++) {
      final t = start + Duration(hours: hour);
      expect(system.offsetAt(t), tzRules.offsetAt(t), reason: '$t');
    }

    final viaSystem = DayMath(system);
    final viaTz = DayMath(tzRules);
    var date = LocalDate(2026, 1, 1);
    while (date.year == 2026) {
      expect(viaSystem.dayBounds(date), viaTz.dayBounds(date), reason: '$date');
      date = date.addDays(1);
    }
  }, skip: zoneId == null || zoneId.isEmpty ? 'TZ not set (run under the CI time-zone matrix)' : false);
}
