import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/time_zone_rules.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/core/time/tz_time_zone_rules.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(tzdata.initializeTimeZones);

  test('uses the tz database for a known device zone and sets tz.local', () async {
    final service = TimeZoneService(() async => 'Asia/Kathmandu');
    await service.refresh();
    expect(service.zoneId, 'Asia/Kathmandu');
    expect(service.dayMath.zone, isA<TzTimeZoneRules>());
    expect(tz.local.name, 'Asia/Kathmandu');
    expect(service.dayMath.dayBounds(LocalDate(2026, 10, 25)).start, Instant.parse('2026-10-24T18:15:00Z'));
  });

  test('falls back to the system zone for an unknown ID', () async {
    final service = TimeZoneService(() async => 'Mars/Olympus_Mons');
    await service.refresh();
    expect(service.zoneId, 'Mars/Olympus_Mons');
    expect(service.dayMath.zone, isA<SystemTimeZoneRules>());
  });

  test('refresh follows a zone change', () async {
    var zone = 'Asia/Baghdad';
    final service = TimeZoneService(() async => zone);
    await service.refresh();
    expect(service.dayMath.offsetAt(Instant.parse('2026-10-25T12:00:00Z')), const Duration(hours: 3));
    zone = 'Europe/Istanbul';
    await service.refresh();
    expect(service.zoneId, 'Europe/Istanbul');
    expect(tz.local.name, 'Europe/Istanbul');
  });
}
