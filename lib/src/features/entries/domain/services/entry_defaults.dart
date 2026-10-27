import '../../../../core/time/day_math.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../entities/entry.dart';

/// Starting values for a new entry.
final class DefaultTimes {
  const DefaultTimes({required this.kind, required this.start, this.end});

  final EntryKind kind;
  final Instant start;

  /// Null = "No end yet".
  final Instant? end;
}

/// Smart defaults for quick add (ENT-02, ENT-10, ENT-11).
final class EntryDefaults {
  const EntryDefaults(this._math);

  final DayMath _math;

  static const roundingMinutes = 5;
  static const recentWindow = Duration(hours: 12);
  static const defaultDuration = Duration(hours: 1);

  /// Actual if the start is not in the future, otherwise planned (ENT-02).
  static EntryKind kindFor(Instant start, Instant now) => start <= now ? EntryKind.actual : EntryKind.planned;

  /// Defaults for quick add on [date].
  ///
  /// Today: start where today's latest actual entry ended (if within the last
  /// 12 h) with end = now rounded down to 5 minutes; otherwise start now
  /// (rounded down) with no end yet. Other days: the same time of
  /// day — a past day gets a 1 h actual entry, a future day a 1 h plan.
  DefaultTimes forDate({required LocalDate date, required Instant now, Instant? latestActualEnd}) {
    final today = _math.dateOf(now);
    final nowRounded = _math.floorToStep(now, roundingMinutes);

    if (date == today) {
      final useLatest =
          latestActualEnd != null &&
          latestActualEnd <= now &&
          _math.dateOf(latestActualEnd) == today &&
          now.difference(latestActualEnd) <= recentWindow;
      if (!useLatest) {
        // Nothing logged recently: "starting now", end left open.
        return DefaultTimes(kind: EntryKind.actual, start: nowRounded);
      }
      final Instant? end;
      if (nowRounded > latestActualEnd) {
        end = nowRounded;
      } else if (now.floorToMinute() > latestActualEnd) {
        end = now.floorToMinute(); // ended within the last 5 minutes
      } else {
        end = null;
      }
      return DefaultTimes(kind: EntryKind.actual, start: latestActualEnd, end: end);
    }

    final start = _math.at(date, _math.wallTimeOf(nowRounded));
    final kind = kindFor(start, now);
    return DefaultTimes(kind: kind, start: start, end: start + defaultDuration);
  }

  /// End for a planned entry: the label's last planned duration, else 1 h.
  Instant plannedEnd(Instant start, Duration? lastDuration) => start + (lastDuration ?? defaultDuration);

  /// Defaults when the user taps an empty gap in the timeline (ENT-11).
  DefaultTimes forGap(InstantRange gap, Instant now) =>
      DefaultTimes(kind: kindFor(gap.start, now), start: gap.start, end: gap.end);
}
