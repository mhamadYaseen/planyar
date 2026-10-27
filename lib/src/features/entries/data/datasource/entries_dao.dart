import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables/entries.dart';
import '../../../../core/time/instant.dart';

part 'entries_dao.g.dart';

/// SQL for entries (plan §7.3, §8.5).
@DriftAccessor(tables: [Entries])
class EntriesDao extends DatabaseAccessor<AppDatabase> with _$EntriesDaoMixin {
  EntriesDao(super.attachedDatabase);

  static const _maxEntryMs = 7 * Duration.millisecondsPerDay;

  /// Closed entries intersecting [from, to) and open entries starting in it:
  /// `start < to AND COALESCE(end, start + 1) > from AND start > from − 7 d`.
  /// The last condition lets the `start_utc` index do the work.
  SimpleSelectStatement<$EntriesTable, EntryRow> _range(Instant from, Instant to) => select(entries)
    ..where(
      (e) =>
          e.startUtc.isSmallerThanValue(to.utcMs) &
          coalesce<int>([e.endUtc, e.startUtc + const Constant(1)]).isBiggerThanValue(from.utcMs) &
          e.startUtc.isBiggerThanValue(from.utcMs - _maxEntryMs),
    )
    ..orderBy([(e) => OrderingTerm.asc(e.startUtc), (e) => OrderingTerm.asc(e.id)]);

  Stream<List<EntryRow>> watchRange(Instant from, Instant to) => _range(from, to).watch();

  Future<List<EntryRow>> range(Instant from, Instant to) => _range(from, to).get();

  Stream<List<EntryRow>> watchOpen() =>
      (select(entries)
            ..where((e) => e.endUtc.isNull())
            ..orderBy([(e) => OrderingTerm.asc(e.startUtc), (e) => OrderingTerm.asc(e.id)]))
          .watch();

  Future<EntryRow?> byId(String id) => (select(entries)..where((e) => e.id.equals(id))).getSingleOrNull();

  Future<int?> latestActualEnd(Instant from, Instant to) async {
    final latest = entries.endUtc.max();
    final query = selectOnly(entries)
      ..addColumns([latest])
      ..where(
        entries.kind.equals('actual') &
            entries.endUtc.isBetweenValues(from.utcMs, to.utcMs) &
            entries.startUtc.isBiggerThanValue(from.utcMs - _maxEntryMs),
      );
    return (await query.getSingle()).read(latest);
  }

  Future<EntryRow?> latestClosedPlanned(String labelId) =>
      (select(entries)
            ..where((e) => e.labelId.equals(labelId) & e.kind.equals('planned') & e.endUtc.isNotNull())
            ..orderBy([(e) => OrderingTerm.desc(e.startUtc)])
            ..limit(1))
          .getSingleOrNull();

  Future<Map<String, int>> labelUseSince(Instant since) async {
    final count = entries.id.count();
    final query = selectOnly(entries)
      ..addColumns([entries.labelId, count])
      ..where(entries.startUtc.isBiggerOrEqualValue(since.utcMs))
      ..groupBy([entries.labelId]);
    return {for (final row in await query.get()) row.read(entries.labelId)!: row.read(count)!};
  }

  Future<void> insertRow(EntriesCompanion row) => into(entries).insert(row);

  Future<void> replaceRow(EntriesCompanion row) => update(entries).replace(row);

  Future<int> deleteById(String id) => (delete(entries)..where((e) => e.id.equals(id))).go();
}
