import 'instant.dart';

/// The UTC offset rules of one time zone. [DayMath] works through this
/// interface, so the same code runs on the tz database in production and on
/// any zone in tests.
abstract interface class TimeZoneRules {
  /// IANA identifier when known (e.g. `Asia/Baghdad`), otherwise a label.
  String get id;

  /// The UTC offset in effect at [instant] (local = UTC + offset).
  Duration offsetAt(Instant instant);
}

/// The process time zone as seen by `DateTime` (follows the `TZ` variable on
/// macOS/Linux). Used as a fallback when the device's IANA zone isn't in the
/// tz database, and cross-checked against it in the CI time-zone matrix.
final class SystemTimeZoneRules implements TimeZoneRules {
  const SystemTimeZoneRules();

  @override
  String get id => 'system';

  @override
  Duration offsetAt(Instant instant) => DateTime.fromMillisecondsSinceEpoch(instant.utcMs).timeZoneOffset;
}

/// A zone with one constant offset and no DST (tests, UTC).
final class FixedOffsetTimeZoneRules implements TimeZoneRules {
  const FixedOffsetTimeZoneRules(this.offset, {this.id = 'fixed'});

  final Duration offset;

  @override
  final String id;

  @override
  Duration offsetAt(Instant instant) => offset;
}
