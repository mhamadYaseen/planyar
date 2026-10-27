import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/label.dart';
import '../../domain/repositories/labels_repository.dart';
import '../../domain/services/label_rules.dart';
import '../../domain/usecases/label_usecases.dart';

part 'label_editor_bloc.freezed.dart';

enum EditorStatus { loading, ready, saving, saved, deleted, failed }

@freezed
sealed class LabelEditorEvent with _$LabelEditorEvent {
  /// Null [labelId] creates a new label.
  const factory LabelEditorEvent.started({String? labelId}) = _Started;
  const factory LabelEditorEvent.nameChanged(String name) = _NameChanged;
  const factory LabelEditorEvent.colorPicked(String colorKey) = _ColorPicked;
  const factory LabelEditorEvent.iconPicked(String? iconKey) = _IconPicked;
  const factory LabelEditorEvent.categoryPicked(String? categoryId) = _CategoryPicked;
  const factory LabelEditorEvent.savePressed() = _SavePressed;
  const factory LabelEditorEvent.archiveToggled() = _ArchiveToggled;
  const factory LabelEditorEvent.deletePressed() = _DeletePressed;
}

@freezed
abstract class LabelEditorState with _$LabelEditorState {
  const factory LabelEditorState({
    @Default(EditorStatus.loading) EditorStatus status,
    Label? original,
    @Default('') String name,
    String? colorKey,
    String? iconKey,
    String? categoryId,
    @Default(<Category>[]) List<Category> categories,

    /// Decides whether Delete is allowed and explains why not (LBL-04, J20).
    LabelUsage? usage,
    NameProblem? nameProblem,
    Failure? failure,
  }) = _LabelEditorState;

  const LabelEditorState._();

  bool get isNew => original == null;

  bool get canDelete => original != null && usage != null && !usage!.isInUse;
}

/// Label editor (S6): name, color, icon, category, archive, delete.
class LabelEditorBloc extends Bloc<LabelEditorEvent, LabelEditorState> {
  LabelEditorBloc({
    required this._labels,
    required this._categories,
    required this._create,
    required this._update,
    required this._setArchived,
    required this._delete,
    required this._usage,
  }) : super(const LabelEditorState()) {
    on<_Started>(_onStarted);
    on<_NameChanged>((e, emit) => emit(state.copyWith(name: e.name, nameProblem: null)));
    on<_ColorPicked>((e, emit) => emit(state.copyWith(colorKey: e.colorKey)));
    on<_IconPicked>((e, emit) => emit(state.copyWith(iconKey: e.iconKey)));
    on<_CategoryPicked>((e, emit) => emit(state.copyWith(categoryId: e.categoryId)));
    on<_SavePressed>(_onSave);
    on<_ArchiveToggled>(_onArchive);
    on<_DeletePressed>(_onDelete);
  }

  final LabelsRepository _labels;
  final WatchCategories _categories;
  final CreateLabel _create;
  final UpdateLabel _update;
  final SetLabelArchived _setArchived;
  final DeleteLabel _delete;
  final GetLabelUsage _usage;

  Future<void> _onStarted(_Started event, Emitter<LabelEditorState> emit) async {
    final id = event.labelId;
    if (id != null) {
      final label = await _labels.byId(id);
      if (label == null) {
        emit(state.copyWith(status: EditorStatus.failed, failure: Failure.notFound('Label $id')));
        return;
      }
      final usage = await _usage(id);
      emit(
        state.copyWith(
          status: EditorStatus.ready,
          original: label,
          name: label.name,
          colorKey: label.colorKey,
          iconKey: label.iconKey,
          categoryId: label.categoryId,
          usage: usage is DataSuccess<LabelUsage> ? usage.data : null,
        ),
      );
    } else {
      emit(state.copyWith(status: EditorStatus.ready));
    }
    await emit.forEach<List<Category>>(
      _categories(const NoParams()),
      onData: (categories) => state.copyWith(categories: categories),
      onError: (_, _) => state,
    );
  }

  Future<void> _onSave(_SavePressed event, Emitter<LabelEditorState> emit) async {
    emit(state.copyWith(status: EditorStatus.saving));
    final original = state.original;
    final result = original == null
        ? await _create(
            CreateLabelParams(
              name: state.name,
              colorKey: state.colorKey,
              iconKey: state.iconKey,
              categoryId: state.categoryId,
            ),
          )
        : await _update(
            original.copyWith(
              name: state.name,
              colorKey: state.colorKey ?? original.colorKey,
              iconKey: state.iconKey,
              categoryId: state.categoryId,
            ),
          );
    switch (result) {
      case DataSuccess():
        emit(state.copyWith(status: EditorStatus.saved));
      case DataError(failure: ValidationFailure(reason: final NameProblem problem)):
        emit(state.copyWith(status: EditorStatus.ready, nameProblem: problem));
      case DataError(:final failure):
        emit(state.copyWith(status: EditorStatus.ready, failure: failure));
      default:
        break;
    }
  }

  Future<void> _onArchive(_ArchiveToggled event, Emitter<LabelEditorState> emit) async {
    final original = state.original;
    if (original == null) return;
    final result = await _setArchived(SetLabelArchivedParams(original.id, archived: !original.isArchived));
    switch (result) {
      case DataSuccess(:final data):
        emit(state.copyWith(original: data, status: EditorStatus.saved));
      case DataError(:final failure):
        emit(state.copyWith(failure: failure));
      default:
        break;
    }
  }

  Future<void> _onDelete(_DeletePressed event, Emitter<LabelEditorState> emit) async {
    final original = state.original;
    if (original == null) return;
    switch (await _delete(original.id)) {
      case DataSuccess():
        emit(state.copyWith(status: EditorStatus.deleted));
      case DataError(failure: ValidationFailure(reason: final LabelUsage usage)):
        emit(state.copyWith(usage: usage));
      case DataError(:final failure):
        emit(state.copyWith(failure: failure));
      default:
        break;
    }
  }
}
