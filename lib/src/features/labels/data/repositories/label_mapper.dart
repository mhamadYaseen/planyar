import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/label.dart';

extension LabelRowMapper on LabelRow {
  Label toEntity() => Label(
    id: id,
    name: name,
    nameKey: nameKey,
    colorKey: colorKey,
    iconKey: iconKey,
    categoryId: categoryId,
    isArchived: isArchived,
    sortOrder: sortOrder,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension LabelEntityMapper on Label {
  LabelsCompanion toCompanion() => LabelsCompanion(
    id: Value(id),
    name: Value(name),
    nameKey: Value(nameKey),
    colorKey: Value(colorKey),
    iconKey: Value(iconKey),
    categoryId: Value(categoryId),
    isArchived: Value(isArchived),
    sortOrder: Value(sortOrder),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
  );
}

extension CategoryRowMapper on CategoryRow {
  Category toEntity() => Category(
    id: id,
    name: name,
    nameKey: nameKey,
    colorKey: colorKey,
    sortOrder: sortOrder,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension CategoryEntityMapper on Category {
  CategoriesCompanion toCompanion() => CategoriesCompanion(
    id: Value(id),
    name: Value(name),
    nameKey: Value(nameKey),
    colorKey: Value(colorKey),
    sortOrder: Value(sortOrder),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
  );
}
