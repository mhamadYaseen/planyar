// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameKeyMeta = const VerificationMeta(
    'nameKey',
  );
  @override
  late final GeneratedColumn<String> nameKey = GeneratedColumn<String>(
    'name_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _colorKeyMeta = const VerificationMeta(
    'colorKey',
  );
  @override
  late final GeneratedColumn<String> colorKey = GeneratedColumn<String>(
    'color_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($CategoriesTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($CategoriesTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    nameKey,
    colorKey,
    sortOrder,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_key')) {
      context.handle(
        _nameKeyMeta,
        nameKey.isAcceptableOrUnknown(data['name_key']!, _nameKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_nameKeyMeta);
    }
    if (data.containsKey('color_key')) {
      context.handle(
        _colorKeyMeta,
        colorKey.isAcceptableOrUnknown(data['color_key']!, _colorKeyMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_key'],
      )!,
      colorKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_key'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: $CategoriesTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $CategoriesTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static TypeConverter<Instant, int> $convertercreatedAt =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class CategoryRow extends DataClass implements Insertable<CategoryRow> {
  final String id;
  final String name;

  /// Lower-cased, trimmed, whitespace collapsed — enforces unique names.
  final String nameKey;
  final String? colorKey;
  final int sortOrder;
  final Instant createdAt;
  final Instant updatedAt;
  const CategoryRow({
    required this.id,
    required this.name,
    required this.nameKey,
    this.colorKey,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_key'] = Variable<String>(nameKey);
    if (!nullToAbsent || colorKey != null) {
      map['color_key'] = Variable<String>(colorKey);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    {
      map['created_at'] = Variable<int>(
        $CategoriesTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $CategoriesTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      nameKey: Value(nameKey),
      colorKey: colorKey == null && nullToAbsent
          ? const Value.absent()
          : Value(colorKey),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameKey: serializer.fromJson<String>(json['nameKey']),
      colorKey: serializer.fromJson<String?>(json['colorKey']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<Instant>(json['createdAt']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameKey': serializer.toJson<String>(nameKey),
      'colorKey': serializer.toJson<String?>(colorKey),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<Instant>(createdAt),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  CategoryRow copyWith({
    String? id,
    String? name,
    String? nameKey,
    Value<String?> colorKey = const Value.absent(),
    int? sortOrder,
    Instant? createdAt,
    Instant? updatedAt,
  }) => CategoryRow(
    id: id ?? this.id,
    name: name ?? this.name,
    nameKey: nameKey ?? this.nameKey,
    colorKey: colorKey.present ? colorKey.value : this.colorKey,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CategoryRow copyWithCompanion(CategoriesCompanion data) {
    return CategoryRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nameKey: data.nameKey.present ? data.nameKey.value : this.nameKey,
      colorKey: data.colorKey.present ? data.colorKey.value : this.colorKey,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameKey: $nameKey, ')
          ..write('colorKey: $colorKey, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, nameKey, colorKey, sortOrder, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameKey == this.nameKey &&
          other.colorKey == this.colorKey &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesCompanion extends UpdateCompanion<CategoryRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameKey;
  final Value<String?> colorKey;
  final Value<int> sortOrder;
  final Value<Instant> createdAt;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameKey = const Value.absent(),
    this.colorKey = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    required String nameKey,
    this.colorKey = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required Instant createdAt,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       nameKey = Value(nameKey),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CategoryRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameKey,
    Expression<String>? colorKey,
    Expression<int>? sortOrder,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameKey != null) 'name_key': nameKey,
      if (colorKey != null) 'color_key': colorKey,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? nameKey,
    Value<String?>? colorKey,
    Value<int>? sortOrder,
    Value<Instant>? createdAt,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameKey: nameKey ?? this.nameKey,
      colorKey: colorKey ?? this.colorKey,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameKey.present) {
      map['name_key'] = Variable<String>(nameKey.value);
    }
    if (colorKey.present) {
      map['color_key'] = Variable<String>(colorKey.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $CategoriesTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $CategoriesTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameKey: $nameKey, ')
          ..write('colorKey: $colorKey, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LabelsTable extends Labels with TableInfo<$LabelsTable, LabelRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LabelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameKeyMeta = const VerificationMeta(
    'nameKey',
  );
  @override
  late final GeneratedColumn<String> nameKey = GeneratedColumn<String>(
    'name_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _colorKeyMeta = const VerificationMeta(
    'colorKey',
  );
  @override
  late final GeneratedColumn<String> colorKey = GeneratedColumn<String>(
    'color_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconKeyMeta = const VerificationMeta(
    'iconKey',
  );
  @override
  late final GeneratedColumn<String> iconKey = GeneratedColumn<String>(
    'icon_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($LabelsTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($LabelsTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    nameKey,
    colorKey,
    iconKey,
    categoryId,
    isArchived,
    sortOrder,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'labels';
  @override
  VerificationContext validateIntegrity(
    Insertable<LabelRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_key')) {
      context.handle(
        _nameKeyMeta,
        nameKey.isAcceptableOrUnknown(data['name_key']!, _nameKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_nameKeyMeta);
    }
    if (data.containsKey('color_key')) {
      context.handle(
        _colorKeyMeta,
        colorKey.isAcceptableOrUnknown(data['color_key']!, _colorKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_colorKeyMeta);
    }
    if (data.containsKey('icon_key')) {
      context.handle(
        _iconKeyMeta,
        iconKey.isAcceptableOrUnknown(data['icon_key']!, _iconKeyMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LabelRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LabelRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_key'],
      )!,
      colorKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_key'],
      )!,
      iconKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_key'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: $LabelsTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $LabelsTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $LabelsTable createAlias(String alias) {
    return $LabelsTable(attachedDatabase, alias);
  }

  static TypeConverter<Instant, int> $convertercreatedAt =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class LabelRow extends DataClass implements Insertable<LabelRow> {
  final String id;
  final String name;

  /// Unique across active and archived labels.
  final String nameKey;
  final String colorKey;
  final String? iconKey;

  /// The app moves references before deleting a category.
  final String? categoryId;
  final bool isArchived;
  final int sortOrder;
  final Instant createdAt;
  final Instant updatedAt;
  const LabelRow({
    required this.id,
    required this.name,
    required this.nameKey,
    required this.colorKey,
    this.iconKey,
    this.categoryId,
    required this.isArchived,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_key'] = Variable<String>(nameKey);
    map['color_key'] = Variable<String>(colorKey);
    if (!nullToAbsent || iconKey != null) {
      map['icon_key'] = Variable<String>(iconKey);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['sort_order'] = Variable<int>(sortOrder);
    {
      map['created_at'] = Variable<int>(
        $LabelsTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $LabelsTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  LabelsCompanion toCompanion(bool nullToAbsent) {
    return LabelsCompanion(
      id: Value(id),
      name: Value(name),
      nameKey: Value(nameKey),
      colorKey: Value(colorKey),
      iconKey: iconKey == null && nullToAbsent
          ? const Value.absent()
          : Value(iconKey),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      isArchived: Value(isArchived),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LabelRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LabelRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameKey: serializer.fromJson<String>(json['nameKey']),
      colorKey: serializer.fromJson<String>(json['colorKey']),
      iconKey: serializer.fromJson<String?>(json['iconKey']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<Instant>(json['createdAt']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameKey': serializer.toJson<String>(nameKey),
      'colorKey': serializer.toJson<String>(colorKey),
      'iconKey': serializer.toJson<String?>(iconKey),
      'categoryId': serializer.toJson<String?>(categoryId),
      'isArchived': serializer.toJson<bool>(isArchived),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<Instant>(createdAt),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  LabelRow copyWith({
    String? id,
    String? name,
    String? nameKey,
    String? colorKey,
    Value<String?> iconKey = const Value.absent(),
    Value<String?> categoryId = const Value.absent(),
    bool? isArchived,
    int? sortOrder,
    Instant? createdAt,
    Instant? updatedAt,
  }) => LabelRow(
    id: id ?? this.id,
    name: name ?? this.name,
    nameKey: nameKey ?? this.nameKey,
    colorKey: colorKey ?? this.colorKey,
    iconKey: iconKey.present ? iconKey.value : this.iconKey,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    isArchived: isArchived ?? this.isArchived,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LabelRow copyWithCompanion(LabelsCompanion data) {
    return LabelRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nameKey: data.nameKey.present ? data.nameKey.value : this.nameKey,
      colorKey: data.colorKey.present ? data.colorKey.value : this.colorKey,
      iconKey: data.iconKey.present ? data.iconKey.value : this.iconKey,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LabelRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameKey: $nameKey, ')
          ..write('colorKey: $colorKey, ')
          ..write('iconKey: $iconKey, ')
          ..write('categoryId: $categoryId, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    nameKey,
    colorKey,
    iconKey,
    categoryId,
    isArchived,
    sortOrder,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LabelRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameKey == this.nameKey &&
          other.colorKey == this.colorKey &&
          other.iconKey == this.iconKey &&
          other.categoryId == this.categoryId &&
          other.isArchived == this.isArchived &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LabelsCompanion extends UpdateCompanion<LabelRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameKey;
  final Value<String> colorKey;
  final Value<String?> iconKey;
  final Value<String?> categoryId;
  final Value<bool> isArchived;
  final Value<int> sortOrder;
  final Value<Instant> createdAt;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const LabelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameKey = const Value.absent(),
    this.colorKey = const Value.absent(),
    this.iconKey = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LabelsCompanion.insert({
    required String id,
    required String name,
    required String nameKey,
    required String colorKey,
    this.iconKey = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required Instant createdAt,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       nameKey = Value(nameKey),
       colorKey = Value(colorKey),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LabelRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameKey,
    Expression<String>? colorKey,
    Expression<String>? iconKey,
    Expression<String>? categoryId,
    Expression<bool>? isArchived,
    Expression<int>? sortOrder,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameKey != null) 'name_key': nameKey,
      if (colorKey != null) 'color_key': colorKey,
      if (iconKey != null) 'icon_key': iconKey,
      if (categoryId != null) 'category_id': categoryId,
      if (isArchived != null) 'is_archived': isArchived,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LabelsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? nameKey,
    Value<String>? colorKey,
    Value<String?>? iconKey,
    Value<String?>? categoryId,
    Value<bool>? isArchived,
    Value<int>? sortOrder,
    Value<Instant>? createdAt,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return LabelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameKey: nameKey ?? this.nameKey,
      colorKey: colorKey ?? this.colorKey,
      iconKey: iconKey ?? this.iconKey,
      categoryId: categoryId ?? this.categoryId,
      isArchived: isArchived ?? this.isArchived,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameKey.present) {
      map['name_key'] = Variable<String>(nameKey.value);
    }
    if (colorKey.present) {
      map['color_key'] = Variable<String>(colorKey.value);
    }
    if (iconKey.present) {
      map['icon_key'] = Variable<String>(iconKey.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $LabelsTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $LabelsTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LabelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameKey: $nameKey, ')
          ..write('colorKey: $colorKey, ')
          ..write('iconKey: $iconKey, ')
          ..write('categoryId: $categoryId, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskSeriesTable extends TaskSeries
    with TableInfo<$TaskSeriesTable, TaskSeriesRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskSeriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _freqMeta = const VerificationMeta('freq');
  @override
  late final GeneratedColumn<String> freq = GeneratedColumn<String>(
    'freq',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _intervalMeta = const VerificationMeta(
    'interval',
  );
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
    'interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate, String> anchorDate =
      GeneratedColumn<String>(
        'anchor_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LocalDate>($TaskSeriesTable.$converteranchorDate);
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate?, String> endsOn =
      GeneratedColumn<String>(
        'ends_on',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<LocalDate?>($TaskSeriesTable.$converterendsOnn);
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($TaskSeriesTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($TaskSeriesTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    freq,
    interval,
    mode,
    anchorDate,
    endsOn,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_series';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskSeriesRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('freq')) {
      context.handle(
        _freqMeta,
        freq.isAcceptableOrUnknown(data['freq']!, _freqMeta),
      );
    } else if (isInserting) {
      context.missing(_freqMeta);
    }
    if (data.containsKey('interval')) {
      context.handle(
        _intervalMeta,
        interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta),
      );
    } else if (isInserting) {
      context.missing(_intervalMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskSeriesRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskSeriesRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      freq: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}freq'],
      )!,
      interval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      anchorDate: $TaskSeriesTable.$converteranchorDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}anchor_date'],
        )!,
      ),
      endsOn: $TaskSeriesTable.$converterendsOnn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ends_on'],
        ),
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: $TaskSeriesTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $TaskSeriesTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $TaskSeriesTable createAlias(String alias) {
    return $TaskSeriesTable(attachedDatabase, alias);
  }

  static TypeConverter<LocalDate, String> $converteranchorDate =
      const LocalDateConverter();
  static TypeConverter<LocalDate, String> $converterendsOn =
      const LocalDateConverter();
  static TypeConverter<LocalDate?, String?> $converterendsOnn =
      NullAwareTypeConverter.wrap($converterendsOn);
  static TypeConverter<Instant, int> $convertercreatedAt =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class TaskSeriesRow extends DataClass implements Insertable<TaskSeriesRow> {
  final String id;

  /// `daily` | `weekly` | `monthly` | `yearly`.
  final String freq;
  final int interval;

  /// `schedule` | `after_completion`.
  final String mode;

  /// The first instance's start; defines day of month / weekday.
  final LocalDate anchorDate;
  final LocalDate? endsOn;

  /// False after "stop repeating" or when the end is reached.
  final bool isActive;
  final Instant createdAt;
  final Instant updatedAt;
  const TaskSeriesRow({
    required this.id,
    required this.freq,
    required this.interval,
    required this.mode,
    required this.anchorDate,
    this.endsOn,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['freq'] = Variable<String>(freq);
    map['interval'] = Variable<int>(interval);
    map['mode'] = Variable<String>(mode);
    {
      map['anchor_date'] = Variable<String>(
        $TaskSeriesTable.$converteranchorDate.toSql(anchorDate),
      );
    }
    if (!nullToAbsent || endsOn != null) {
      map['ends_on'] = Variable<String>(
        $TaskSeriesTable.$converterendsOnn.toSql(endsOn),
      );
    }
    map['is_active'] = Variable<bool>(isActive);
    {
      map['created_at'] = Variable<int>(
        $TaskSeriesTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $TaskSeriesTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  TaskSeriesCompanion toCompanion(bool nullToAbsent) {
    return TaskSeriesCompanion(
      id: Value(id),
      freq: Value(freq),
      interval: Value(interval),
      mode: Value(mode),
      anchorDate: Value(anchorDate),
      endsOn: endsOn == null && nullToAbsent
          ? const Value.absent()
          : Value(endsOn),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TaskSeriesRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskSeriesRow(
      id: serializer.fromJson<String>(json['id']),
      freq: serializer.fromJson<String>(json['freq']),
      interval: serializer.fromJson<int>(json['interval']),
      mode: serializer.fromJson<String>(json['mode']),
      anchorDate: serializer.fromJson<LocalDate>(json['anchorDate']),
      endsOn: serializer.fromJson<LocalDate?>(json['endsOn']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<Instant>(json['createdAt']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'freq': serializer.toJson<String>(freq),
      'interval': serializer.toJson<int>(interval),
      'mode': serializer.toJson<String>(mode),
      'anchorDate': serializer.toJson<LocalDate>(anchorDate),
      'endsOn': serializer.toJson<LocalDate?>(endsOn),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<Instant>(createdAt),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  TaskSeriesRow copyWith({
    String? id,
    String? freq,
    int? interval,
    String? mode,
    LocalDate? anchorDate,
    Value<LocalDate?> endsOn = const Value.absent(),
    bool? isActive,
    Instant? createdAt,
    Instant? updatedAt,
  }) => TaskSeriesRow(
    id: id ?? this.id,
    freq: freq ?? this.freq,
    interval: interval ?? this.interval,
    mode: mode ?? this.mode,
    anchorDate: anchorDate ?? this.anchorDate,
    endsOn: endsOn.present ? endsOn.value : this.endsOn,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TaskSeriesRow copyWithCompanion(TaskSeriesCompanion data) {
    return TaskSeriesRow(
      id: data.id.present ? data.id.value : this.id,
      freq: data.freq.present ? data.freq.value : this.freq,
      interval: data.interval.present ? data.interval.value : this.interval,
      mode: data.mode.present ? data.mode.value : this.mode,
      anchorDate: data.anchorDate.present
          ? data.anchorDate.value
          : this.anchorDate,
      endsOn: data.endsOn.present ? data.endsOn.value : this.endsOn,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskSeriesRow(')
          ..write('id: $id, ')
          ..write('freq: $freq, ')
          ..write('interval: $interval, ')
          ..write('mode: $mode, ')
          ..write('anchorDate: $anchorDate, ')
          ..write('endsOn: $endsOn, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    freq,
    interval,
    mode,
    anchorDate,
    endsOn,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskSeriesRow &&
          other.id == this.id &&
          other.freq == this.freq &&
          other.interval == this.interval &&
          other.mode == this.mode &&
          other.anchorDate == this.anchorDate &&
          other.endsOn == this.endsOn &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TaskSeriesCompanion extends UpdateCompanion<TaskSeriesRow> {
  final Value<String> id;
  final Value<String> freq;
  final Value<int> interval;
  final Value<String> mode;
  final Value<LocalDate> anchorDate;
  final Value<LocalDate?> endsOn;
  final Value<bool> isActive;
  final Value<Instant> createdAt;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const TaskSeriesCompanion({
    this.id = const Value.absent(),
    this.freq = const Value.absent(),
    this.interval = const Value.absent(),
    this.mode = const Value.absent(),
    this.anchorDate = const Value.absent(),
    this.endsOn = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskSeriesCompanion.insert({
    required String id,
    required String freq,
    required int interval,
    required String mode,
    required LocalDate anchorDate,
    this.endsOn = const Value.absent(),
    this.isActive = const Value.absent(),
    required Instant createdAt,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       freq = Value(freq),
       interval = Value(interval),
       mode = Value(mode),
       anchorDate = Value(anchorDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TaskSeriesRow> custom({
    Expression<String>? id,
    Expression<String>? freq,
    Expression<int>? interval,
    Expression<String>? mode,
    Expression<String>? anchorDate,
    Expression<String>? endsOn,
    Expression<bool>? isActive,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (freq != null) 'freq': freq,
      if (interval != null) 'interval': interval,
      if (mode != null) 'mode': mode,
      if (anchorDate != null) 'anchor_date': anchorDate,
      if (endsOn != null) 'ends_on': endsOn,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskSeriesCompanion copyWith({
    Value<String>? id,
    Value<String>? freq,
    Value<int>? interval,
    Value<String>? mode,
    Value<LocalDate>? anchorDate,
    Value<LocalDate?>? endsOn,
    Value<bool>? isActive,
    Value<Instant>? createdAt,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return TaskSeriesCompanion(
      id: id ?? this.id,
      freq: freq ?? this.freq,
      interval: interval ?? this.interval,
      mode: mode ?? this.mode,
      anchorDate: anchorDate ?? this.anchorDate,
      endsOn: endsOn ?? this.endsOn,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (freq.present) {
      map['freq'] = Variable<String>(freq.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (anchorDate.present) {
      map['anchor_date'] = Variable<String>(
        $TaskSeriesTable.$converteranchorDate.toSql(anchorDate.value),
      );
    }
    if (endsOn.present) {
      map['ends_on'] = Variable<String>(
        $TaskSeriesTable.$converterendsOnn.toSql(endsOn.value),
      );
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $TaskSeriesTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $TaskSeriesTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskSeriesCompanion(')
          ..write('id: $id, ')
          ..write('freq: $freq, ')
          ..write('interval: $interval, ')
          ..write('mode: $mode, ')
          ..write('anchorDate: $anchorDate, ')
          ..write('endsOn: $endsOn, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, TaskRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<String> seriesId = GeneratedColumn<String>(
    'series_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES task_series (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate, String> startDate =
      GeneratedColumn<String>(
        'start_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LocalDate>($TasksTable.$converterstartDate);
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate?, String> deadlineDate =
      GeneratedColumn<String>(
        'deadline_date',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<LocalDate?>($TasksTable.$converterdeadlineDaten);
  static const VerificationMeta _deadlineMinuteMeta = const VerificationMeta(
    'deadlineMinute',
  );
  @override
  late final GeneratedColumn<int> deadlineMinute = GeneratedColumn<int>(
    'deadline_minute',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('normal'),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _estimateMinMeta = const VerificationMeta(
    'estimateMin',
  );
  @override
  late final GeneratedColumn<int> estimateMin = GeneratedColumn<int>(
    'estimate_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actualAdjustMinMeta = const VerificationMeta(
    'actualAdjustMin',
  );
  @override
  late final GeneratedColumn<int> actualAdjustMin = GeneratedColumn<int>(
    'actual_adjust_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant?, int> completedAt =
      GeneratedColumn<int>(
        'completed_at',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<Instant?>($TasksTable.$convertercompletedAtn);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($TasksTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($TasksTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    seriesId,
    title,
    notes,
    startDate,
    deadlineDate,
    deadlineMinute,
    status,
    priority,
    categoryId,
    estimateMin,
    actualAdjustMin,
    completedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('deadline_minute')) {
      context.handle(
        _deadlineMinuteMeta,
        deadlineMinute.isAcceptableOrUnknown(
          data['deadline_minute']!,
          _deadlineMinuteMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('estimate_min')) {
      context.handle(
        _estimateMinMeta,
        estimateMin.isAcceptableOrUnknown(
          data['estimate_min']!,
          _estimateMinMeta,
        ),
      );
    }
    if (data.containsKey('actual_adjust_min')) {
      context.handle(
        _actualAdjustMinMeta,
        actualAdjustMin.isAcceptableOrUnknown(
          data['actual_adjust_min']!,
          _actualAdjustMinMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}series_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      startDate: $TasksTable.$converterstartDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}start_date'],
        )!,
      ),
      deadlineDate: $TasksTable.$converterdeadlineDaten.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}deadline_date'],
        ),
      ),
      deadlineMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deadline_minute'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      estimateMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimate_min'],
      ),
      actualAdjustMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}actual_adjust_min'],
      )!,
      completedAt: $TasksTable.$convertercompletedAtn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}completed_at'],
        ),
      ),
      createdAt: $TasksTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $TasksTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }

  static TypeConverter<LocalDate, String> $converterstartDate =
      const LocalDateConverter();
  static TypeConverter<LocalDate, String> $converterdeadlineDate =
      const LocalDateConverter();
  static TypeConverter<LocalDate?, String?> $converterdeadlineDaten =
      NullAwareTypeConverter.wrap($converterdeadlineDate);
  static TypeConverter<Instant, int> $convertercompletedAt =
      const InstantConverter();
  static TypeConverter<Instant?, int?> $convertercompletedAtn =
      NullAwareTypeConverter.wrap($convertercompletedAt);
  static TypeConverter<Instant, int> $convertercreatedAt =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class TaskRow extends DataClass implements Insertable<TaskRow> {
  final String id;
  final String? seriesId;
  final String title;
  final String? notes;
  final LocalDate startDate;
  final LocalDate? deadlineDate;

  /// Optional time of day for the deadline, minutes since midnight.
  final int? deadlineMinute;

  /// `not_started` | `in_progress` | `completed`.
  final String status;

  /// `low` | `normal` | `high`.
  final String priority;
  final String? categoryId;
  final int? estimateMin;

  /// Manual adjustment for unlogged work; may be negative (TSK-11).
  final int actualAdjustMin;
  final Instant? completedAt;
  final Instant createdAt;
  final Instant updatedAt;
  const TaskRow({
    required this.id,
    this.seriesId,
    required this.title,
    this.notes,
    required this.startDate,
    this.deadlineDate,
    this.deadlineMinute,
    required this.status,
    required this.priority,
    this.categoryId,
    this.estimateMin,
    required this.actualAdjustMin,
    this.completedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || seriesId != null) {
      map['series_id'] = Variable<String>(seriesId);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    {
      map['start_date'] = Variable<String>(
        $TasksTable.$converterstartDate.toSql(startDate),
      );
    }
    if (!nullToAbsent || deadlineDate != null) {
      map['deadline_date'] = Variable<String>(
        $TasksTable.$converterdeadlineDaten.toSql(deadlineDate),
      );
    }
    if (!nullToAbsent || deadlineMinute != null) {
      map['deadline_minute'] = Variable<int>(deadlineMinute);
    }
    map['status'] = Variable<String>(status);
    map['priority'] = Variable<String>(priority);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || estimateMin != null) {
      map['estimate_min'] = Variable<int>(estimateMin);
    }
    map['actual_adjust_min'] = Variable<int>(actualAdjustMin);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<int>(
        $TasksTable.$convertercompletedAtn.toSql(completedAt),
      );
    }
    {
      map['created_at'] = Variable<int>(
        $TasksTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $TasksTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      seriesId: seriesId == null && nullToAbsent
          ? const Value.absent()
          : Value(seriesId),
      title: Value(title),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      startDate: Value(startDate),
      deadlineDate: deadlineDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deadlineDate),
      deadlineMinute: deadlineMinute == null && nullToAbsent
          ? const Value.absent()
          : Value(deadlineMinute),
      status: Value(status),
      priority: Value(priority),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      estimateMin: estimateMin == null && nullToAbsent
          ? const Value.absent()
          : Value(estimateMin),
      actualAdjustMin: Value(actualAdjustMin),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TaskRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskRow(
      id: serializer.fromJson<String>(json['id']),
      seriesId: serializer.fromJson<String?>(json['seriesId']),
      title: serializer.fromJson<String>(json['title']),
      notes: serializer.fromJson<String?>(json['notes']),
      startDate: serializer.fromJson<LocalDate>(json['startDate']),
      deadlineDate: serializer.fromJson<LocalDate?>(json['deadlineDate']),
      deadlineMinute: serializer.fromJson<int?>(json['deadlineMinute']),
      status: serializer.fromJson<String>(json['status']),
      priority: serializer.fromJson<String>(json['priority']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      estimateMin: serializer.fromJson<int?>(json['estimateMin']),
      actualAdjustMin: serializer.fromJson<int>(json['actualAdjustMin']),
      completedAt: serializer.fromJson<Instant?>(json['completedAt']),
      createdAt: serializer.fromJson<Instant>(json['createdAt']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'seriesId': serializer.toJson<String?>(seriesId),
      'title': serializer.toJson<String>(title),
      'notes': serializer.toJson<String?>(notes),
      'startDate': serializer.toJson<LocalDate>(startDate),
      'deadlineDate': serializer.toJson<LocalDate?>(deadlineDate),
      'deadlineMinute': serializer.toJson<int?>(deadlineMinute),
      'status': serializer.toJson<String>(status),
      'priority': serializer.toJson<String>(priority),
      'categoryId': serializer.toJson<String?>(categoryId),
      'estimateMin': serializer.toJson<int?>(estimateMin),
      'actualAdjustMin': serializer.toJson<int>(actualAdjustMin),
      'completedAt': serializer.toJson<Instant?>(completedAt),
      'createdAt': serializer.toJson<Instant>(createdAt),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  TaskRow copyWith({
    String? id,
    Value<String?> seriesId = const Value.absent(),
    String? title,
    Value<String?> notes = const Value.absent(),
    LocalDate? startDate,
    Value<LocalDate?> deadlineDate = const Value.absent(),
    Value<int?> deadlineMinute = const Value.absent(),
    String? status,
    String? priority,
    Value<String?> categoryId = const Value.absent(),
    Value<int?> estimateMin = const Value.absent(),
    int? actualAdjustMin,
    Value<Instant?> completedAt = const Value.absent(),
    Instant? createdAt,
    Instant? updatedAt,
  }) => TaskRow(
    id: id ?? this.id,
    seriesId: seriesId.present ? seriesId.value : this.seriesId,
    title: title ?? this.title,
    notes: notes.present ? notes.value : this.notes,
    startDate: startDate ?? this.startDate,
    deadlineDate: deadlineDate.present ? deadlineDate.value : this.deadlineDate,
    deadlineMinute: deadlineMinute.present
        ? deadlineMinute.value
        : this.deadlineMinute,
    status: status ?? this.status,
    priority: priority ?? this.priority,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    estimateMin: estimateMin.present ? estimateMin.value : this.estimateMin,
    actualAdjustMin: actualAdjustMin ?? this.actualAdjustMin,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TaskRow copyWithCompanion(TasksCompanion data) {
    return TaskRow(
      id: data.id.present ? data.id.value : this.id,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      title: data.title.present ? data.title.value : this.title,
      notes: data.notes.present ? data.notes.value : this.notes,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      deadlineDate: data.deadlineDate.present
          ? data.deadlineDate.value
          : this.deadlineDate,
      deadlineMinute: data.deadlineMinute.present
          ? data.deadlineMinute.value
          : this.deadlineMinute,
      status: data.status.present ? data.status.value : this.status,
      priority: data.priority.present ? data.priority.value : this.priority,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      estimateMin: data.estimateMin.present
          ? data.estimateMin.value
          : this.estimateMin,
      actualAdjustMin: data.actualAdjustMin.present
          ? data.actualAdjustMin.value
          : this.actualAdjustMin,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskRow(')
          ..write('id: $id, ')
          ..write('seriesId: $seriesId, ')
          ..write('title: $title, ')
          ..write('notes: $notes, ')
          ..write('startDate: $startDate, ')
          ..write('deadlineDate: $deadlineDate, ')
          ..write('deadlineMinute: $deadlineMinute, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('categoryId: $categoryId, ')
          ..write('estimateMin: $estimateMin, ')
          ..write('actualAdjustMin: $actualAdjustMin, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    seriesId,
    title,
    notes,
    startDate,
    deadlineDate,
    deadlineMinute,
    status,
    priority,
    categoryId,
    estimateMin,
    actualAdjustMin,
    completedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskRow &&
          other.id == this.id &&
          other.seriesId == this.seriesId &&
          other.title == this.title &&
          other.notes == this.notes &&
          other.startDate == this.startDate &&
          other.deadlineDate == this.deadlineDate &&
          other.deadlineMinute == this.deadlineMinute &&
          other.status == this.status &&
          other.priority == this.priority &&
          other.categoryId == this.categoryId &&
          other.estimateMin == this.estimateMin &&
          other.actualAdjustMin == this.actualAdjustMin &&
          other.completedAt == this.completedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TasksCompanion extends UpdateCompanion<TaskRow> {
  final Value<String> id;
  final Value<String?> seriesId;
  final Value<String> title;
  final Value<String?> notes;
  final Value<LocalDate> startDate;
  final Value<LocalDate?> deadlineDate;
  final Value<int?> deadlineMinute;
  final Value<String> status;
  final Value<String> priority;
  final Value<String?> categoryId;
  final Value<int?> estimateMin;
  final Value<int> actualAdjustMin;
  final Value<Instant?> completedAt;
  final Value<Instant> createdAt;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.title = const Value.absent(),
    this.notes = const Value.absent(),
    this.startDate = const Value.absent(),
    this.deadlineDate = const Value.absent(),
    this.deadlineMinute = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.estimateMin = const Value.absent(),
    this.actualAdjustMin = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    this.seriesId = const Value.absent(),
    required String title,
    this.notes = const Value.absent(),
    required LocalDate startDate,
    this.deadlineDate = const Value.absent(),
    this.deadlineMinute = const Value.absent(),
    required String status,
    this.priority = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.estimateMin = const Value.absent(),
    this.actualAdjustMin = const Value.absent(),
    this.completedAt = const Value.absent(),
    required Instant createdAt,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       startDate = Value(startDate),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TaskRow> custom({
    Expression<String>? id,
    Expression<String>? seriesId,
    Expression<String>? title,
    Expression<String>? notes,
    Expression<String>? startDate,
    Expression<String>? deadlineDate,
    Expression<int>? deadlineMinute,
    Expression<String>? status,
    Expression<String>? priority,
    Expression<String>? categoryId,
    Expression<int>? estimateMin,
    Expression<int>? actualAdjustMin,
    Expression<int>? completedAt,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (seriesId != null) 'series_id': seriesId,
      if (title != null) 'title': title,
      if (notes != null) 'notes': notes,
      if (startDate != null) 'start_date': startDate,
      if (deadlineDate != null) 'deadline_date': deadlineDate,
      if (deadlineMinute != null) 'deadline_minute': deadlineMinute,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
      if (categoryId != null) 'category_id': categoryId,
      if (estimateMin != null) 'estimate_min': estimateMin,
      if (actualAdjustMin != null) 'actual_adjust_min': actualAdjustMin,
      if (completedAt != null) 'completed_at': completedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith({
    Value<String>? id,
    Value<String?>? seriesId,
    Value<String>? title,
    Value<String?>? notes,
    Value<LocalDate>? startDate,
    Value<LocalDate?>? deadlineDate,
    Value<int?>? deadlineMinute,
    Value<String>? status,
    Value<String>? priority,
    Value<String?>? categoryId,
    Value<int?>? estimateMin,
    Value<int>? actualAdjustMin,
    Value<Instant?>? completedAt,
    Value<Instant>? createdAt,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      seriesId: seriesId ?? this.seriesId,
      title: title ?? this.title,
      notes: notes ?? this.notes,
      startDate: startDate ?? this.startDate,
      deadlineDate: deadlineDate ?? this.deadlineDate,
      deadlineMinute: deadlineMinute ?? this.deadlineMinute,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      categoryId: categoryId ?? this.categoryId,
      estimateMin: estimateMin ?? this.estimateMin,
      actualAdjustMin: actualAdjustMin ?? this.actualAdjustMin,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<String>(seriesId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(
        $TasksTable.$converterstartDate.toSql(startDate.value),
      );
    }
    if (deadlineDate.present) {
      map['deadline_date'] = Variable<String>(
        $TasksTable.$converterdeadlineDaten.toSql(deadlineDate.value),
      );
    }
    if (deadlineMinute.present) {
      map['deadline_minute'] = Variable<int>(deadlineMinute.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (estimateMin.present) {
      map['estimate_min'] = Variable<int>(estimateMin.value);
    }
    if (actualAdjustMin.present) {
      map['actual_adjust_min'] = Variable<int>(actualAdjustMin.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<int>(
        $TasksTable.$convertercompletedAtn.toSql(completedAt.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $TasksTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $TasksTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('seriesId: $seriesId, ')
          ..write('title: $title, ')
          ..write('notes: $notes, ')
          ..write('startDate: $startDate, ')
          ..write('deadlineDate: $deadlineDate, ')
          ..write('deadlineMinute: $deadlineMinute, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('categoryId: $categoryId, ')
          ..write('estimateMin: $estimateMin, ')
          ..write('actualAdjustMin: $actualAdjustMin, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutinesTable extends Routines
    with TableInfo<$RoutinesTable, RoutineRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _labelIdMeta = const VerificationMeta(
    'labelId',
  );
  @override
  late final GeneratedColumn<String> labelId = GeneratedColumn<String>(
    'label_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES labels (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _startMinuteMeta = const VerificationMeta(
    'startMinute',
  );
  @override
  late final GeneratedColumn<int> startMinute = GeneratedColumn<int>(
    'start_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMinuteMeta = const VerificationMeta(
    'endMinute',
  );
  @override
  late final GeneratedColumn<int> endMinute = GeneratedColumn<int>(
    'end_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recurrenceFreqMeta = const VerificationMeta(
    'recurrenceFreq',
  );
  @override
  late final GeneratedColumn<String> recurrenceFreq = GeneratedColumn<String>(
    'recurrence_freq',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('daily'),
  );
  static const VerificationMeta _recurrenceIntervalMeta =
      const VerificationMeta('recurrenceInterval');
  @override
  late final GeneratedColumn<int> recurrenceInterval = GeneratedColumn<int>(
    'recurrence_interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _weekdaysMaskMeta = const VerificationMeta(
    'weekdaysMask',
  );
  @override
  late final GeneratedColumn<int> weekdaysMask = GeneratedColumn<int>(
    'weekdays_mask',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate, String> startsOn =
      GeneratedColumn<String>(
        'starts_on',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LocalDate>($RoutinesTable.$converterstartsOn);
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate?, String> endsOn =
      GeneratedColumn<String>(
        'ends_on',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<LocalDate?>($RoutinesTable.$converterendsOnn);
  static const VerificationMeta _isPausedMeta = const VerificationMeta(
    'isPaused',
  );
  @override
  late final GeneratedColumn<bool> isPaused = GeneratedColumn<bool>(
    'is_paused',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_paused" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reminderOffsetMinMeta = const VerificationMeta(
    'reminderOffsetMin',
  );
  @override
  late final GeneratedColumn<int> reminderOffsetMin = GeneratedColumn<int>(
    'reminder_offset_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reminderIgnoreQuietMeta =
      const VerificationMeta('reminderIgnoreQuiet');
  @override
  late final GeneratedColumn<bool> reminderIgnoreQuiet = GeneratedColumn<bool>(
    'reminder_ignore_quiet',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminder_ignore_quiet" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate?, String>
  generatedThrough = GeneratedColumn<String>(
    'generated_through',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<LocalDate?>($RoutinesTable.$convertergeneratedThroughn);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($RoutinesTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($RoutinesTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    labelId,
    startMinute,
    endMinute,
    recurrenceFreq,
    recurrenceInterval,
    weekdaysMask,
    startsOn,
    endsOn,
    isPaused,
    isArchived,
    note,
    reminderOffsetMin,
    reminderIgnoreQuiet,
    generatedThrough,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routines';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('label_id')) {
      context.handle(
        _labelIdMeta,
        labelId.isAcceptableOrUnknown(data['label_id']!, _labelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_labelIdMeta);
    }
    if (data.containsKey('start_minute')) {
      context.handle(
        _startMinuteMeta,
        startMinute.isAcceptableOrUnknown(
          data['start_minute']!,
          _startMinuteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startMinuteMeta);
    }
    if (data.containsKey('end_minute')) {
      context.handle(
        _endMinuteMeta,
        endMinute.isAcceptableOrUnknown(data['end_minute']!, _endMinuteMeta),
      );
    } else if (isInserting) {
      context.missing(_endMinuteMeta);
    }
    if (data.containsKey('recurrence_freq')) {
      context.handle(
        _recurrenceFreqMeta,
        recurrenceFreq.isAcceptableOrUnknown(
          data['recurrence_freq']!,
          _recurrenceFreqMeta,
        ),
      );
    }
    if (data.containsKey('recurrence_interval')) {
      context.handle(
        _recurrenceIntervalMeta,
        recurrenceInterval.isAcceptableOrUnknown(
          data['recurrence_interval']!,
          _recurrenceIntervalMeta,
        ),
      );
    }
    if (data.containsKey('weekdays_mask')) {
      context.handle(
        _weekdaysMaskMeta,
        weekdaysMask.isAcceptableOrUnknown(
          data['weekdays_mask']!,
          _weekdaysMaskMeta,
        ),
      );
    }
    if (data.containsKey('is_paused')) {
      context.handle(
        _isPausedMeta,
        isPaused.isAcceptableOrUnknown(data['is_paused']!, _isPausedMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('reminder_offset_min')) {
      context.handle(
        _reminderOffsetMinMeta,
        reminderOffsetMin.isAcceptableOrUnknown(
          data['reminder_offset_min']!,
          _reminderOffsetMinMeta,
        ),
      );
    }
    if (data.containsKey('reminder_ignore_quiet')) {
      context.handle(
        _reminderIgnoreQuietMeta,
        reminderIgnoreQuiet.isAcceptableOrUnknown(
          data['reminder_ignore_quiet']!,
          _reminderIgnoreQuietMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      labelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_id'],
      )!,
      startMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minute'],
      )!,
      endMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minute'],
      )!,
      recurrenceFreq: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence_freq'],
      )!,
      recurrenceInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recurrence_interval'],
      )!,
      weekdaysMask: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekdays_mask'],
      ),
      startsOn: $RoutinesTable.$converterstartsOn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}starts_on'],
        )!,
      ),
      endsOn: $RoutinesTable.$converterendsOnn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ends_on'],
        ),
      ),
      isPaused: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_paused'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      reminderOffsetMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_offset_min'],
      ),
      reminderIgnoreQuiet: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminder_ignore_quiet'],
      )!,
      generatedThrough: $RoutinesTable.$convertergeneratedThroughn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}generated_through'],
        ),
      ),
      createdAt: $RoutinesTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $RoutinesTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $RoutinesTable createAlias(String alias) {
    return $RoutinesTable(attachedDatabase, alias);
  }

  static TypeConverter<LocalDate, String> $converterstartsOn =
      const LocalDateConverter();
  static TypeConverter<LocalDate, String> $converterendsOn =
      const LocalDateConverter();
  static TypeConverter<LocalDate?, String?> $converterendsOnn =
      NullAwareTypeConverter.wrap($converterendsOn);
  static TypeConverter<LocalDate, String> $convertergeneratedThrough =
      const LocalDateConverter();
  static TypeConverter<LocalDate?, String?> $convertergeneratedThroughn =
      NullAwareTypeConverter.wrap($convertergeneratedThrough);
  static TypeConverter<Instant, int> $convertercreatedAt =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class RoutineRow extends DataClass implements Insertable<RoutineRow> {
  final String id;

  /// Defaults to the label name in the UI.
  final String? name;
  final String labelId;

  /// Minutes since local midnight. `end ≤ start` means it ends the next day.
  final int startMinute;
  final int endMinute;

  /// `daily` in v1; weekdays come later through [weekdaysMask].
  final String recurrenceFreq;
  final int recurrenceInterval;
  final int? weekdaysMask;
  final LocalDate startsOn;
  final LocalDate? endsOn;
  final bool isPaused;

  /// Ended / deleted-with-history routines.
  final bool isArchived;
  final String? note;

  /// NULL = off; 0 = at start; 5–60 = minutes before.
  final int? reminderOffsetMin;
  final bool reminderIgnoreQuiet;

  /// Device bookkeeping; never imported (recomputed).
  final LocalDate? generatedThrough;
  final Instant createdAt;
  final Instant updatedAt;
  const RoutineRow({
    required this.id,
    this.name,
    required this.labelId,
    required this.startMinute,
    required this.endMinute,
    required this.recurrenceFreq,
    required this.recurrenceInterval,
    this.weekdaysMask,
    required this.startsOn,
    this.endsOn,
    required this.isPaused,
    required this.isArchived,
    this.note,
    this.reminderOffsetMin,
    required this.reminderIgnoreQuiet,
    this.generatedThrough,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['label_id'] = Variable<String>(labelId);
    map['start_minute'] = Variable<int>(startMinute);
    map['end_minute'] = Variable<int>(endMinute);
    map['recurrence_freq'] = Variable<String>(recurrenceFreq);
    map['recurrence_interval'] = Variable<int>(recurrenceInterval);
    if (!nullToAbsent || weekdaysMask != null) {
      map['weekdays_mask'] = Variable<int>(weekdaysMask);
    }
    {
      map['starts_on'] = Variable<String>(
        $RoutinesTable.$converterstartsOn.toSql(startsOn),
      );
    }
    if (!nullToAbsent || endsOn != null) {
      map['ends_on'] = Variable<String>(
        $RoutinesTable.$converterendsOnn.toSql(endsOn),
      );
    }
    map['is_paused'] = Variable<bool>(isPaused);
    map['is_archived'] = Variable<bool>(isArchived);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || reminderOffsetMin != null) {
      map['reminder_offset_min'] = Variable<int>(reminderOffsetMin);
    }
    map['reminder_ignore_quiet'] = Variable<bool>(reminderIgnoreQuiet);
    if (!nullToAbsent || generatedThrough != null) {
      map['generated_through'] = Variable<String>(
        $RoutinesTable.$convertergeneratedThroughn.toSql(generatedThrough),
      );
    }
    {
      map['created_at'] = Variable<int>(
        $RoutinesTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $RoutinesTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  RoutinesCompanion toCompanion(bool nullToAbsent) {
    return RoutinesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      labelId: Value(labelId),
      startMinute: Value(startMinute),
      endMinute: Value(endMinute),
      recurrenceFreq: Value(recurrenceFreq),
      recurrenceInterval: Value(recurrenceInterval),
      weekdaysMask: weekdaysMask == null && nullToAbsent
          ? const Value.absent()
          : Value(weekdaysMask),
      startsOn: Value(startsOn),
      endsOn: endsOn == null && nullToAbsent
          ? const Value.absent()
          : Value(endsOn),
      isPaused: Value(isPaused),
      isArchived: Value(isArchived),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      reminderOffsetMin: reminderOffsetMin == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderOffsetMin),
      reminderIgnoreQuiet: Value(reminderIgnoreQuiet),
      generatedThrough: generatedThrough == null && nullToAbsent
          ? const Value.absent()
          : Value(generatedThrough),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RoutineRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      labelId: serializer.fromJson<String>(json['labelId']),
      startMinute: serializer.fromJson<int>(json['startMinute']),
      endMinute: serializer.fromJson<int>(json['endMinute']),
      recurrenceFreq: serializer.fromJson<String>(json['recurrenceFreq']),
      recurrenceInterval: serializer.fromJson<int>(json['recurrenceInterval']),
      weekdaysMask: serializer.fromJson<int?>(json['weekdaysMask']),
      startsOn: serializer.fromJson<LocalDate>(json['startsOn']),
      endsOn: serializer.fromJson<LocalDate?>(json['endsOn']),
      isPaused: serializer.fromJson<bool>(json['isPaused']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      note: serializer.fromJson<String?>(json['note']),
      reminderOffsetMin: serializer.fromJson<int?>(json['reminderOffsetMin']),
      reminderIgnoreQuiet: serializer.fromJson<bool>(
        json['reminderIgnoreQuiet'],
      ),
      generatedThrough: serializer.fromJson<LocalDate?>(
        json['generatedThrough'],
      ),
      createdAt: serializer.fromJson<Instant>(json['createdAt']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
      'labelId': serializer.toJson<String>(labelId),
      'startMinute': serializer.toJson<int>(startMinute),
      'endMinute': serializer.toJson<int>(endMinute),
      'recurrenceFreq': serializer.toJson<String>(recurrenceFreq),
      'recurrenceInterval': serializer.toJson<int>(recurrenceInterval),
      'weekdaysMask': serializer.toJson<int?>(weekdaysMask),
      'startsOn': serializer.toJson<LocalDate>(startsOn),
      'endsOn': serializer.toJson<LocalDate?>(endsOn),
      'isPaused': serializer.toJson<bool>(isPaused),
      'isArchived': serializer.toJson<bool>(isArchived),
      'note': serializer.toJson<String?>(note),
      'reminderOffsetMin': serializer.toJson<int?>(reminderOffsetMin),
      'reminderIgnoreQuiet': serializer.toJson<bool>(reminderIgnoreQuiet),
      'generatedThrough': serializer.toJson<LocalDate?>(generatedThrough),
      'createdAt': serializer.toJson<Instant>(createdAt),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  RoutineRow copyWith({
    String? id,
    Value<String?> name = const Value.absent(),
    String? labelId,
    int? startMinute,
    int? endMinute,
    String? recurrenceFreq,
    int? recurrenceInterval,
    Value<int?> weekdaysMask = const Value.absent(),
    LocalDate? startsOn,
    Value<LocalDate?> endsOn = const Value.absent(),
    bool? isPaused,
    bool? isArchived,
    Value<String?> note = const Value.absent(),
    Value<int?> reminderOffsetMin = const Value.absent(),
    bool? reminderIgnoreQuiet,
    Value<LocalDate?> generatedThrough = const Value.absent(),
    Instant? createdAt,
    Instant? updatedAt,
  }) => RoutineRow(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    labelId: labelId ?? this.labelId,
    startMinute: startMinute ?? this.startMinute,
    endMinute: endMinute ?? this.endMinute,
    recurrenceFreq: recurrenceFreq ?? this.recurrenceFreq,
    recurrenceInterval: recurrenceInterval ?? this.recurrenceInterval,
    weekdaysMask: weekdaysMask.present ? weekdaysMask.value : this.weekdaysMask,
    startsOn: startsOn ?? this.startsOn,
    endsOn: endsOn.present ? endsOn.value : this.endsOn,
    isPaused: isPaused ?? this.isPaused,
    isArchived: isArchived ?? this.isArchived,
    note: note.present ? note.value : this.note,
    reminderOffsetMin: reminderOffsetMin.present
        ? reminderOffsetMin.value
        : this.reminderOffsetMin,
    reminderIgnoreQuiet: reminderIgnoreQuiet ?? this.reminderIgnoreQuiet,
    generatedThrough: generatedThrough.present
        ? generatedThrough.value
        : this.generatedThrough,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RoutineRow copyWithCompanion(RoutinesCompanion data) {
    return RoutineRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      labelId: data.labelId.present ? data.labelId.value : this.labelId,
      startMinute: data.startMinute.present
          ? data.startMinute.value
          : this.startMinute,
      endMinute: data.endMinute.present ? data.endMinute.value : this.endMinute,
      recurrenceFreq: data.recurrenceFreq.present
          ? data.recurrenceFreq.value
          : this.recurrenceFreq,
      recurrenceInterval: data.recurrenceInterval.present
          ? data.recurrenceInterval.value
          : this.recurrenceInterval,
      weekdaysMask: data.weekdaysMask.present
          ? data.weekdaysMask.value
          : this.weekdaysMask,
      startsOn: data.startsOn.present ? data.startsOn.value : this.startsOn,
      endsOn: data.endsOn.present ? data.endsOn.value : this.endsOn,
      isPaused: data.isPaused.present ? data.isPaused.value : this.isPaused,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      note: data.note.present ? data.note.value : this.note,
      reminderOffsetMin: data.reminderOffsetMin.present
          ? data.reminderOffsetMin.value
          : this.reminderOffsetMin,
      reminderIgnoreQuiet: data.reminderIgnoreQuiet.present
          ? data.reminderIgnoreQuiet.value
          : this.reminderIgnoreQuiet,
      generatedThrough: data.generatedThrough.present
          ? data.generatedThrough.value
          : this.generatedThrough,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('labelId: $labelId, ')
          ..write('startMinute: $startMinute, ')
          ..write('endMinute: $endMinute, ')
          ..write('recurrenceFreq: $recurrenceFreq, ')
          ..write('recurrenceInterval: $recurrenceInterval, ')
          ..write('weekdaysMask: $weekdaysMask, ')
          ..write('startsOn: $startsOn, ')
          ..write('endsOn: $endsOn, ')
          ..write('isPaused: $isPaused, ')
          ..write('isArchived: $isArchived, ')
          ..write('note: $note, ')
          ..write('reminderOffsetMin: $reminderOffsetMin, ')
          ..write('reminderIgnoreQuiet: $reminderIgnoreQuiet, ')
          ..write('generatedThrough: $generatedThrough, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    labelId,
    startMinute,
    endMinute,
    recurrenceFreq,
    recurrenceInterval,
    weekdaysMask,
    startsOn,
    endsOn,
    isPaused,
    isArchived,
    note,
    reminderOffsetMin,
    reminderIgnoreQuiet,
    generatedThrough,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.labelId == this.labelId &&
          other.startMinute == this.startMinute &&
          other.endMinute == this.endMinute &&
          other.recurrenceFreq == this.recurrenceFreq &&
          other.recurrenceInterval == this.recurrenceInterval &&
          other.weekdaysMask == this.weekdaysMask &&
          other.startsOn == this.startsOn &&
          other.endsOn == this.endsOn &&
          other.isPaused == this.isPaused &&
          other.isArchived == this.isArchived &&
          other.note == this.note &&
          other.reminderOffsetMin == this.reminderOffsetMin &&
          other.reminderIgnoreQuiet == this.reminderIgnoreQuiet &&
          other.generatedThrough == this.generatedThrough &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RoutinesCompanion extends UpdateCompanion<RoutineRow> {
  final Value<String> id;
  final Value<String?> name;
  final Value<String> labelId;
  final Value<int> startMinute;
  final Value<int> endMinute;
  final Value<String> recurrenceFreq;
  final Value<int> recurrenceInterval;
  final Value<int?> weekdaysMask;
  final Value<LocalDate> startsOn;
  final Value<LocalDate?> endsOn;
  final Value<bool> isPaused;
  final Value<bool> isArchived;
  final Value<String?> note;
  final Value<int?> reminderOffsetMin;
  final Value<bool> reminderIgnoreQuiet;
  final Value<LocalDate?> generatedThrough;
  final Value<Instant> createdAt;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const RoutinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.labelId = const Value.absent(),
    this.startMinute = const Value.absent(),
    this.endMinute = const Value.absent(),
    this.recurrenceFreq = const Value.absent(),
    this.recurrenceInterval = const Value.absent(),
    this.weekdaysMask = const Value.absent(),
    this.startsOn = const Value.absent(),
    this.endsOn = const Value.absent(),
    this.isPaused = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.note = const Value.absent(),
    this.reminderOffsetMin = const Value.absent(),
    this.reminderIgnoreQuiet = const Value.absent(),
    this.generatedThrough = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutinesCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    required String labelId,
    required int startMinute,
    required int endMinute,
    this.recurrenceFreq = const Value.absent(),
    this.recurrenceInterval = const Value.absent(),
    this.weekdaysMask = const Value.absent(),
    required LocalDate startsOn,
    this.endsOn = const Value.absent(),
    this.isPaused = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.note = const Value.absent(),
    this.reminderOffsetMin = const Value.absent(),
    this.reminderIgnoreQuiet = const Value.absent(),
    this.generatedThrough = const Value.absent(),
    required Instant createdAt,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       labelId = Value(labelId),
       startMinute = Value(startMinute),
       endMinute = Value(endMinute),
       startsOn = Value(startsOn),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<RoutineRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? labelId,
    Expression<int>? startMinute,
    Expression<int>? endMinute,
    Expression<String>? recurrenceFreq,
    Expression<int>? recurrenceInterval,
    Expression<int>? weekdaysMask,
    Expression<String>? startsOn,
    Expression<String>? endsOn,
    Expression<bool>? isPaused,
    Expression<bool>? isArchived,
    Expression<String>? note,
    Expression<int>? reminderOffsetMin,
    Expression<bool>? reminderIgnoreQuiet,
    Expression<String>? generatedThrough,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (labelId != null) 'label_id': labelId,
      if (startMinute != null) 'start_minute': startMinute,
      if (endMinute != null) 'end_minute': endMinute,
      if (recurrenceFreq != null) 'recurrence_freq': recurrenceFreq,
      if (recurrenceInterval != null) 'recurrence_interval': recurrenceInterval,
      if (weekdaysMask != null) 'weekdays_mask': weekdaysMask,
      if (startsOn != null) 'starts_on': startsOn,
      if (endsOn != null) 'ends_on': endsOn,
      if (isPaused != null) 'is_paused': isPaused,
      if (isArchived != null) 'is_archived': isArchived,
      if (note != null) 'note': note,
      if (reminderOffsetMin != null) 'reminder_offset_min': reminderOffsetMin,
      if (reminderIgnoreQuiet != null)
        'reminder_ignore_quiet': reminderIgnoreQuiet,
      if (generatedThrough != null) 'generated_through': generatedThrough,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutinesCompanion copyWith({
    Value<String>? id,
    Value<String?>? name,
    Value<String>? labelId,
    Value<int>? startMinute,
    Value<int>? endMinute,
    Value<String>? recurrenceFreq,
    Value<int>? recurrenceInterval,
    Value<int?>? weekdaysMask,
    Value<LocalDate>? startsOn,
    Value<LocalDate?>? endsOn,
    Value<bool>? isPaused,
    Value<bool>? isArchived,
    Value<String?>? note,
    Value<int?>? reminderOffsetMin,
    Value<bool>? reminderIgnoreQuiet,
    Value<LocalDate?>? generatedThrough,
    Value<Instant>? createdAt,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return RoutinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      labelId: labelId ?? this.labelId,
      startMinute: startMinute ?? this.startMinute,
      endMinute: endMinute ?? this.endMinute,
      recurrenceFreq: recurrenceFreq ?? this.recurrenceFreq,
      recurrenceInterval: recurrenceInterval ?? this.recurrenceInterval,
      weekdaysMask: weekdaysMask ?? this.weekdaysMask,
      startsOn: startsOn ?? this.startsOn,
      endsOn: endsOn ?? this.endsOn,
      isPaused: isPaused ?? this.isPaused,
      isArchived: isArchived ?? this.isArchived,
      note: note ?? this.note,
      reminderOffsetMin: reminderOffsetMin ?? this.reminderOffsetMin,
      reminderIgnoreQuiet: reminderIgnoreQuiet ?? this.reminderIgnoreQuiet,
      generatedThrough: generatedThrough ?? this.generatedThrough,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (labelId.present) {
      map['label_id'] = Variable<String>(labelId.value);
    }
    if (startMinute.present) {
      map['start_minute'] = Variable<int>(startMinute.value);
    }
    if (endMinute.present) {
      map['end_minute'] = Variable<int>(endMinute.value);
    }
    if (recurrenceFreq.present) {
      map['recurrence_freq'] = Variable<String>(recurrenceFreq.value);
    }
    if (recurrenceInterval.present) {
      map['recurrence_interval'] = Variable<int>(recurrenceInterval.value);
    }
    if (weekdaysMask.present) {
      map['weekdays_mask'] = Variable<int>(weekdaysMask.value);
    }
    if (startsOn.present) {
      map['starts_on'] = Variable<String>(
        $RoutinesTable.$converterstartsOn.toSql(startsOn.value),
      );
    }
    if (endsOn.present) {
      map['ends_on'] = Variable<String>(
        $RoutinesTable.$converterendsOnn.toSql(endsOn.value),
      );
    }
    if (isPaused.present) {
      map['is_paused'] = Variable<bool>(isPaused.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (reminderOffsetMin.present) {
      map['reminder_offset_min'] = Variable<int>(reminderOffsetMin.value);
    }
    if (reminderIgnoreQuiet.present) {
      map['reminder_ignore_quiet'] = Variable<bool>(reminderIgnoreQuiet.value);
    }
    if (generatedThrough.present) {
      map['generated_through'] = Variable<String>(
        $RoutinesTable.$convertergeneratedThroughn.toSql(
          generatedThrough.value,
        ),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $RoutinesTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $RoutinesTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('labelId: $labelId, ')
          ..write('startMinute: $startMinute, ')
          ..write('endMinute: $endMinute, ')
          ..write('recurrenceFreq: $recurrenceFreq, ')
          ..write('recurrenceInterval: $recurrenceInterval, ')
          ..write('weekdaysMask: $weekdaysMask, ')
          ..write('startsOn: $startsOn, ')
          ..write('endsOn: $endsOn, ')
          ..write('isPaused: $isPaused, ')
          ..write('isArchived: $isArchived, ')
          ..write('note: $note, ')
          ..write('reminderOffsetMin: $reminderOffsetMin, ')
          ..write('reminderIgnoreQuiet: $reminderIgnoreQuiet, ')
          ..write('generatedThrough: $generatedThrough, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EntriesTable extends Entries with TableInfo<$EntriesTable, EntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelIdMeta = const VerificationMeta(
    'labelId',
  );
  @override
  late final GeneratedColumn<String> labelId = GeneratedColumn<String>(
    'label_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES labels (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _categoryOverrideIdMeta =
      const VerificationMeta('categoryOverrideId');
  @override
  late final GeneratedColumn<String> categoryOverrideId =
      GeneratedColumn<String>(
        'category_override_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories (id)',
        ),
      );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> startUtc =
      GeneratedColumn<int>(
        'start_utc',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($EntriesTable.$converterstartUtc);
  @override
  late final GeneratedColumnWithTypeConverter<Instant?, int> endUtc =
      GeneratedColumn<int>(
        'end_utc',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<Instant?>($EntriesTable.$converterendUtcn);
  static const VerificationMeta _tzIdMeta = const VerificationMeta('tzId');
  @override
  late final GeneratedColumn<String> tzId = GeneratedColumn<String>(
    'tz_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _utcOffsetMinMeta = const VerificationMeta(
    'utcOffsetMin',
  );
  @override
  late final GeneratedColumn<int> utcOffsetMin = GeneratedColumn<int>(
    'utc_offset_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routineIdMeta = const VerificationMeta(
    'routineId',
  );
  @override
  late final GeneratedColumn<String> routineId = GeneratedColumn<String>(
    'routine_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routines (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate?, String>
  occurrenceDate = GeneratedColumn<String>(
    'occurrence_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<LocalDate?>($EntriesTable.$converteroccurrenceDaten);
  static const VerificationMeta _plannedEntryIdMeta = const VerificationMeta(
    'plannedEntryId',
  );
  @override
  late final GeneratedColumn<String> plannedEntryId = GeneratedColumn<String>(
    'planned_entry_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES entries (id) ON DELETE SET NULL',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($EntriesTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($EntriesTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kind,
    labelId,
    categoryOverrideId,
    startUtc,
    endUtc,
    tzId,
    utcOffsetMin,
    note,
    taskId,
    source,
    routineId,
    occurrenceDate,
    plannedEntryId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<EntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('label_id')) {
      context.handle(
        _labelIdMeta,
        labelId.isAcceptableOrUnknown(data['label_id']!, _labelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_labelIdMeta);
    }
    if (data.containsKey('category_override_id')) {
      context.handle(
        _categoryOverrideIdMeta,
        categoryOverrideId.isAcceptableOrUnknown(
          data['category_override_id']!,
          _categoryOverrideIdMeta,
        ),
      );
    }
    if (data.containsKey('tz_id')) {
      context.handle(
        _tzIdMeta,
        tzId.isAcceptableOrUnknown(data['tz_id']!, _tzIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tzIdMeta);
    }
    if (data.containsKey('utc_offset_min')) {
      context.handle(
        _utcOffsetMinMeta,
        utcOffsetMin.isAcceptableOrUnknown(
          data['utc_offset_min']!,
          _utcOffsetMinMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_utcOffsetMinMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('routine_id')) {
      context.handle(
        _routineIdMeta,
        routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta),
      );
    }
    if (data.containsKey('planned_entry_id')) {
      context.handle(
        _plannedEntryIdMeta,
        plannedEntryId.isAcceptableOrUnknown(
          data['planned_entry_id']!,
          _plannedEntryIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      labelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_id'],
      )!,
      categoryOverrideId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_override_id'],
      ),
      startUtc: $EntriesTable.$converterstartUtc.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}start_utc'],
        )!,
      ),
      endUtc: $EntriesTable.$converterendUtcn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}end_utc'],
        ),
      ),
      tzId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tz_id'],
      )!,
      utcOffsetMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}utc_offset_min'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_id'],
      ),
      occurrenceDate: $EntriesTable.$converteroccurrenceDaten.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}occurrence_date'],
        ),
      ),
      plannedEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}planned_entry_id'],
      ),
      createdAt: $EntriesTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $EntriesTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $EntriesTable createAlias(String alias) {
    return $EntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<Instant, int> $converterstartUtc =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterendUtc =
      const InstantConverter();
  static TypeConverter<Instant?, int?> $converterendUtcn =
      NullAwareTypeConverter.wrap($converterendUtc);
  static TypeConverter<LocalDate, String> $converteroccurrenceDate =
      const LocalDateConverter();
  static TypeConverter<LocalDate?, String?> $converteroccurrenceDaten =
      NullAwareTypeConverter.wrap($converteroccurrenceDate);
  static TypeConverter<Instant, int> $convertercreatedAt =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class EntryRow extends DataClass implements Insertable<EntryRow> {
  final String id;

  /// `planned` | `actual`.
  final String kind;

  /// Labels in use can't be deleted (LBL-04).
  final String labelId;
  final String? categoryOverrideId;

  /// UTC ms, minute-aligned.
  final Instant startUtc;

  /// NULL = open entry (§6.9). Otherwise after start and at most 7 days later.
  final Instant? endUtc;

  /// IANA zone and offset at save time — informational only (§6.1).
  final String tzId;
  final int utcOffsetMin;
  final String? note;
  final String? taskId;

  /// `manual` | `routine` | `from_plan`.
  final String source;
  final String? routineId;
  final LocalDate? occurrenceDate;

  /// Set on actual entries logged from a plan (ENT-09).
  final String? plannedEntryId;
  final Instant createdAt;
  final Instant updatedAt;
  const EntryRow({
    required this.id,
    required this.kind,
    required this.labelId,
    this.categoryOverrideId,
    required this.startUtc,
    this.endUtc,
    required this.tzId,
    required this.utcOffsetMin,
    this.note,
    this.taskId,
    required this.source,
    this.routineId,
    this.occurrenceDate,
    this.plannedEntryId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    map['label_id'] = Variable<String>(labelId);
    if (!nullToAbsent || categoryOverrideId != null) {
      map['category_override_id'] = Variable<String>(categoryOverrideId);
    }
    {
      map['start_utc'] = Variable<int>(
        $EntriesTable.$converterstartUtc.toSql(startUtc),
      );
    }
    if (!nullToAbsent || endUtc != null) {
      map['end_utc'] = Variable<int>(
        $EntriesTable.$converterendUtcn.toSql(endUtc),
      );
    }
    map['tz_id'] = Variable<String>(tzId);
    map['utc_offset_min'] = Variable<int>(utcOffsetMin);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<String>(taskId);
    }
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || routineId != null) {
      map['routine_id'] = Variable<String>(routineId);
    }
    if (!nullToAbsent || occurrenceDate != null) {
      map['occurrence_date'] = Variable<String>(
        $EntriesTable.$converteroccurrenceDaten.toSql(occurrenceDate),
      );
    }
    if (!nullToAbsent || plannedEntryId != null) {
      map['planned_entry_id'] = Variable<String>(plannedEntryId);
    }
    {
      map['created_at'] = Variable<int>(
        $EntriesTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $EntriesTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  EntriesCompanion toCompanion(bool nullToAbsent) {
    return EntriesCompanion(
      id: Value(id),
      kind: Value(kind),
      labelId: Value(labelId),
      categoryOverrideId: categoryOverrideId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryOverrideId),
      startUtc: Value(startUtc),
      endUtc: endUtc == null && nullToAbsent
          ? const Value.absent()
          : Value(endUtc),
      tzId: Value(tzId),
      utcOffsetMin: Value(utcOffsetMin),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      taskId: taskId == null && nullToAbsent
          ? const Value.absent()
          : Value(taskId),
      source: Value(source),
      routineId: routineId == null && nullToAbsent
          ? const Value.absent()
          : Value(routineId),
      occurrenceDate: occurrenceDate == null && nullToAbsent
          ? const Value.absent()
          : Value(occurrenceDate),
      plannedEntryId: plannedEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedEntryId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory EntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntryRow(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      labelId: serializer.fromJson<String>(json['labelId']),
      categoryOverrideId: serializer.fromJson<String?>(
        json['categoryOverrideId'],
      ),
      startUtc: serializer.fromJson<Instant>(json['startUtc']),
      endUtc: serializer.fromJson<Instant?>(json['endUtc']),
      tzId: serializer.fromJson<String>(json['tzId']),
      utcOffsetMin: serializer.fromJson<int>(json['utcOffsetMin']),
      note: serializer.fromJson<String?>(json['note']),
      taskId: serializer.fromJson<String?>(json['taskId']),
      source: serializer.fromJson<String>(json['source']),
      routineId: serializer.fromJson<String?>(json['routineId']),
      occurrenceDate: serializer.fromJson<LocalDate?>(json['occurrenceDate']),
      plannedEntryId: serializer.fromJson<String?>(json['plannedEntryId']),
      createdAt: serializer.fromJson<Instant>(json['createdAt']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'labelId': serializer.toJson<String>(labelId),
      'categoryOverrideId': serializer.toJson<String?>(categoryOverrideId),
      'startUtc': serializer.toJson<Instant>(startUtc),
      'endUtc': serializer.toJson<Instant?>(endUtc),
      'tzId': serializer.toJson<String>(tzId),
      'utcOffsetMin': serializer.toJson<int>(utcOffsetMin),
      'note': serializer.toJson<String?>(note),
      'taskId': serializer.toJson<String?>(taskId),
      'source': serializer.toJson<String>(source),
      'routineId': serializer.toJson<String?>(routineId),
      'occurrenceDate': serializer.toJson<LocalDate?>(occurrenceDate),
      'plannedEntryId': serializer.toJson<String?>(plannedEntryId),
      'createdAt': serializer.toJson<Instant>(createdAt),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  EntryRow copyWith({
    String? id,
    String? kind,
    String? labelId,
    Value<String?> categoryOverrideId = const Value.absent(),
    Instant? startUtc,
    Value<Instant?> endUtc = const Value.absent(),
    String? tzId,
    int? utcOffsetMin,
    Value<String?> note = const Value.absent(),
    Value<String?> taskId = const Value.absent(),
    String? source,
    Value<String?> routineId = const Value.absent(),
    Value<LocalDate?> occurrenceDate = const Value.absent(),
    Value<String?> plannedEntryId = const Value.absent(),
    Instant? createdAt,
    Instant? updatedAt,
  }) => EntryRow(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    labelId: labelId ?? this.labelId,
    categoryOverrideId: categoryOverrideId.present
        ? categoryOverrideId.value
        : this.categoryOverrideId,
    startUtc: startUtc ?? this.startUtc,
    endUtc: endUtc.present ? endUtc.value : this.endUtc,
    tzId: tzId ?? this.tzId,
    utcOffsetMin: utcOffsetMin ?? this.utcOffsetMin,
    note: note.present ? note.value : this.note,
    taskId: taskId.present ? taskId.value : this.taskId,
    source: source ?? this.source,
    routineId: routineId.present ? routineId.value : this.routineId,
    occurrenceDate: occurrenceDate.present
        ? occurrenceDate.value
        : this.occurrenceDate,
    plannedEntryId: plannedEntryId.present
        ? plannedEntryId.value
        : this.plannedEntryId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  EntryRow copyWithCompanion(EntriesCompanion data) {
    return EntryRow(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      labelId: data.labelId.present ? data.labelId.value : this.labelId,
      categoryOverrideId: data.categoryOverrideId.present
          ? data.categoryOverrideId.value
          : this.categoryOverrideId,
      startUtc: data.startUtc.present ? data.startUtc.value : this.startUtc,
      endUtc: data.endUtc.present ? data.endUtc.value : this.endUtc,
      tzId: data.tzId.present ? data.tzId.value : this.tzId,
      utcOffsetMin: data.utcOffsetMin.present
          ? data.utcOffsetMin.value
          : this.utcOffsetMin,
      note: data.note.present ? data.note.value : this.note,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      source: data.source.present ? data.source.value : this.source,
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
      occurrenceDate: data.occurrenceDate.present
          ? data.occurrenceDate.value
          : this.occurrenceDate,
      plannedEntryId: data.plannedEntryId.present
          ? data.plannedEntryId.value
          : this.plannedEntryId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EntryRow(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('labelId: $labelId, ')
          ..write('categoryOverrideId: $categoryOverrideId, ')
          ..write('startUtc: $startUtc, ')
          ..write('endUtc: $endUtc, ')
          ..write('tzId: $tzId, ')
          ..write('utcOffsetMin: $utcOffsetMin, ')
          ..write('note: $note, ')
          ..write('taskId: $taskId, ')
          ..write('source: $source, ')
          ..write('routineId: $routineId, ')
          ..write('occurrenceDate: $occurrenceDate, ')
          ..write('plannedEntryId: $plannedEntryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    kind,
    labelId,
    categoryOverrideId,
    startUtc,
    endUtc,
    tzId,
    utcOffsetMin,
    note,
    taskId,
    source,
    routineId,
    occurrenceDate,
    plannedEntryId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntryRow &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.labelId == this.labelId &&
          other.categoryOverrideId == this.categoryOverrideId &&
          other.startUtc == this.startUtc &&
          other.endUtc == this.endUtc &&
          other.tzId == this.tzId &&
          other.utcOffsetMin == this.utcOffsetMin &&
          other.note == this.note &&
          other.taskId == this.taskId &&
          other.source == this.source &&
          other.routineId == this.routineId &&
          other.occurrenceDate == this.occurrenceDate &&
          other.plannedEntryId == this.plannedEntryId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EntriesCompanion extends UpdateCompanion<EntryRow> {
  final Value<String> id;
  final Value<String> kind;
  final Value<String> labelId;
  final Value<String?> categoryOverrideId;
  final Value<Instant> startUtc;
  final Value<Instant?> endUtc;
  final Value<String> tzId;
  final Value<int> utcOffsetMin;
  final Value<String?> note;
  final Value<String?> taskId;
  final Value<String> source;
  final Value<String?> routineId;
  final Value<LocalDate?> occurrenceDate;
  final Value<String?> plannedEntryId;
  final Value<Instant> createdAt;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const EntriesCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.labelId = const Value.absent(),
    this.categoryOverrideId = const Value.absent(),
    this.startUtc = const Value.absent(),
    this.endUtc = const Value.absent(),
    this.tzId = const Value.absent(),
    this.utcOffsetMin = const Value.absent(),
    this.note = const Value.absent(),
    this.taskId = const Value.absent(),
    this.source = const Value.absent(),
    this.routineId = const Value.absent(),
    this.occurrenceDate = const Value.absent(),
    this.plannedEntryId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EntriesCompanion.insert({
    required String id,
    required String kind,
    required String labelId,
    this.categoryOverrideId = const Value.absent(),
    required Instant startUtc,
    this.endUtc = const Value.absent(),
    required String tzId,
    required int utcOffsetMin,
    this.note = const Value.absent(),
    this.taskId = const Value.absent(),
    required String source,
    this.routineId = const Value.absent(),
    this.occurrenceDate = const Value.absent(),
    this.plannedEntryId = const Value.absent(),
    required Instant createdAt,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       labelId = Value(labelId),
       startUtc = Value(startUtc),
       tzId = Value(tzId),
       utcOffsetMin = Value(utcOffsetMin),
       source = Value(source),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<EntryRow> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<String>? labelId,
    Expression<String>? categoryOverrideId,
    Expression<int>? startUtc,
    Expression<int>? endUtc,
    Expression<String>? tzId,
    Expression<int>? utcOffsetMin,
    Expression<String>? note,
    Expression<String>? taskId,
    Expression<String>? source,
    Expression<String>? routineId,
    Expression<String>? occurrenceDate,
    Expression<String>? plannedEntryId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (labelId != null) 'label_id': labelId,
      if (categoryOverrideId != null)
        'category_override_id': categoryOverrideId,
      if (startUtc != null) 'start_utc': startUtc,
      if (endUtc != null) 'end_utc': endUtc,
      if (tzId != null) 'tz_id': tzId,
      if (utcOffsetMin != null) 'utc_offset_min': utcOffsetMin,
      if (note != null) 'note': note,
      if (taskId != null) 'task_id': taskId,
      if (source != null) 'source': source,
      if (routineId != null) 'routine_id': routineId,
      if (occurrenceDate != null) 'occurrence_date': occurrenceDate,
      if (plannedEntryId != null) 'planned_entry_id': plannedEntryId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<String>? labelId,
    Value<String?>? categoryOverrideId,
    Value<Instant>? startUtc,
    Value<Instant?>? endUtc,
    Value<String>? tzId,
    Value<int>? utcOffsetMin,
    Value<String?>? note,
    Value<String?>? taskId,
    Value<String>? source,
    Value<String?>? routineId,
    Value<LocalDate?>? occurrenceDate,
    Value<String?>? plannedEntryId,
    Value<Instant>? createdAt,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return EntriesCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      labelId: labelId ?? this.labelId,
      categoryOverrideId: categoryOverrideId ?? this.categoryOverrideId,
      startUtc: startUtc ?? this.startUtc,
      endUtc: endUtc ?? this.endUtc,
      tzId: tzId ?? this.tzId,
      utcOffsetMin: utcOffsetMin ?? this.utcOffsetMin,
      note: note ?? this.note,
      taskId: taskId ?? this.taskId,
      source: source ?? this.source,
      routineId: routineId ?? this.routineId,
      occurrenceDate: occurrenceDate ?? this.occurrenceDate,
      plannedEntryId: plannedEntryId ?? this.plannedEntryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (labelId.present) {
      map['label_id'] = Variable<String>(labelId.value);
    }
    if (categoryOverrideId.present) {
      map['category_override_id'] = Variable<String>(categoryOverrideId.value);
    }
    if (startUtc.present) {
      map['start_utc'] = Variable<int>(
        $EntriesTable.$converterstartUtc.toSql(startUtc.value),
      );
    }
    if (endUtc.present) {
      map['end_utc'] = Variable<int>(
        $EntriesTable.$converterendUtcn.toSql(endUtc.value),
      );
    }
    if (tzId.present) {
      map['tz_id'] = Variable<String>(tzId.value);
    }
    if (utcOffsetMin.present) {
      map['utc_offset_min'] = Variable<int>(utcOffsetMin.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<String>(routineId.value);
    }
    if (occurrenceDate.present) {
      map['occurrence_date'] = Variable<String>(
        $EntriesTable.$converteroccurrenceDaten.toSql(occurrenceDate.value),
      );
    }
    if (plannedEntryId.present) {
      map['planned_entry_id'] = Variable<String>(plannedEntryId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $EntriesTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $EntriesTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntriesCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('labelId: $labelId, ')
          ..write('categoryOverrideId: $categoryOverrideId, ')
          ..write('startUtc: $startUtc, ')
          ..write('endUtc: $endUtc, ')
          ..write('tzId: $tzId, ')
          ..write('utcOffsetMin: $utcOffsetMin, ')
          ..write('note: $note, ')
          ..write('taskId: $taskId, ')
          ..write('source: $source, ')
          ..write('routineId: $routineId, ')
          ..write('occurrenceDate: $occurrenceDate, ')
          ..write('plannedEntryId: $plannedEntryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutineExceptionsTable extends RoutineExceptions
    with TableInfo<$RoutineExceptionsTable, RoutineExceptionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineExceptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routineIdMeta = const VerificationMeta(
    'routineId',
  );
  @override
  late final GeneratedColumn<String> routineId = GeneratedColumn<String>(
    'routine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routines (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<LocalDate, String>
  occurrenceDate = GeneratedColumn<String>(
    'occurrence_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<LocalDate>($RoutineExceptionsTable.$converteroccurrenceDate);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startOffsetMinMeta = const VerificationMeta(
    'startOffsetMin',
  );
  @override
  late final GeneratedColumn<int> startOffsetMin = GeneratedColumn<int>(
    'start_offset_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endOffsetMinMeta = const VerificationMeta(
    'endOffsetMin',
  );
  @override
  late final GeneratedColumn<int> endOffsetMin = GeneratedColumn<int>(
    'end_offset_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _labelIdMeta = const VerificationMeta(
    'labelId',
  );
  @override
  late final GeneratedColumn<String> labelId = GeneratedColumn<String>(
    'label_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES labels (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($RoutineExceptionsTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($RoutineExceptionsTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    routineId,
    occurrenceDate,
    type,
    startOffsetMin,
    endOffsetMin,
    labelId,
    note,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_exceptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineExceptionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('routine_id')) {
      context.handle(
        _routineIdMeta,
        routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('start_offset_min')) {
      context.handle(
        _startOffsetMinMeta,
        startOffsetMin.isAcceptableOrUnknown(
          data['start_offset_min']!,
          _startOffsetMinMeta,
        ),
      );
    }
    if (data.containsKey('end_offset_min')) {
      context.handle(
        _endOffsetMinMeta,
        endOffsetMin.isAcceptableOrUnknown(
          data['end_offset_min']!,
          _endOffsetMinMeta,
        ),
      );
    }
    if (data.containsKey('label_id')) {
      context.handle(
        _labelIdMeta,
        labelId.isAcceptableOrUnknown(data['label_id']!, _labelIdMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {routineId, occurrenceDate},
  ];
  @override
  RoutineExceptionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineExceptionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_id'],
      )!,
      occurrenceDate: $RoutineExceptionsTable.$converteroccurrenceDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}occurrence_date'],
        )!,
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      startOffsetMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_offset_min'],
      ),
      endOffsetMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_offset_min'],
      ),
      labelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_id'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: $RoutineExceptionsTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $RoutineExceptionsTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $RoutineExceptionsTable createAlias(String alias) {
    return $RoutineExceptionsTable(attachedDatabase, alias);
  }

  static TypeConverter<LocalDate, String> $converteroccurrenceDate =
      const LocalDateConverter();
  static TypeConverter<Instant, int> $convertercreatedAt =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class RoutineExceptionRow extends DataClass
    implements Insertable<RoutineExceptionRow> {
  final String id;
  final String routineId;
  final LocalDate occurrenceDate;

  /// `skip` | `modify`.
  final String type;

  /// Minutes from the occurrence date's midnight, −720…2880.
  final int? startOffsetMin;
  final int? endOffsetMin;
  final String? labelId;
  final String? note;
  final Instant createdAt;
  final Instant updatedAt;
  const RoutineExceptionRow({
    required this.id,
    required this.routineId,
    required this.occurrenceDate,
    required this.type,
    this.startOffsetMin,
    this.endOffsetMin,
    this.labelId,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['routine_id'] = Variable<String>(routineId);
    {
      map['occurrence_date'] = Variable<String>(
        $RoutineExceptionsTable.$converteroccurrenceDate.toSql(occurrenceDate),
      );
    }
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || startOffsetMin != null) {
      map['start_offset_min'] = Variable<int>(startOffsetMin);
    }
    if (!nullToAbsent || endOffsetMin != null) {
      map['end_offset_min'] = Variable<int>(endOffsetMin);
    }
    if (!nullToAbsent || labelId != null) {
      map['label_id'] = Variable<String>(labelId);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    {
      map['created_at'] = Variable<int>(
        $RoutineExceptionsTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $RoutineExceptionsTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  RoutineExceptionsCompanion toCompanion(bool nullToAbsent) {
    return RoutineExceptionsCompanion(
      id: Value(id),
      routineId: Value(routineId),
      occurrenceDate: Value(occurrenceDate),
      type: Value(type),
      startOffsetMin: startOffsetMin == null && nullToAbsent
          ? const Value.absent()
          : Value(startOffsetMin),
      endOffsetMin: endOffsetMin == null && nullToAbsent
          ? const Value.absent()
          : Value(endOffsetMin),
      labelId: labelId == null && nullToAbsent
          ? const Value.absent()
          : Value(labelId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RoutineExceptionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineExceptionRow(
      id: serializer.fromJson<String>(json['id']),
      routineId: serializer.fromJson<String>(json['routineId']),
      occurrenceDate: serializer.fromJson<LocalDate>(json['occurrenceDate']),
      type: serializer.fromJson<String>(json['type']),
      startOffsetMin: serializer.fromJson<int?>(json['startOffsetMin']),
      endOffsetMin: serializer.fromJson<int?>(json['endOffsetMin']),
      labelId: serializer.fromJson<String?>(json['labelId']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<Instant>(json['createdAt']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'routineId': serializer.toJson<String>(routineId),
      'occurrenceDate': serializer.toJson<LocalDate>(occurrenceDate),
      'type': serializer.toJson<String>(type),
      'startOffsetMin': serializer.toJson<int?>(startOffsetMin),
      'endOffsetMin': serializer.toJson<int?>(endOffsetMin),
      'labelId': serializer.toJson<String?>(labelId),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<Instant>(createdAt),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  RoutineExceptionRow copyWith({
    String? id,
    String? routineId,
    LocalDate? occurrenceDate,
    String? type,
    Value<int?> startOffsetMin = const Value.absent(),
    Value<int?> endOffsetMin = const Value.absent(),
    Value<String?> labelId = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Instant? createdAt,
    Instant? updatedAt,
  }) => RoutineExceptionRow(
    id: id ?? this.id,
    routineId: routineId ?? this.routineId,
    occurrenceDate: occurrenceDate ?? this.occurrenceDate,
    type: type ?? this.type,
    startOffsetMin: startOffsetMin.present
        ? startOffsetMin.value
        : this.startOffsetMin,
    endOffsetMin: endOffsetMin.present ? endOffsetMin.value : this.endOffsetMin,
    labelId: labelId.present ? labelId.value : this.labelId,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RoutineExceptionRow copyWithCompanion(RoutineExceptionsCompanion data) {
    return RoutineExceptionRow(
      id: data.id.present ? data.id.value : this.id,
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
      occurrenceDate: data.occurrenceDate.present
          ? data.occurrenceDate.value
          : this.occurrenceDate,
      type: data.type.present ? data.type.value : this.type,
      startOffsetMin: data.startOffsetMin.present
          ? data.startOffsetMin.value
          : this.startOffsetMin,
      endOffsetMin: data.endOffsetMin.present
          ? data.endOffsetMin.value
          : this.endOffsetMin,
      labelId: data.labelId.present ? data.labelId.value : this.labelId,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineExceptionRow(')
          ..write('id: $id, ')
          ..write('routineId: $routineId, ')
          ..write('occurrenceDate: $occurrenceDate, ')
          ..write('type: $type, ')
          ..write('startOffsetMin: $startOffsetMin, ')
          ..write('endOffsetMin: $endOffsetMin, ')
          ..write('labelId: $labelId, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    routineId,
    occurrenceDate,
    type,
    startOffsetMin,
    endOffsetMin,
    labelId,
    note,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineExceptionRow &&
          other.id == this.id &&
          other.routineId == this.routineId &&
          other.occurrenceDate == this.occurrenceDate &&
          other.type == this.type &&
          other.startOffsetMin == this.startOffsetMin &&
          other.endOffsetMin == this.endOffsetMin &&
          other.labelId == this.labelId &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RoutineExceptionsCompanion extends UpdateCompanion<RoutineExceptionRow> {
  final Value<String> id;
  final Value<String> routineId;
  final Value<LocalDate> occurrenceDate;
  final Value<String> type;
  final Value<int?> startOffsetMin;
  final Value<int?> endOffsetMin;
  final Value<String?> labelId;
  final Value<String?> note;
  final Value<Instant> createdAt;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const RoutineExceptionsCompanion({
    this.id = const Value.absent(),
    this.routineId = const Value.absent(),
    this.occurrenceDate = const Value.absent(),
    this.type = const Value.absent(),
    this.startOffsetMin = const Value.absent(),
    this.endOffsetMin = const Value.absent(),
    this.labelId = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineExceptionsCompanion.insert({
    required String id,
    required String routineId,
    required LocalDate occurrenceDate,
    required String type,
    this.startOffsetMin = const Value.absent(),
    this.endOffsetMin = const Value.absent(),
    this.labelId = const Value.absent(),
    this.note = const Value.absent(),
    required Instant createdAt,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       routineId = Value(routineId),
       occurrenceDate = Value(occurrenceDate),
       type = Value(type),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<RoutineExceptionRow> custom({
    Expression<String>? id,
    Expression<String>? routineId,
    Expression<String>? occurrenceDate,
    Expression<String>? type,
    Expression<int>? startOffsetMin,
    Expression<int>? endOffsetMin,
    Expression<String>? labelId,
    Expression<String>? note,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routineId != null) 'routine_id': routineId,
      if (occurrenceDate != null) 'occurrence_date': occurrenceDate,
      if (type != null) 'type': type,
      if (startOffsetMin != null) 'start_offset_min': startOffsetMin,
      if (endOffsetMin != null) 'end_offset_min': endOffsetMin,
      if (labelId != null) 'label_id': labelId,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineExceptionsCompanion copyWith({
    Value<String>? id,
    Value<String>? routineId,
    Value<LocalDate>? occurrenceDate,
    Value<String>? type,
    Value<int?>? startOffsetMin,
    Value<int?>? endOffsetMin,
    Value<String?>? labelId,
    Value<String?>? note,
    Value<Instant>? createdAt,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return RoutineExceptionsCompanion(
      id: id ?? this.id,
      routineId: routineId ?? this.routineId,
      occurrenceDate: occurrenceDate ?? this.occurrenceDate,
      type: type ?? this.type,
      startOffsetMin: startOffsetMin ?? this.startOffsetMin,
      endOffsetMin: endOffsetMin ?? this.endOffsetMin,
      labelId: labelId ?? this.labelId,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<String>(routineId.value);
    }
    if (occurrenceDate.present) {
      map['occurrence_date'] = Variable<String>(
        $RoutineExceptionsTable.$converteroccurrenceDate.toSql(
          occurrenceDate.value,
        ),
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (startOffsetMin.present) {
      map['start_offset_min'] = Variable<int>(startOffsetMin.value);
    }
    if (endOffsetMin.present) {
      map['end_offset_min'] = Variable<int>(endOffsetMin.value);
    }
    if (labelId.present) {
      map['label_id'] = Variable<String>(labelId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $RoutineExceptionsTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $RoutineExceptionsTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineExceptionsCompanion(')
          ..write('id: $id, ')
          ..write('routineId: $routineId, ')
          ..write('occurrenceDate: $occurrenceDate, ')
          ..write('type: $type, ')
          ..write('startOffsetMin: $startOffsetMin, ')
          ..write('endOffsetMin: $endOffsetMin, ')
          ..write('labelId: $labelId, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskRemindersTable extends TaskReminders
    with TableInfo<$TaskRemindersTable, TaskReminderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskRemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _offsetDaysMeta = const VerificationMeta(
    'offsetDays',
  );
  @override
  late final GeneratedColumn<int> offsetDays = GeneratedColumn<int>(
    'offset_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minuteOfDayMeta = const VerificationMeta(
    'minuteOfDay',
  );
  @override
  late final GeneratedColumn<int> minuteOfDay = GeneratedColumn<int>(
    'minute_of_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant?, int> customAtUtc =
      GeneratedColumn<int>(
        'custom_at_utc',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<Instant?>($TaskRemindersTable.$convertercustomAtUtcn);
  static const VerificationMeta _ignoreQuietMeta = const VerificationMeta(
    'ignoreQuiet',
  );
  @override
  late final GeneratedColumn<bool> ignoreQuiet = GeneratedColumn<bool>(
    'ignore_quiet',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("ignore_quiet" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($TaskRemindersTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($TaskRemindersTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    taskId,
    type,
    offsetDays,
    minuteOfDay,
    customAtUtc,
    ignoreQuiet,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskReminderRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('offset_days')) {
      context.handle(
        _offsetDaysMeta,
        offsetDays.isAcceptableOrUnknown(data['offset_days']!, _offsetDaysMeta),
      );
    }
    if (data.containsKey('minute_of_day')) {
      context.handle(
        _minuteOfDayMeta,
        minuteOfDay.isAcceptableOrUnknown(
          data['minute_of_day']!,
          _minuteOfDayMeta,
        ),
      );
    }
    if (data.containsKey('ignore_quiet')) {
      context.handle(
        _ignoreQuietMeta,
        ignoreQuiet.isAcceptableOrUnknown(
          data['ignore_quiet']!,
          _ignoreQuietMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskReminderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskReminderRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      offsetDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}offset_days'],
      ),
      minuteOfDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minute_of_day'],
      ),
      customAtUtc: $TaskRemindersTable.$convertercustomAtUtcn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}custom_at_utc'],
        ),
      ),
      ignoreQuiet: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}ignore_quiet'],
      )!,
      createdAt: $TaskRemindersTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $TaskRemindersTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $TaskRemindersTable createAlias(String alias) {
    return $TaskRemindersTable(attachedDatabase, alias);
  }

  static TypeConverter<Instant, int> $convertercustomAtUtc =
      const InstantConverter();
  static TypeConverter<Instant?, int?> $convertercustomAtUtcn =
      NullAwareTypeConverter.wrap($convertercustomAtUtc);
  static TypeConverter<Instant, int> $convertercreatedAt =
      const InstantConverter();
  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class TaskReminderRow extends DataClass implements Insertable<TaskReminderRow> {
  final String id;
  final String taskId;

  /// `at_start` | `before_deadline` | `on_deadline` | `custom`.
  final String type;

  /// Days before the deadline, for `before_deadline` (1–30).
  final int? offsetDays;

  /// Time of day for the relative types.
  final int? minuteOfDay;
  final Instant? customAtUtc;
  final bool ignoreQuiet;
  final Instant createdAt;
  final Instant updatedAt;
  const TaskReminderRow({
    required this.id,
    required this.taskId,
    required this.type,
    this.offsetDays,
    this.minuteOfDay,
    this.customAtUtc,
    required this.ignoreQuiet,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['task_id'] = Variable<String>(taskId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || offsetDays != null) {
      map['offset_days'] = Variable<int>(offsetDays);
    }
    if (!nullToAbsent || minuteOfDay != null) {
      map['minute_of_day'] = Variable<int>(minuteOfDay);
    }
    if (!nullToAbsent || customAtUtc != null) {
      map['custom_at_utc'] = Variable<int>(
        $TaskRemindersTable.$convertercustomAtUtcn.toSql(customAtUtc),
      );
    }
    map['ignore_quiet'] = Variable<bool>(ignoreQuiet);
    {
      map['created_at'] = Variable<int>(
        $TaskRemindersTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $TaskRemindersTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  TaskRemindersCompanion toCompanion(bool nullToAbsent) {
    return TaskRemindersCompanion(
      id: Value(id),
      taskId: Value(taskId),
      type: Value(type),
      offsetDays: offsetDays == null && nullToAbsent
          ? const Value.absent()
          : Value(offsetDays),
      minuteOfDay: minuteOfDay == null && nullToAbsent
          ? const Value.absent()
          : Value(minuteOfDay),
      customAtUtc: customAtUtc == null && nullToAbsent
          ? const Value.absent()
          : Value(customAtUtc),
      ignoreQuiet: Value(ignoreQuiet),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TaskReminderRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskReminderRow(
      id: serializer.fromJson<String>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      type: serializer.fromJson<String>(json['type']),
      offsetDays: serializer.fromJson<int?>(json['offsetDays']),
      minuteOfDay: serializer.fromJson<int?>(json['minuteOfDay']),
      customAtUtc: serializer.fromJson<Instant?>(json['customAtUtc']),
      ignoreQuiet: serializer.fromJson<bool>(json['ignoreQuiet']),
      createdAt: serializer.fromJson<Instant>(json['createdAt']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'taskId': serializer.toJson<String>(taskId),
      'type': serializer.toJson<String>(type),
      'offsetDays': serializer.toJson<int?>(offsetDays),
      'minuteOfDay': serializer.toJson<int?>(minuteOfDay),
      'customAtUtc': serializer.toJson<Instant?>(customAtUtc),
      'ignoreQuiet': serializer.toJson<bool>(ignoreQuiet),
      'createdAt': serializer.toJson<Instant>(createdAt),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  TaskReminderRow copyWith({
    String? id,
    String? taskId,
    String? type,
    Value<int?> offsetDays = const Value.absent(),
    Value<int?> minuteOfDay = const Value.absent(),
    Value<Instant?> customAtUtc = const Value.absent(),
    bool? ignoreQuiet,
    Instant? createdAt,
    Instant? updatedAt,
  }) => TaskReminderRow(
    id: id ?? this.id,
    taskId: taskId ?? this.taskId,
    type: type ?? this.type,
    offsetDays: offsetDays.present ? offsetDays.value : this.offsetDays,
    minuteOfDay: minuteOfDay.present ? minuteOfDay.value : this.minuteOfDay,
    customAtUtc: customAtUtc.present ? customAtUtc.value : this.customAtUtc,
    ignoreQuiet: ignoreQuiet ?? this.ignoreQuiet,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TaskReminderRow copyWithCompanion(TaskRemindersCompanion data) {
    return TaskReminderRow(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      type: data.type.present ? data.type.value : this.type,
      offsetDays: data.offsetDays.present
          ? data.offsetDays.value
          : this.offsetDays,
      minuteOfDay: data.minuteOfDay.present
          ? data.minuteOfDay.value
          : this.minuteOfDay,
      customAtUtc: data.customAtUtc.present
          ? data.customAtUtc.value
          : this.customAtUtc,
      ignoreQuiet: data.ignoreQuiet.present
          ? data.ignoreQuiet.value
          : this.ignoreQuiet,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskReminderRow(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('type: $type, ')
          ..write('offsetDays: $offsetDays, ')
          ..write('minuteOfDay: $minuteOfDay, ')
          ..write('customAtUtc: $customAtUtc, ')
          ..write('ignoreQuiet: $ignoreQuiet, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    taskId,
    type,
    offsetDays,
    minuteOfDay,
    customAtUtc,
    ignoreQuiet,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskReminderRow &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.type == this.type &&
          other.offsetDays == this.offsetDays &&
          other.minuteOfDay == this.minuteOfDay &&
          other.customAtUtc == this.customAtUtc &&
          other.ignoreQuiet == this.ignoreQuiet &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TaskRemindersCompanion extends UpdateCompanion<TaskReminderRow> {
  final Value<String> id;
  final Value<String> taskId;
  final Value<String> type;
  final Value<int?> offsetDays;
  final Value<int?> minuteOfDay;
  final Value<Instant?> customAtUtc;
  final Value<bool> ignoreQuiet;
  final Value<Instant> createdAt;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const TaskRemindersCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.type = const Value.absent(),
    this.offsetDays = const Value.absent(),
    this.minuteOfDay = const Value.absent(),
    this.customAtUtc = const Value.absent(),
    this.ignoreQuiet = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskRemindersCompanion.insert({
    required String id,
    required String taskId,
    required String type,
    this.offsetDays = const Value.absent(),
    this.minuteOfDay = const Value.absent(),
    this.customAtUtc = const Value.absent(),
    this.ignoreQuiet = const Value.absent(),
    required Instant createdAt,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       taskId = Value(taskId),
       type = Value(type),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TaskReminderRow> custom({
    Expression<String>? id,
    Expression<String>? taskId,
    Expression<String>? type,
    Expression<int>? offsetDays,
    Expression<int>? minuteOfDay,
    Expression<int>? customAtUtc,
    Expression<bool>? ignoreQuiet,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (type != null) 'type': type,
      if (offsetDays != null) 'offset_days': offsetDays,
      if (minuteOfDay != null) 'minute_of_day': minuteOfDay,
      if (customAtUtc != null) 'custom_at_utc': customAtUtc,
      if (ignoreQuiet != null) 'ignore_quiet': ignoreQuiet,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskRemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? taskId,
    Value<String>? type,
    Value<int?>? offsetDays,
    Value<int?>? minuteOfDay,
    Value<Instant?>? customAtUtc,
    Value<bool>? ignoreQuiet,
    Value<Instant>? createdAt,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return TaskRemindersCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      type: type ?? this.type,
      offsetDays: offsetDays ?? this.offsetDays,
      minuteOfDay: minuteOfDay ?? this.minuteOfDay,
      customAtUtc: customAtUtc ?? this.customAtUtc,
      ignoreQuiet: ignoreQuiet ?? this.ignoreQuiet,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (offsetDays.present) {
      map['offset_days'] = Variable<int>(offsetDays.value);
    }
    if (minuteOfDay.present) {
      map['minute_of_day'] = Variable<int>(minuteOfDay.value);
    }
    if (customAtUtc.present) {
      map['custom_at_utc'] = Variable<int>(
        $TaskRemindersTable.$convertercustomAtUtcn.toSql(customAtUtc.value),
      );
    }
    if (ignoreQuiet.present) {
      map['ignore_quiet'] = Variable<bool>(ignoreQuiet.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $TaskRemindersTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $TaskRemindersTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskRemindersCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('type: $type, ')
          ..write('offsetDays: $offsetDays, ')
          ..write('minuteOfDay: $minuteOfDay, ')
          ..write('customAtUtc: $customAtUtc, ')
          ..write('ignoreQuiet: $ignoreQuiet, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>($SettingsTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [key, value, scope, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
        _scopeMeta,
        scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta),
      );
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      scope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope'],
      )!,
      updatedAt: $SettingsTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }

  static TypeConverter<Instant, int> $converterupdatedAt =
      const InstantConverter();
}

class SettingRow extends DataClass implements Insertable<SettingRow> {
  final String key;

  /// JSON-encoded value.
  final String value;

  /// `portable` | `device`.
  final String scope;
  final Instant updatedAt;
  const SettingRow({
    required this.key,
    required this.value,
    required this.scope,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['scope'] = Variable<String>(scope);
    {
      map['updated_at'] = Variable<int>(
        $SettingsTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      key: Value(key),
      value: Value(value),
      scope: Value(scope),
      updatedAt: Value(updatedAt),
    );
  }

  factory SettingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      scope: serializer.fromJson<String>(json['scope']),
      updatedAt: serializer.fromJson<Instant>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'scope': serializer.toJson<String>(scope),
      'updatedAt': serializer.toJson<Instant>(updatedAt),
    };
  }

  SettingRow copyWith({
    String? key,
    String? value,
    String? scope,
    Instant? updatedAt,
  }) => SettingRow(
    key: key ?? this.key,
    value: value ?? this.value,
    scope: scope ?? this.scope,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SettingRow copyWithCompanion(SettingsCompanion data) {
    return SettingRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      scope: data.scope.present ? data.scope.value : this.scope,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingRow(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('scope: $scope, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, scope, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingRow &&
          other.key == this.key &&
          other.value == this.value &&
          other.scope == this.scope &&
          other.updatedAt == this.updatedAt);
}

class SettingsCompanion extends UpdateCompanion<SettingRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<String> scope;
  final Value<Instant> updatedAt;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.scope = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    required String scope,
    required Instant updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       scope = Value(scope),
       updatedAt = Value(updatedAt);
  static Insertable<SettingRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? scope,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (scope != null) 'scope': scope,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<String>? scope,
    Value<Instant>? updatedAt,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      scope: scope ?? this.scope,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $SettingsTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('scope: $scope, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScheduledNotificationsTable extends ScheduledNotifications
    with TableInfo<$ScheduledNotificationsTable, ScheduledNotificationRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduledNotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _platformIdMeta = const VerificationMeta(
    'platformId',
  );
  @override
  late final GeneratedColumn<int> platformId = GeneratedColumn<int>(
    'platform_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Instant, int> fireAtUtc =
      GeneratedColumn<int>(
        'fire_at_utc',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Instant>(
        $ScheduledNotificationsTable.$converterfireAtUtc,
      );
  static const VerificationMeta _contentHashMeta = const VerificationMeta(
    'contentHash',
  );
  @override
  late final GeneratedColumn<String> contentHash = GeneratedColumn<String>(
    'content_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    platformId,
    fireAtUtc,
    contentHash,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scheduled_notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduledNotificationRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('platform_id')) {
      context.handle(
        _platformIdMeta,
        platformId.isAcceptableOrUnknown(data['platform_id']!, _platformIdMeta),
      );
    } else if (isInserting) {
      context.missing(_platformIdMeta);
    }
    if (data.containsKey('content_hash')) {
      context.handle(
        _contentHashMeta,
        contentHash.isAcceptableOrUnknown(
          data['content_hash']!,
          _contentHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentHashMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  ScheduledNotificationRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduledNotificationRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      platformId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}platform_id'],
      )!,
      fireAtUtc: $ScheduledNotificationsTable.$converterfireAtUtc.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}fire_at_utc'],
        )!,
      ),
      contentHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_hash'],
      )!,
    );
  }

  @override
  $ScheduledNotificationsTable createAlias(String alias) {
    return $ScheduledNotificationsTable(attachedDatabase, alias);
  }

  static TypeConverter<Instant, int> $converterfireAtUtc =
      const InstantConverter();
}

class ScheduledNotificationRow extends DataClass
    implements Insertable<ScheduledNotificationRow> {
  /// Stable key, e.g. `rtn:{routineId}:{date}`.
  final String key;

  /// The 31-bit platform notification ID, allocated sequentially.
  final int platformId;
  final Instant fireAtUtc;
  final String contentHash;
  const ScheduledNotificationRow({
    required this.key,
    required this.platformId,
    required this.fireAtUtc,
    required this.contentHash,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['platform_id'] = Variable<int>(platformId);
    {
      map['fire_at_utc'] = Variable<int>(
        $ScheduledNotificationsTable.$converterfireAtUtc.toSql(fireAtUtc),
      );
    }
    map['content_hash'] = Variable<String>(contentHash);
    return map;
  }

  ScheduledNotificationsCompanion toCompanion(bool nullToAbsent) {
    return ScheduledNotificationsCompanion(
      key: Value(key),
      platformId: Value(platformId),
      fireAtUtc: Value(fireAtUtc),
      contentHash: Value(contentHash),
    );
  }

  factory ScheduledNotificationRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduledNotificationRow(
      key: serializer.fromJson<String>(json['key']),
      platformId: serializer.fromJson<int>(json['platformId']),
      fireAtUtc: serializer.fromJson<Instant>(json['fireAtUtc']),
      contentHash: serializer.fromJson<String>(json['contentHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'platformId': serializer.toJson<int>(platformId),
      'fireAtUtc': serializer.toJson<Instant>(fireAtUtc),
      'contentHash': serializer.toJson<String>(contentHash),
    };
  }

  ScheduledNotificationRow copyWith({
    String? key,
    int? platformId,
    Instant? fireAtUtc,
    String? contentHash,
  }) => ScheduledNotificationRow(
    key: key ?? this.key,
    platformId: platformId ?? this.platformId,
    fireAtUtc: fireAtUtc ?? this.fireAtUtc,
    contentHash: contentHash ?? this.contentHash,
  );
  ScheduledNotificationRow copyWithCompanion(
    ScheduledNotificationsCompanion data,
  ) {
    return ScheduledNotificationRow(
      key: data.key.present ? data.key.value : this.key,
      platformId: data.platformId.present
          ? data.platformId.value
          : this.platformId,
      fireAtUtc: data.fireAtUtc.present ? data.fireAtUtc.value : this.fireAtUtc,
      contentHash: data.contentHash.present
          ? data.contentHash.value
          : this.contentHash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledNotificationRow(')
          ..write('key: $key, ')
          ..write('platformId: $platformId, ')
          ..write('fireAtUtc: $fireAtUtc, ')
          ..write('contentHash: $contentHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, platformId, fireAtUtc, contentHash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduledNotificationRow &&
          other.key == this.key &&
          other.platformId == this.platformId &&
          other.fireAtUtc == this.fireAtUtc &&
          other.contentHash == this.contentHash);
}

class ScheduledNotificationsCompanion
    extends UpdateCompanion<ScheduledNotificationRow> {
  final Value<String> key;
  final Value<int> platformId;
  final Value<Instant> fireAtUtc;
  final Value<String> contentHash;
  final Value<int> rowid;
  const ScheduledNotificationsCompanion({
    this.key = const Value.absent(),
    this.platformId = const Value.absent(),
    this.fireAtUtc = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScheduledNotificationsCompanion.insert({
    required String key,
    required int platformId,
    required Instant fireAtUtc,
    required String contentHash,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       platformId = Value(platformId),
       fireAtUtc = Value(fireAtUtc),
       contentHash = Value(contentHash);
  static Insertable<ScheduledNotificationRow> custom({
    Expression<String>? key,
    Expression<int>? platformId,
    Expression<int>? fireAtUtc,
    Expression<String>? contentHash,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (platformId != null) 'platform_id': platformId,
      if (fireAtUtc != null) 'fire_at_utc': fireAtUtc,
      if (contentHash != null) 'content_hash': contentHash,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScheduledNotificationsCompanion copyWith({
    Value<String>? key,
    Value<int>? platformId,
    Value<Instant>? fireAtUtc,
    Value<String>? contentHash,
    Value<int>? rowid,
  }) {
    return ScheduledNotificationsCompanion(
      key: key ?? this.key,
      platformId: platformId ?? this.platformId,
      fireAtUtc: fireAtUtc ?? this.fireAtUtc,
      contentHash: contentHash ?? this.contentHash,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (platformId.present) {
      map['platform_id'] = Variable<int>(platformId.value);
    }
    if (fireAtUtc.present) {
      map['fire_at_utc'] = Variable<int>(
        $ScheduledNotificationsTable.$converterfireAtUtc.toSql(fireAtUtc.value),
      );
    }
    if (contentHash.present) {
      map['content_hash'] = Variable<String>(contentHash.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledNotificationsCompanion(')
          ..write('key: $key, ')
          ..write('platformId: $platformId, ')
          ..write('fireAtUtc: $fireAtUtc, ')
          ..write('contentHash: $contentHash, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $LabelsTable labels = $LabelsTable(this);
  late final $TaskSeriesTable taskSeries = $TaskSeriesTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $RoutinesTable routines = $RoutinesTable(this);
  late final $EntriesTable entries = $EntriesTable(this);
  late final $RoutineExceptionsTable routineExceptions =
      $RoutineExceptionsTable(this);
  late final $TaskRemindersTable taskReminders = $TaskRemindersTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $ScheduledNotificationsTable scheduledNotifications =
      $ScheduledNotificationsTable(this);
  late final Index labelsCategoryId = Index(
    'labels_category_id',
    'CREATE INDEX labels_category_id ON labels (category_id)',
  );
  late final Index entriesStartUtc = Index(
    'entries_start_utc',
    'CREATE INDEX entries_start_utc ON entries (start_utc)',
  );
  late final Index entriesKindStartUtc = Index(
    'entries_kind_start_utc',
    'CREATE INDEX entries_kind_start_utc ON entries (kind, start_utc)',
  );
  late final Index entriesLabelId = Index(
    'entries_label_id',
    'CREATE INDEX entries_label_id ON entries (label_id)',
  );
  late final Index entriesTaskId = Index(
    'entries_task_id',
    'CREATE INDEX entries_task_id ON entries (task_id)',
  );
  late final Index entriesPlannedEntryId = Index(
    'entries_planned_entry_id',
    'CREATE INDEX entries_planned_entry_id ON entries (planned_entry_id)',
  );
  late final Index entriesRoutineOccurrence = Index(
    'entries_routine_occurrence',
    'CREATE UNIQUE INDEX entries_routine_occurrence ON entries (routine_id, occurrence_date) WHERE routine_id IS NOT NULL',
  );
  late final Index entriesOpen = Index(
    'entries_open',
    'CREATE INDEX entries_open ON entries (start_utc) WHERE end_utc IS NULL',
  );
  late final Index routinesLabelId = Index(
    'routines_label_id',
    'CREATE INDEX routines_label_id ON routines (label_id)',
  );
  late final Index tasksStatus = Index(
    'tasks_status',
    'CREATE INDEX tasks_status ON tasks (status)',
  );
  late final Index tasksStartDate = Index(
    'tasks_start_date',
    'CREATE INDEX tasks_start_date ON tasks (start_date)',
  );
  late final Index tasksDeadlineDate = Index(
    'tasks_deadline_date',
    'CREATE INDEX tasks_deadline_date ON tasks (deadline_date)',
  );
  late final Index tasksSeriesId = Index(
    'tasks_series_id',
    'CREATE INDEX tasks_series_id ON tasks (series_id)',
  );
  late final Index tasksOneOpenPerSeries = Index(
    'tasks_one_open_per_series',
    'CREATE UNIQUE INDEX tasks_one_open_per_series ON tasks (series_id) WHERE status != \'completed\' AND series_id IS NOT NULL',
  );
  late final Index taskRemindersTaskId = Index(
    'task_reminders_task_id',
    'CREATE INDEX task_reminders_task_id ON task_reminders (task_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    labels,
    taskSeries,
    tasks,
    routines,
    entries,
    routineExceptions,
    taskReminders,
    settings,
    scheduledNotifications,
    labelsCategoryId,
    entriesStartUtc,
    entriesKindStartUtc,
    entriesLabelId,
    entriesTaskId,
    entriesPlannedEntryId,
    entriesRoutineOccurrence,
    entriesOpen,
    routinesLabelId,
    tasksStatus,
    tasksStartDate,
    tasksDeadlineDate,
    tasksSeriesId,
    tasksOneOpenPerSeries,
    taskRemindersTaskId,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tasks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('entries', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'entries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('entries', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routines',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_exceptions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tasks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('task_reminders', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  required String id,
  required String name,
  required String nameKey,
  Value<String?> colorKey,
  Value<int> sortOrder,
  required Instant createdAt,
  required Instant updatedAt,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> nameKey,
  Value<String?> colorKey,
  Value<int> sortOrder,
  Value<Instant> createdAt,
  Value<Instant> updatedAt,
  Value<int> rowid,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LabelsTable, List<LabelRow>> _labelsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.labels,
    aliasName: 'categories__id__labels__category_id',
  );

  $$LabelsTableProcessedTableManager get labelsRefs {
    final manager = $$LabelsTableTableManager(
      $_db,
      $_db.labels,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_labelsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TasksTable, List<TaskRow>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: 'categories__id__tasks__category_id',
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EntriesTable, List<EntryRow>> _entriesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.entries,
    aliasName: 'categories__id__entries__category_override_id',
  );

  $$EntriesTableProcessedTableManager get entriesRefs {
    final manager = $$EntriesTableTableManager($_db, $_db.entries).filter(
      (f) => f.categoryOverrideId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_entriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameKey => $composableBuilder(
    column: $table.nameKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorKey => $composableBuilder(
    column: $table.colorKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  Expression<bool> labelsRefs(
    Expression<bool> Function($$LabelsTableFilterComposer f) f,
  ) {
    final $$LabelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableFilterComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> entriesRefs(
    Expression<bool> Function($$EntriesTableFilterComposer f) f,
  ) {
    final $$EntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.categoryOverrideId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableFilterComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameKey => $composableBuilder(
    column: $table.nameKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorKey => $composableBuilder(
    column: $table.colorKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameKey =>
      $composableBuilder(column: $table.nameKey, builder: (column) => column);

  GeneratedColumn<String> get colorKey =>
      $composableBuilder(column: $table.colorKey, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> labelsRefs<T extends Object>(
    Expression<T> Function($$LabelsTableAnnotationComposer a) f,
  ) {
    final $$LabelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableAnnotationComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> entriesRefs<T extends Object>(
    Expression<T> Function($$EntriesTableAnnotationComposer a) f,
  ) {
    final $$EntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.categoryOverrideId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          CategoryRow,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (CategoryRow, $$CategoriesTableReferences),
          CategoryRow,
          PrefetchHooks Function({
            bool labelsRefs,
            bool tasksRefs,
            bool entriesRefs,
          })
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameKey = const Value.absent(),
                Value<String?> colorKey = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<Instant> createdAt = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                nameKey: nameKey,
                colorKey: colorKey,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String nameKey,
                Value<String?> colorKey = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required Instant createdAt,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                nameKey: nameKey,
                colorKey: colorKey,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CategoriesTable, CategoryRow>(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({labelsRefs = false, tasksRefs = false, entriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (labelsRefs) db.labels,
                    if (tasksRefs) db.tasks,
                    if (entriesRefs) db.entries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (labelsRefs)
                        await $_getPrefetchedDataByColumns<
                          CategoryRow,
                          $CategoriesTable,
                          LabelRow,
                          $LabelsTable
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._labelsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).labelsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'category_id',
                          typedResults: items,
                        ),
                      if (tasksRefs)
                        await $_getPrefetchedDataByColumns<
                          CategoryRow,
                          $CategoriesTable,
                          TaskRow,
                          $TasksTable
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._tasksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).tasksRefs,
                          currentColumn: 'id',
                          referencedColumn: 'category_id',
                          typedResults: items,
                        ),
                      if (entriesRefs)
                        await $_getPrefetchedDataByColumns<
                          CategoryRow,
                          $CategoriesTable,
                          EntryRow,
                          $EntriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._entriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).entriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'category_override_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      CategoryRow,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (CategoryRow, $$CategoriesTableReferences),
      CategoryRow,
      PrefetchHooks Function({
        bool labelsRefs,
        bool tasksRefs,
        bool entriesRefs,
      })
    >;
typedef $$LabelsTableCreateCompanionBuilder = LabelsCompanion Function({
  required String id,
  required String name,
  required String nameKey,
  required String colorKey,
  Value<String?> iconKey,
  Value<String?> categoryId,
  Value<bool> isArchived,
  Value<int> sortOrder,
  required Instant createdAt,
  required Instant updatedAt,
  Value<int> rowid,
});
typedef $$LabelsTableUpdateCompanionBuilder = LabelsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> nameKey,
  Value<String> colorKey,
  Value<String?> iconKey,
  Value<String?> categoryId,
  Value<bool> isArchived,
  Value<int> sortOrder,
  Value<Instant> createdAt,
  Value<Instant> updatedAt,
  Value<int> rowid,
});

final class $$LabelsTableReferences
    extends BaseReferences<_$AppDatabase, $LabelsTable, LabelRow> {
  $$LabelsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('labels__category_id__categories__id');

  $$CategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<String>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RoutinesTable, List<RoutineRow>>
  _routinesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.routines,
    aliasName: 'labels__id__routines__label_id',
  );

  $$RoutinesTableProcessedTableManager get routinesRefs {
    final manager = $$RoutinesTableTableManager(
      $_db,
      $_db.routines,
    ).filter((f) => f.labelId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_routinesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EntriesTable, List<EntryRow>> _entriesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.entries,
    aliasName: 'labels__id__entries__label_id',
  );

  $$EntriesTableProcessedTableManager get entriesRefs {
    final manager = $$EntriesTableTableManager(
      $_db,
      $_db.entries,
    ).filter((f) => f.labelId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_entriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoutineExceptionsTable, List<RoutineExceptionRow>>
  _routineExceptionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.routineExceptions,
        aliasName: 'labels__id__routine_exceptions__label_id',
      );

  $$RoutineExceptionsTableProcessedTableManager get routineExceptionsRefs {
    final manager = $$RoutineExceptionsTableTableManager(
      $_db,
      $_db.routineExceptions,
    ).filter((f) => f.labelId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _routineExceptionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LabelsTableFilterComposer
    extends Composer<_$AppDatabase, $LabelsTable> {
  $$LabelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameKey => $composableBuilder(
    column: $table.nameKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorKey => $composableBuilder(
    column: $table.colorKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> routinesRefs(
    Expression<bool> Function($$RoutinesTableFilterComposer f) f,
  ) {
    final $$RoutinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.labelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableFilterComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> entriesRefs(
    Expression<bool> Function($$EntriesTableFilterComposer f) f,
  ) {
    final $$EntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.labelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableFilterComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> routineExceptionsRefs(
    Expression<bool> Function($$RoutineExceptionsTableFilterComposer f) f,
  ) {
    final $$RoutineExceptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineExceptions,
      getReferencedColumn: (t) => t.labelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineExceptionsTableFilterComposer(
            $db: $db,
            $table: $db.routineExceptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LabelsTableOrderingComposer
    extends Composer<_$AppDatabase, $LabelsTable> {
  $$LabelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameKey => $composableBuilder(
    column: $table.nameKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorKey => $composableBuilder(
    column: $table.colorKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LabelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LabelsTable> {
  $$LabelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameKey =>
      $composableBuilder(column: $table.nameKey, builder: (column) => column);

  GeneratedColumn<String> get colorKey =>
      $composableBuilder(column: $table.colorKey, builder: (column) => column);

  GeneratedColumn<String> get iconKey =>
      $composableBuilder(column: $table.iconKey, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> routinesRefs<T extends Object>(
    Expression<T> Function($$RoutinesTableAnnotationComposer a) f,
  ) {
    final $$RoutinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.labelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableAnnotationComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> entriesRefs<T extends Object>(
    Expression<T> Function($$EntriesTableAnnotationComposer a) f,
  ) {
    final $$EntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.labelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> routineExceptionsRefs<T extends Object>(
    Expression<T> Function($$RoutineExceptionsTableAnnotationComposer a) f,
  ) {
    final $$RoutineExceptionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.routineExceptions,
          getReferencedColumn: (t) => t.labelId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoutineExceptionsTableAnnotationComposer(
                $db: $db,
                $table: $db.routineExceptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$LabelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LabelsTable,
          LabelRow,
          $$LabelsTableFilterComposer,
          $$LabelsTableOrderingComposer,
          $$LabelsTableAnnotationComposer,
          $$LabelsTableCreateCompanionBuilder,
          $$LabelsTableUpdateCompanionBuilder,
          (LabelRow, $$LabelsTableReferences),
          LabelRow,
          PrefetchHooks Function({
            bool categoryId,
            bool routinesRefs,
            bool entriesRefs,
            bool routineExceptionsRefs,
          })
        > {
  $$LabelsTableTableManager(_$AppDatabase db, $LabelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LabelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LabelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LabelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameKey = const Value.absent(),
                Value<String> colorKey = const Value.absent(),
                Value<String?> iconKey = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<Instant> createdAt = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LabelsCompanion(
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
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String nameKey,
                required String colorKey,
                Value<String?> iconKey = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required Instant createdAt,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LabelsCompanion.insert(
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
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LabelsTable, LabelRow>(table),
                  $$LabelsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                categoryId = false,
                routinesRefs = false,
                entriesRefs = false,
                routineExceptionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (routinesRefs) db.routines,
                    if (entriesRefs) db.entries,
                    if (routineExceptionsRefs) db.routineExceptions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$LabelsTableReferences
                                ._categoryIdTable(db),
                            referencedColumn: $$LabelsTableReferences
                                ._categoryIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (routinesRefs)
                        await $_getPrefetchedDataByColumns<
                          LabelRow,
                          $LabelsTable,
                          RoutineRow,
                          $RoutinesTable
                        >(
                          currentTable: table,
                          referencedTable: $$LabelsTableReferences
                              ._routinesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LabelsTableReferences(
                                db,
                                table,
                                p0,
                              ).routinesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'label_id',
                          typedResults: items,
                        ),
                      if (entriesRefs)
                        await $_getPrefetchedDataByColumns<
                          LabelRow,
                          $LabelsTable,
                          EntryRow,
                          $EntriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$LabelsTableReferences
                              ._entriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LabelsTableReferences(
                                db,
                                table,
                                p0,
                              ).entriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'label_id',
                          typedResults: items,
                        ),
                      if (routineExceptionsRefs)
                        await $_getPrefetchedDataByColumns<
                          LabelRow,
                          $LabelsTable,
                          RoutineExceptionRow,
                          $RoutineExceptionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$LabelsTableReferences
                              ._routineExceptionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LabelsTableReferences(
                                db,
                                table,
                                p0,
                              ).routineExceptionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'label_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LabelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LabelsTable,
      LabelRow,
      $$LabelsTableFilterComposer,
      $$LabelsTableOrderingComposer,
      $$LabelsTableAnnotationComposer,
      $$LabelsTableCreateCompanionBuilder,
      $$LabelsTableUpdateCompanionBuilder,
      (LabelRow, $$LabelsTableReferences),
      LabelRow,
      PrefetchHooks Function({
        bool categoryId,
        bool routinesRefs,
        bool entriesRefs,
        bool routineExceptionsRefs,
      })
    >;
typedef $$TaskSeriesTableCreateCompanionBuilder = TaskSeriesCompanion Function({
  required String id,
  required String freq,
  required int interval,
  required String mode,
  required LocalDate anchorDate,
  Value<LocalDate?> endsOn,
  Value<bool> isActive,
  required Instant createdAt,
  required Instant updatedAt,
  Value<int> rowid,
});
typedef $$TaskSeriesTableUpdateCompanionBuilder = TaskSeriesCompanion Function({
  Value<String> id,
  Value<String> freq,
  Value<int> interval,
  Value<String> mode,
  Value<LocalDate> anchorDate,
  Value<LocalDate?> endsOn,
  Value<bool> isActive,
  Value<Instant> createdAt,
  Value<Instant> updatedAt,
  Value<int> rowid,
});

final class $$TaskSeriesTableReferences
    extends BaseReferences<_$AppDatabase, $TaskSeriesTable, TaskSeriesRow> {
  $$TaskSeriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TasksTable, List<TaskRow>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: 'task_series__id__tasks__series_id',
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TaskSeriesTableFilterComposer
    extends Composer<_$AppDatabase, $TaskSeriesTable> {
  $$TaskSeriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get freq => $composableBuilder(
    column: $table.freq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get interval => $composableBuilder(
    column: $table.interval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LocalDate, LocalDate, String> get anchorDate =>
      $composableBuilder(
        column: $table.anchorDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<LocalDate?, LocalDate, String> get endsOn =>
      $composableBuilder(
        column: $table.endsOn,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TaskSeriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskSeriesTable> {
  $$TaskSeriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get freq => $composableBuilder(
    column: $table.freq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get interval => $composableBuilder(
    column: $table.interval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get anchorDate => $composableBuilder(
    column: $table.anchorDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endsOn => $composableBuilder(
    column: $table.endsOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaskSeriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskSeriesTable> {
  $$TaskSeriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get freq =>
      $composableBuilder(column: $table.freq, builder: (column) => column);

  GeneratedColumn<int> get interval =>
      $composableBuilder(column: $table.interval, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalDate, String> get anchorDate =>
      $composableBuilder(
        column: $table.anchorDate,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<LocalDate?, String> get endsOn =>
      $composableBuilder(column: $table.endsOn, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TaskSeriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskSeriesTable,
          TaskSeriesRow,
          $$TaskSeriesTableFilterComposer,
          $$TaskSeriesTableOrderingComposer,
          $$TaskSeriesTableAnnotationComposer,
          $$TaskSeriesTableCreateCompanionBuilder,
          $$TaskSeriesTableUpdateCompanionBuilder,
          (TaskSeriesRow, $$TaskSeriesTableReferences),
          TaskSeriesRow,
          PrefetchHooks Function({bool tasksRefs})
        > {
  $$TaskSeriesTableTableManager(_$AppDatabase db, $TaskSeriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskSeriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskSeriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskSeriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> freq = const Value.absent(),
                Value<int> interval = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<LocalDate> anchorDate = const Value.absent(),
                Value<LocalDate?> endsOn = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<Instant> createdAt = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskSeriesCompanion(
                id: id,
                freq: freq,
                interval: interval,
                mode: mode,
                anchorDate: anchorDate,
                endsOn: endsOn,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String freq,
                required int interval,
                required String mode,
                required LocalDate anchorDate,
                Value<LocalDate?> endsOn = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required Instant createdAt,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => TaskSeriesCompanion.insert(
                id: id,
                freq: freq,
                interval: interval,
                mode: mode,
                anchorDate: anchorDate,
                endsOn: endsOn,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TaskSeriesTable, TaskSeriesRow>(table),
                  $$TaskSeriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tasksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tasksRefs) db.tasks],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksRefs)
                    await $_getPrefetchedDataByColumns<
                      TaskSeriesRow,
                      $TaskSeriesTable,
                      TaskRow,
                      $TasksTable
                    >(
                      currentTable: table,
                      referencedTable: $$TaskSeriesTableReferences
                          ._tasksRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TaskSeriesTableReferences(db, table, p0).tasksRefs,
                      currentColumn: 'id',
                      referencedColumn: 'series_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TaskSeriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskSeriesTable,
      TaskSeriesRow,
      $$TaskSeriesTableFilterComposer,
      $$TaskSeriesTableOrderingComposer,
      $$TaskSeriesTableAnnotationComposer,
      $$TaskSeriesTableCreateCompanionBuilder,
      $$TaskSeriesTableUpdateCompanionBuilder,
      (TaskSeriesRow, $$TaskSeriesTableReferences),
      TaskSeriesRow,
      PrefetchHooks Function({bool tasksRefs})
    >;
typedef $$TasksTableCreateCompanionBuilder = TasksCompanion Function({
  required String id,
  Value<String?> seriesId,
  required String title,
  Value<String?> notes,
  required LocalDate startDate,
  Value<LocalDate?> deadlineDate,
  Value<int?> deadlineMinute,
  required String status,
  Value<String> priority,
  Value<String?> categoryId,
  Value<int?> estimateMin,
  Value<int> actualAdjustMin,
  Value<Instant?> completedAt,
  required Instant createdAt,
  required Instant updatedAt,
  Value<int> rowid,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<String> id,
  Value<String?> seriesId,
  Value<String> title,
  Value<String?> notes,
  Value<LocalDate> startDate,
  Value<LocalDate?> deadlineDate,
  Value<int?> deadlineMinute,
  Value<String> status,
  Value<String> priority,
  Value<String?> categoryId,
  Value<int?> estimateMin,
  Value<int> actualAdjustMin,
  Value<Instant?> completedAt,
  Value<Instant> createdAt,
  Value<Instant> updatedAt,
  Value<int> rowid,
});

final class $$TasksTableReferences
    extends BaseReferences<_$AppDatabase, $TasksTable, TaskRow> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TaskSeriesTable _seriesIdTable(_$AppDatabase db) =>
      db.taskSeries.createAlias('tasks__series_id__task_series__id');

  $$TaskSeriesTableProcessedTableManager? get seriesId {
    final $_column = $_itemColumn<String>('series_id');
    if ($_column == null) return null;
    final manager = $$TaskSeriesTableTableManager(
      $_db,
      $_db.taskSeries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('tasks__category_id__categories__id');

  $$CategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<String>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EntriesTable, List<EntryRow>> _entriesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.entries,
    aliasName: 'tasks__id__entries__task_id',
  );

  $$EntriesTableProcessedTableManager get entriesRefs {
    final manager = $$EntriesTableTableManager(
      $_db,
      $_db.entries,
    ).filter((f) => f.taskId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_entriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TaskRemindersTable, List<TaskReminderRow>>
  _taskRemindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.taskReminders,
    aliasName: 'tasks__id__task_reminders__task_id',
  );

  $$TaskRemindersTableProcessedTableManager get taskRemindersRefs {
    final manager = $$TaskRemindersTableTableManager(
      $_db,
      $_db.taskReminders,
    ).filter((f) => f.taskId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_taskRemindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LocalDate, LocalDate, String> get startDate =>
      $composableBuilder(
        column: $table.startDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<LocalDate?, LocalDate, String>
  get deadlineDate => $composableBuilder(
    column: $table.deadlineDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get deadlineMinute => $composableBuilder(
    column: $table.deadlineMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimateMin => $composableBuilder(
    column: $table.estimateMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actualAdjustMin => $composableBuilder(
    column: $table.actualAdjustMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant?, Instant, int> get completedAt =>
      $composableBuilder(
        column: $table.completedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$TaskSeriesTableFilterComposer get seriesId {
    final $$TaskSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.taskSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskSeriesTableFilterComposer(
            $db: $db,
            $table: $db.taskSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> entriesRefs(
    Expression<bool> Function($$EntriesTableFilterComposer f) f,
  ) {
    final $$EntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableFilterComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> taskRemindersRefs(
    Expression<bool> Function($$TaskRemindersTableFilterComposer f) f,
  ) {
    final $$TaskRemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskReminders,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskRemindersTableFilterComposer(
            $db: $db,
            $table: $db.taskReminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deadlineDate => $composableBuilder(
    column: $table.deadlineDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deadlineMinute => $composableBuilder(
    column: $table.deadlineMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimateMin => $composableBuilder(
    column: $table.estimateMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actualAdjustMin => $composableBuilder(
    column: $table.actualAdjustMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TaskSeriesTableOrderingComposer get seriesId {
    final $$TaskSeriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.taskSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskSeriesTableOrderingComposer(
            $db: $db,
            $table: $db.taskSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalDate, String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalDate?, String> get deadlineDate =>
      $composableBuilder(
        column: $table.deadlineDate,
        builder: (column) => column,
      );

  GeneratedColumn<int> get deadlineMinute => $composableBuilder(
    column: $table.deadlineMinute,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<int> get estimateMin => $composableBuilder(
    column: $table.estimateMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actualAdjustMin => $composableBuilder(
    column: $table.actualAdjustMin,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Instant?, int> get completedAt =>
      $composableBuilder(
        column: $table.completedAt,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<Instant, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TaskSeriesTableAnnotationComposer get seriesId {
    final $$TaskSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.taskSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.taskSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> entriesRefs<T extends Object>(
    Expression<T> Function($$EntriesTableAnnotationComposer a) f,
  ) {
    final $$EntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> taskRemindersRefs<T extends Object>(
    Expression<T> Function($$TaskRemindersTableAnnotationComposer a) f,
  ) {
    final $$TaskRemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskReminders,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskRemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.taskReminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          TaskRow,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (TaskRow, $$TasksTableReferences),
          TaskRow,
          PrefetchHooks Function({
            bool seriesId,
            bool categoryId,
            bool entriesRefs,
            bool taskRemindersRefs,
          })
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> seriesId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<LocalDate> startDate = const Value.absent(),
                Value<LocalDate?> deadlineDate = const Value.absent(),
                Value<int?> deadlineMinute = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<int?> estimateMin = const Value.absent(),
                Value<int> actualAdjustMin = const Value.absent(),
                Value<Instant?> completedAt = const Value.absent(),
                Value<Instant> createdAt = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                seriesId: seriesId,
                title: title,
                notes: notes,
                startDate: startDate,
                deadlineDate: deadlineDate,
                deadlineMinute: deadlineMinute,
                status: status,
                priority: priority,
                categoryId: categoryId,
                estimateMin: estimateMin,
                actualAdjustMin: actualAdjustMin,
                completedAt: completedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> seriesId = const Value.absent(),
                required String title,
                Value<String?> notes = const Value.absent(),
                required LocalDate startDate,
                Value<LocalDate?> deadlineDate = const Value.absent(),
                Value<int?> deadlineMinute = const Value.absent(),
                required String status,
                Value<String> priority = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<int?> estimateMin = const Value.absent(),
                Value<int> actualAdjustMin = const Value.absent(),
                Value<Instant?> completedAt = const Value.absent(),
                required Instant createdAt,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                seriesId: seriesId,
                title: title,
                notes: notes,
                startDate: startDate,
                deadlineDate: deadlineDate,
                deadlineMinute: deadlineMinute,
                status: status,
                priority: priority,
                categoryId: categoryId,
                estimateMin: estimateMin,
                actualAdjustMin: actualAdjustMin,
                completedAt: completedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TasksTable, TaskRow>(table),
                  $$TasksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                seriesId = false,
                categoryId = false,
                entriesRefs = false,
                taskRemindersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (entriesRefs) db.entries,
                    if (taskRemindersRefs) db.taskReminders,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (seriesId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.seriesId,
                            referencedTable: $$TasksTableReferences
                                ._seriesIdTable(db),
                            referencedColumn: $$TasksTableReferences
                                ._seriesIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (categoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$TasksTableReferences
                                ._categoryIdTable(db),
                            referencedColumn: $$TasksTableReferences
                                ._categoryIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (entriesRefs)
                        await $_getPrefetchedDataByColumns<
                          TaskRow,
                          $TasksTable,
                          EntryRow,
                          $EntriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$TasksTableReferences
                              ._entriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TasksTableReferences(db, table, p0).entriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'task_id',
                          typedResults: items,
                        ),
                      if (taskRemindersRefs)
                        await $_getPrefetchedDataByColumns<
                          TaskRow,
                          $TasksTable,
                          TaskReminderRow,
                          $TaskRemindersTable
                        >(
                          currentTable: table,
                          referencedTable: $$TasksTableReferences
                              ._taskRemindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TasksTableReferences(
                                db,
                                table,
                                p0,
                              ).taskRemindersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'task_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      TaskRow,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (TaskRow, $$TasksTableReferences),
      TaskRow,
      PrefetchHooks Function({
        bool seriesId,
        bool categoryId,
        bool entriesRefs,
        bool taskRemindersRefs,
      })
    >;
typedef $$RoutinesTableCreateCompanionBuilder = RoutinesCompanion Function({
  required String id,
  Value<String?> name,
  required String labelId,
  required int startMinute,
  required int endMinute,
  Value<String> recurrenceFreq,
  Value<int> recurrenceInterval,
  Value<int?> weekdaysMask,
  required LocalDate startsOn,
  Value<LocalDate?> endsOn,
  Value<bool> isPaused,
  Value<bool> isArchived,
  Value<String?> note,
  Value<int?> reminderOffsetMin,
  Value<bool> reminderIgnoreQuiet,
  Value<LocalDate?> generatedThrough,
  required Instant createdAt,
  required Instant updatedAt,
  Value<int> rowid,
});
typedef $$RoutinesTableUpdateCompanionBuilder = RoutinesCompanion Function({
  Value<String> id,
  Value<String?> name,
  Value<String> labelId,
  Value<int> startMinute,
  Value<int> endMinute,
  Value<String> recurrenceFreq,
  Value<int> recurrenceInterval,
  Value<int?> weekdaysMask,
  Value<LocalDate> startsOn,
  Value<LocalDate?> endsOn,
  Value<bool> isPaused,
  Value<bool> isArchived,
  Value<String?> note,
  Value<int?> reminderOffsetMin,
  Value<bool> reminderIgnoreQuiet,
  Value<LocalDate?> generatedThrough,
  Value<Instant> createdAt,
  Value<Instant> updatedAt,
  Value<int> rowid,
});

final class $$RoutinesTableReferences
    extends BaseReferences<_$AppDatabase, $RoutinesTable, RoutineRow> {
  $$RoutinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LabelsTable _labelIdTable(_$AppDatabase db) =>
      db.labels.createAlias('routines__label_id__labels__id');

  $$LabelsTableProcessedTableManager get labelId {
    final $_column = $_itemColumn<String>('label_id')!;

    final manager = $$LabelsTableTableManager(
      $_db,
      $_db.labels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_labelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EntriesTable, List<EntryRow>> _entriesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.entries,
    aliasName: 'routines__id__entries__routine_id',
  );

  $$EntriesTableProcessedTableManager get entriesRefs {
    final manager = $$EntriesTableTableManager(
      $_db,
      $_db.entries,
    ).filter((f) => f.routineId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_entriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoutineExceptionsTable, List<RoutineExceptionRow>>
  _routineExceptionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.routineExceptions,
        aliasName: 'routines__id__routine_exceptions__routine_id',
      );

  $$RoutineExceptionsTableProcessedTableManager get routineExceptionsRefs {
    final manager = $$RoutineExceptionsTableTableManager(
      $_db,
      $_db.routineExceptions,
    ).filter((f) => f.routineId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _routineExceptionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoutinesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinute => $composableBuilder(
    column: $table.endMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrenceFreq => $composableBuilder(
    column: $table.recurrenceFreq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recurrenceInterval => $composableBuilder(
    column: $table.recurrenceInterval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekdaysMask => $composableBuilder(
    column: $table.weekdaysMask,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LocalDate, LocalDate, String> get startsOn =>
      $composableBuilder(
        column: $table.startsOn,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<LocalDate?, LocalDate, String> get endsOn =>
      $composableBuilder(
        column: $table.endsOn,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isPaused => $composableBuilder(
    column: $table.isPaused,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminderOffsetMin => $composableBuilder(
    column: $table.reminderOffsetMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reminderIgnoreQuiet => $composableBuilder(
    column: $table.reminderIgnoreQuiet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LocalDate?, LocalDate, String>
  get generatedThrough => $composableBuilder(
    column: $table.generatedThrough,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$LabelsTableFilterComposer get labelId {
    final $$LabelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableFilterComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> entriesRefs(
    Expression<bool> Function($$EntriesTableFilterComposer f) f,
  ) {
    final $$EntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.routineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableFilterComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> routineExceptionsRefs(
    Expression<bool> Function($$RoutineExceptionsTableFilterComposer f) f,
  ) {
    final $$RoutineExceptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineExceptions,
      getReferencedColumn: (t) => t.routineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineExceptionsTableFilterComposer(
            $db: $db,
            $table: $db.routineExceptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutinesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinute => $composableBuilder(
    column: $table.endMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrenceFreq => $composableBuilder(
    column: $table.recurrenceFreq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recurrenceInterval => $composableBuilder(
    column: $table.recurrenceInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekdaysMask => $composableBuilder(
    column: $table.weekdaysMask,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startsOn => $composableBuilder(
    column: $table.startsOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endsOn => $composableBuilder(
    column: $table.endsOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPaused => $composableBuilder(
    column: $table.isPaused,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderOffsetMin => $composableBuilder(
    column: $table.reminderOffsetMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reminderIgnoreQuiet => $composableBuilder(
    column: $table.reminderIgnoreQuiet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generatedThrough => $composableBuilder(
    column: $table.generatedThrough,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LabelsTableOrderingComposer get labelId {
    final $$LabelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableOrderingComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinute =>
      $composableBuilder(column: $table.endMinute, builder: (column) => column);

  GeneratedColumn<String> get recurrenceFreq => $composableBuilder(
    column: $table.recurrenceFreq,
    builder: (column) => column,
  );

  GeneratedColumn<int> get recurrenceInterval => $composableBuilder(
    column: $table.recurrenceInterval,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weekdaysMask => $composableBuilder(
    column: $table.weekdaysMask,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<LocalDate, String> get startsOn =>
      $composableBuilder(column: $table.startsOn, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalDate?, String> get endsOn =>
      $composableBuilder(column: $table.endsOn, builder: (column) => column);

  GeneratedColumn<bool> get isPaused =>
      $composableBuilder(column: $table.isPaused, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get reminderOffsetMin => $composableBuilder(
    column: $table.reminderOffsetMin,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get reminderIgnoreQuiet => $composableBuilder(
    column: $table.reminderIgnoreQuiet,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<LocalDate?, String> get generatedThrough =>
      $composableBuilder(
        column: $table.generatedThrough,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<Instant, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$LabelsTableAnnotationComposer get labelId {
    final $$LabelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableAnnotationComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> entriesRefs<T extends Object>(
    Expression<T> Function($$EntriesTableAnnotationComposer a) f,
  ) {
    final $$EntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.routineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> routineExceptionsRefs<T extends Object>(
    Expression<T> Function($$RoutineExceptionsTableAnnotationComposer a) f,
  ) {
    final $$RoutineExceptionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.routineExceptions,
          getReferencedColumn: (t) => t.routineId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoutineExceptionsTableAnnotationComposer(
                $db: $db,
                $table: $db.routineExceptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RoutinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutinesTable,
          RoutineRow,
          $$RoutinesTableFilterComposer,
          $$RoutinesTableOrderingComposer,
          $$RoutinesTableAnnotationComposer,
          $$RoutinesTableCreateCompanionBuilder,
          $$RoutinesTableUpdateCompanionBuilder,
          (RoutineRow, $$RoutinesTableReferences),
          RoutineRow,
          PrefetchHooks Function({
            bool labelId,
            bool entriesRefs,
            bool routineExceptionsRefs,
          })
        > {
  $$RoutinesTableTableManager(_$AppDatabase db, $RoutinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String> labelId = const Value.absent(),
                Value<int> startMinute = const Value.absent(),
                Value<int> endMinute = const Value.absent(),
                Value<String> recurrenceFreq = const Value.absent(),
                Value<int> recurrenceInterval = const Value.absent(),
                Value<int?> weekdaysMask = const Value.absent(),
                Value<LocalDate> startsOn = const Value.absent(),
                Value<LocalDate?> endsOn = const Value.absent(),
                Value<bool> isPaused = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> reminderOffsetMin = const Value.absent(),
                Value<bool> reminderIgnoreQuiet = const Value.absent(),
                Value<LocalDate?> generatedThrough = const Value.absent(),
                Value<Instant> createdAt = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutinesCompanion(
                id: id,
                name: name,
                labelId: labelId,
                startMinute: startMinute,
                endMinute: endMinute,
                recurrenceFreq: recurrenceFreq,
                recurrenceInterval: recurrenceInterval,
                weekdaysMask: weekdaysMask,
                startsOn: startsOn,
                endsOn: endsOn,
                isPaused: isPaused,
                isArchived: isArchived,
                note: note,
                reminderOffsetMin: reminderOffsetMin,
                reminderIgnoreQuiet: reminderIgnoreQuiet,
                generatedThrough: generatedThrough,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> name = const Value.absent(),
                required String labelId,
                required int startMinute,
                required int endMinute,
                Value<String> recurrenceFreq = const Value.absent(),
                Value<int> recurrenceInterval = const Value.absent(),
                Value<int?> weekdaysMask = const Value.absent(),
                required LocalDate startsOn,
                Value<LocalDate?> endsOn = const Value.absent(),
                Value<bool> isPaused = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> reminderOffsetMin = const Value.absent(),
                Value<bool> reminderIgnoreQuiet = const Value.absent(),
                Value<LocalDate?> generatedThrough = const Value.absent(),
                required Instant createdAt,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RoutinesCompanion.insert(
                id: id,
                name: name,
                labelId: labelId,
                startMinute: startMinute,
                endMinute: endMinute,
                recurrenceFreq: recurrenceFreq,
                recurrenceInterval: recurrenceInterval,
                weekdaysMask: weekdaysMask,
                startsOn: startsOn,
                endsOn: endsOn,
                isPaused: isPaused,
                isArchived: isArchived,
                note: note,
                reminderOffsetMin: reminderOffsetMin,
                reminderIgnoreQuiet: reminderIgnoreQuiet,
                generatedThrough: generatedThrough,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RoutinesTable, RoutineRow>(table),
                  $$RoutinesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                labelId = false,
                entriesRefs = false,
                routineExceptionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (entriesRefs) db.entries,
                    if (routineExceptionsRefs) db.routineExceptions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (labelId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.labelId,
                            referencedTable: $$RoutinesTableReferences
                                ._labelIdTable(db),
                            referencedColumn: $$RoutinesTableReferences
                                ._labelIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (entriesRefs)
                        await $_getPrefetchedDataByColumns<
                          RoutineRow,
                          $RoutinesTable,
                          EntryRow,
                          $EntriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$RoutinesTableReferences
                              ._entriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutinesTableReferences(
                                db,
                                table,
                                p0,
                              ).entriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'routine_id',
                          typedResults: items,
                        ),
                      if (routineExceptionsRefs)
                        await $_getPrefetchedDataByColumns<
                          RoutineRow,
                          $RoutinesTable,
                          RoutineExceptionRow,
                          $RoutineExceptionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$RoutinesTableReferences
                              ._routineExceptionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutinesTableReferences(
                                db,
                                table,
                                p0,
                              ).routineExceptionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'routine_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoutinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutinesTable,
      RoutineRow,
      $$RoutinesTableFilterComposer,
      $$RoutinesTableOrderingComposer,
      $$RoutinesTableAnnotationComposer,
      $$RoutinesTableCreateCompanionBuilder,
      $$RoutinesTableUpdateCompanionBuilder,
      (RoutineRow, $$RoutinesTableReferences),
      RoutineRow,
      PrefetchHooks Function({
        bool labelId,
        bool entriesRefs,
        bool routineExceptionsRefs,
      })
    >;
typedef $$EntriesTableCreateCompanionBuilder = EntriesCompanion Function({
  required String id,
  required String kind,
  required String labelId,
  Value<String?> categoryOverrideId,
  required Instant startUtc,
  Value<Instant?> endUtc,
  required String tzId,
  required int utcOffsetMin,
  Value<String?> note,
  Value<String?> taskId,
  required String source,
  Value<String?> routineId,
  Value<LocalDate?> occurrenceDate,
  Value<String?> plannedEntryId,
  required Instant createdAt,
  required Instant updatedAt,
  Value<int> rowid,
});
typedef $$EntriesTableUpdateCompanionBuilder = EntriesCompanion Function({
  Value<String> id,
  Value<String> kind,
  Value<String> labelId,
  Value<String?> categoryOverrideId,
  Value<Instant> startUtc,
  Value<Instant?> endUtc,
  Value<String> tzId,
  Value<int> utcOffsetMin,
  Value<String?> note,
  Value<String?> taskId,
  Value<String> source,
  Value<String?> routineId,
  Value<LocalDate?> occurrenceDate,
  Value<String?> plannedEntryId,
  Value<Instant> createdAt,
  Value<Instant> updatedAt,
  Value<int> rowid,
});

final class $$EntriesTableReferences
    extends BaseReferences<_$AppDatabase, $EntriesTable, EntryRow> {
  $$EntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LabelsTable _labelIdTable(_$AppDatabase db) =>
      db.labels.createAlias('entries__label_id__labels__id');

  $$LabelsTableProcessedTableManager get labelId {
    final $_column = $_itemColumn<String>('label_id')!;

    final manager = $$LabelsTableTableManager(
      $_db,
      $_db.labels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_labelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryOverrideIdTable(_$AppDatabase db) => db
      .categories
      .createAlias('entries__category_override_id__categories__id');

  $$CategoriesTableProcessedTableManager? get categoryOverrideId {
    final $_column = $_itemColumn<String>('category_override_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryOverrideIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TasksTable _taskIdTable(_$AppDatabase db) =>
      db.tasks.createAlias('entries__task_id__tasks__id');

  $$TasksTableProcessedTableManager? get taskId {
    final $_column = $_itemColumn<String>('task_id');
    if ($_column == null) return null;
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RoutinesTable _routineIdTable(_$AppDatabase db) =>
      db.routines.createAlias('entries__routine_id__routines__id');

  $$RoutinesTableProcessedTableManager? get routineId {
    final $_column = $_itemColumn<String>('routine_id');
    if ($_column == null) return null;
    final manager = $$RoutinesTableTableManager(
      $_db,
      $_db.routines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EntriesTable _plannedEntryIdTable(_$AppDatabase db) =>
      db.entries.createAlias('entries__planned_entry_id__entries__id');

  $$EntriesTableProcessedTableManager? get plannedEntryId {
    final $_column = $_itemColumn<String>('planned_entry_id');
    if ($_column == null) return null;
    final manager = $$EntriesTableTableManager(
      $_db,
      $_db.entries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_plannedEntryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EntriesTableFilterComposer
    extends Composer<_$AppDatabase, $EntriesTable> {
  $$EntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get startUtc =>
      $composableBuilder(
        column: $table.startUtc,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant?, Instant, int> get endUtc =>
      $composableBuilder(
        column: $table.endUtc,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get tzId => $composableBuilder(
    column: $table.tzId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get utcOffsetMin => $composableBuilder(
    column: $table.utcOffsetMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LocalDate?, LocalDate, String>
  get occurrenceDate => $composableBuilder(
    column: $table.occurrenceDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$LabelsTableFilterComposer get labelId {
    final $$LabelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableFilterComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryOverrideId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryOverrideId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableFilterComposer get taskId {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutinesTableFilterComposer get routineId {
    final $$RoutinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableFilterComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EntriesTableFilterComposer get plannedEntryId {
    final $$EntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.plannedEntryId,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableFilterComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $EntriesTable> {
  $$EntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startUtc => $composableBuilder(
    column: $table.startUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endUtc => $composableBuilder(
    column: $table.endUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tzId => $composableBuilder(
    column: $table.tzId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get utcOffsetMin => $composableBuilder(
    column: $table.utcOffsetMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occurrenceDate => $composableBuilder(
    column: $table.occurrenceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LabelsTableOrderingComposer get labelId {
    final $$LabelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableOrderingComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryOverrideId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryOverrideId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableOrderingComposer get taskId {
    final $$TasksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableOrderingComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutinesTableOrderingComposer get routineId {
    final $$RoutinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableOrderingComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EntriesTableOrderingComposer get plannedEntryId {
    final $$EntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.plannedEntryId,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableOrderingComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntriesTable> {
  $$EntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get startUtc =>
      $composableBuilder(column: $table.startUtc, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant?, int> get endUtc =>
      $composableBuilder(column: $table.endUtc, builder: (column) => column);

  GeneratedColumn<String> get tzId =>
      $composableBuilder(column: $table.tzId, builder: (column) => column);

  GeneratedColumn<int> get utcOffsetMin => $composableBuilder(
    column: $table.utcOffsetMin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalDate?, String> get occurrenceDate =>
      $composableBuilder(
        column: $table.occurrenceDate,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<Instant, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$LabelsTableAnnotationComposer get labelId {
    final $$LabelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableAnnotationComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryOverrideId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryOverrideId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableAnnotationComposer get taskId {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutinesTableAnnotationComposer get routineId {
    final $$RoutinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableAnnotationComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EntriesTableAnnotationComposer get plannedEntryId {
    final $$EntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.plannedEntryId,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EntriesTable,
          EntryRow,
          $$EntriesTableFilterComposer,
          $$EntriesTableOrderingComposer,
          $$EntriesTableAnnotationComposer,
          $$EntriesTableCreateCompanionBuilder,
          $$EntriesTableUpdateCompanionBuilder,
          (EntryRow, $$EntriesTableReferences),
          EntryRow,
          PrefetchHooks Function({
            bool labelId,
            bool categoryOverrideId,
            bool taskId,
            bool routineId,
            bool plannedEntryId,
          })
        > {
  $$EntriesTableTableManager(_$AppDatabase db, $EntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> labelId = const Value.absent(),
                Value<String?> categoryOverrideId = const Value.absent(),
                Value<Instant> startUtc = const Value.absent(),
                Value<Instant?> endUtc = const Value.absent(),
                Value<String> tzId = const Value.absent(),
                Value<int> utcOffsetMin = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> taskId = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> routineId = const Value.absent(),
                Value<LocalDate?> occurrenceDate = const Value.absent(),
                Value<String?> plannedEntryId = const Value.absent(),
                Value<Instant> createdAt = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EntriesCompanion(
                id: id,
                kind: kind,
                labelId: labelId,
                categoryOverrideId: categoryOverrideId,
                startUtc: startUtc,
                endUtc: endUtc,
                tzId: tzId,
                utcOffsetMin: utcOffsetMin,
                note: note,
                taskId: taskId,
                source: source,
                routineId: routineId,
                occurrenceDate: occurrenceDate,
                plannedEntryId: plannedEntryId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                required String labelId,
                Value<String?> categoryOverrideId = const Value.absent(),
                required Instant startUtc,
                Value<Instant?> endUtc = const Value.absent(),
                required String tzId,
                required int utcOffsetMin,
                Value<String?> note = const Value.absent(),
                Value<String?> taskId = const Value.absent(),
                required String source,
                Value<String?> routineId = const Value.absent(),
                Value<LocalDate?> occurrenceDate = const Value.absent(),
                Value<String?> plannedEntryId = const Value.absent(),
                required Instant createdAt,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => EntriesCompanion.insert(
                id: id,
                kind: kind,
                labelId: labelId,
                categoryOverrideId: categoryOverrideId,
                startUtc: startUtc,
                endUtc: endUtc,
                tzId: tzId,
                utcOffsetMin: utcOffsetMin,
                note: note,
                taskId: taskId,
                source: source,
                routineId: routineId,
                occurrenceDate: occurrenceDate,
                plannedEntryId: plannedEntryId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EntriesTable, EntryRow>(table),
                  $$EntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                labelId = false,
                categoryOverrideId = false,
                taskId = false,
                routineId = false,
                plannedEntryId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (labelId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.labelId,
                            referencedTable: $$EntriesTableReferences
                                ._labelIdTable(db),
                            referencedColumn: $$EntriesTableReferences
                                ._labelIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (categoryOverrideId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryOverrideId,
                            referencedTable: $$EntriesTableReferences
                                ._categoryOverrideIdTable(db),
                            referencedColumn: $$EntriesTableReferences
                                ._categoryOverrideIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (taskId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.taskId,
                            referencedTable: $$EntriesTableReferences
                                ._taskIdTable(db),
                            referencedColumn: $$EntriesTableReferences
                                ._taskIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (routineId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.routineId,
                            referencedTable: $$EntriesTableReferences
                                ._routineIdTable(db),
                            referencedColumn: $$EntriesTableReferences
                                ._routineIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (plannedEntryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.plannedEntryId,
                            referencedTable: $$EntriesTableReferences
                                ._plannedEntryIdTable(db),
                            referencedColumn: $$EntriesTableReferences
                                ._plannedEntryIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$EntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EntriesTable,
      EntryRow,
      $$EntriesTableFilterComposer,
      $$EntriesTableOrderingComposer,
      $$EntriesTableAnnotationComposer,
      $$EntriesTableCreateCompanionBuilder,
      $$EntriesTableUpdateCompanionBuilder,
      (EntryRow, $$EntriesTableReferences),
      EntryRow,
      PrefetchHooks Function({
        bool labelId,
        bool categoryOverrideId,
        bool taskId,
        bool routineId,
        bool plannedEntryId,
      })
    >;
typedef $$RoutineExceptionsTableCreateCompanionBuilder =
    RoutineExceptionsCompanion Function({
      required String id,
      required String routineId,
      required LocalDate occurrenceDate,
      required String type,
      Value<int?> startOffsetMin,
      Value<int?> endOffsetMin,
      Value<String?> labelId,
      Value<String?> note,
      required Instant createdAt,
      required Instant updatedAt,
      Value<int> rowid,
    });
typedef $$RoutineExceptionsTableUpdateCompanionBuilder =
    RoutineExceptionsCompanion Function({
      Value<String> id,
      Value<String> routineId,
      Value<LocalDate> occurrenceDate,
      Value<String> type,
      Value<int?> startOffsetMin,
      Value<int?> endOffsetMin,
      Value<String?> labelId,
      Value<String?> note,
      Value<Instant> createdAt,
      Value<Instant> updatedAt,
      Value<int> rowid,
    });

final class $$RoutineExceptionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RoutineExceptionsTable,
          RoutineExceptionRow
        > {
  $$RoutineExceptionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoutinesTable _routineIdTable(_$AppDatabase db) =>
      db.routines.createAlias('routine_exceptions__routine_id__routines__id');

  $$RoutinesTableProcessedTableManager get routineId {
    final $_column = $_itemColumn<String>('routine_id')!;

    final manager = $$RoutinesTableTableManager(
      $_db,
      $_db.routines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LabelsTable _labelIdTable(_$AppDatabase db) =>
      db.labels.createAlias('routine_exceptions__label_id__labels__id');

  $$LabelsTableProcessedTableManager? get labelId {
    final $_column = $_itemColumn<String>('label_id');
    if ($_column == null) return null;
    final manager = $$LabelsTableTableManager(
      $_db,
      $_db.labels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_labelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RoutineExceptionsTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineExceptionsTable> {
  $$RoutineExceptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LocalDate, LocalDate, String>
  get occurrenceDate => $composableBuilder(
    column: $table.occurrenceDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startOffsetMin => $composableBuilder(
    column: $table.startOffsetMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endOffsetMin => $composableBuilder(
    column: $table.endOffsetMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$RoutinesTableFilterComposer get routineId {
    final $$RoutinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableFilterComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LabelsTableFilterComposer get labelId {
    final $$LabelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableFilterComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineExceptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineExceptionsTable> {
  $$RoutineExceptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occurrenceDate => $composableBuilder(
    column: $table.occurrenceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startOffsetMin => $composableBuilder(
    column: $table.startOffsetMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endOffsetMin => $composableBuilder(
    column: $table.endOffsetMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoutinesTableOrderingComposer get routineId {
    final $$RoutinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableOrderingComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LabelsTableOrderingComposer get labelId {
    final $$LabelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableOrderingComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineExceptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineExceptionsTable> {
  $$RoutineExceptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalDate, String> get occurrenceDate =>
      $composableBuilder(
        column: $table.occurrenceDate,
        builder: (column) => column,
      );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get startOffsetMin => $composableBuilder(
    column: $table.startOffsetMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endOffsetMin => $composableBuilder(
    column: $table.endOffsetMin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$RoutinesTableAnnotationComposer get routineId {
    final $$RoutinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableAnnotationComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LabelsTableAnnotationComposer get labelId {
    final $$LabelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.labelId,
      referencedTable: $db.labels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabelsTableAnnotationComposer(
            $db: $db,
            $table: $db.labels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineExceptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineExceptionsTable,
          RoutineExceptionRow,
          $$RoutineExceptionsTableFilterComposer,
          $$RoutineExceptionsTableOrderingComposer,
          $$RoutineExceptionsTableAnnotationComposer,
          $$RoutineExceptionsTableCreateCompanionBuilder,
          $$RoutineExceptionsTableUpdateCompanionBuilder,
          (RoutineExceptionRow, $$RoutineExceptionsTableReferences),
          RoutineExceptionRow,
          PrefetchHooks Function({bool routineId, bool labelId})
        > {
  $$RoutineExceptionsTableTableManager(
    _$AppDatabase db,
    $RoutineExceptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineExceptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineExceptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineExceptionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> routineId = const Value.absent(),
                Value<LocalDate> occurrenceDate = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int?> startOffsetMin = const Value.absent(),
                Value<int?> endOffsetMin = const Value.absent(),
                Value<String?> labelId = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<Instant> createdAt = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineExceptionsCompanion(
                id: id,
                routineId: routineId,
                occurrenceDate: occurrenceDate,
                type: type,
                startOffsetMin: startOffsetMin,
                endOffsetMin: endOffsetMin,
                labelId: labelId,
                note: note,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String routineId,
                required LocalDate occurrenceDate,
                required String type,
                Value<int?> startOffsetMin = const Value.absent(),
                Value<int?> endOffsetMin = const Value.absent(),
                Value<String?> labelId = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required Instant createdAt,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RoutineExceptionsCompanion.insert(
                id: id,
                routineId: routineId,
                occurrenceDate: occurrenceDate,
                type: type,
                startOffsetMin: startOffsetMin,
                endOffsetMin: endOffsetMin,
                labelId: labelId,
                note: note,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RoutineExceptionsTable, RoutineExceptionRow>(
                    table,
                  ),
                  $$RoutineExceptionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({routineId = false, labelId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (routineId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.routineId,
                        referencedTable: $$RoutineExceptionsTableReferences
                            ._routineIdTable(db),
                        referencedColumn: $$RoutineExceptionsTableReferences
                            ._routineIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (labelId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.labelId,
                        referencedTable: $$RoutineExceptionsTableReferences
                            ._labelIdTable(db),
                        referencedColumn: $$RoutineExceptionsTableReferences
                            ._labelIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RoutineExceptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineExceptionsTable,
      RoutineExceptionRow,
      $$RoutineExceptionsTableFilterComposer,
      $$RoutineExceptionsTableOrderingComposer,
      $$RoutineExceptionsTableAnnotationComposer,
      $$RoutineExceptionsTableCreateCompanionBuilder,
      $$RoutineExceptionsTableUpdateCompanionBuilder,
      (RoutineExceptionRow, $$RoutineExceptionsTableReferences),
      RoutineExceptionRow,
      PrefetchHooks Function({bool routineId, bool labelId})
    >;
typedef $$TaskRemindersTableCreateCompanionBuilder =
    TaskRemindersCompanion Function({
      required String id,
      required String taskId,
      required String type,
      Value<int?> offsetDays,
      Value<int?> minuteOfDay,
      Value<Instant?> customAtUtc,
      Value<bool> ignoreQuiet,
      required Instant createdAt,
      required Instant updatedAt,
      Value<int> rowid,
    });
typedef $$TaskRemindersTableUpdateCompanionBuilder =
    TaskRemindersCompanion Function({
      Value<String> id,
      Value<String> taskId,
      Value<String> type,
      Value<int?> offsetDays,
      Value<int?> minuteOfDay,
      Value<Instant?> customAtUtc,
      Value<bool> ignoreQuiet,
      Value<Instant> createdAt,
      Value<Instant> updatedAt,
      Value<int> rowid,
    });

final class $$TaskRemindersTableReferences
    extends
        BaseReferences<_$AppDatabase, $TaskRemindersTable, TaskReminderRow> {
  $$TaskRemindersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TasksTable _taskIdTable(_$AppDatabase db) =>
      db.tasks.createAlias('task_reminders__task_id__tasks__id');

  $$TasksTableProcessedTableManager get taskId {
    final $_column = $_itemColumn<String>('task_id')!;

    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TaskRemindersTableFilterComposer
    extends Composer<_$AppDatabase, $TaskRemindersTable> {
  $$TaskRemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get offsetDays => $composableBuilder(
    column: $table.offsetDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minuteOfDay => $composableBuilder(
    column: $table.minuteOfDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant?, Instant, int> get customAtUtc =>
      $composableBuilder(
        column: $table.customAtUtc,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get ignoreQuiet => $composableBuilder(
    column: $table.ignoreQuiet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$TasksTableFilterComposer get taskId {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskRemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskRemindersTable> {
  $$TaskRemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get offsetDays => $composableBuilder(
    column: $table.offsetDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minuteOfDay => $composableBuilder(
    column: $table.minuteOfDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customAtUtc => $composableBuilder(
    column: $table.customAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ignoreQuiet => $composableBuilder(
    column: $table.ignoreQuiet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TasksTableOrderingComposer get taskId {
    final $$TasksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableOrderingComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskRemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskRemindersTable> {
  $$TaskRemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get offsetDays => $composableBuilder(
    column: $table.offsetDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get minuteOfDay => $composableBuilder(
    column: $table.minuteOfDay,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Instant?, int> get customAtUtc =>
      $composableBuilder(
        column: $table.customAtUtc,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get ignoreQuiet => $composableBuilder(
    column: $table.ignoreQuiet,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Instant, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TasksTableAnnotationComposer get taskId {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskRemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskRemindersTable,
          TaskReminderRow,
          $$TaskRemindersTableFilterComposer,
          $$TaskRemindersTableOrderingComposer,
          $$TaskRemindersTableAnnotationComposer,
          $$TaskRemindersTableCreateCompanionBuilder,
          $$TaskRemindersTableUpdateCompanionBuilder,
          (TaskReminderRow, $$TaskRemindersTableReferences),
          TaskReminderRow,
          PrefetchHooks Function({bool taskId})
        > {
  $$TaskRemindersTableTableManager(_$AppDatabase db, $TaskRemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskRemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskRemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskRemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> taskId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int?> offsetDays = const Value.absent(),
                Value<int?> minuteOfDay = const Value.absent(),
                Value<Instant?> customAtUtc = const Value.absent(),
                Value<bool> ignoreQuiet = const Value.absent(),
                Value<Instant> createdAt = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskRemindersCompanion(
                id: id,
                taskId: taskId,
                type: type,
                offsetDays: offsetDays,
                minuteOfDay: minuteOfDay,
                customAtUtc: customAtUtc,
                ignoreQuiet: ignoreQuiet,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String taskId,
                required String type,
                Value<int?> offsetDays = const Value.absent(),
                Value<int?> minuteOfDay = const Value.absent(),
                Value<Instant?> customAtUtc = const Value.absent(),
                Value<bool> ignoreQuiet = const Value.absent(),
                required Instant createdAt,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => TaskRemindersCompanion.insert(
                id: id,
                taskId: taskId,
                type: type,
                offsetDays: offsetDays,
                minuteOfDay: minuteOfDay,
                customAtUtc: customAtUtc,
                ignoreQuiet: ignoreQuiet,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TaskRemindersTable, TaskReminderRow>(table),
                  $$TaskRemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({taskId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (taskId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.taskId,
                        referencedTable: $$TaskRemindersTableReferences
                            ._taskIdTable(db),
                        referencedColumn: $$TaskRemindersTableReferences
                            ._taskIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TaskRemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskRemindersTable,
      TaskReminderRow,
      $$TaskRemindersTableFilterComposer,
      $$TaskRemindersTableOrderingComposer,
      $$TaskRemindersTableAnnotationComposer,
      $$TaskRemindersTableCreateCompanionBuilder,
      $$TaskRemindersTableUpdateCompanionBuilder,
      (TaskReminderRow, $$TaskRemindersTableReferences),
      TaskReminderRow,
      PrefetchHooks Function({bool taskId})
    >;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String key,
  required String value,
  required String scope,
  required Instant updatedAt,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<String> scope,
  Value<Instant> updatedAt,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Instant, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          SettingRow,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            SettingRow,
            BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>,
          ),
          SettingRow,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<String> scope = const Value.absent(),
                Value<Instant> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(
                key: key,
                value: value,
                scope: scope,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required String scope,
                required Instant updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
                scope: scope,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTable, SettingRow>(table),
                  BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      SettingRow,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (SettingRow, BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>),
      SettingRow,
      PrefetchHooks Function()
    >;
typedef $$ScheduledNotificationsTableCreateCompanionBuilder =
    ScheduledNotificationsCompanion Function({
      required String key,
      required int platformId,
      required Instant fireAtUtc,
      required String contentHash,
      Value<int> rowid,
    });
typedef $$ScheduledNotificationsTableUpdateCompanionBuilder =
    ScheduledNotificationsCompanion Function({
      Value<String> key,
      Value<int> platformId,
      Value<Instant> fireAtUtc,
      Value<String> contentHash,
      Value<int> rowid,
    });

class $$ScheduledNotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get platformId => $composableBuilder(
    column: $table.platformId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Instant, Instant, int> get fireAtUtc =>
      $composableBuilder(
        column: $table.fireAtUtc,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScheduledNotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get platformId => $composableBuilder(
    column: $table.platformId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fireAtUtc => $composableBuilder(
    column: $table.fireAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScheduledNotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<int> get platformId => $composableBuilder(
    column: $table.platformId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Instant, int> get fireAtUtc =>
      $composableBuilder(column: $table.fireAtUtc, builder: (column) => column);

  GeneratedColumn<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => column,
  );
}

class $$ScheduledNotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduledNotificationsTable,
          ScheduledNotificationRow,
          $$ScheduledNotificationsTableFilterComposer,
          $$ScheduledNotificationsTableOrderingComposer,
          $$ScheduledNotificationsTableAnnotationComposer,
          $$ScheduledNotificationsTableCreateCompanionBuilder,
          $$ScheduledNotificationsTableUpdateCompanionBuilder,
          (
            ScheduledNotificationRow,
            BaseReferences<
              _$AppDatabase,
              $ScheduledNotificationsTable,
              ScheduledNotificationRow
            >,
          ),
          ScheduledNotificationRow,
          PrefetchHooks Function()
        > {
  $$ScheduledNotificationsTableTableManager(
    _$AppDatabase db,
    $ScheduledNotificationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduledNotificationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ScheduledNotificationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ScheduledNotificationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<int> platformId = const Value.absent(),
                Value<Instant> fireAtUtc = const Value.absent(),
                Value<String> contentHash = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScheduledNotificationsCompanion(
                key: key,
                platformId: platformId,
                fireAtUtc: fireAtUtc,
                contentHash: contentHash,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required int platformId,
                required Instant fireAtUtc,
                required String contentHash,
                Value<int> rowid = const Value.absent(),
              }) => ScheduledNotificationsCompanion.insert(
                key: key,
                platformId: platformId,
                fireAtUtc: fireAtUtc,
                contentHash: contentHash,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $ScheduledNotificationsTable,
                    ScheduledNotificationRow
                  >(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ScheduledNotificationsTable,
                    ScheduledNotificationRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScheduledNotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduledNotificationsTable,
      ScheduledNotificationRow,
      $$ScheduledNotificationsTableFilterComposer,
      $$ScheduledNotificationsTableOrderingComposer,
      $$ScheduledNotificationsTableAnnotationComposer,
      $$ScheduledNotificationsTableCreateCompanionBuilder,
      $$ScheduledNotificationsTableUpdateCompanionBuilder,
      (
        ScheduledNotificationRow,
        BaseReferences<
          _$AppDatabase,
          $ScheduledNotificationsTable,
          ScheduledNotificationRow
        >,
      ),
      ScheduledNotificationRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$LabelsTableTableManager get labels =>
      $$LabelsTableTableManager(_db, _db.labels);
  $$TaskSeriesTableTableManager get taskSeries =>
      $$TaskSeriesTableTableManager(_db, _db.taskSeries);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$RoutinesTableTableManager get routines =>
      $$RoutinesTableTableManager(_db, _db.routines);
  $$EntriesTableTableManager get entries =>
      $$EntriesTableTableManager(_db, _db.entries);
  $$RoutineExceptionsTableTableManager get routineExceptions =>
      $$RoutineExceptionsTableTableManager(_db, _db.routineExceptions);
  $$TaskRemindersTableTableManager get taskReminders =>
      $$TaskRemindersTableTableManager(_db, _db.taskReminders);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$ScheduledNotificationsTableTableManager get scheduledNotifications =>
      $$ScheduledNotificationsTableTableManager(
        _db,
        _db.scheduledNotifications,
      );
}
