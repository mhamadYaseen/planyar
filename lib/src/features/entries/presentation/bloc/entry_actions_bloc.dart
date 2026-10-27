import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/entry.dart';
import '../../domain/usecases/entry_usecases.dart';

part 'entry_actions_bloc.freezed.dart';

/// Something the user did that the snackbar can undo (§6.11).
@freezed
sealed class UndoableAction with _$UndoableAction {
  const factory UndoableAction.created(Entry entry) = EntryCreated;
  const factory UndoableAction.edited({required Entry before, required Entry after}) = EntryEdited;
  const factory UndoableAction.deleted(Entry entry) = EntryDeletedAction;
}

@freezed
sealed class EntryActionsEvent with _$EntryActionsEvent {
  /// End now, +30m / +1h / +2h, Set end… (ENT-05, S11).
  const factory EntryActionsEvent.endSet(Entry entry, Instant end) = _EndSet;
  const factory EntryActionsEvent.deleteRequested(Entry entry) = _DeleteRequested;
  const factory EntryActionsEvent.undoRequested(UndoableAction action) = _UndoRequested;
}

@freezed
abstract class EntryActionsState with _$EntryActionsState {
  const factory EntryActionsState({
    /// The last undoable action; [sequence] changes on every action so a
    /// listener shows a snackbar even for an identical one.
    UndoableAction? lastAction,
    @Default(0) int sequence,
    Failure? failure,
  }) = _EntryActionsState;
}

/// Quick actions on existing entries outside the editor, and Undo.
class EntryActionsBloc extends Bloc<EntryActionsEvent, EntryActionsState> {
  EntryActionsBloc({required this._setEnd, required this._delete, required this._restore, required this._revert})
    : super(const EntryActionsState()) {
    on<_EndSet>(_onEndSet);
    on<_DeleteRequested>(_onDelete);
    on<_UndoRequested>(_onUndo);
  }

  final SetEntryEnd _setEnd;
  final DeleteEntry _delete;
  final RestoreEntry _restore;
  final RevertEntry _revert;

  void _record(Emitter<EntryActionsState> emit, UndoableAction action) =>
      emit(EntryActionsState(lastAction: action, sequence: state.sequence + 1));

  Future<void> _onEndSet(_EndSet event, Emitter<EntryActionsState> emit) async {
    switch (await _setEnd(SetEntryEndParams(event.entry, event.end))) {
      case DataSuccess(:final data):
        _record(emit, UndoableAction.edited(before: event.entry, after: data));
      case DataError(:final failure):
        emit(state.copyWith(failure: failure));
      default:
        break;
    }
  }

  Future<void> _onDelete(_DeleteRequested event, Emitter<EntryActionsState> emit) async {
    switch (await _delete(event.entry.id)) {
      case DataSuccess(:final data):
        _record(emit, UndoableAction.deleted(data));
      case DataError(:final failure):
        emit(state.copyWith(failure: failure));
      default:
        break;
    }
  }

  Future<void> _onUndo(_UndoRequested event, Emitter<EntryActionsState> emit) async {
    final DataState<Object?> result = switch (event.action) {
      EntryCreated(:final entry) => await _delete(entry.id),
      EntryEdited(:final before) => await _revert(before),
      EntryDeletedAction(:final entry) => await _restore(entry),
    };
    if (result case DataError(:final failure)) emit(state.copyWith(failure: failure));
  }
}
