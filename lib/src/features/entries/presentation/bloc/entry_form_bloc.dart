import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/time/day_math.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../../../core/time/wall_time.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../core/utils/streams.dart';
import '../../../labels/domain/entities/label.dart';
import '../../../labels/domain/services/label_rules.dart';
import '../../../labels/domain/usecases/label_usecases.dart';
import '../../domain/entities/entry.dart';
import '../../domain/entities/entry_draft.dart';
import '../../domain/services/entry_defaults.dart';
import '../../domain/services/entry_validator.dart';
import '../../domain/usecases/entry_usecases.dart';

part 'entry_form_bloc.freezed.dart';
part 'entry_form_event.dart';
part 'entry_form_state.dart';

/// Drives quick add (S2) and the full entry editor (S3): smart defaults,
/// kind auto-switch, time nudges, overlap note, save and delete.
class EntryFormBloc extends Bloc<EntryFormEvent, EntryFormState> {
  EntryFormBloc({
    required this._getDefaults,
    required this._getPlannedDuration,
    required this._getEntry,
    required this._findOverlaps,
    required this._save,
    required this._delete,
    required this._watchLabels,
    required this._recentUse,
    required this._watchCategories,
    required this._timeZones,
  }) : super(const EntryFormState()) {
    on<_Started>(_onStarted);
    on<_KindChanged>((e, emit) => _apply(emit, state.copyWith(kind: e.kind, kindTouched: true)));
    on<_LabelSelected>(_onLabelSelected);
    on<_StartDateSet>((e, emit) => _setStart(emit, _math.at(e.date, _math.wallTimeOf(state.start!))));
    on<_StartTimeSet>((e, emit) => _setStart(emit, _math.at(_math.dateOf(state.start!), e.time)));
    on<_StartNudged>((e, emit) => _setStart(emit, state.start! + Duration(minutes: e.minutes)));
    on<_EndDateSet>((e, emit) => _setEnd(emit, _math.at(e.date, _math.wallTimeOf(state.end ?? state.start!))));
    on<_EndTimeSet>((e, emit) => _setEnd(emit, _endAt(e.time)));
    on<_EndNudged>((e, emit) => _setEnd(emit, (state.end ?? state.start!) + Duration(minutes: e.minutes)));
    on<_DurationPicked>((e, emit) => _setEnd(emit, state.start! + e.duration));
    on<_EndNowPressed>((e, emit) => _setEnd(emit, Instant.now().floorToMinute()));
    on<_OpenEndToggled>(_onOpenEndToggled);
    on<_NoteChanged>((e, emit) => _apply(emit, state.copyWith(note: e.note), recheckOverlaps: false));
    on<_CategoryOverrideChanged>(
      (e, emit) => _apply(emit, state.copyWith(categoryOverrideId: e.categoryId), recheckOverlaps: false),
    );
    on<_SavePressed>(_onSave);
    on<_DeletePressed>(_onDelete);
    on<_OverlapCheckRequested>(_onOverlapCheck, transformer: debounceEvents(overlapDebounce));
  }

  static const overlapDebounce = Duration(milliseconds: 200);

  final GetEntryDefaults _getDefaults;
  final GetPlannedDuration _getPlannedDuration;
  final GetEntry _getEntry;
  final FindOverlaps _findOverlaps;
  final SaveEntry _save;
  final DeleteEntry _delete;
  final WatchLabels _watchLabels;
  final GetRecentLabelUse _recentUse;
  final WatchCategories _watchCategories;
  final TimeZoneService _timeZones;

  DayMath get _math => _timeZones.dayMath;

  Future<void> _onStarted(_Started event, Emitter<EntryFormState> emit) async {
    final recentUse = await _recentUse(const NoParams());
    switch (event.request) {
      case NewEntryOnDate(:final date, :final labelId):
        await _startNew(emit, DefaultsForDate(date), labelId: labelId);
      case NewEntryInGap(:final gap, :final kind):
        await _startNew(emit, DefaultsForGap(gap));
        // Tapped in the PLAN or ACTUAL lane: that lane's kind (VIEW-03).
        if (kind != null) _apply(emit, state.copyWith(kind: kind, kindTouched: true));
      case EditEntry(:final entryId):
        final entry = await _getEntry(entryId);
        if (entry == null) {
          emit(state.copyWith(status: EntryFormStatus.failed, failure: Failure.notFound('Entry $entryId')));
          return;
        }
        _apply(
          emit,
          state.copyWith(
            status: EntryFormStatus.ready,
            original: entry,
            kind: entry.kind,
            kindTouched: true,
            labelId: entry.labelId,
            start: entry.start,
            end: entry.end,
            endTouched: true,
            note: entry.note ?? '',
            categoryOverrideId: entry.categoryOverrideId,
          ),
        );
      case DuplicateEntry(:final entryId, :final onDate):
        final entry = await _getEntry(entryId);
        if (entry == null) {
          emit(state.copyWith(status: EntryFormStatus.failed, failure: Failure.notFound('Entry $entryId')));
          return;
        }
        // Same wall-clock start on the target day, same duration (ENT-12).
        final start = _math.at(onDate, _math.wallTimeOf(entry.start));
        final now = Instant.now();
        _apply(
          emit,
          state.copyWith(
            status: EntryFormStatus.ready,
            kind: EntryDefaults.kindFor(start, now),
            labelId: entry.labelId,
            start: start,
            end: entry.duration == null ? null : start + entry.duration!,
            endTouched: true,
            note: entry.note ?? '',
            categoryOverrideId: entry.categoryOverrideId,
          ),
        );
    }

    await emit.forEach<(List<Label>, List<Category>)>(
      combineLatest2(_watchLabels(const NoParams()), _watchCategories(const NoParams()), (l, c) => (l, c)),
      onData: (data) {
        final (labels, categories) = data;
        final picker = LabelRules.picker(labels, recentUse: recentUse);
        return state.copyWith(
          labels: {for (final l in labels) l.id: l},
          quickLabels: picker.quickChips,
          categories: categories,
        );
      },
      onError: (_, _) => state,
    );
  }

  Future<void> _startNew(Emitter<EntryFormState> emit, DefaultsRequest request, {String? labelId}) async {
    final result = await _getDefaults(request);
    switch (result) {
      case DataSuccess(:final data):
        _apply(
          emit,
          state.copyWith(
            status: EntryFormStatus.ready,
            kind: data.kind,
            start: data.start,
            end: data.end,
            labelId: labelId,
          ),
        );
      case DataError(:final failure):
        emit(state.copyWith(status: EntryFormStatus.failed, failure: failure));
      default:
        break;
    }
  }

  Future<void> _onLabelSelected(_LabelSelected event, Emitter<EntryFormState> emit) async {
    var next = state.copyWith(labelId: event.labelId);
    // Planned entries default to the label's last planned duration (ENT-10).
    if (next.kind == EntryKind.planned && !next.endTouched && next.start != null) {
      final last = await _getPlannedDuration(event.labelId);
      next = next.copyWith(end: EntryDefaults(_math).plannedEnd(next.start!, last));
    }
    _apply(emit, next);
  }

  void _setStart(Emitter<EntryFormState> emit, Instant start) {
    final oldStart = state.start!;
    var end = state.end;
    // Moving the start past the end keeps the duration.
    if (end != null && end <= start) end = start + end.difference(oldStart);
    _apply(
      emit,
      state.copyWith(
        start: start,
        end: end,
        // Actual if it already started, planned otherwise — until the user
        // picks a kind themselves (ENT-02).
        kind: state.kindTouched ? state.kind : EntryDefaults.kindFor(start, Instant.now()),
      ),
    );
  }

  void _setEnd(Emitter<EntryFormState> emit, Instant end) =>
      _apply(emit, state.copyWith(end: end, endTouched: true, endBeforeOpen: null));

  /// A picked end time: on the start's day, or the next day when it's not
  /// after the start ("23:00 → 07:00" means the next morning).
  Instant _endAt(WallTime time) {
    final startDate = _math.dateOf(state.start!);
    final sameDay = _math.at(startDate, time);
    return sameDay > state.start! ? sameDay : _math.at(startDate.addDays(1), time);
  }

  void _onOpenEndToggled(_OpenEndToggled event, Emitter<EntryFormState> emit) {
    if (event.open) {
      _apply(emit, state.copyWith(endBeforeOpen: state.end, end: null, endTouched: true));
    } else {
      final restored = state.endBeforeOpen ?? state.start! + EntryDefaults.defaultDuration;
      _setEnd(emit, restored);
    }
  }

  /// Emits [next] with a fresh validation result and (debounced) overlap check.
  void _apply(Emitter<EntryFormState> emit, EntryFormState next, {bool recheckOverlaps = true}) {
    final start = next.start;
    final check = start == null
        ? const EntryCheck()
        : EntryValidator(_math).check(start: start, end: next.end, note: next.note, now: Instant.now());
    emit(next.copyWith(check: check, failure: null));
    if (recheckOverlaps) add(const EntryFormEvent.overlapCheckRequested());
  }

  Future<void> _onOverlapCheck(_OverlapCheckRequested event, Emitter<EntryFormState> emit) async {
    final start = state.start;
    final end = state.end;
    if (start == null || end == null || end <= start) {
      emit(state.copyWith(overlaps: const []));
      return;
    }
    final result = await _findOverlaps(
      FindOverlapsParams(kind: state.kind, range: InstantRange(start, end), excludeId: state.original?.id),
    );
    if (result case DataSuccess(:final data)) emit(state.copyWith(overlaps: data));
  }

  Future<void> _onSave(_SavePressed event, Emitter<EntryFormState> emit) async {
    if (!state.canSave) return;
    emit(state.copyWith(status: EntryFormStatus.saving));
    final result = await _save(
      SaveEntryParams(
        existing: state.original,
        draft: EntryDraft(
          kind: state.kind,
          labelId: state.labelId!,
          start: state.start!,
          end: state.end,
          note: state.note,
          categoryOverrideId: state.categoryOverrideId,
          taskId: state.original?.taskId,
        ),
      ),
    );
    switch (result) {
      case DataSuccess(:final data):
        emit(state.copyWith(status: EntryFormStatus.saved, result: data));
      case DataError(:final failure):
        emit(state.copyWith(status: EntryFormStatus.ready, failure: failure));
      default:
        break;
    }
  }

  Future<void> _onDelete(_DeletePressed event, Emitter<EntryFormState> emit) async {
    final original = state.original;
    if (original == null) return;
    final result = await _delete(original.id);
    switch (result) {
      case DataSuccess(:final data):
        emit(state.copyWith(status: EntryFormStatus.deleted, result: data));
      case DataError(:final failure):
        emit(state.copyWith(failure: failure));
      default:
        break;
    }
  }
}
