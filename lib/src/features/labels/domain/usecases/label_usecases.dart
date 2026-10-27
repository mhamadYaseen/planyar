import '../../../../core/error/failures.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/usecases/guard.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../../entries/domain/repositories/entries_repository.dart';
import '../entities/label.dart';
import '../repositories/labels_repository.dart';
import '../services/label_rules.dart';

/// Maps repository exceptions to failures the UI can word.
Failure _labelFailure(Object error) => switch (error) {
  NameTakenException() => Failure.validation('Name taken', reason: NameProblem.duplicate),
  LabelInUseException(:final usage) => Failure.validation('Label in use', reason: usage),
  _ => Failure.database(error.toString()),
};

final class WatchLabels implements StreamUseCase<List<Label>, NoParams> {
  const WatchLabels(this._labels);

  final LabelsRepository _labels;

  @override
  Stream<List<Label>> call(NoParams params) => _labels.watchAll();
}

final class CreateLabelParams {
  const CreateLabelParams({required this.name, this.colorKey, this.iconKey, this.categoryId});

  final String name;

  /// Null = next unused palette color (LBL-01).
  final String? colorKey;
  final String? iconKey;
  final String? categoryId;
}

/// Creates a label, from the picker (inline) or the label editor. Name
/// problems come back as `Failure.validation(reason: NameProblem)`.
final class CreateLabel implements UseCase<DataState<Label>, CreateLabelParams> {
  const CreateLabel(this._labels);

  final LabelsRepository _labels;

  @override
  Future<DataState<Label>> call(CreateLabelParams p) async {
    final problem = LabelRules.checkName(p.name, existingKeys: const []);
    if (problem != null) return DataState.error(Failure.validation('Bad name', reason: problem));
    return guard(
      () => _labels.create(name: p.name, colorKey: p.colorKey, iconKey: p.iconKey, categoryId: p.categoryId),
      onError: _labelFailure,
    );
  }
}

/// Saves name, color, icon and category (LBL-02, LBL-03).
final class UpdateLabel implements UseCase<DataState<Label>, Label> {
  const UpdateLabel(this._labels);

  final LabelsRepository _labels;

  @override
  Future<DataState<Label>> call(Label label) async {
    final problem = LabelRules.checkName(label.name, existingKeys: const []);
    if (problem != null) return DataState.error(Failure.validation('Bad name', reason: problem));
    return guard(() => _labels.update(label), onError: _labelFailure);
  }
}

final class SetLabelArchivedParams {
  const SetLabelArchivedParams(this.labelId, {required this.archived});

  final String labelId;
  final bool archived;
}

/// Archive or restore (LBL-05).
final class SetLabelArchived implements UseCase<DataState<Label>, SetLabelArchivedParams> {
  const SetLabelArchived(this._labels);

  final LabelsRepository _labels;

  @override
  Future<DataState<Label>> call(SetLabelArchivedParams p) =>
      guard(() => _labels.setArchived(p.labelId, archived: p.archived), onError: _labelFailure);
}

/// Deletes an unused label; an in-use one fails with its `LabelUsage` (LBL-04).
final class DeleteLabel implements UseCase<DataState<void>, String> {
  const DeleteLabel(this._labels);

  final LabelsRepository _labels;

  @override
  Future<DataState<void>> call(String id) => guard(() => _labels.delete(id), onError: _labelFailure);
}

final class GetLabelUsage implements UseCase<DataState<LabelUsage>, String> {
  const GetLabelUsage(this._labels);

  final LabelsRepository _labels;

  @override
  Future<DataState<LabelUsage>> call(String id) => guard(() => _labels.usage(id));
}

final class WatchLabelEntryCounts implements StreamUseCase<Map<String, int>, NoParams> {
  const WatchLabelEntryCounts(this._labels);

  final LabelsRepository _labels;

  @override
  Stream<Map<String, int>> call(NoParams params) => _labels.watchEntryCounts();
}

/// Label ID → entries in the last 14 days, for picker order (LBL-06).
final class GetRecentLabelUse implements UseCase<Map<String, int>, NoParams> {
  const GetRecentLabelUse(this._entries);

  final EntriesRepository _entries;

  static const window = Duration(days: 14);

  @override
  Future<Map<String, int>> call(NoParams params) async {
    try {
      return await _entries.labelUseSince(Instant.now() - window);
    } on Object {
      return const {}; // Only affects ordering.
    }
  }
}

// Categories

final class WatchCategories implements StreamUseCase<List<Category>, NoParams> {
  const WatchCategories(this._categories);

  final CategoriesRepository _categories;

  @override
  Stream<List<Category>> call(NoParams params) => _categories.watchAll();
}

final class CreateCategoryParams {
  const CreateCategoryParams({required this.name, this.colorKey});

  final String name;
  final String? colorKey;
}

final class CreateCategory implements UseCase<DataState<Category>, CreateCategoryParams> {
  const CreateCategory(this._categories);

  final CategoriesRepository _categories;

  @override
  Future<DataState<Category>> call(CreateCategoryParams p) async {
    final problem = LabelRules.checkName(p.name, existingKeys: const []);
    if (problem != null) return DataState.error(Failure.validation('Bad name', reason: problem));
    return guard(
      () => _categories.create(name: p.name, colorKey: p.colorKey),
      onError: _labelFailure,
    );
  }
}

final class UpdateCategory implements UseCase<DataState<Category>, Category> {
  const UpdateCategory(this._categories);

  final CategoriesRepository _categories;

  @override
  Future<DataState<Category>> call(Category category) async {
    final problem = LabelRules.checkName(category.name, existingKeys: const []);
    if (problem != null) return DataState.error(Failure.validation('Bad name', reason: problem));
    return guard(() => _categories.update(category), onError: _labelFailure);
  }
}

final class GetCategoryUsage implements UseCase<DataState<CategoryUsage>, String> {
  const GetCategoryUsage(this._categories);

  final CategoriesRepository _categories;

  @override
  Future<DataState<CategoryUsage>> call(String id) => guard(() => _categories.usage(id));
}

final class DeleteCategoryParams {
  const DeleteCategoryParams(this.categoryId, {this.moveTo});

  final String categoryId;

  /// Destination for its labels, tasks and overrides; null = Uncategorized.
  final String? moveTo;
}

/// CAT-04.
final class DeleteCategory implements UseCase<DataState<void>, DeleteCategoryParams> {
  const DeleteCategory(this._categories);

  final CategoriesRepository _categories;

  @override
  Future<DataState<void>> call(DeleteCategoryParams p) =>
      guard(() => _categories.delete(p.categoryId, moveTo: p.moveTo));
}
