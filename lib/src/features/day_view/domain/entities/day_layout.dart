import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../../../../core/time/wall_time.dart';
import '../../../entries/domain/entities/entry.dart';

export '../../../settings/domain/entities/app_settings.dart' show DayViewMode, LaneMode;

enum TimelineLane { plan, actual, combined }

/// One entry's part of one day, positioned in minutes from the day's start
/// instant (so 23 h and 25 h days work, §8.7).
final class TimelineSegment {
  const TimelineSegment({
    required this.entry,
    required this.lane,
    required this.startMinute,
    required this.endMinute,
    required this.column,
    required this.columnCount,
    required this.continuesFromPreviousDay,
    required this.continuesToNextDay,
    required this.hasOverlap,
  });

  final Entry entry;
  final TimelineLane lane;

  /// Drawn span; for open entries this includes the tail (§6.9).
  final int startMinute;
  final int endMinute;

  /// Side-by-side position among overlapping blocks in the lane.
  final int column;
  final int columnCount;

  /// "↑ from Sat 23:10" at the top edge.
  final bool continuesFromPreviousDay;

  /// "continues ↓" at the bottom edge.
  final bool continuesToNextDay;

  /// ⚠ — a real same-kind overlap on this day (§6.6).
  final bool hasOverlap;

  bool get isOpen => entry.isOpen;
}

/// An hour line on the timeline.
final class HourMark {
  const HourMark({required this.minute, required this.wallTime, required this.isRepeated});

  /// Minutes from the day's start.
  final int minute;
  final WallTime wallTime;

  /// The second pass through a fall-back hour — labelled "01:00 (2nd)".
  final bool isRepeated;
}

/// Everything the timeline and list need to draw one day.
final class DayLayout {
  const DayLayout({
    required this.date,
    required this.bounds,
    required this.hours,
    required this.segments,
    this.nowMinute,
  });

  final LocalDate date;
  final InstantRange bounds;
  final List<HourMark> hours;

  /// Sorted by start, then lane, then column.
  final List<TimelineSegment> segments;

  /// Minutes from the day's start to now, when now is on this day.
  final int? nowMinute;

  /// 1440 normally; 1380 / 1500 on DST days.
  int get totalMinutes => bounds.duration.inMinutes;
}
