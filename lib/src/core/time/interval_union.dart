import 'instant.dart';

/// Covered time of possibly overlapping intervals (plan §8.3). "Tracked"
/// totals use this, so overlapping entries are never counted twice (D-35).
abstract final class IntervalUnion {
  /// Sorted, non-overlapping ranges covering exactly the same time.
  /// Touching ranges merge.
  static List<InstantRange> merge(Iterable<InstantRange> ranges) {
    final sorted = ranges.toList()..sort((a, b) => a.start.compareTo(b.start));
    final merged = <InstantRange>[];
    for (final range in sorted) {
      if (merged.isNotEmpty && range.start <= merged.last.end) {
        final last = merged.removeLast();
        merged.add(InstantRange(last.start, Instant.latest(last.end, range.end)));
      } else {
        merged.add(range);
      }
    }
    return merged;
  }

  /// Total covered time, optionally clipped to [within].
  static Duration covered(Iterable<InstantRange> ranges, {InstantRange? within}) {
    final clipped = within == null ? ranges : ranges.map((r) => r.intersection(within)).whereType<InstantRange>();
    return merge(clipped).fold(Duration.zero, (total, r) => total + r.duration);
  }
}
