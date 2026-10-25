import 'package:timezone/timezone.dart' as tz;

import 'day_math.dart';
import 'time_zone_rules.dart';
import 'tz_time_zone_rules.dart';

/// Reads the device's IANA zone and provides the matching [DayMath]
/// (plan §6.5, §8.4.3). The plugin call is injected, so this class stays
/// pure Dart and testable.
///
/// Phase 3 adds change detection (compare with `lastKnownTimeZone` on start
/// and resume, re-anchor routines, resync notifications).
final class TimeZoneService {
  TimeZoneService(this._readDeviceZoneId);

  final Future<String> Function() _readDeviceZoneId;

  String _zoneId = 'UTC';
  DayMath _dayMath = const DayMath(SystemTimeZoneRules());

  /// The device's IANA zone ID as last read.
  String get zoneId => _zoneId;

  /// Local-time math for the current zone.
  DayMath get dayMath => _dayMath;

  /// Re-reads the device zone and updates [dayMath] and the `timezone`
  /// package's local location (used for scheduling notifications). Requires
  /// `initializeTimeZones()` first. Unknown IDs fall back to the system clock.
  Future<void> refresh() async {
    final id = await _readDeviceZoneId();
    _zoneId = id;
    try {
      final location = tz.getLocation(id);
      tz.setLocalLocation(location);
      _dayMath = DayMath(TzTimeZoneRules(location));
    } on tz.LocationNotFoundException {
      _dayMath = const DayMath(SystemTimeZoneRules());
    }
  }
}
