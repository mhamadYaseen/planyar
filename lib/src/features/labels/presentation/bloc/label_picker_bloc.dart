import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/label.dart';
import '../../domain/services/label_rules.dart';
import '../../domain/usecases/label_usecases.dart';

part 'label_picker_bloc.freezed.dart';

@freezed
sealed class LabelPickerEvent with _$LabelPickerEvent {
  const factory LabelPickerEvent.started() = _Started;
  const factory LabelPickerEvent.queryChanged(String query) = _QueryChanged;

  /// The "Create '…'" row (LBL-01, J3).
  const factory LabelPickerEvent.createPressed() = _CreatePressed;

  /// The "Restore archived '…'?" row (LBL-05).
  const factory LabelPickerEvent.restorePressed(Label label) = _RestorePressed;
}

@freezed
abstract class LabelPickerState with _$LabelPickerState {
  const factory LabelPickerState({
    @Default(true) bool loading,
    @Default(<Label>[]) List<Label> labels,
    @Default(<String, int>{}) Map<String, int> recentUse,
    @Default('') String query,
    @Default(<Label>[]) List<Label> quickChips,

    /// The list under the search field: everything when the query is empty.
    @Default(<Label>[]) List<Label> results,
    @Default(CreateOption.none()) CreateOption createOption,

    /// A label created or restored here — the sheet returns it.
    Label? picked,
    Failure? failure,
  }) = _LabelPickerState;
}

/// The label picker sheet (S4): search, recent chips, inline create (LBL-06).
class LabelPickerBloc extends Bloc<LabelPickerEvent, LabelPickerState> {
  LabelPickerBloc({
    required this._watchLabels,
    required this._recentUse,
    required this._create,
    required this._setArchived,
  }) : super(const LabelPickerState()) {
    on<_Started>(_onStarted);
    on<_QueryChanged>((event, emit) => emit(_refresh(state.copyWith(query: event.query))));
    on<_CreatePressed>(_onCreate);
    on<_RestorePressed>(_onRestore);
  }

  final WatchLabels _watchLabels;
  final GetRecentLabelUse _recentUse;
  final CreateLabel _create;
  final SetLabelArchived _setArchived;

  Future<void> _onStarted(_Started event, Emitter<LabelPickerState> emit) async {
    final recent = await _recentUse(const NoParams());
    await emit.forEach<List<Label>>(
      _watchLabels(const NoParams()),
      onData: (labels) => _refresh(state.copyWith(loading: false, labels: labels, recentUse: recent)),
      onError: (error, _) => state.copyWith(loading: false, failure: Failure.database(error.toString())),
    );
  }

  LabelPickerState _refresh(LabelPickerState s) {
    final picker = LabelRules.picker(s.labels, recentUse: s.recentUse);
    final hasQuery = LabelRules.cleanName(s.query).isNotEmpty;
    return s.copyWith(
      quickChips: picker.quickChips,
      results: hasQuery ? LabelRules.search(s.labels, s.query) : picker.all,
      createOption: LabelRules.createOption(s.query, s.labels),
    );
  }

  Future<void> _onCreate(_CreatePressed event, Emitter<LabelPickerState> emit) async {
    if (state.createOption case CreateNewLabel(:final name)) {
      switch (await _create(CreateLabelParams(name: name))) {
        case DataSuccess(:final data):
          emit(state.copyWith(picked: data));
        case DataError(:final failure):
          emit(state.copyWith(failure: failure));
        default:
          break;
      }
    }
  }

  Future<void> _onRestore(_RestorePressed event, Emitter<LabelPickerState> emit) async {
    switch (await _setArchived(SetLabelArchivedParams(event.label.id, archived: false))) {
      case DataSuccess(:final data):
        emit(state.copyWith(picked: data));
      case DataError(:final failure):
        emit(state.copyWith(failure: failure));
      default:
        break;
    }
  }
}
