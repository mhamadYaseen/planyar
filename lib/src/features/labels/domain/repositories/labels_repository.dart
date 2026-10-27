import '../entities/label.dart';

/// Thrown when a label or category name is already used (LBL-02, CAT-01).
final class NameTakenException implements Exception {
  const NameTakenException(this.name);

  final String name;

  @override
  String toString() => 'NameTakenException($name)';
}

/// Thrown when deleting a label that entries or routines still use (LBL-04).
final class LabelInUseException implements Exception {
  const LabelInUseException(this.usage);

  final LabelUsage usage;

  @override
  String toString() => 'LabelInUseException($usage)';
}

abstract interface class LabelsRepository {
  /// All labels, archived included, alphabetical.
  Stream<List<Label>> watchAll();

  Future<List<Label>> all();

  Future<Label?> byId(String id);

  /// Creates a label; picks the next unused palette color when [colorKey] is
  /// null (LBL-01). Throws [NameTakenException] — also for archived names.
  Future<Label> create({required String name, String? colorKey, String? iconKey, String? categoryId});

  /// Saves name, color, icon and category. Renames apply everywhere because
  /// entries reference the ID (LBL-03). Throws [NameTakenException].
  Future<Label> update(Label label);

  Future<Label> setArchived(String id, {required bool archived});

  Future<LabelUsage> usage(String id);

  /// Label ID → entries using it (Labels & categories list, S5).
  Stream<Map<String, int>> watchEntryCounts();

  /// Only for unused labels; throws [LabelInUseException] otherwise.
  Future<void> delete(String id);
}

/// What still points at a category before it's deleted (CAT-04).
final class CategoryUsage {
  const CategoryUsage({this.labels = 0, this.tasks = 0, this.entryOverrides = 0});

  final int labels;
  final int tasks;
  final int entryOverrides;

  bool get isInUse => labels + tasks + entryOverrides > 0;
}

abstract interface class CategoriesRepository {
  Stream<List<Category>> watchAll();

  Future<List<Category>> all();

  /// Throws [NameTakenException].
  Future<Category> create({required String name, String? colorKey});

  /// Throws [NameTakenException].
  Future<Category> update(Category category);

  Future<CategoryUsage> usage(String id);

  /// Moves labels, tasks and entry overrides to [moveTo] (null =
  /// Uncategorized), then deletes — all in one transaction (CAT-04).
  Future<void> delete(String id, {String? moveTo});
}
