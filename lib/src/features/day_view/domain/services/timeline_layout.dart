import '../../../../core/time/day_math.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../../entries/domain/services/overlap_detector.dart';
import '../entities/day_layout.dart';

/// Turns a day's entries into positioned segments (plan §8.7). Pure; the
/// timeline and list widgets only draw what this returns.
final class TimelineLayout {
  const TimelineLayout(this._math, {this._overlaps = const OverlapDetector()});

  final DayMath _math;
  final OverlapDetector _overlaps;

  /// Open entries on days other than today show a fixed 1 h dashed tail.
  static const openTail = Duration(hours: 1);
  static const _hourScanStep = Duration(minutes: 15);

  DayLayout build({
    required LocalDate date,
    required Iterable<Entry> entries,
    required Instant now,
    required LaneMode laneMode,
  }) {
    final bounds = _math.dayBounds(date);
    final overlapping = _overlaps.overlappingIds(entries, within: bounds);

    final placed = <_Placed>[];
    for (final entry in entries) {
      final span = _displaySpan(entry, bounds, now);
      if (span == null) continue;
      placed.add(
        _Placed(
          entry: entry,
          lane: switch (laneMode) {
            LaneMode.combined => TimelineLane.combined,
            LaneMode.split => entry.kind == EntryKind.planned ? TimelineLane.plan : TimelineLane.actual,
          },
          start: span.start.difference(bounds.start).inMinutes,
          end: span.end.difference(bounds.start).inMinutes,
        ),
      );
    }

    final segments = <TimelineSegment>[];
    for (final lane in TimelineLane.values) {
      final inLane = placed.where((p) => p.lane == lane).toList()..sort(_Placed.compare);
      segments.addAll(_assignColumns(inLane, bounds, overlapping));
    }
    segments.sort((a, b) {
      final byStart = a.startMinute.compareTo(b.startMinute);
      if (byStart != 0) return byStart;
      final byLane = a.lane.index.compareTo(b.lane.index);
      return byLane != 0 ? byLane : a.column.compareTo(b.column);
    });

    return DayLayout(
      date: date,
      bounds: bounds,
      hours: _hourMarks(bounds),
      segments: segments,
      nowMinute: bounds.contains(now) ? now.difference(bounds.start).inMinutes : null,
    );
  }

  /// The drawn interval of [entry] on this day, or null if it isn't shown.
  InstantRange? _displaySpan(Entry entry, InstantRange bounds, Instant now) {
    final range = entry.range;
    if (range != null) return range.intersection(bounds);
    // Open entries show on their start day only (§6.9, §7.3).
    if (!bounds.contains(entry.start)) return null;
    var end = bounds.contains(now) && now > entry.start ? now : entry.start + openTail;
    end = Instant.earliest(end, bounds.end);
    if (end.difference(entry.start).inMinutes < 1) end = entry.start + const Duration(minutes: 1);
    return InstantRange(entry.start, end);
  }

  /// Greedy interval colouring per cluster: each block takes the lowest free
  /// column; every block in a cluster shares the cluster's column count.
  List<TimelineSegment> _assignColumns(List<_Placed> sorted, InstantRange bounds, Set<String> overlapping) {
    final result = <TimelineSegment>[];
    var cluster = <(_Placed, int)>[];
    var columnEnds = <int>[];
    var clusterEnd = -1;

    void flush() {
      for (final (p, column) in cluster) {
        result.add(
          TimelineSegment(
            entry: p.entry,
            lane: p.lane,
            startMinute: p.start,
            endMinute: p.end,
            column: column,
            columnCount: columnEnds.length,
            continuesFromPreviousDay: p.entry.start < bounds.start,
            continuesToNextDay: p.entry.end != null && p.entry.end! > bounds.end,
            hasOverlap: overlapping.contains(p.entry.id),
          ),
        );
      }
      cluster = [];
      columnEnds = [];
    }

    for (final p in sorted) {
      if (cluster.isNotEmpty && p.start >= clusterEnd) flush();
      var column = columnEnds.indexWhere((end) => end <= p.start);
      if (column == -1) {
        column = columnEnds.length;
        columnEnds.add(p.end);
      } else {
        columnEnds[column] = p.end;
      }
      cluster.add((p, column));
      clusterEnd = cluster.length == 1 ? p.end : (p.end > clusterEnd ? p.end : clusterEnd);
    }
    if (cluster.isNotEmpty) flush();
    return result;
  }

  /// Whole local hours, found by scanning the day in 15-minute steps (every
  /// real offset is a multiple of 15 minutes), so DST days label correctly.
  List<HourMark> _hourMarks(InstantRange bounds) {
    final marks = <HourMark>[];
    for (var t = bounds.start; t < bounds.end; t = t + _hourScanStep) {
      final wall = _math.wallTimeOf(t);
      if (wall.minute != 0) continue;
      marks.add(
        HourMark(minute: t.difference(bounds.start).inMinutes, wallTime: wall, isRepeated: _math.isRepeatedWallTime(t)),
      );
    }
    return marks;
  }
}

final class _Placed {
  const _Placed({required this.entry, required this.lane, required this.start, required this.end});

  final Entry entry;
  final TimelineLane lane;
  final int start;
  final int end;

  /// Start ascending, longer first, then ID — so columns are stable.
  static int compare(_Placed a, _Placed b) {
    final byStart = a.start.compareTo(b.start);
    if (byStart != 0) return byStart;
    final byEnd = b.end.compareTo(a.end);
    return byEnd != 0 ? byEnd : a.entry.id.compareTo(b.entry.id);
  }
}
