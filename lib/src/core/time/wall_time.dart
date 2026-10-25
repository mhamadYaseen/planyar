/// A time of day with no date, e.g. `23:00` (plan §6.1).
///
/// Used for routine start/end, reminder times of day, quiet hours and the
/// check-in time. Stored as minutes since local midnight (0…1439).
final class WallTime implements Comparable<WallTime> {
  /// Throws [ArgumentError] unless 0 ≤ [hour] ≤ 23 and 0 ≤ [minute] ≤ 59.
  factory WallTime(int hour, int minute) {
    if (hour < 0 || hour > 23) throw ArgumentError.value(hour, 'hour', 'must be 0…23');
    if (minute < 0 || minute > 59) throw ArgumentError.value(minute, 'minute', 'must be 0…59');
    return WallTime._(hour * 60 + minute);
  }

  /// Throws [ArgumentError] unless 0 ≤ [minutes] < 1440.
  factory WallTime.fromMinutes(int minutes) {
    if (minutes < 0 || minutes >= minutesPerDay) {
      throw ArgumentError.value(minutes, 'minutes', 'must be 0…1439');
    }
    return WallTime._(minutes);
  }

  const WallTime._(this.minutes);

  /// Parses strict 24-hour `HH:mm`. Throws [FormatException] otherwise.
  factory WallTime.parse(String text) {
    final time = tryParse(text);
    if (time == null) throw FormatException('Not an HH:mm time', text);
    return time;
  }

  static WallTime? tryParse(String text) {
    final match = _pattern.firstMatch(text);
    if (match == null) return null;
    final hour = int.parse(match.group(1)!);
    final minute = int.parse(match.group(2)!);
    if (hour > 23 || minute > 59) return null;
    return WallTime._(hour * 60 + minute);
  }

  static final _pattern = RegExp(r'^(\d{2}):(\d{2})$');
  static const minutesPerDay = 1440;
  static const midnight = WallTime._(0);

  /// Minutes since local midnight, 0…1439.
  final int minutes;

  int get hour => minutes ~/ 60;
  int get minute => minutes % 60;

  bool operator <(WallTime other) => minutes < other.minutes;
  bool operator <=(WallTime other) => minutes <= other.minutes;
  bool operator >(WallTime other) => minutes > other.minutes;
  bool operator >=(WallTime other) => minutes >= other.minutes;

  @override
  int compareTo(WallTime other) => minutes.compareTo(other.minutes);

  @override
  bool operator ==(Object other) => other is WallTime && other.minutes == minutes;

  @override
  int get hashCode => minutes.hashCode;

  /// 24-hour `HH:mm` (for storage and debugging; the UI formats with `intl`).
  @override
  String toString() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}
