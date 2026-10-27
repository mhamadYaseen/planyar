import '../../../../core/error/failures.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../../../core/usecases/guard.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../entities/entry.dart';
import '../entities/entry_draft.dart';
import '../repositories/entries_repository.dart';
import '../services/entry_defaults.dart';
import '../services/entry_validator.dart';
import '../services/overlap_detector.dart';

final class SaveEntryParams {
  const SaveEntryParams({required this.draft, this.existing});

  final EntryDraft draft;

  /// The entry being edited; null creates a new one.
  final Entry? existing;
}

/// Validates (ENT-03/04) and creates or updates an entry. A blocked save
/// returns `Failure.validation` with the `EntryCheck` as its reason.
final class SaveEntry implements UseCase<DataState<Entry>, SaveEntryParams> {
  const SaveEntry(this._entries, this._timeZones);

  final EntriesRepository _entries;
  final TimeZoneService _timeZones;

  @override
  Future<DataState<Entry>> call(SaveEntryParams params) async {
    final draft = params.draft;
    final check = EntryValidator(_timeZones.dayMath)
        .check(start: draft.start, end: draft.end, note: draft.note, now: Instant.now());
    if (!check.canSave) return DataState.error(Failure.validation('Entry not saved', reason: check));
    final existing = params.existing;
    return guard(
      () => existing == null
          ? _entries.create(draft)
          : _entries.update(
              existing.copyWith(
                kind: draft.kind,
                labelId: draft.labelId,
                start: draft.start,
                end: draft.end,
                note: draft.note,
                categoryOverrideId: draft.categoryOverrideId,
                taskId: draft.taskId,
              ),
            ),
    );
  }
}

/// Deletes an entry and returns it for Undo (ENT-06).
final class DeleteEntry implements UseCase<DataState<Entry>, String> {
  const DeleteEntry(this._entries);

  final EntriesRepository _entries;

  @override
  Future<DataState<Entry>> call(String id) async {
    try {
      final deleted = await _entries.delete(id);
      return deleted == null ? DataState.error(Failure.notFound('Entry $id')) : DataState.success(deleted);
    } on Object catch (error) {
      return DataState.error(Failure.database(error.toString()));
    }
  }
}

/// Undo of [DeleteEntry]: puts the exact row back (§6.11).
final class RestoreEntry implements UseCase<DataState<void>, Entry> {
  const RestoreEntry(this._entries);

  final EntriesRepository _entries;

  @override
  Future<DataState<void>> call(Entry entry) => guard(() => _entries.restore(entry));
}

final class SetEntryEndParams {
  const SetEntryEndParams(this.entry, this.end);

  final Entry entry;
  final Instant end;
}

/// Closes an open entry: End now, +30m/+1h/+2h, Set end (ENT-05, S11).
final class SetEntryEnd implements UseCase<DataState<Entry>, SetEntryEndParams> {
  const SetEntryEnd(this._save);

  final SaveEntry _save;

  @override
  Future<DataState<Entry>> call(SetEntryEndParams params) {
    final e = params.entry;
    return _save(
      SaveEntryParams(
        existing: e,
        draft: EntryDraft(
          kind: e.kind,
          labelId: e.labelId,
          start: e.start,
          end: params.end,
          note: e.note,
          categoryOverrideId: e.categoryOverrideId,
          taskId: e.taskId,
        ),
      ),
    );
  }
}

final class FindOverlapsParams {
  const FindOverlapsParams({required this.kind, required this.range, this.excludeId});

  final EntryKind kind;
  final InstantRange range;
  final String? excludeId;
}

/// Same-kind entries overlapping a draft, for the editor note (ENT-08).
final class FindOverlaps implements UseCase<DataState<List<Entry>>, FindOverlapsParams> {
  const FindOverlaps(this._entries);

  final EntriesRepository _entries;

  @override
  Future<DataState<List<Entry>>> call(FindOverlapsParams params) => guard(() async {
    final candidates = await _entries.inRange(params.range);
    return const OverlapDetector().overlapping(
      kind: params.kind,
      range: params.range,
      among: candidates,
      excludeId: params.excludeId,
    );
  });
}

/// Where a new entry starts: a date (FAB) or a tapped gap (ENT-11).
sealed class DefaultsRequest {
  const DefaultsRequest();
}

final class DefaultsForDate extends DefaultsRequest {
  const DefaultsForDate(this.date);

  final LocalDate date;
}

final class DefaultsForGap extends DefaultsRequest {
  const DefaultsForGap(this.gap);

  final InstantRange gap;
}

/// Smart defaults for quick add (ENT-10, ENT-11).
final class GetEntryDefaults implements UseCase<DataState<DefaultTimes>, DefaultsRequest> {
  const GetEntryDefaults(this._entries, this._timeZones);

  final EntriesRepository _entries;
  final TimeZoneService _timeZones;

  @override
  Future<DataState<DefaultTimes>> call(DefaultsRequest request) => guard(() async {
    final now = Instant.now();
    final defaults = EntryDefaults(_timeZones.dayMath);
    return switch (request) {
      DefaultsForGap(:final gap) => defaults.forGap(gap, now),
      DefaultsForDate(:final date) => defaults.forDate(
        date: date,
        now: now,
        latestActualEnd: await _entries.latestActualEnd(from: now - EntryDefaults.recentWindow, to: now),
      ),
    };
  });
}

/// The label's last planned duration, for planned defaults (ENT-10).
final class GetPlannedDuration implements UseCase<Duration?, String> {
  const GetPlannedDuration(this._entries);

  final EntriesRepository _entries;

  @override
  Future<Duration?> call(String labelId) async {
    try {
      return await _entries.lastPlannedDuration(labelId);
    } on Object {
      return null; // Only a default; never block the editor.
    }
  }
}

/// Open entries, oldest first (S11).
final class WatchOpenEntries implements StreamUseCase<List<Entry>, NoParams> {
  const WatchOpenEntries(this._entries);

  final EntriesRepository _entries;

  @override
  Stream<List<Entry>> call(NoParams params) => _entries.watchOpen();
}

final class GetEntry implements UseCase<Entry?, String> {
  const GetEntry(this._entries);

  final EntriesRepository _entries;

  @override
  Future<Entry?> call(String id) => _entries.byId(id);
}

/// Undo of an edit: writes the previous version back (§6.11).
final class RevertEntry implements UseCase<DataState<Entry>, Entry> {
  const RevertEntry(this._entries);

  final EntriesRepository _entries;

  @override
  Future<DataState<Entry>> call(Entry previous) => guard(() => _entries.update(previous));
}
