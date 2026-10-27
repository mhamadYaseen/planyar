import '../../../../core/time/instant.dart';
import '../../../../core/time/interval_union.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../../entries/domain/services/overlap_detector.dart';

/// The day header numbers (VIEW-05): time covered by actual and planned
/// entries (overlaps counted once, D-35), overlap groups, and open entries
/// starting this day (excluded from totals, D-08).
final class DaySummary {
  const DaySummary({required this.tracked, required this.planned, required this.overlapCount, required this.openCount});

  factory DaySummary.of({required InstantRange day, required Iterable<Entry> entries}) {
    Iterable<InstantRange> closed(EntryKind kind) =>
        entries.where((e) => e.kind == kind).map((e) => e.range).whereType<InstantRange>();
    return DaySummary(
      tracked: IntervalUnion.covered(closed(EntryKind.actual), within: day),
      planned: IntervalUnion.covered(closed(EntryKind.planned), within: day),
      overlapCount: const OverlapDetector().clusters(entries, within: day).length,
      openCount: entries.where((e) => e.isOpen && day.contains(e.start)).length,
    );
  }

  static const empty = DaySummary(tracked: Duration.zero, planned: Duration.zero, overlapCount: 0, openCount: 0);

  final Duration tracked;
  final Duration planned;
  final int overlapCount;
  final int openCount;

  bool get isEmpty => tracked == Duration.zero && planned == Duration.zero && openCount == 0;
}
