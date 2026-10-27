import '../../../../core/time/instant.dart';
import '../entities/entry.dart';
import '../entities/entry_draft.dart';

/// Entries storage (plan §8.5). Streams re-emit after any change, including
/// imports and routine regeneration.
abstract interface class EntriesRepository {
  /// Entries shown on a day: closed entries that intersect [range] and open
  /// entries that start inside it (§6.9, §7.3).
  Stream<List<Entry>> watchRange(InstantRange range);

  /// One-shot version of [watchRange] (overlap check in the editor).
  Future<List<Entry>> inRange(InstantRange range);

  /// Open entries, oldest first (To finish, S11).
  Stream<List<Entry>> watchOpen();

  Future<Entry?> byId(String id);

  /// The latest end of an actual entry in [from, to] (quick-add start, ENT-10).
  Future<Instant?> latestActualEnd({required Instant from, required Instant to});

  /// Duration of the label's most recent closed planned entry (ENT-10).
  Future<Duration?> lastPlannedDuration(String labelId);

  /// Label ID → number of entries starting since [since] (picker order, LBL-06).
  Future<Map<String, int>> labelUseSince(Instant since);

  Future<Entry> create(EntryDraft draft);

  /// Saves edited fields; sets `updatedAt`.
  Future<Entry> update(Entry entry);

  /// Deletes and returns the row, so Undo can put it back exactly.
  Future<Entry?> delete(String id);

  /// Re-inserts a deleted row unchanged (Undo, §6.11).
  Future<void> restore(Entry entry);
}
