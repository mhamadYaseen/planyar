import '../../../../core/time/instant.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../../../core/utils/id_generator.dart';
import '../../domain/entities/entry.dart';
import '../../domain/entities/entry_draft.dart';
import '../../domain/repositories/entries_repository.dart';
import '../datasource/entries_dao.dart';
import 'entry_mapper.dart';

final class EntriesRepositoryImpl implements EntriesRepository {
  EntriesRepositoryImpl(this._dao, this._ids, this._timeZones);

  final EntriesDao _dao;
  final IdGenerator _ids;
  final TimeZoneService _timeZones;

  @override
  Stream<List<Entry>> watchRange(InstantRange range) =>
      _dao.watchRange(range.start, range.end).map((rows) => [for (final r in rows) r.toEntity()]);

  @override
  Future<List<Entry>> inRange(InstantRange range) async => [
    for (final r in await _dao.range(range.start, range.end)) r.toEntity(),
  ];

  @override
  Stream<List<Entry>> watchOpen() => _dao.watchOpen().map((rows) => [for (final r in rows) r.toEntity()]);

  @override
  Future<Entry?> byId(String id) async => (await _dao.byId(id))?.toEntity();

  @override
  Future<Instant?> latestActualEnd({required Instant from, required Instant to}) async {
    final ms = await _dao.latestActualEnd(from, to);
    return ms == null ? null : Instant.fromUtcMs(ms);
  }

  @override
  Future<Duration?> lastPlannedDuration(String labelId) async =>
      (await _dao.latestClosedPlanned(labelId))?.toEntity().duration;

  @override
  Future<Map<String, int>> labelUseSince(Instant since) => _dao.labelUseSince(since);

  @override
  Future<Entry> create(EntryDraft draft) async {
    final now = Instant.now();
    final entry = Entry(
      id: _ids.newId(),
      kind: draft.kind,
      labelId: draft.labelId,
      start: draft.start,
      end: draft.end,
      note: _clean(draft.note),
      categoryOverrideId: draft.categoryOverrideId,
      taskId: draft.taskId,
      tzId: _timeZones.zoneId,
      utcOffsetMin: _timeZones.dayMath.offsetAt(draft.start).inMinutes,
      createdAt: now,
      updatedAt: now,
    );
    await _dao.insertRow(entry.toCompanion());
    return entry;
  }

  @override
  Future<Entry> update(Entry entry) async {
    final updated = entry.copyWith(note: _clean(entry.note), updatedAt: Instant.now());
    await _dao.replaceRow(updated.toCompanion());
    return updated;
  }

  @override
  Future<Entry?> delete(String id) => _dao.transaction(() async {
    final row = await _dao.byId(id);
    if (row == null) return null;
    await _dao.deleteById(id);
    return row.toEntity();
  });

  @override
  Future<void> restore(Entry entry) => _dao.insertRow(entry.toCompanion());

  /// Blank notes are stored as null.
  static String? _clean(String? note) => (note == null || note.trim().isEmpty) ? null : note.trim();
}
