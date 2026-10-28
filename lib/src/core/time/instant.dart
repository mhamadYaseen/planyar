import 'package:clock/clock.dart';

import 'local_date.dart';

/// An exact moment, stored as UTC milliseconds since the Unix epoch
/// (plan §6.1). Entry start/end, `completedAt`, `createdAt/updatedAt` and
/// custom reminder times are instants.
final class Instant implements Comparable<Instant> {
  const Instant.fromUtcMs(this.utcMs);

  Instant.fromDateTime(DateTime dateTime) : utcMs = dateTime.millisecondsSinceEpoch;

  /// The current moment from `package:clock`, so tests can fix "now".
  factory Instant.now() => Instant.fromDateTime(clock.now());

  /// Parses ISO-8601 text with a time and a zone: `2026-10-25T14:30Z`,
  /// `…T14:30:05.123+03:00`. Throws [FormatException] for anything else —
  /// text without a zone would be read in the device's zone, and
  /// `DateTime.parse` would roll impossible values (month 13, 25:61) over
  /// instead of failing. Backups are untrusted input, so this is strict.
  factory Instant.parse(String text) {
    final m = _iso.firstMatch(text);
    if (m == null) throw FormatException('Not an ISO-8601 time with a zone', text);
    int part(int group) => int.parse(m.group(group)!);
    final (year, month, day, hour, minute) = (part(1), part(2), part(3), part(4), part(5));
    final second = m.group(6) == null ? 0 : part(6);
    final zone = m.group(8)!;
    final validDate = month >= 1 && month <= 12 && day >= 1 && day <= LocalDate.daysInMonth(year, month);
    final validTime = hour <= 23 && minute <= 59 && second <= 59;
    final validZone = zone == 'Z' || (int.parse(zone.substring(1, 3)) <= 18 && int.parse(zone.substring(4)) <= 59);
    if (!validDate || !validTime || !validZone) throw FormatException('Not a valid time', text);
    return Instant.fromDateTime(DateTime.parse(text));
  }

  static final _iso = RegExp(r'^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})(?::(\d{2})(\.\d{1,9})?)?(Z|[+-]\d{2}:\d{2})$');
  static const _msPerMinute = Duration.millisecondsPerMinute;

  final int utcMs;

  DateTime toUtcDateTime() => DateTime.fromMillisecondsSinceEpoch(utcMs, isUtc: true);

  bool get isMinuteAligned => utcMs % _msPerMinute == 0;

  /// This instant with seconds and milliseconds dropped.
  Instant floorToMinute() => Instant.fromUtcMs(utcMs - utcMs % _msPerMinute);

  Instant operator +(Duration duration) => Instant.fromUtcMs(utcMs + duration.inMilliseconds);
  Instant operator -(Duration duration) => Instant.fromUtcMs(utcMs - duration.inMilliseconds);

  /// `this − other`.
  Duration difference(Instant other) => Duration(milliseconds: utcMs - other.utcMs);

  bool isBefore(Instant other) => utcMs < other.utcMs;
  bool isAfter(Instant other) => utcMs > other.utcMs;
  bool operator <(Instant other) => utcMs < other.utcMs;
  bool operator <=(Instant other) => utcMs <= other.utcMs;
  bool operator >(Instant other) => utcMs > other.utcMs;
  bool operator >=(Instant other) => utcMs >= other.utcMs;

  static Instant earliest(Instant a, Instant b) => a.utcMs <= b.utcMs ? a : b;
  static Instant latest(Instant a, Instant b) => a.utcMs >= b.utcMs ? a : b;

  @override
  int compareTo(Instant other) => utcMs.compareTo(other.utcMs);

  @override
  bool operator ==(Object other) => other is Instant && other.utcMs == utcMs;

  @override
  int get hashCode => utcMs.hashCode;

  /// ISO-8601 UTC, e.g. `2026-10-25T14:30:00.000Z`.
  @override
  String toString() => toUtcDateTime().toIso8601String();
}

/// A half-open, non-empty interval `[start, end)` of instants.
final class InstantRange {
  /// Throws [ArgumentError] unless [end] is after [start].
  InstantRange(this.start, this.end) {
    if (!end.isAfter(start)) {
      throw ArgumentError('end ($end) must be after start ($start)');
    }
  }

  final Instant start;
  final Instant end;

  Duration get duration => end.difference(start);

  bool contains(Instant instant) => instant >= start && instant < end;

  /// True when the ranges share positive time. Touching ranges don't overlap.
  bool overlaps(InstantRange other) => start < other.end && other.start < end;

  /// The shared part, or null if the ranges don't overlap.
  InstantRange? intersection(InstantRange other) {
    if (!overlaps(other)) return null;
    return InstantRange(Instant.latest(start, other.start), Instant.earliest(end, other.end));
  }

  Duration overlapDuration(InstantRange other) => intersection(other)?.duration ?? Duration.zero;

  @override
  bool operator ==(Object other) => other is InstantRange && other.start == start && other.end == end;

  @override
  int get hashCode => Object.hash(start, end);

  @override
  String toString() => '[$start, $end)';
}
