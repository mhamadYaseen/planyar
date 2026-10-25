import 'package:clock/clock.dart';

/// An exact moment, stored as UTC milliseconds since the Unix epoch
/// (plan §6.1). Entry start/end, `completedAt`, `createdAt/updatedAt` and
/// custom reminder times are instants.
final class Instant implements Comparable<Instant> {
  const Instant.fromUtcMs(this.utcMs);

  Instant.fromDateTime(DateTime dateTime) : utcMs = dateTime.millisecondsSinceEpoch;

  /// The current moment from `package:clock`, so tests can fix "now".
  factory Instant.now() => Instant.fromDateTime(clock.now());

  /// Parses ISO-8601 text that carries a zone (`Z` or `±hh:mm`).
  /// Throws [FormatException] for text without a zone, because that would be
  /// read in the device's local zone.
  factory Instant.parse(String text) {
    if (!_hasZone.hasMatch(text)) {
      throw FormatException('Instant text needs a zone (Z or ±hh:mm)', text);
    }
    return Instant.fromDateTime(DateTime.parse(text));
  }

  static final _hasZone = RegExp(r'(Z|[+-]\d{2}(:?\d{2})?)$');
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
