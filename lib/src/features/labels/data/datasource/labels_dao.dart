import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables/categories_labels.dart';
import '../../../../core/database/tables/entries.dart';
import '../../../../core/database/tables/routines.dart';
import '../../../../core/database/tables/tasks.dart';

part 'labels_dao.g.dart';

/// SQL for labels and categories (plan §7.3, §7.6).
@DriftAccessor(tables: [Labels, Categories, Entries, Routines, RoutineExceptions, Tasks])
class LabelsDao extends DatabaseAccessor<AppDatabase> with _$LabelsDaoMixin {
  LabelsDao(super.attachedDatabase);

  // Labels

  Stream<List<LabelRow>> watchLabels() =>
      (select(labels)..orderBy([(l) => OrderingTerm.asc(l.nameKey), (l) => OrderingTerm.asc(l.id)])).watch();

  Future<List<LabelRow>> allLabels() =>
      (select(labels)..orderBy([(l) => OrderingTerm.asc(l.nameKey), (l) => OrderingTerm.asc(l.id)])).get();

  Future<LabelRow?> labelById(String id) => (select(labels)..where((l) => l.id.equals(id))).getSingleOrNull();

  Future<bool> labelKeyTaken(String nameKey, {String? exceptId}) async {
    final query = select(labels)..where((l) => l.nameKey.equals(nameKey));
    if (exceptId != null) query.where((l) => l.id.equals(exceptId).not());
    return (await query.get()).isNotEmpty;
  }

  Future<List<String>> activeColorKeys() async {
    final rows = await (select(labels)..where((l) => l.isArchived.equals(false))).get();
    return [for (final r in rows) r.colorKey];
  }

  Future<int> _count(TableInfo<Table, Object?> table, Expression<bool> where) async {
    final count = countAll();
    final query = selectOnly(table)
      ..addColumns([count])
      ..where(where);
    return (await query.getSingle()).read(count)!;
  }

  Future<(int, int, int)> labelUsage(String id) async => (
    await _count(entries, entries.labelId.equals(id)),
    await _count(routines, routines.labelId.equals(id)),
    await _count(routineExceptions, routineExceptions.labelId.equals(id)),
  );

  Stream<Map<String, int>> watchEntryCountsByLabel() {
    final count = entries.id.count();
    final query = selectOnly(entries)
      ..addColumns([entries.labelId, count])
      ..groupBy([entries.labelId]);
    return query.watch().map((rows) => {for (final r in rows) r.read(entries.labelId)!: r.read(count)!});
  }

  Future<void> insertLabel(LabelsCompanion row) => into(labels).insert(row);

  Future<void> replaceLabel(LabelsCompanion row) => update(labels).replace(row);

  Future<int> deleteLabel(String id) => (delete(labels)..where((l) => l.id.equals(id))).go();

  // Categories

  Stream<List<CategoryRow>> watchCategories() =>
      (select(categories)..orderBy([(c) => OrderingTerm.asc(c.nameKey), (c) => OrderingTerm.asc(c.id)])).watch();

  Future<List<CategoryRow>> allCategories() =>
      (select(categories)..orderBy([(c) => OrderingTerm.asc(c.nameKey), (c) => OrderingTerm.asc(c.id)])).get();

  Future<bool> categoryKeyTaken(String nameKey, {String? exceptId}) async {
    final query = select(categories)..where((c) => c.nameKey.equals(nameKey));
    if (exceptId != null) query.where((c) => c.id.equals(exceptId).not());
    return (await query.get()).isNotEmpty;
  }

  Future<(int, int, int)> categoryUsage(String id) async => (
    await _count(labels, labels.categoryId.equals(id)),
    await _count(tasks, tasks.categoryId.equals(id)),
    await _count(entries, entries.categoryOverrideId.equals(id)),
  );

  Future<void> insertCategory(CategoriesCompanion row) => into(categories).insert(row);

  Future<void> replaceCategory(CategoriesCompanion row) => update(categories).replace(row);

  /// CAT-04: move references, then delete, in one transaction.
  Future<void> deleteCategoryMovingTo(String id, String? moveTo, int nowMs) => transaction(() async {
    await (update(labels)..where((l) => l.categoryId.equals(id))).write(
      LabelsCompanion.custom(categoryId: Variable<String>(moveTo), updatedAt: Variable<int>(nowMs)),
    );
    await (update(tasks)..where((t) => t.categoryId.equals(id))).write(
      TasksCompanion.custom(categoryId: Variable<String>(moveTo), updatedAt: Variable<int>(nowMs)),
    );
    await (update(entries)..where((e) => e.categoryOverrideId.equals(id))).write(
      EntriesCompanion.custom(categoryOverrideId: Variable<String>(moveTo), updatedAt: Variable<int>(nowMs)),
    );
    await (delete(categories)..where((c) => c.id.equals(id))).go();
  });
}
