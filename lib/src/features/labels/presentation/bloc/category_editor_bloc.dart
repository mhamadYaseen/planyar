import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/label.dart';
import '../../domain/repositories/labels_repository.dart';
import '../../domain/services/label_rules.dart';
import '../../domain/usecases/label_usecases.dart';
import 'label_editor_bloc.dart' show EditorStatus;

part 'category_editor_bloc.freezed.dart';

@freezed
sealed class CategoryEditorEvent with _$CategoryEditorEvent {
  const factory CategoryEditorEvent.started({String? categoryId}) = _Started;
  const factory CategoryEditorEvent.nameChanged(String name) = _NameChanged;
  const factory CategoryEditorEvent.colorPicked(String? colorKey) = _ColorPicked;
  const factory CategoryEditorEvent.savePressed() = _SavePressed;

  /// After the user chose where its labels, tasks and overrides go (CAT-04).
  const factory CategoryEditorEvent.deleteConfirmed({String? moveTo}) = _DeleteConfirmed;
}

@freezed
abstract class CategoryEditorState with _$CategoryEditorState {
  const factory CategoryEditorState({
    @Default(EditorStatus.loading) EditorStatus status,
    Category? original,
    @Default('') String name,
    String? colorKey,
    CategoryUsage? usage,

    /// Other categories, as destinations for a delete.
    @Default(<Category>[]) List<Category> others,
    NameProblem? nameProblem,
    Failure? failure,
  }) = _CategoryEditorState;

  const CategoryEditorState._();

  bool get isNew => original == null;
}

/// Category editor (S7).
class CategoryEditorBloc extends Bloc<CategoryEditorEvent, CategoryEditorState> {
  CategoryEditorBloc({
    required this._categories,
    required this._create,
    required this._update,
    required this._usage,
    required this._delete,
  }) : super(const CategoryEditorState()) {
    on<_Started>(_onStarted);
    on<_NameChanged>((e, emit) => emit(state.copyWith(name: e.name, nameProblem: null)));
    on<_ColorPicked>((e, emit) => emit(state.copyWith(colorKey: e.colorKey)));
    on<_SavePressed>(_onSave);
    on<_DeleteConfirmed>(_onDelete);
  }

  final CategoriesRepository _categories;
  final CreateCategory _create;
  final UpdateCategory _update;
  final GetCategoryUsage _usage;
  final DeleteCategory _delete;

  Future<void> _onStarted(_Started event, Emitter<CategoryEditorState> emit) async {
    final all = await _categories.all();
    final id = event.categoryId;
    if (id == null) {
      emit(state.copyWith(status: EditorStatus.ready, others: all));
      return;
    }
    final category = all.where((c) => c.id == id).firstOrNull;
    if (category == null) {
      emit(state.copyWith(status: EditorStatus.failed, failure: Failure.notFound('Category $id')));
      return;
    }
    final usage = await _usage(id);
    emit(
      state.copyWith(
        status: EditorStatus.ready,
        original: category,
        name: category.name,
        colorKey: category.colorKey,
        usage: usage is DataSuccess<CategoryUsage> ? usage.data : null,
        others: all.where((c) => c.id != id).toList(),
      ),
    );
  }

  Future<void> _onSave(_SavePressed event, Emitter<CategoryEditorState> emit) async {
    emit(state.copyWith(status: EditorStatus.saving));
    final original = state.original;
    final result = original == null
        ? await _create(CreateCategoryParams(name: state.name, colorKey: state.colorKey))
        : await _update(original.copyWith(name: state.name, colorKey: state.colorKey));
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

  Future<void> _onDelete(_DeleteConfirmed event, Emitter<CategoryEditorState> emit) async {
    final original = state.original;
    if (original == null) return;
    switch (await _delete(DeleteCategoryParams(original.id, moveTo: event.moveTo))) {
      case DataSuccess():
        emit(state.copyWith(status: EditorStatus.deleted));
      case DataError(:final failure):
        emit(state.copyWith(failure: failure));
      default:
        break;
    }
  }
}
