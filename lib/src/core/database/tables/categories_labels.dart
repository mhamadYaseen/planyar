import 'package:drift/drift.dart';

import '../converters.dart';

/// Optional groups above labels and tasks (plan §7.3, CAT-01).
@DataClassName('CategoryRow')
class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  /// Lower-cased, trimmed, whitespace collapsed — enforces unique names.
  TextColumn get nameKey => text().unique()();
  TextColumn get colorKey => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer().map(const InstantConverter())();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (length(name) BETWEEN 1 AND 40 AND name = trim(name))',
    'CHECK (length(name_key) >= 1)',
  ];
}

/// Reusable activity names with a palette color (plan §7.3, LBL-02).
@DataClassName('LabelRow')
@TableIndex(name: 'labels_category_id', columns: {#categoryId})
class Labels extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  /// Unique across active and archived labels.
  TextColumn get nameKey => text().unique()();
  TextColumn get colorKey => text()();
  TextColumn get iconKey => text().nullable()();

  /// The app moves references before deleting a category.
  TextColumn get categoryId => text().nullable().references(Categories, #id)();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer().map(const InstantConverter())();
  IntColumn get updatedAt => integer().map(const InstantConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (length(name) BETWEEN 1 AND 40 AND name = trim(name))',
    'CHECK (length(name_key) >= 1)',
    'CHECK (length(color_key) >= 1)',
  ];
}
