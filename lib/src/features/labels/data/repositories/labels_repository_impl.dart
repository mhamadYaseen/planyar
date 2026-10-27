import '../../../../core/time/instant.dart';
import '../../../../core/utils/id_generator.dart';
import '../../domain/entities/label.dart';
import '../../domain/repositories/labels_repository.dart';
import '../../domain/services/label_rules.dart';
import '../datasource/labels_dao.dart';
import 'label_mapper.dart';

final class LabelsRepositoryImpl implements LabelsRepository {
  LabelsRepositoryImpl(this._dao, this._ids);

  final LabelsDao _dao;
  final IdGenerator _ids;

  @override
  Stream<List<Label>> watchAll() => _dao.watchLabels().map((rows) => [for (final r in rows) r.toEntity()]);

  @override
  Future<List<Label>> all() async => [for (final r in await _dao.allLabels()) r.toEntity()];

  @override
  Future<Label?> byId(String id) async => (await _dao.labelById(id))?.toEntity();

  @override
  Future<Label> create({required String name, String? colorKey, String? iconKey, String? categoryId}) =>
      _dao.transaction(() async {
        final clean = LabelRules.cleanName(name);
        final key = LabelRules.nameKeyOf(clean);
        if (await _dao.labelKeyTaken(key)) throw NameTakenException(clean);
        final now = Instant.now();
        final label = Label(
          id: _ids.newId(),
          name: clean,
          nameKey: key,
          colorKey: colorKey ?? LabelRules.nextColorKey(await _dao.activeColorKeys()),
          iconKey: iconKey,
          categoryId: categoryId,
          createdAt: now,
          updatedAt: now,
        );
        await _dao.insertLabel(label.toCompanion());
        return label;
      });

  @override
  Future<Label> update(Label label) => _dao.transaction(() async {
    final clean = LabelRules.cleanName(label.name);
    final key = LabelRules.nameKeyOf(clean);
    if (await _dao.labelKeyTaken(key, exceptId: label.id)) throw NameTakenException(clean);
    final updated = label.copyWith(name: clean, nameKey: key, updatedAt: Instant.now());
    await _dao.replaceLabel(updated.toCompanion());
    return updated;
  });

  @override
  Future<Label> setArchived(String id, {required bool archived}) => _dao.transaction(() async {
    final row = await _dao.labelById(id);
    if (row == null) throw StateError('No label $id');
    final updated = row.toEntity().copyWith(isArchived: archived, updatedAt: Instant.now());
    await _dao.replaceLabel(updated.toCompanion());
    return updated;
  });

  @override
  Future<LabelUsage> usage(String id) async {
    final (entries, routines, exceptions) = await _dao.labelUsage(id);
    return LabelUsage(entries: entries, routines: routines, routineExceptions: exceptions);
  }

  @override
  Stream<Map<String, int>> watchEntryCounts() => _dao.watchEntryCountsByLabel();

  @override
  Future<void> delete(String id) => _dao.transaction(() async {
    final current = await usage(id);
    if (current.isInUse) throw LabelInUseException(current);
    await _dao.deleteLabel(id);
  });
}

final class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl(this._dao, this._ids);

  final LabelsDao _dao;
  final IdGenerator _ids;

  @override
  Stream<List<Category>> watchAll() => _dao.watchCategories().map((rows) => [for (final r in rows) r.toEntity()]);

  @override
  Future<List<Category>> all() async => [for (final r in await _dao.allCategories()) r.toEntity()];

  @override
  Future<Category> create({required String name, String? colorKey}) => _dao.transaction(() async {
    final clean = LabelRules.cleanName(name);
    final key = LabelRules.nameKeyOf(clean);
    if (await _dao.categoryKeyTaken(key)) throw NameTakenException(clean);
    final now = Instant.now();
    final category = Category(
      id: _ids.newId(),
      name: clean,
      nameKey: key,
      colorKey: colorKey,
      createdAt: now,
      updatedAt: now,
    );
    await _dao.insertCategory(category.toCompanion());
    return category;
  });

  @override
  Future<Category> update(Category category) => _dao.transaction(() async {
    final clean = LabelRules.cleanName(category.name);
    final key = LabelRules.nameKeyOf(clean);
    if (await _dao.categoryKeyTaken(key, exceptId: category.id)) throw NameTakenException(clean);
    final updated = category.copyWith(name: clean, nameKey: key, updatedAt: Instant.now());
    await _dao.replaceCategory(updated.toCompanion());
    return updated;
  });

  @override
  Future<CategoryUsage> usage(String id) async {
    final (labels, tasks, overrides) = await _dao.categoryUsage(id);
    return CategoryUsage(labels: labels, tasks: tasks, entryOverrides: overrides);
  }

  @override
  Future<void> delete(String id, {String? moveTo}) => _dao.deleteCategoryMovingTo(id, moveTo, Instant.now().utcMs);
}
