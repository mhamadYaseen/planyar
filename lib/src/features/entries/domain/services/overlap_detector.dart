import '../../../../core/time/instant.dart';
import '../entities/entry.dart';

/// Finds overlapping entries (plan §6.6, D-34). Two entries overlap when they
/// are the same kind, both closed, and share positive time. Touching entries
/// don't overlap; planned vs actual never overlap. Computed on read, never
/// stored.
final class OverlapDetector {
  const OverlapDetector();

  /// Same-kind closed entries among [among] that overlap [range], sorted by
  /// start. [excludeId] skips the entry being edited (editor note, J5 AC1).
  List<Entry> overlapping({
    required EntryKind kind,
    required InstantRange range,
    required Iterable<Entry> among,
    String? excludeId,
  }) {
    final found = [
      for (final entry in among)
        if (entry.kind == kind && entry.id != excludeId && (entry.range?.overlaps(range) ?? false)) entry,
    ];
    return found..sort(_byStartThenEnd);
  }

  /// Groups of two or more entries that overlap, directly or through a chain
  /// (A–B, B–C → one group). Each kind is grouped separately. With [within],
  /// only overlap inside that window counts (e.g. one day).
  List<List<Entry>> clusters(Iterable<Entry> entries, {InstantRange? within}) {
    final result = <List<Entry>>[];
    for (final kind in EntryKind.values) {
      final items = <(Entry, InstantRange)>[
        for (final entry in entries)
          if (entry.kind == kind)
            if (_clip(entry.range, within) case final range?) (entry, range),
      ]..sort((a, b) => _compareRanges(a.$2, b.$2, a.$1.id, b.$1.id));

      var current = <Entry>[];
      Instant? currentEnd;
      for (final (entry, range) in items) {
        if (currentEnd != null && range.start < currentEnd) {
          current.add(entry);
          currentEnd = Instant.latest(currentEnd, range.end);
        } else {
          if (current.length > 1) result.add(current);
          current = [entry];
          currentEnd = range.end;
        }
      }
      if (current.length > 1) result.add(current);
    }
    return result;
  }

  /// IDs of all entries that overlap another one.
  Set<String> overlappingIds(Iterable<Entry> entries, {InstantRange? within}) => {
    for (final cluster in clusters(entries, within: within))
      for (final entry in cluster) entry.id,
  };

  static InstantRange? _clip(InstantRange? range, InstantRange? within) =>
      range == null ? null : (within == null ? range : range.intersection(within));

  static int _byStartThenEnd(Entry a, Entry b) => _compareRanges(a.range!, b.range!, a.id, b.id);

  /// Start ascending, then longer first, then ID — deterministic order.
  static int _compareRanges(InstantRange a, InstantRange b, String idA, String idB) {
    final byStart = a.start.compareTo(b.start);
    if (byStart != 0) return byStart;
    final byEnd = b.end.compareTo(a.end);
    return byEnd != 0 ? byEnd : idA.compareTo(idB);
  }
}
