import 'package:timezone/timezone.dart' as tz;

import 'instant.dart';
import 'time_zone_rules.dart';

/// [TimeZoneRules] backed by the `timezone` package's tz database — the same
/// data the notification scheduler uses. Call
/// `initializeTimeZones()` from `package:timezone/data/latest_all.dart` first.
final class TzTimeZoneRules implements TimeZoneRules {
  TzTimeZoneRules(this.location);

  /// Throws `LocationNotFoundException` if [id] isn't in the database.
  factory TzTimeZoneRules.named(String id) => TzTimeZoneRules(tz.getLocation(id));

  final tz.Location location;

  @override
  String get id => location.name;

  @override
  Duration offsetAt(Instant instant) => location.timeZone(instant.utcMs).offset;
}
