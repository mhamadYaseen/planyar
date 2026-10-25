import 'instant.dart';
import 'local_date.dart';
import 'time_zone_rules.dart';
import 'wall_time.dart';

/// All local-time math for the app (plan §6.2–§6.4). Nothing else builds
/// local times from parts.
///
/// Rules:
/// * A day is the half-open interval [local 00:00, next local 00:00).
/// * `local(D, minutes)` allows minutes ≥ 1440 (next day) and < 0 (previous
///   day), as routine exceptions need (−720…2880).
/// * A wall time inside a DST gap moves forward to the first valid minute
///   (02:30 → 03:00). A wall time that happens twice resolves to the first.
/// * Durations always come from instants, so 23 h and 25 h days are right.
final class DayMath {
  const DayMath(this.zone);

  final TimeZoneRules zone;

  static const _msPerDay = Duration.millisecondsPerDay;
  static const _msPerMinute = Duration.millisecondsPerMinute;

  /// Today's local date, using `package:clock` for "now".
  LocalDate today() => dateOf(Instant.now());

  Duration offsetAt(Instant instant) => zone.offsetAt(instant);

  /// The local date that contains [instant].
  LocalDate dateOf(Instant instant) => LocalDate.fromEpochDay(_floorDiv(_wallMs(instant), _msPerDay));

  /// The local time of day of [instant], with seconds dropped.
  WallTime wallTimeOf(Instant instant) {
    final msIntoDay = _wallMs(instant) % _msPerDay;
    return WallTime.fromMinutes(msIntoDay ~/ _msPerMinute);
  }

  /// The instant for [minutes] after local midnight of [date] (§6.7).
  Instant local(LocalDate date, int minutes) {
    final minuteOfDay = minutes % WallTime.minutesPerDay;
    final dayShift = (minutes - minuteOfDay) ~/ WallTime.minutesPerDay;
    final shifted = date.addDays(dayShift);
    return _resolve(shifted.epochDay * _msPerDay + minuteOfDay * _msPerMinute);
  }

  /// The instant for [time] on [date].
  Instant at(LocalDate date, WallTime time) => local(date, time.minutes);

  /// Start of [date]: local midnight, or the first valid instant if midnight
  /// falls in a DST gap.
  Instant startOfDay(LocalDate date) => local(date, 0);

  /// [startOfDay(date), startOfDay(date + 1)).
  InstantRange dayBounds(LocalDate date) => InstantRange(startOfDay(date), startOfDay(date.addDays(1)));

  /// 24 h normally; 23 h / 25 h (or ±30 min) on DST days.
  Duration dayLength(LocalDate date) => dayBounds(date).duration;

  /// [start of first, start of the day after last) — a report range such as
  /// 1–7 Oct is [1 Oct 00:00, 8 Oct 00:00).
  InstantRange rangeBounds(LocalDate first, LocalDate last) {
    if (last < first) throw ArgumentError('last ($last) is before first ($first)');
    return InstantRange(startOfDay(first), startOfDay(last.addDays(1)));
  }

  /// True when [instant]'s wall-clock time already happened earlier the same
  /// night (the second pass through a fall-back hour, shown as "01:00 (2nd)").
  bool isRepeatedWallTime(Instant instant) {
    final wall = _wallMs(instant);
    return _validInstantsFor(wall).any((t) => t < instant.utcMs);
  }

  /// Splits [range] at local midnights into one slice per day it touches
  /// with positive duration (§6.2, §6.3). An entry ending exactly at 00:00
  /// belongs only to the earlier day.
  List<DaySlice> splitByDay(InstantRange range) {
    final first = dateOf(range.start);
    final last = dateOf(range.end - const Duration(milliseconds: 1));
    final slices = <DaySlice>[];
    for (var date = first; date <= last; date = date.addDays(1)) {
      final day = dayBounds(date);
      final part = range.intersection(day);
      if (part == null) continue;
      slices.add(
        DaySlice(
          date: date,
          day: day,
          part: part,
          continuesFromPreviousDay: range.start < day.start,
          continuesToNextDay: range.end > day.end,
        ),
      );
    }
    return slices;
  }

  // Wall-clock milliseconds: the local date-time written as if it were UTC.
  int _wallMs(Instant instant) => instant.utcMs + zone.offsetAt(instant).inMilliseconds;

  int _offsetMs(int utcMs) => zone.offsetAt(Instant.fromUtcMs(utcMs)).inMilliseconds;

  /// Turns a wall-clock time into an instant using the gap/overlap rules.
  Instant _resolve(int wallMs) {
    final valid = _validInstantsFor(wallMs);
    if (valid.isNotEmpty) {
      return Instant.fromUtcMs(valid.reduce((a, b) => a < b ? a : b));
    }
    return Instant.fromUtcMs(_gapEnd(wallMs));
  }

  /// Every UTC instant whose wall-clock time is [wallMs]: one normally, two in
  /// a repeated hour, none in a gap.
  List<int> _validInstantsFor(int wallMs) {
    final offsets = _candidateOffsets(wallMs);
    return [
      for (final offset in offsets)
        if (_offsetMs(wallMs - offset) == offset) wallMs - offset,
    ];
  }

  Set<int> _candidateOffsets(int wallMs) {
    // Offsets that could apply near this wall time. Real zones never change
    // offset twice within two days, so probing ±1 day finds both sides.
    final offsets = {
      _offsetMs(wallMs - _msPerDay),
      _offsetMs(wallMs),
      _offsetMs(wallMs + _msPerDay),
    };
    for (final offset in offsets.toList()) {
      offsets.add(_offsetMs(wallMs - offset));
    }
    return offsets;
  }

  /// For a wall time inside a gap, the first instant after the transition.
  int _gapEnd(int wallMs) {
    final offsets = _candidateOffsets(wallMs);
    final maxOffset = offsets.reduce((a, b) => a > b ? a : b);
    final minOffset = offsets.reduce((a, b) => a < b ? a : b);
    var lo = wallMs - maxOffset; // before the transition
    var hi = wallMs - minOffset; // after the transition
    final before = _offsetMs(lo);
    if (before == _offsetMs(hi)) {
      // Not a real gap (shouldn't happen); fall back to the current offset.
      return wallMs - _offsetMs(wallMs);
    }
    while (hi - lo > 1) {
      final mid = lo + (hi - lo) ~/ 2;
      if (_offsetMs(mid) == before) {
        lo = mid;
      } else {
        hi = mid;
      }
    }
    return hi;
  }

  static int _floorDiv(int a, int b) => (a - a % b) ~/ b;
}

/// The part of an interval that falls on one local day.
final class DaySlice {
  const DaySlice({
    required this.date,
    required this.day,
    required this.part,
    required this.continuesFromPreviousDay,
    required this.continuesToNextDay,
  });

  final LocalDate date;

  /// The whole day's bounds.
  final InstantRange day;

  /// The clipped part of the interval inside [day].
  final InstantRange part;

  /// Show "↑ from …" at the top edge.
  final bool continuesFromPreviousDay;

  /// Show "continues ↓" at the bottom edge.
  final bool continuesToNextDay;

  @override
  String toString() => 'DaySlice($date, $part)';
}
