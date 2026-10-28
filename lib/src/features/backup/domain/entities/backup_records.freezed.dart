// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_records.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryRecord {

 String get id; String get name; String? get colorKey; int get sortOrder; Instant get createdAt; Instant get updatedAt;
/// Create a copy of CategoryRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryRecordCopyWith<CategoryRecord> get copyWith => _$CategoryRecordCopyWithImpl<CategoryRecord>(this as CategoryRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CategoryRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.colorKey, _this.colorKey) || other.colorKey == _this.colorKey)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as CategoryRecord;
  return Object.hash(runtimeType,_this.id,_this.name,_this.colorKey,_this.sortOrder,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as CategoryRecord;
  return 'CategoryRecord(id: ${_this.id}, name: ${_this.name}, colorKey: ${_this.colorKey}, sortOrder: ${_this.sortOrder}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $CategoryRecordCopyWith<$Res>  {
  factory $CategoryRecordCopyWith(CategoryRecord value, $Res Function(CategoryRecord) _then) = _$CategoryRecordCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? colorKey, int sortOrder, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$CategoryRecordCopyWithImpl<$Res>
    implements $CategoryRecordCopyWith<$Res> {
  _$CategoryRecordCopyWithImpl(this._self, this._then);

  final CategoryRecord _self;
  final $Res Function(CategoryRecord) _then;

/// Create a copy of CategoryRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? colorKey = freezed,Object? sortOrder = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(CategoryRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorKey: freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryRecord].
extension CategoryRecordPatterns on CategoryRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryRecord value)  $default,){
final _that = this;
switch (_that) {
case _CategoryRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryRecord value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? colorKey,  int sortOrder,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryRecord() when $default != null:
return $default(_that.id,_that.name,_that.colorKey,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? colorKey,  int sortOrder,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CategoryRecord():
return $default(_that.id,_that.name,_that.colorKey,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? colorKey,  int sortOrder,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CategoryRecord() when $default != null:
return $default(_that.id,_that.name,_that.colorKey,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryRecord implements CategoryRecord {
  const _CategoryRecord({required this.id, required this.name, this.colorKey, this.sortOrder = 0, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  String? colorKey;
@override@JsonKey() final  int sortOrder;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of CategoryRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryRecordCopyWith<_CategoryRecord> get copyWith => __$CategoryRecordCopyWithImpl<_CategoryRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorKey, colorKey) || other.colorKey == colorKey)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,colorKey,sortOrder,createdAt,updatedAt);
}

@override
String toString() {
    return 'CategoryRecord(id: $id, name: $name, colorKey: $colorKey, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryRecordCopyWith<$Res> implements $CategoryRecordCopyWith<$Res> {
  factory _$CategoryRecordCopyWith(_CategoryRecord value, $Res Function(_CategoryRecord) _then) = __$CategoryRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? colorKey, int sortOrder, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$CategoryRecordCopyWithImpl<$Res>
    implements _$CategoryRecordCopyWith<$Res> {
  __$CategoryRecordCopyWithImpl(this._self, this._then);

  final _CategoryRecord _self;
  final $Res Function(_CategoryRecord) _then;

/// Create a copy of CategoryRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? colorKey = freezed,Object? sortOrder = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CategoryRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorKey: freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$LabelRecord {

 String get id; String get name; String get colorKey; String? get iconKey; String? get categoryId; bool get isArchived; int get sortOrder; Instant get createdAt; Instant get updatedAt;
/// Create a copy of LabelRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelRecordCopyWith<LabelRecord> get copyWith => _$LabelRecordCopyWithImpl<LabelRecord>(this as LabelRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LabelRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.colorKey, _this.colorKey) || other.colorKey == _this.colorKey)&&(identical(other.iconKey, _this.iconKey) || other.iconKey == _this.iconKey)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as LabelRecord;
  return Object.hash(runtimeType,_this.id,_this.name,_this.colorKey,_this.iconKey,_this.categoryId,_this.isArchived,_this.sortOrder,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as LabelRecord;
  return 'LabelRecord(id: ${_this.id}, name: ${_this.name}, colorKey: ${_this.colorKey}, iconKey: ${_this.iconKey}, categoryId: ${_this.categoryId}, isArchived: ${_this.isArchived}, sortOrder: ${_this.sortOrder}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $LabelRecordCopyWith<$Res>  {
  factory $LabelRecordCopyWith(LabelRecord value, $Res Function(LabelRecord) _then) = _$LabelRecordCopyWithImpl;
@useResult
$Res call({
 String id, String name, String colorKey, String? iconKey, String? categoryId, bool isArchived, int sortOrder, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$LabelRecordCopyWithImpl<$Res>
    implements $LabelRecordCopyWith<$Res> {
  _$LabelRecordCopyWithImpl(this._self, this._then);

  final LabelRecord _self;
  final $Res Function(LabelRecord) _then;

/// Create a copy of LabelRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? colorKey = null,Object? iconKey = freezed,Object? categoryId = freezed,Object? isArchived = null,Object? sortOrder = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(LabelRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorKey: null == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String,iconKey: freezed == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [LabelRecord].
extension LabelRecordPatterns on LabelRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabelRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabelRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabelRecord value)  $default,){
final _that = this;
switch (_that) {
case _LabelRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabelRecord value)?  $default,){
final _that = this;
switch (_that) {
case _LabelRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String colorKey,  String? iconKey,  String? categoryId,  bool isArchived,  int sortOrder,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabelRecord() when $default != null:
return $default(_that.id,_that.name,_that.colorKey,_that.iconKey,_that.categoryId,_that.isArchived,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String colorKey,  String? iconKey,  String? categoryId,  bool isArchived,  int sortOrder,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LabelRecord():
return $default(_that.id,_that.name,_that.colorKey,_that.iconKey,_that.categoryId,_that.isArchived,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String colorKey,  String? iconKey,  String? categoryId,  bool isArchived,  int sortOrder,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LabelRecord() when $default != null:
return $default(_that.id,_that.name,_that.colorKey,_that.iconKey,_that.categoryId,_that.isArchived,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _LabelRecord implements LabelRecord {
  const _LabelRecord({required this.id, required this.name, required this.colorKey, this.iconKey, this.categoryId, this.isArchived = false, this.sortOrder = 0, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  String colorKey;
@override final  String? iconKey;
@override final  String? categoryId;
@override@JsonKey() final  bool isArchived;
@override@JsonKey() final  int sortOrder;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of LabelRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelRecordCopyWith<_LabelRecord> get copyWith => __$LabelRecordCopyWithImpl<_LabelRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabelRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorKey, colorKey) || other.colorKey == colorKey)&&(identical(other.iconKey, iconKey) || other.iconKey == iconKey)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,colorKey,iconKey,categoryId,isArchived,sortOrder,createdAt,updatedAt);
}

@override
String toString() {
    return 'LabelRecord(id: $id, name: $name, colorKey: $colorKey, iconKey: $iconKey, categoryId: $categoryId, isArchived: $isArchived, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LabelRecordCopyWith<$Res> implements $LabelRecordCopyWith<$Res> {
  factory _$LabelRecordCopyWith(_LabelRecord value, $Res Function(_LabelRecord) _then) = __$LabelRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String colorKey, String? iconKey, String? categoryId, bool isArchived, int sortOrder, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$LabelRecordCopyWithImpl<$Res>
    implements _$LabelRecordCopyWith<$Res> {
  __$LabelRecordCopyWithImpl(this._self, this._then);

  final _LabelRecord _self;
  final $Res Function(_LabelRecord) _then;

/// Create a copy of LabelRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? colorKey = null,Object? iconKey = freezed,Object? categoryId = freezed,Object? isArchived = null,Object? sortOrder = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_LabelRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorKey: null == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String,iconKey: freezed == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$EntryRecord {

 String get id;/// `planned` | `actual`.
 String get kind; String get labelId; String? get categoryOverrideId; Instant get start;/// Null for an open entry.
 Instant? get end; String get tzId; int get utcOffsetMin; String? get note; String? get taskId;/// `manual` | `routine` | `from_plan`.
 String get source; String? get routineId; LocalDate? get occurrenceDate; String? get plannedEntryId; Instant get createdAt; Instant get updatedAt;
/// Create a copy of EntryRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryRecordCopyWith<EntryRecord> get copyWith => _$EntryRecordCopyWithImpl<EntryRecord>(this as EntryRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EntryRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.labelId, _this.labelId) || other.labelId == _this.labelId)&&(identical(other.categoryOverrideId, _this.categoryOverrideId) || other.categoryOverrideId == _this.categoryOverrideId)&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end)&&(identical(other.tzId, _this.tzId) || other.tzId == _this.tzId)&&(identical(other.utcOffsetMin, _this.utcOffsetMin) || other.utcOffsetMin == _this.utcOffsetMin)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.routineId, _this.routineId) || other.routineId == _this.routineId)&&(identical(other.occurrenceDate, _this.occurrenceDate) || other.occurrenceDate == _this.occurrenceDate)&&(identical(other.plannedEntryId, _this.plannedEntryId) || other.plannedEntryId == _this.plannedEntryId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as EntryRecord;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.labelId,_this.categoryOverrideId,_this.start,_this.end,_this.tzId,_this.utcOffsetMin,_this.note,_this.taskId,_this.source,_this.routineId,_this.occurrenceDate,_this.plannedEntryId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as EntryRecord;
  return 'EntryRecord(id: ${_this.id}, kind: ${_this.kind}, labelId: ${_this.labelId}, categoryOverrideId: ${_this.categoryOverrideId}, start: ${_this.start}, end: ${_this.end}, tzId: ${_this.tzId}, utcOffsetMin: ${_this.utcOffsetMin}, note: ${_this.note}, taskId: ${_this.taskId}, source: ${_this.source}, routineId: ${_this.routineId}, occurrenceDate: ${_this.occurrenceDate}, plannedEntryId: ${_this.plannedEntryId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $EntryRecordCopyWith<$Res>  {
  factory $EntryRecordCopyWith(EntryRecord value, $Res Function(EntryRecord) _then) = _$EntryRecordCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String labelId, String? categoryOverrideId, Instant start, Instant? end, String tzId, int utcOffsetMin, String? note, String? taskId, String source, String? routineId, LocalDate? occurrenceDate, String? plannedEntryId, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$EntryRecordCopyWithImpl<$Res>
    implements $EntryRecordCopyWith<$Res> {
  _$EntryRecordCopyWithImpl(this._self, this._then);

  final EntryRecord _self;
  final $Res Function(EntryRecord) _then;

/// Create a copy of EntryRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? labelId = null,Object? categoryOverrideId = freezed,Object? start = null,Object? end = freezed,Object? tzId = null,Object? utcOffsetMin = null,Object? note = freezed,Object? taskId = freezed,Object? source = null,Object? routineId = freezed,Object? occurrenceDate = freezed,Object? plannedEntryId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(EntryRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,labelId: null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,categoryOverrideId: freezed == categoryOverrideId ? _self.categoryOverrideId : categoryOverrideId // ignore: cast_nullable_to_non_nullable
as String?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Instant,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant?,tzId: null == tzId ? _self.tzId : tzId // ignore: cast_nullable_to_non_nullable
as String,utcOffsetMin: null == utcOffsetMin ? _self.utcOffsetMin : utcOffsetMin // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,routineId: freezed == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String?,occurrenceDate: freezed == occurrenceDate ? _self.occurrenceDate : occurrenceDate // ignore: cast_nullable_to_non_nullable
as LocalDate?,plannedEntryId: freezed == plannedEntryId ? _self.plannedEntryId : plannedEntryId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [EntryRecord].
extension EntryRecordPatterns on EntryRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntryRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntryRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntryRecord value)  $default,){
final _that = this;
switch (_that) {
case _EntryRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntryRecord value)?  $default,){
final _that = this;
switch (_that) {
case _EntryRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String labelId,  String? categoryOverrideId,  Instant start,  Instant? end,  String tzId,  int utcOffsetMin,  String? note,  String? taskId,  String source,  String? routineId,  LocalDate? occurrenceDate,  String? plannedEntryId,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntryRecord() when $default != null:
return $default(_that.id,_that.kind,_that.labelId,_that.categoryOverrideId,_that.start,_that.end,_that.tzId,_that.utcOffsetMin,_that.note,_that.taskId,_that.source,_that.routineId,_that.occurrenceDate,_that.plannedEntryId,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String labelId,  String? categoryOverrideId,  Instant start,  Instant? end,  String tzId,  int utcOffsetMin,  String? note,  String? taskId,  String source,  String? routineId,  LocalDate? occurrenceDate,  String? plannedEntryId,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _EntryRecord():
return $default(_that.id,_that.kind,_that.labelId,_that.categoryOverrideId,_that.start,_that.end,_that.tzId,_that.utcOffsetMin,_that.note,_that.taskId,_that.source,_that.routineId,_that.occurrenceDate,_that.plannedEntryId,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String labelId,  String? categoryOverrideId,  Instant start,  Instant? end,  String tzId,  int utcOffsetMin,  String? note,  String? taskId,  String source,  String? routineId,  LocalDate? occurrenceDate,  String? plannedEntryId,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _EntryRecord() when $default != null:
return $default(_that.id,_that.kind,_that.labelId,_that.categoryOverrideId,_that.start,_that.end,_that.tzId,_that.utcOffsetMin,_that.note,_that.taskId,_that.source,_that.routineId,_that.occurrenceDate,_that.plannedEntryId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _EntryRecord implements EntryRecord {
  const _EntryRecord({required this.id, required this.kind, required this.labelId, this.categoryOverrideId, required this.start, this.end, required this.tzId, required this.utcOffsetMin, this.note, this.taskId, required this.source, this.routineId, this.occurrenceDate, this.plannedEntryId, required this.createdAt, required this.updatedAt});
  

@override final  String id;
/// `planned` | `actual`.
@override final  String kind;
@override final  String labelId;
@override final  String? categoryOverrideId;
@override final  Instant start;
/// Null for an open entry.
@override final  Instant? end;
@override final  String tzId;
@override final  int utcOffsetMin;
@override final  String? note;
@override final  String? taskId;
/// `manual` | `routine` | `from_plan`.
@override final  String source;
@override final  String? routineId;
@override final  LocalDate? occurrenceDate;
@override final  String? plannedEntryId;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of EntryRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryRecordCopyWith<_EntryRecord> get copyWith => __$EntryRecordCopyWithImpl<_EntryRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.labelId, labelId) || other.labelId == labelId)&&(identical(other.categoryOverrideId, categoryOverrideId) || other.categoryOverrideId == categoryOverrideId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.tzId, tzId) || other.tzId == tzId)&&(identical(other.utcOffsetMin, utcOffsetMin) || other.utcOffsetMin == utcOffsetMin)&&(identical(other.note, note) || other.note == note)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.source, source) || other.source == source)&&(identical(other.routineId, routineId) || other.routineId == routineId)&&(identical(other.occurrenceDate, occurrenceDate) || other.occurrenceDate == occurrenceDate)&&(identical(other.plannedEntryId, plannedEntryId) || other.plannedEntryId == plannedEntryId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,labelId,categoryOverrideId,start,end,tzId,utcOffsetMin,note,taskId,source,routineId,occurrenceDate,plannedEntryId,createdAt,updatedAt);
}

@override
String toString() {
    return 'EntryRecord(id: $id, kind: $kind, labelId: $labelId, categoryOverrideId: $categoryOverrideId, start: $start, end: $end, tzId: $tzId, utcOffsetMin: $utcOffsetMin, note: $note, taskId: $taskId, source: $source, routineId: $routineId, occurrenceDate: $occurrenceDate, plannedEntryId: $plannedEntryId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EntryRecordCopyWith<$Res> implements $EntryRecordCopyWith<$Res> {
  factory _$EntryRecordCopyWith(_EntryRecord value, $Res Function(_EntryRecord) _then) = __$EntryRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String labelId, String? categoryOverrideId, Instant start, Instant? end, String tzId, int utcOffsetMin, String? note, String? taskId, String source, String? routineId, LocalDate? occurrenceDate, String? plannedEntryId, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$EntryRecordCopyWithImpl<$Res>
    implements _$EntryRecordCopyWith<$Res> {
  __$EntryRecordCopyWithImpl(this._self, this._then);

  final _EntryRecord _self;
  final $Res Function(_EntryRecord) _then;

/// Create a copy of EntryRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? labelId = null,Object? categoryOverrideId = freezed,Object? start = null,Object? end = freezed,Object? tzId = null,Object? utcOffsetMin = null,Object? note = freezed,Object? taskId = freezed,Object? source = null,Object? routineId = freezed,Object? occurrenceDate = freezed,Object? plannedEntryId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_EntryRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,labelId: null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,categoryOverrideId: freezed == categoryOverrideId ? _self.categoryOverrideId : categoryOverrideId // ignore: cast_nullable_to_non_nullable
as String?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Instant,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant?,tzId: null == tzId ? _self.tzId : tzId // ignore: cast_nullable_to_non_nullable
as String,utcOffsetMin: null == utcOffsetMin ? _self.utcOffsetMin : utcOffsetMin // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,routineId: freezed == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String?,occurrenceDate: freezed == occurrenceDate ? _self.occurrenceDate : occurrenceDate // ignore: cast_nullable_to_non_nullable
as LocalDate?,plannedEntryId: freezed == plannedEntryId ? _self.plannedEntryId : plannedEntryId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$RoutineRecord {

 String get id; String? get name; String get labelId; int get startMinute; int get endMinute; String get recurrenceFreq; int get recurrenceInterval; int? get weekdaysMask; LocalDate get startsOn; LocalDate? get endsOn; bool get isPaused; bool get isArchived; String? get note; int? get reminderOffsetMin; bool get reminderIgnoreQuiet; Instant get createdAt; Instant get updatedAt;
/// Create a copy of RoutineRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutineRecordCopyWith<RoutineRecord> get copyWith => _$RoutineRecordCopyWithImpl<RoutineRecord>(this as RoutineRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoutineRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutineRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.labelId, _this.labelId) || other.labelId == _this.labelId)&&(identical(other.startMinute, _this.startMinute) || other.startMinute == _this.startMinute)&&(identical(other.endMinute, _this.endMinute) || other.endMinute == _this.endMinute)&&(identical(other.recurrenceFreq, _this.recurrenceFreq) || other.recurrenceFreq == _this.recurrenceFreq)&&(identical(other.recurrenceInterval, _this.recurrenceInterval) || other.recurrenceInterval == _this.recurrenceInterval)&&(identical(other.weekdaysMask, _this.weekdaysMask) || other.weekdaysMask == _this.weekdaysMask)&&(identical(other.startsOn, _this.startsOn) || other.startsOn == _this.startsOn)&&(identical(other.endsOn, _this.endsOn) || other.endsOn == _this.endsOn)&&(identical(other.isPaused, _this.isPaused) || other.isPaused == _this.isPaused)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.reminderOffsetMin, _this.reminderOffsetMin) || other.reminderOffsetMin == _this.reminderOffsetMin)&&(identical(other.reminderIgnoreQuiet, _this.reminderIgnoreQuiet) || other.reminderIgnoreQuiet == _this.reminderIgnoreQuiet)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as RoutineRecord;
  return Object.hash(runtimeType,_this.id,_this.name,_this.labelId,_this.startMinute,_this.endMinute,_this.recurrenceFreq,_this.recurrenceInterval,_this.weekdaysMask,_this.startsOn,_this.endsOn,_this.isPaused,_this.isArchived,_this.note,_this.reminderOffsetMin,_this.reminderIgnoreQuiet,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as RoutineRecord;
  return 'RoutineRecord(id: ${_this.id}, name: ${_this.name}, labelId: ${_this.labelId}, startMinute: ${_this.startMinute}, endMinute: ${_this.endMinute}, recurrenceFreq: ${_this.recurrenceFreq}, recurrenceInterval: ${_this.recurrenceInterval}, weekdaysMask: ${_this.weekdaysMask}, startsOn: ${_this.startsOn}, endsOn: ${_this.endsOn}, isPaused: ${_this.isPaused}, isArchived: ${_this.isArchived}, note: ${_this.note}, reminderOffsetMin: ${_this.reminderOffsetMin}, reminderIgnoreQuiet: ${_this.reminderIgnoreQuiet}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $RoutineRecordCopyWith<$Res>  {
  factory $RoutineRecordCopyWith(RoutineRecord value, $Res Function(RoutineRecord) _then) = _$RoutineRecordCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String labelId, int startMinute, int endMinute, String recurrenceFreq, int recurrenceInterval, int? weekdaysMask, LocalDate startsOn, LocalDate? endsOn, bool isPaused, bool isArchived, String? note, int? reminderOffsetMin, bool reminderIgnoreQuiet, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$RoutineRecordCopyWithImpl<$Res>
    implements $RoutineRecordCopyWith<$Res> {
  _$RoutineRecordCopyWithImpl(this._self, this._then);

  final RoutineRecord _self;
  final $Res Function(RoutineRecord) _then;

/// Create a copy of RoutineRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? labelId = null,Object? startMinute = null,Object? endMinute = null,Object? recurrenceFreq = null,Object? recurrenceInterval = null,Object? weekdaysMask = freezed,Object? startsOn = null,Object? endsOn = freezed,Object? isPaused = null,Object? isArchived = null,Object? note = freezed,Object? reminderOffsetMin = freezed,Object? reminderIgnoreQuiet = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(RoutineRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,labelId: null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,startMinute: null == startMinute ? _self.startMinute : startMinute // ignore: cast_nullable_to_non_nullable
as int,endMinute: null == endMinute ? _self.endMinute : endMinute // ignore: cast_nullable_to_non_nullable
as int,recurrenceFreq: null == recurrenceFreq ? _self.recurrenceFreq : recurrenceFreq // ignore: cast_nullable_to_non_nullable
as String,recurrenceInterval: null == recurrenceInterval ? _self.recurrenceInterval : recurrenceInterval // ignore: cast_nullable_to_non_nullable
as int,weekdaysMask: freezed == weekdaysMask ? _self.weekdaysMask : weekdaysMask // ignore: cast_nullable_to_non_nullable
as int?,startsOn: null == startsOn ? _self.startsOn : startsOn // ignore: cast_nullable_to_non_nullable
as LocalDate,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as LocalDate?,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,reminderOffsetMin: freezed == reminderOffsetMin ? _self.reminderOffsetMin : reminderOffsetMin // ignore: cast_nullable_to_non_nullable
as int?,reminderIgnoreQuiet: null == reminderIgnoreQuiet ? _self.reminderIgnoreQuiet : reminderIgnoreQuiet // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutineRecord].
extension RoutineRecordPatterns on RoutineRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutineRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutineRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutineRecord value)  $default,){
final _that = this;
switch (_that) {
case _RoutineRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutineRecord value)?  $default,){
final _that = this;
switch (_that) {
case _RoutineRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String labelId,  int startMinute,  int endMinute,  String recurrenceFreq,  int recurrenceInterval,  int? weekdaysMask,  LocalDate startsOn,  LocalDate? endsOn,  bool isPaused,  bool isArchived,  String? note,  int? reminderOffsetMin,  bool reminderIgnoreQuiet,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutineRecord() when $default != null:
return $default(_that.id,_that.name,_that.labelId,_that.startMinute,_that.endMinute,_that.recurrenceFreq,_that.recurrenceInterval,_that.weekdaysMask,_that.startsOn,_that.endsOn,_that.isPaused,_that.isArchived,_that.note,_that.reminderOffsetMin,_that.reminderIgnoreQuiet,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String labelId,  int startMinute,  int endMinute,  String recurrenceFreq,  int recurrenceInterval,  int? weekdaysMask,  LocalDate startsOn,  LocalDate? endsOn,  bool isPaused,  bool isArchived,  String? note,  int? reminderOffsetMin,  bool reminderIgnoreQuiet,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RoutineRecord():
return $default(_that.id,_that.name,_that.labelId,_that.startMinute,_that.endMinute,_that.recurrenceFreq,_that.recurrenceInterval,_that.weekdaysMask,_that.startsOn,_that.endsOn,_that.isPaused,_that.isArchived,_that.note,_that.reminderOffsetMin,_that.reminderIgnoreQuiet,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String labelId,  int startMinute,  int endMinute,  String recurrenceFreq,  int recurrenceInterval,  int? weekdaysMask,  LocalDate startsOn,  LocalDate? endsOn,  bool isPaused,  bool isArchived,  String? note,  int? reminderOffsetMin,  bool reminderIgnoreQuiet,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RoutineRecord() when $default != null:
return $default(_that.id,_that.name,_that.labelId,_that.startMinute,_that.endMinute,_that.recurrenceFreq,_that.recurrenceInterval,_that.weekdaysMask,_that.startsOn,_that.endsOn,_that.isPaused,_that.isArchived,_that.note,_that.reminderOffsetMin,_that.reminderIgnoreQuiet,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _RoutineRecord implements RoutineRecord {
  const _RoutineRecord({required this.id, this.name, required this.labelId, required this.startMinute, required this.endMinute, this.recurrenceFreq = 'daily', this.recurrenceInterval = 1, this.weekdaysMask, required this.startsOn, this.endsOn, this.isPaused = false, this.isArchived = false, this.note, this.reminderOffsetMin, this.reminderIgnoreQuiet = false, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String? name;
@override final  String labelId;
@override final  int startMinute;
@override final  int endMinute;
@override@JsonKey() final  String recurrenceFreq;
@override@JsonKey() final  int recurrenceInterval;
@override final  int? weekdaysMask;
@override final  LocalDate startsOn;
@override final  LocalDate? endsOn;
@override@JsonKey() final  bool isPaused;
@override@JsonKey() final  bool isArchived;
@override final  String? note;
@override final  int? reminderOffsetMin;
@override@JsonKey() final  bool reminderIgnoreQuiet;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of RoutineRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutineRecordCopyWith<_RoutineRecord> get copyWith => __$RoutineRecordCopyWithImpl<_RoutineRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutineRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.labelId, labelId) || other.labelId == labelId)&&(identical(other.startMinute, startMinute) || other.startMinute == startMinute)&&(identical(other.endMinute, endMinute) || other.endMinute == endMinute)&&(identical(other.recurrenceFreq, recurrenceFreq) || other.recurrenceFreq == recurrenceFreq)&&(identical(other.recurrenceInterval, recurrenceInterval) || other.recurrenceInterval == recurrenceInterval)&&(identical(other.weekdaysMask, weekdaysMask) || other.weekdaysMask == weekdaysMask)&&(identical(other.startsOn, startsOn) || other.startsOn == startsOn)&&(identical(other.endsOn, endsOn) || other.endsOn == endsOn)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.note, note) || other.note == note)&&(identical(other.reminderOffsetMin, reminderOffsetMin) || other.reminderOffsetMin == reminderOffsetMin)&&(identical(other.reminderIgnoreQuiet, reminderIgnoreQuiet) || other.reminderIgnoreQuiet == reminderIgnoreQuiet)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,labelId,startMinute,endMinute,recurrenceFreq,recurrenceInterval,weekdaysMask,startsOn,endsOn,isPaused,isArchived,note,reminderOffsetMin,reminderIgnoreQuiet,createdAt,updatedAt);
}

@override
String toString() {
    return 'RoutineRecord(id: $id, name: $name, labelId: $labelId, startMinute: $startMinute, endMinute: $endMinute, recurrenceFreq: $recurrenceFreq, recurrenceInterval: $recurrenceInterval, weekdaysMask: $weekdaysMask, startsOn: $startsOn, endsOn: $endsOn, isPaused: $isPaused, isArchived: $isArchived, note: $note, reminderOffsetMin: $reminderOffsetMin, reminderIgnoreQuiet: $reminderIgnoreQuiet, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RoutineRecordCopyWith<$Res> implements $RoutineRecordCopyWith<$Res> {
  factory _$RoutineRecordCopyWith(_RoutineRecord value, $Res Function(_RoutineRecord) _then) = __$RoutineRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String labelId, int startMinute, int endMinute, String recurrenceFreq, int recurrenceInterval, int? weekdaysMask, LocalDate startsOn, LocalDate? endsOn, bool isPaused, bool isArchived, String? note, int? reminderOffsetMin, bool reminderIgnoreQuiet, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$RoutineRecordCopyWithImpl<$Res>
    implements _$RoutineRecordCopyWith<$Res> {
  __$RoutineRecordCopyWithImpl(this._self, this._then);

  final _RoutineRecord _self;
  final $Res Function(_RoutineRecord) _then;

/// Create a copy of RoutineRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? labelId = null,Object? startMinute = null,Object? endMinute = null,Object? recurrenceFreq = null,Object? recurrenceInterval = null,Object? weekdaysMask = freezed,Object? startsOn = null,Object? endsOn = freezed,Object? isPaused = null,Object? isArchived = null,Object? note = freezed,Object? reminderOffsetMin = freezed,Object? reminderIgnoreQuiet = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_RoutineRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,labelId: null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,startMinute: null == startMinute ? _self.startMinute : startMinute // ignore: cast_nullable_to_non_nullable
as int,endMinute: null == endMinute ? _self.endMinute : endMinute // ignore: cast_nullable_to_non_nullable
as int,recurrenceFreq: null == recurrenceFreq ? _self.recurrenceFreq : recurrenceFreq // ignore: cast_nullable_to_non_nullable
as String,recurrenceInterval: null == recurrenceInterval ? _self.recurrenceInterval : recurrenceInterval // ignore: cast_nullable_to_non_nullable
as int,weekdaysMask: freezed == weekdaysMask ? _self.weekdaysMask : weekdaysMask // ignore: cast_nullable_to_non_nullable
as int?,startsOn: null == startsOn ? _self.startsOn : startsOn // ignore: cast_nullable_to_non_nullable
as LocalDate,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as LocalDate?,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,reminderOffsetMin: freezed == reminderOffsetMin ? _self.reminderOffsetMin : reminderOffsetMin // ignore: cast_nullable_to_non_nullable
as int?,reminderIgnoreQuiet: null == reminderIgnoreQuiet ? _self.reminderIgnoreQuiet : reminderIgnoreQuiet // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$RoutineExceptionRecord {

 String get id; String get routineId; LocalDate get occurrenceDate;/// `skip` | `modify`.
 String get type; int? get startOffsetMin; int? get endOffsetMin; String? get labelId; String? get note; Instant get createdAt; Instant get updatedAt;
/// Create a copy of RoutineExceptionRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutineExceptionRecordCopyWith<RoutineExceptionRecord> get copyWith => _$RoutineExceptionRecordCopyWithImpl<RoutineExceptionRecord>(this as RoutineExceptionRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoutineExceptionRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutineExceptionRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.routineId, _this.routineId) || other.routineId == _this.routineId)&&(identical(other.occurrenceDate, _this.occurrenceDate) || other.occurrenceDate == _this.occurrenceDate)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.startOffsetMin, _this.startOffsetMin) || other.startOffsetMin == _this.startOffsetMin)&&(identical(other.endOffsetMin, _this.endOffsetMin) || other.endOffsetMin == _this.endOffsetMin)&&(identical(other.labelId, _this.labelId) || other.labelId == _this.labelId)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as RoutineExceptionRecord;
  return Object.hash(runtimeType,_this.id,_this.routineId,_this.occurrenceDate,_this.type,_this.startOffsetMin,_this.endOffsetMin,_this.labelId,_this.note,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as RoutineExceptionRecord;
  return 'RoutineExceptionRecord(id: ${_this.id}, routineId: ${_this.routineId}, occurrenceDate: ${_this.occurrenceDate}, type: ${_this.type}, startOffsetMin: ${_this.startOffsetMin}, endOffsetMin: ${_this.endOffsetMin}, labelId: ${_this.labelId}, note: ${_this.note}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $RoutineExceptionRecordCopyWith<$Res>  {
  factory $RoutineExceptionRecordCopyWith(RoutineExceptionRecord value, $Res Function(RoutineExceptionRecord) _then) = _$RoutineExceptionRecordCopyWithImpl;
@useResult
$Res call({
 String id, String routineId, LocalDate occurrenceDate, String type, int? startOffsetMin, int? endOffsetMin, String? labelId, String? note, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$RoutineExceptionRecordCopyWithImpl<$Res>
    implements $RoutineExceptionRecordCopyWith<$Res> {
  _$RoutineExceptionRecordCopyWithImpl(this._self, this._then);

  final RoutineExceptionRecord _self;
  final $Res Function(RoutineExceptionRecord) _then;

/// Create a copy of RoutineExceptionRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? routineId = null,Object? occurrenceDate = null,Object? type = null,Object? startOffsetMin = freezed,Object? endOffsetMin = freezed,Object? labelId = freezed,Object? note = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(RoutineExceptionRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,routineId: null == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String,occurrenceDate: null == occurrenceDate ? _self.occurrenceDate : occurrenceDate // ignore: cast_nullable_to_non_nullable
as LocalDate,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,startOffsetMin: freezed == startOffsetMin ? _self.startOffsetMin : startOffsetMin // ignore: cast_nullable_to_non_nullable
as int?,endOffsetMin: freezed == endOffsetMin ? _self.endOffsetMin : endOffsetMin // ignore: cast_nullable_to_non_nullable
as int?,labelId: freezed == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutineExceptionRecord].
extension RoutineExceptionRecordPatterns on RoutineExceptionRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutineExceptionRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutineExceptionRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutineExceptionRecord value)  $default,){
final _that = this;
switch (_that) {
case _RoutineExceptionRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutineExceptionRecord value)?  $default,){
final _that = this;
switch (_that) {
case _RoutineExceptionRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String routineId,  LocalDate occurrenceDate,  String type,  int? startOffsetMin,  int? endOffsetMin,  String? labelId,  String? note,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutineExceptionRecord() when $default != null:
return $default(_that.id,_that.routineId,_that.occurrenceDate,_that.type,_that.startOffsetMin,_that.endOffsetMin,_that.labelId,_that.note,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String routineId,  LocalDate occurrenceDate,  String type,  int? startOffsetMin,  int? endOffsetMin,  String? labelId,  String? note,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RoutineExceptionRecord():
return $default(_that.id,_that.routineId,_that.occurrenceDate,_that.type,_that.startOffsetMin,_that.endOffsetMin,_that.labelId,_that.note,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String routineId,  LocalDate occurrenceDate,  String type,  int? startOffsetMin,  int? endOffsetMin,  String? labelId,  String? note,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RoutineExceptionRecord() when $default != null:
return $default(_that.id,_that.routineId,_that.occurrenceDate,_that.type,_that.startOffsetMin,_that.endOffsetMin,_that.labelId,_that.note,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _RoutineExceptionRecord implements RoutineExceptionRecord {
  const _RoutineExceptionRecord({required this.id, required this.routineId, required this.occurrenceDate, required this.type, this.startOffsetMin, this.endOffsetMin, this.labelId, this.note, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String routineId;
@override final  LocalDate occurrenceDate;
/// `skip` | `modify`.
@override final  String type;
@override final  int? startOffsetMin;
@override final  int? endOffsetMin;
@override final  String? labelId;
@override final  String? note;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of RoutineExceptionRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutineExceptionRecordCopyWith<_RoutineExceptionRecord> get copyWith => __$RoutineExceptionRecordCopyWithImpl<_RoutineExceptionRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutineExceptionRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.routineId, routineId) || other.routineId == routineId)&&(identical(other.occurrenceDate, occurrenceDate) || other.occurrenceDate == occurrenceDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.startOffsetMin, startOffsetMin) || other.startOffsetMin == startOffsetMin)&&(identical(other.endOffsetMin, endOffsetMin) || other.endOffsetMin == endOffsetMin)&&(identical(other.labelId, labelId) || other.labelId == labelId)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,routineId,occurrenceDate,type,startOffsetMin,endOffsetMin,labelId,note,createdAt,updatedAt);
}

@override
String toString() {
    return 'RoutineExceptionRecord(id: $id, routineId: $routineId, occurrenceDate: $occurrenceDate, type: $type, startOffsetMin: $startOffsetMin, endOffsetMin: $endOffsetMin, labelId: $labelId, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RoutineExceptionRecordCopyWith<$Res> implements $RoutineExceptionRecordCopyWith<$Res> {
  factory _$RoutineExceptionRecordCopyWith(_RoutineExceptionRecord value, $Res Function(_RoutineExceptionRecord) _then) = __$RoutineExceptionRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String routineId, LocalDate occurrenceDate, String type, int? startOffsetMin, int? endOffsetMin, String? labelId, String? note, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$RoutineExceptionRecordCopyWithImpl<$Res>
    implements _$RoutineExceptionRecordCopyWith<$Res> {
  __$RoutineExceptionRecordCopyWithImpl(this._self, this._then);

  final _RoutineExceptionRecord _self;
  final $Res Function(_RoutineExceptionRecord) _then;

/// Create a copy of RoutineExceptionRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? routineId = null,Object? occurrenceDate = null,Object? type = null,Object? startOffsetMin = freezed,Object? endOffsetMin = freezed,Object? labelId = freezed,Object? note = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_RoutineExceptionRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,routineId: null == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String,occurrenceDate: null == occurrenceDate ? _self.occurrenceDate : occurrenceDate // ignore: cast_nullable_to_non_nullable
as LocalDate,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,startOffsetMin: freezed == startOffsetMin ? _self.startOffsetMin : startOffsetMin // ignore: cast_nullable_to_non_nullable
as int?,endOffsetMin: freezed == endOffsetMin ? _self.endOffsetMin : endOffsetMin // ignore: cast_nullable_to_non_nullable
as int?,labelId: freezed == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$TaskSeriesRecord {

 String get id;/// `daily` | `weekly` | `monthly` | `yearly`.
 String get freq; int get interval;/// `schedule` | `after_completion`.
 String get mode; LocalDate get anchorDate; LocalDate? get endsOn; bool get isActive; Instant get createdAt; Instant get updatedAt;
/// Create a copy of TaskSeriesRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskSeriesRecordCopyWith<TaskSeriesRecord> get copyWith => _$TaskSeriesRecordCopyWithImpl<TaskSeriesRecord>(this as TaskSeriesRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TaskSeriesRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskSeriesRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.freq, _this.freq) || other.freq == _this.freq)&&(identical(other.interval, _this.interval) || other.interval == _this.interval)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.anchorDate, _this.anchorDate) || other.anchorDate == _this.anchorDate)&&(identical(other.endsOn, _this.endsOn) || other.endsOn == _this.endsOn)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as TaskSeriesRecord;
  return Object.hash(runtimeType,_this.id,_this.freq,_this.interval,_this.mode,_this.anchorDate,_this.endsOn,_this.isActive,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as TaskSeriesRecord;
  return 'TaskSeriesRecord(id: ${_this.id}, freq: ${_this.freq}, interval: ${_this.interval}, mode: ${_this.mode}, anchorDate: ${_this.anchorDate}, endsOn: ${_this.endsOn}, isActive: ${_this.isActive}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $TaskSeriesRecordCopyWith<$Res>  {
  factory $TaskSeriesRecordCopyWith(TaskSeriesRecord value, $Res Function(TaskSeriesRecord) _then) = _$TaskSeriesRecordCopyWithImpl;
@useResult
$Res call({
 String id, String freq, int interval, String mode, LocalDate anchorDate, LocalDate? endsOn, bool isActive, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$TaskSeriesRecordCopyWithImpl<$Res>
    implements $TaskSeriesRecordCopyWith<$Res> {
  _$TaskSeriesRecordCopyWithImpl(this._self, this._then);

  final TaskSeriesRecord _self;
  final $Res Function(TaskSeriesRecord) _then;

/// Create a copy of TaskSeriesRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? freq = null,Object? interval = null,Object? mode = null,Object? anchorDate = null,Object? endsOn = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(TaskSeriesRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,freq: null == freq ? _self.freq : freq // ignore: cast_nullable_to_non_nullable
as String,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,anchorDate: null == anchorDate ? _self.anchorDate : anchorDate // ignore: cast_nullable_to_non_nullable
as LocalDate,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as LocalDate?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskSeriesRecord].
extension TaskSeriesRecordPatterns on TaskSeriesRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskSeriesRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskSeriesRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskSeriesRecord value)  $default,){
final _that = this;
switch (_that) {
case _TaskSeriesRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskSeriesRecord value)?  $default,){
final _that = this;
switch (_that) {
case _TaskSeriesRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String freq,  int interval,  String mode,  LocalDate anchorDate,  LocalDate? endsOn,  bool isActive,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskSeriesRecord() when $default != null:
return $default(_that.id,_that.freq,_that.interval,_that.mode,_that.anchorDate,_that.endsOn,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String freq,  int interval,  String mode,  LocalDate anchorDate,  LocalDate? endsOn,  bool isActive,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskSeriesRecord():
return $default(_that.id,_that.freq,_that.interval,_that.mode,_that.anchorDate,_that.endsOn,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String freq,  int interval,  String mode,  LocalDate anchorDate,  LocalDate? endsOn,  bool isActive,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskSeriesRecord() when $default != null:
return $default(_that.id,_that.freq,_that.interval,_that.mode,_that.anchorDate,_that.endsOn,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TaskSeriesRecord implements TaskSeriesRecord {
  const _TaskSeriesRecord({required this.id, required this.freq, required this.interval, required this.mode, required this.anchorDate, this.endsOn, this.isActive = true, required this.createdAt, required this.updatedAt});
  

@override final  String id;
/// `daily` | `weekly` | `monthly` | `yearly`.
@override final  String freq;
@override final  int interval;
/// `schedule` | `after_completion`.
@override final  String mode;
@override final  LocalDate anchorDate;
@override final  LocalDate? endsOn;
@override@JsonKey() final  bool isActive;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of TaskSeriesRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskSeriesRecordCopyWith<_TaskSeriesRecord> get copyWith => __$TaskSeriesRecordCopyWithImpl<_TaskSeriesRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskSeriesRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.freq, freq) || other.freq == freq)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.anchorDate, anchorDate) || other.anchorDate == anchorDate)&&(identical(other.endsOn, endsOn) || other.endsOn == endsOn)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,freq,interval,mode,anchorDate,endsOn,isActive,createdAt,updatedAt);
}

@override
String toString() {
    return 'TaskSeriesRecord(id: $id, freq: $freq, interval: $interval, mode: $mode, anchorDate: $anchorDate, endsOn: $endsOn, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskSeriesRecordCopyWith<$Res> implements $TaskSeriesRecordCopyWith<$Res> {
  factory _$TaskSeriesRecordCopyWith(_TaskSeriesRecord value, $Res Function(_TaskSeriesRecord) _then) = __$TaskSeriesRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String freq, int interval, String mode, LocalDate anchorDate, LocalDate? endsOn, bool isActive, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$TaskSeriesRecordCopyWithImpl<$Res>
    implements _$TaskSeriesRecordCopyWith<$Res> {
  __$TaskSeriesRecordCopyWithImpl(this._self, this._then);

  final _TaskSeriesRecord _self;
  final $Res Function(_TaskSeriesRecord) _then;

/// Create a copy of TaskSeriesRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? freq = null,Object? interval = null,Object? mode = null,Object? anchorDate = null,Object? endsOn = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskSeriesRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,freq: null == freq ? _self.freq : freq // ignore: cast_nullable_to_non_nullable
as String,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,anchorDate: null == anchorDate ? _self.anchorDate : anchorDate // ignore: cast_nullable_to_non_nullable
as LocalDate,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as LocalDate?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$TaskRecord {

 String get id; String? get seriesId; String get title; String? get notes; LocalDate get startDate; LocalDate? get deadlineDate; int? get deadlineMinute;/// `not_started` | `in_progress` | `completed`.
 String get status;/// `low` | `normal` | `high`.
 String get priority; String? get categoryId; int? get estimateMin; int get actualAdjustMin; Instant? get completedAt; Instant get createdAt; Instant get updatedAt;
/// Create a copy of TaskRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskRecordCopyWith<TaskRecord> get copyWith => _$TaskRecordCopyWithImpl<TaskRecord>(this as TaskRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TaskRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.seriesId, _this.seriesId) || other.seriesId == _this.seriesId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.deadlineDate, _this.deadlineDate) || other.deadlineDate == _this.deadlineDate)&&(identical(other.deadlineMinute, _this.deadlineMinute) || other.deadlineMinute == _this.deadlineMinute)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.estimateMin, _this.estimateMin) || other.estimateMin == _this.estimateMin)&&(identical(other.actualAdjustMin, _this.actualAdjustMin) || other.actualAdjustMin == _this.actualAdjustMin)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as TaskRecord;
  return Object.hash(runtimeType,_this.id,_this.seriesId,_this.title,_this.notes,_this.startDate,_this.deadlineDate,_this.deadlineMinute,_this.status,_this.priority,_this.categoryId,_this.estimateMin,_this.actualAdjustMin,_this.completedAt,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as TaskRecord;
  return 'TaskRecord(id: ${_this.id}, seriesId: ${_this.seriesId}, title: ${_this.title}, notes: ${_this.notes}, startDate: ${_this.startDate}, deadlineDate: ${_this.deadlineDate}, deadlineMinute: ${_this.deadlineMinute}, status: ${_this.status}, priority: ${_this.priority}, categoryId: ${_this.categoryId}, estimateMin: ${_this.estimateMin}, actualAdjustMin: ${_this.actualAdjustMin}, completedAt: ${_this.completedAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $TaskRecordCopyWith<$Res>  {
  factory $TaskRecordCopyWith(TaskRecord value, $Res Function(TaskRecord) _then) = _$TaskRecordCopyWithImpl;
@useResult
$Res call({
 String id, String? seriesId, String title, String? notes, LocalDate startDate, LocalDate? deadlineDate, int? deadlineMinute, String status, String priority, String? categoryId, int? estimateMin, int actualAdjustMin, Instant? completedAt, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$TaskRecordCopyWithImpl<$Res>
    implements $TaskRecordCopyWith<$Res> {
  _$TaskRecordCopyWithImpl(this._self, this._then);

  final TaskRecord _self;
  final $Res Function(TaskRecord) _then;

/// Create a copy of TaskRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? seriesId = freezed,Object? title = null,Object? notes = freezed,Object? startDate = null,Object? deadlineDate = freezed,Object? deadlineMinute = freezed,Object? status = null,Object? priority = null,Object? categoryId = freezed,Object? estimateMin = freezed,Object? actualAdjustMin = null,Object? completedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(TaskRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seriesId: freezed == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as LocalDate,deadlineDate: freezed == deadlineDate ? _self.deadlineDate : deadlineDate // ignore: cast_nullable_to_non_nullable
as LocalDate?,deadlineMinute: freezed == deadlineMinute ? _self.deadlineMinute : deadlineMinute // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,estimateMin: freezed == estimateMin ? _self.estimateMin : estimateMin // ignore: cast_nullable_to_non_nullable
as int?,actualAdjustMin: null == actualAdjustMin ? _self.actualAdjustMin : actualAdjustMin // ignore: cast_nullable_to_non_nullable
as int,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as Instant?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskRecord].
extension TaskRecordPatterns on TaskRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskRecord value)  $default,){
final _that = this;
switch (_that) {
case _TaskRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskRecord value)?  $default,){
final _that = this;
switch (_that) {
case _TaskRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? seriesId,  String title,  String? notes,  LocalDate startDate,  LocalDate? deadlineDate,  int? deadlineMinute,  String status,  String priority,  String? categoryId,  int? estimateMin,  int actualAdjustMin,  Instant? completedAt,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskRecord() when $default != null:
return $default(_that.id,_that.seriesId,_that.title,_that.notes,_that.startDate,_that.deadlineDate,_that.deadlineMinute,_that.status,_that.priority,_that.categoryId,_that.estimateMin,_that.actualAdjustMin,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? seriesId,  String title,  String? notes,  LocalDate startDate,  LocalDate? deadlineDate,  int? deadlineMinute,  String status,  String priority,  String? categoryId,  int? estimateMin,  int actualAdjustMin,  Instant? completedAt,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskRecord():
return $default(_that.id,_that.seriesId,_that.title,_that.notes,_that.startDate,_that.deadlineDate,_that.deadlineMinute,_that.status,_that.priority,_that.categoryId,_that.estimateMin,_that.actualAdjustMin,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? seriesId,  String title,  String? notes,  LocalDate startDate,  LocalDate? deadlineDate,  int? deadlineMinute,  String status,  String priority,  String? categoryId,  int? estimateMin,  int actualAdjustMin,  Instant? completedAt,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskRecord() when $default != null:
return $default(_that.id,_that.seriesId,_that.title,_that.notes,_that.startDate,_that.deadlineDate,_that.deadlineMinute,_that.status,_that.priority,_that.categoryId,_that.estimateMin,_that.actualAdjustMin,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TaskRecord extends TaskRecord {
  const _TaskRecord({required this.id, this.seriesId, required this.title, this.notes, required this.startDate, this.deadlineDate, this.deadlineMinute, required this.status, this.priority = 'normal', this.categoryId, this.estimateMin, this.actualAdjustMin = 0, this.completedAt, required this.createdAt, required this.updatedAt}): super._();
  

@override final  String id;
@override final  String? seriesId;
@override final  String title;
@override final  String? notes;
@override final  LocalDate startDate;
@override final  LocalDate? deadlineDate;
@override final  int? deadlineMinute;
/// `not_started` | `in_progress` | `completed`.
@override final  String status;
/// `low` | `normal` | `high`.
@override@JsonKey() final  String priority;
@override final  String? categoryId;
@override final  int? estimateMin;
@override@JsonKey() final  int actualAdjustMin;
@override final  Instant? completedAt;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of TaskRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskRecordCopyWith<_TaskRecord> get copyWith => __$TaskRecordCopyWithImpl<_TaskRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.seriesId, seriesId) || other.seriesId == seriesId)&&(identical(other.title, title) || other.title == title)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.deadlineDate, deadlineDate) || other.deadlineDate == deadlineDate)&&(identical(other.deadlineMinute, deadlineMinute) || other.deadlineMinute == deadlineMinute)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.estimateMin, estimateMin) || other.estimateMin == estimateMin)&&(identical(other.actualAdjustMin, actualAdjustMin) || other.actualAdjustMin == actualAdjustMin)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,seriesId,title,notes,startDate,deadlineDate,deadlineMinute,status,priority,categoryId,estimateMin,actualAdjustMin,completedAt,createdAt,updatedAt);
}

@override
String toString() {
    return 'TaskRecord(id: $id, seriesId: $seriesId, title: $title, notes: $notes, startDate: $startDate, deadlineDate: $deadlineDate, deadlineMinute: $deadlineMinute, status: $status, priority: $priority, categoryId: $categoryId, estimateMin: $estimateMin, actualAdjustMin: $actualAdjustMin, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskRecordCopyWith<$Res> implements $TaskRecordCopyWith<$Res> {
  factory _$TaskRecordCopyWith(_TaskRecord value, $Res Function(_TaskRecord) _then) = __$TaskRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String? seriesId, String title, String? notes, LocalDate startDate, LocalDate? deadlineDate, int? deadlineMinute, String status, String priority, String? categoryId, int? estimateMin, int actualAdjustMin, Instant? completedAt, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$TaskRecordCopyWithImpl<$Res>
    implements _$TaskRecordCopyWith<$Res> {
  __$TaskRecordCopyWithImpl(this._self, this._then);

  final _TaskRecord _self;
  final $Res Function(_TaskRecord) _then;

/// Create a copy of TaskRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? seriesId = freezed,Object? title = null,Object? notes = freezed,Object? startDate = null,Object? deadlineDate = freezed,Object? deadlineMinute = freezed,Object? status = null,Object? priority = null,Object? categoryId = freezed,Object? estimateMin = freezed,Object? actualAdjustMin = null,Object? completedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seriesId: freezed == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as LocalDate,deadlineDate: freezed == deadlineDate ? _self.deadlineDate : deadlineDate // ignore: cast_nullable_to_non_nullable
as LocalDate?,deadlineMinute: freezed == deadlineMinute ? _self.deadlineMinute : deadlineMinute // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,estimateMin: freezed == estimateMin ? _self.estimateMin : estimateMin // ignore: cast_nullable_to_non_nullable
as int?,actualAdjustMin: null == actualAdjustMin ? _self.actualAdjustMin : actualAdjustMin // ignore: cast_nullable_to_non_nullable
as int,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as Instant?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$TaskReminderRecord {

 String get id; String get taskId;/// `at_start` | `before_deadline` | `on_deadline` | `custom`.
 String get type; int? get offsetDays; int? get minuteOfDay; Instant? get customAt; bool get ignoreQuiet; Instant get createdAt; Instant get updatedAt;
/// Create a copy of TaskReminderRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskReminderRecordCopyWith<TaskReminderRecord> get copyWith => _$TaskReminderRecordCopyWithImpl<TaskReminderRecord>(this as TaskReminderRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TaskReminderRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskReminderRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.offsetDays, _this.offsetDays) || other.offsetDays == _this.offsetDays)&&(identical(other.minuteOfDay, _this.minuteOfDay) || other.minuteOfDay == _this.minuteOfDay)&&(identical(other.customAt, _this.customAt) || other.customAt == _this.customAt)&&(identical(other.ignoreQuiet, _this.ignoreQuiet) || other.ignoreQuiet == _this.ignoreQuiet)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as TaskReminderRecord;
  return Object.hash(runtimeType,_this.id,_this.taskId,_this.type,_this.offsetDays,_this.minuteOfDay,_this.customAt,_this.ignoreQuiet,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as TaskReminderRecord;
  return 'TaskReminderRecord(id: ${_this.id}, taskId: ${_this.taskId}, type: ${_this.type}, offsetDays: ${_this.offsetDays}, minuteOfDay: ${_this.minuteOfDay}, customAt: ${_this.customAt}, ignoreQuiet: ${_this.ignoreQuiet}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $TaskReminderRecordCopyWith<$Res>  {
  factory $TaskReminderRecordCopyWith(TaskReminderRecord value, $Res Function(TaskReminderRecord) _then) = _$TaskReminderRecordCopyWithImpl;
@useResult
$Res call({
 String id, String taskId, String type, int? offsetDays, int? minuteOfDay, Instant? customAt, bool ignoreQuiet, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$TaskReminderRecordCopyWithImpl<$Res>
    implements $TaskReminderRecordCopyWith<$Res> {
  _$TaskReminderRecordCopyWithImpl(this._self, this._then);

  final TaskReminderRecord _self;
  final $Res Function(TaskReminderRecord) _then;

/// Create a copy of TaskReminderRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? type = null,Object? offsetDays = freezed,Object? minuteOfDay = freezed,Object? customAt = freezed,Object? ignoreQuiet = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(TaskReminderRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,offsetDays: freezed == offsetDays ? _self.offsetDays : offsetDays // ignore: cast_nullable_to_non_nullable
as int?,minuteOfDay: freezed == minuteOfDay ? _self.minuteOfDay : minuteOfDay // ignore: cast_nullable_to_non_nullable
as int?,customAt: freezed == customAt ? _self.customAt : customAt // ignore: cast_nullable_to_non_nullable
as Instant?,ignoreQuiet: null == ignoreQuiet ? _self.ignoreQuiet : ignoreQuiet // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskReminderRecord].
extension TaskReminderRecordPatterns on TaskReminderRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskReminderRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskReminderRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskReminderRecord value)  $default,){
final _that = this;
switch (_that) {
case _TaskReminderRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskReminderRecord value)?  $default,){
final _that = this;
switch (_that) {
case _TaskReminderRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String taskId,  String type,  int? offsetDays,  int? minuteOfDay,  Instant? customAt,  bool ignoreQuiet,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskReminderRecord() when $default != null:
return $default(_that.id,_that.taskId,_that.type,_that.offsetDays,_that.minuteOfDay,_that.customAt,_that.ignoreQuiet,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String taskId,  String type,  int? offsetDays,  int? minuteOfDay,  Instant? customAt,  bool ignoreQuiet,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskReminderRecord():
return $default(_that.id,_that.taskId,_that.type,_that.offsetDays,_that.minuteOfDay,_that.customAt,_that.ignoreQuiet,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String taskId,  String type,  int? offsetDays,  int? minuteOfDay,  Instant? customAt,  bool ignoreQuiet,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskReminderRecord() when $default != null:
return $default(_that.id,_that.taskId,_that.type,_that.offsetDays,_that.minuteOfDay,_that.customAt,_that.ignoreQuiet,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TaskReminderRecord implements TaskReminderRecord {
  const _TaskReminderRecord({required this.id, required this.taskId, required this.type, this.offsetDays, this.minuteOfDay, this.customAt, this.ignoreQuiet = false, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String taskId;
/// `at_start` | `before_deadline` | `on_deadline` | `custom`.
@override final  String type;
@override final  int? offsetDays;
@override final  int? minuteOfDay;
@override final  Instant? customAt;
@override@JsonKey() final  bool ignoreQuiet;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of TaskReminderRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskReminderRecordCopyWith<_TaskReminderRecord> get copyWith => __$TaskReminderRecordCopyWithImpl<_TaskReminderRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskReminderRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.type, type) || other.type == type)&&(identical(other.offsetDays, offsetDays) || other.offsetDays == offsetDays)&&(identical(other.minuteOfDay, minuteOfDay) || other.minuteOfDay == minuteOfDay)&&(identical(other.customAt, customAt) || other.customAt == customAt)&&(identical(other.ignoreQuiet, ignoreQuiet) || other.ignoreQuiet == ignoreQuiet)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,taskId,type,offsetDays,minuteOfDay,customAt,ignoreQuiet,createdAt,updatedAt);
}

@override
String toString() {
    return 'TaskReminderRecord(id: $id, taskId: $taskId, type: $type, offsetDays: $offsetDays, minuteOfDay: $minuteOfDay, customAt: $customAt, ignoreQuiet: $ignoreQuiet, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskReminderRecordCopyWith<$Res> implements $TaskReminderRecordCopyWith<$Res> {
  factory _$TaskReminderRecordCopyWith(_TaskReminderRecord value, $Res Function(_TaskReminderRecord) _then) = __$TaskReminderRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String taskId, String type, int? offsetDays, int? minuteOfDay, Instant? customAt, bool ignoreQuiet, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$TaskReminderRecordCopyWithImpl<$Res>
    implements _$TaskReminderRecordCopyWith<$Res> {
  __$TaskReminderRecordCopyWithImpl(this._self, this._then);

  final _TaskReminderRecord _self;
  final $Res Function(_TaskReminderRecord) _then;

/// Create a copy of TaskReminderRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? type = null,Object? offsetDays = freezed,Object? minuteOfDay = freezed,Object? customAt = freezed,Object? ignoreQuiet = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskReminderRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,offsetDays: freezed == offsetDays ? _self.offsetDays : offsetDays // ignore: cast_nullable_to_non_nullable
as int?,minuteOfDay: freezed == minuteOfDay ? _self.minuteOfDay : minuteOfDay // ignore: cast_nullable_to_non_nullable
as int?,customAt: freezed == customAt ? _self.customAt : customAt // ignore: cast_nullable_to_non_nullable
as Instant?,ignoreQuiet: null == ignoreQuiet ? _self.ignoreQuiet : ignoreQuiet // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$BackupData {

 List<CategoryRecord> get categories; List<LabelRecord> get labels; List<TaskSeriesRecord> get taskSeries; List<TaskRecord> get tasks; List<TaskReminderRecord> get taskReminders; List<RoutineRecord> get routines; List<RoutineExceptionRecord> get routineExceptions; List<EntryRecord> get entries; Map<String, Object?> get settings;
/// Create a copy of BackupData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupDataCopyWith<BackupData> get copyWith => _$BackupDataCopyWithImpl<BackupData>(this as BackupData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BackupData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupData&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&const DeepCollectionEquality().equals(other.labels, _this.labels)&&const DeepCollectionEquality().equals(other.taskSeries, _this.taskSeries)&&const DeepCollectionEquality().equals(other.tasks, _this.tasks)&&const DeepCollectionEquality().equals(other.taskReminders, _this.taskReminders)&&const DeepCollectionEquality().equals(other.routines, _this.routines)&&const DeepCollectionEquality().equals(other.routineExceptions, _this.routineExceptions)&&const DeepCollectionEquality().equals(other.entries, _this.entries)&&const DeepCollectionEquality().equals(other.settings, _this.settings));
}


@override
int get hashCode {
  final _this = this as BackupData;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.categories),const DeepCollectionEquality().hash(_this.labels),const DeepCollectionEquality().hash(_this.taskSeries),const DeepCollectionEquality().hash(_this.tasks),const DeepCollectionEquality().hash(_this.taskReminders),const DeepCollectionEquality().hash(_this.routines),const DeepCollectionEquality().hash(_this.routineExceptions),const DeepCollectionEquality().hash(_this.entries),const DeepCollectionEquality().hash(_this.settings));
}

@override
String toString() {
  final _this = this as BackupData;
  return 'BackupData(categories: ${_this.categories}, labels: ${_this.labels}, taskSeries: ${_this.taskSeries}, tasks: ${_this.tasks}, taskReminders: ${_this.taskReminders}, routines: ${_this.routines}, routineExceptions: ${_this.routineExceptions}, entries: ${_this.entries}, settings: ${_this.settings})';
}


}

/// @nodoc
abstract mixin class $BackupDataCopyWith<$Res>  {
  factory $BackupDataCopyWith(BackupData value, $Res Function(BackupData) _then) = _$BackupDataCopyWithImpl;
@useResult
$Res call({
 List<CategoryRecord> categories, List<LabelRecord> labels, List<TaskSeriesRecord> taskSeries, List<TaskRecord> tasks, List<TaskReminderRecord> taskReminders, List<RoutineRecord> routines, List<RoutineExceptionRecord> routineExceptions, List<EntryRecord> entries, Map<String, Object?> settings
});




}
/// @nodoc
class _$BackupDataCopyWithImpl<$Res>
    implements $BackupDataCopyWith<$Res> {
  _$BackupDataCopyWithImpl(this._self, this._then);

  final BackupData _self;
  final $Res Function(BackupData) _then;

/// Create a copy of BackupData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? labels = null,Object? taskSeries = null,Object? tasks = null,Object? taskReminders = null,Object? routines = null,Object? routineExceptions = null,Object? entries = null,Object? settings = null,}) {
  return _then(BackupData(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryRecord>,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<LabelRecord>,taskSeries: null == taskSeries ? _self.taskSeries : taskSeries // ignore: cast_nullable_to_non_nullable
as List<TaskSeriesRecord>,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskRecord>,taskReminders: null == taskReminders ? _self.taskReminders : taskReminders // ignore: cast_nullable_to_non_nullable
as List<TaskReminderRecord>,routines: null == routines ? _self.routines : routines // ignore: cast_nullable_to_non_nullable
as List<RoutineRecord>,routineExceptions: null == routineExceptions ? _self.routineExceptions : routineExceptions // ignore: cast_nullable_to_non_nullable
as List<RoutineExceptionRecord>,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<EntryRecord>,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupData].
extension BackupDataPatterns on BackupData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupData value)  $default,){
final _that = this;
switch (_that) {
case _BackupData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupData value)?  $default,){
final _that = this;
switch (_that) {
case _BackupData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoryRecord> categories,  List<LabelRecord> labels,  List<TaskSeriesRecord> taskSeries,  List<TaskRecord> tasks,  List<TaskReminderRecord> taskReminders,  List<RoutineRecord> routines,  List<RoutineExceptionRecord> routineExceptions,  List<EntryRecord> entries,  Map<String, Object?> settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupData() when $default != null:
return $default(_that.categories,_that.labels,_that.taskSeries,_that.tasks,_that.taskReminders,_that.routines,_that.routineExceptions,_that.entries,_that.settings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoryRecord> categories,  List<LabelRecord> labels,  List<TaskSeriesRecord> taskSeries,  List<TaskRecord> tasks,  List<TaskReminderRecord> taskReminders,  List<RoutineRecord> routines,  List<RoutineExceptionRecord> routineExceptions,  List<EntryRecord> entries,  Map<String, Object?> settings)  $default,) {final _that = this;
switch (_that) {
case _BackupData():
return $default(_that.categories,_that.labels,_that.taskSeries,_that.tasks,_that.taskReminders,_that.routines,_that.routineExceptions,_that.entries,_that.settings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoryRecord> categories,  List<LabelRecord> labels,  List<TaskSeriesRecord> taskSeries,  List<TaskRecord> tasks,  List<TaskReminderRecord> taskReminders,  List<RoutineRecord> routines,  List<RoutineExceptionRecord> routineExceptions,  List<EntryRecord> entries,  Map<String, Object?> settings)?  $default,) {final _that = this;
switch (_that) {
case _BackupData() when $default != null:
return $default(_that.categories,_that.labels,_that.taskSeries,_that.tasks,_that.taskReminders,_that.routines,_that.routineExceptions,_that.entries,_that.settings);case _:
  return null;

}
}

}

/// @nodoc


class _BackupData extends BackupData {
  const _BackupData({ List<CategoryRecord> categories = const <CategoryRecord>[],  List<LabelRecord> labels = const <LabelRecord>[],  List<TaskSeriesRecord> taskSeries = const <TaskSeriesRecord>[],  List<TaskRecord> tasks = const <TaskRecord>[],  List<TaskReminderRecord> taskReminders = const <TaskReminderRecord>[],  List<RoutineRecord> routines = const <RoutineRecord>[],  List<RoutineExceptionRecord> routineExceptions = const <RoutineExceptionRecord>[],  List<EntryRecord> entries = const <EntryRecord>[],  Map<String, Object?> settings = const <String, Object?>{}}): _categories = categories,_labels = labels,_taskSeries = taskSeries,_tasks = tasks,_taskReminders = taskReminders,_routines = routines,_routineExceptions = routineExceptions,_entries = entries,_settings = settings,super._();
  

 final  List<CategoryRecord> _categories;
@override@JsonKey() List<CategoryRecord> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<LabelRecord> _labels;
@override@JsonKey() List<LabelRecord> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}

 final  List<TaskSeriesRecord> _taskSeries;
@override@JsonKey() List<TaskSeriesRecord> get taskSeries {
  if (_taskSeries is EqualUnmodifiableListView) return _taskSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taskSeries);
}

 final  List<TaskRecord> _tasks;
@override@JsonKey() List<TaskRecord> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

 final  List<TaskReminderRecord> _taskReminders;
@override@JsonKey() List<TaskReminderRecord> get taskReminders {
  if (_taskReminders is EqualUnmodifiableListView) return _taskReminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taskReminders);
}

 final  List<RoutineRecord> _routines;
@override@JsonKey() List<RoutineRecord> get routines {
  if (_routines is EqualUnmodifiableListView) return _routines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_routines);
}

 final  List<RoutineExceptionRecord> _routineExceptions;
@override@JsonKey() List<RoutineExceptionRecord> get routineExceptions {
  if (_routineExceptions is EqualUnmodifiableListView) return _routineExceptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_routineExceptions);
}

 final  List<EntryRecord> _entries;
@override@JsonKey() List<EntryRecord> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

 final  Map<String, Object?> _settings;
@override@JsonKey() Map<String, Object?> get settings {
  if (_settings is EqualUnmodifiableMapView) return _settings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_settings);
}


/// Create a copy of BackupData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupDataCopyWith<_BackupData> get copyWith => __$BackupDataCopyWithImpl<_BackupData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupData&&const DeepCollectionEquality().equals(other.categories, _categories)&&const DeepCollectionEquality().equals(other.labels, _labels)&&const DeepCollectionEquality().equals(other.taskSeries, _taskSeries)&&const DeepCollectionEquality().equals(other.tasks, _tasks)&&const DeepCollectionEquality().equals(other.taskReminders, _taskReminders)&&const DeepCollectionEquality().equals(other.routines, _routines)&&const DeepCollectionEquality().equals(other.routineExceptions, _routineExceptions)&&const DeepCollectionEquality().equals(other.entries, _entries)&&const DeepCollectionEquality().equals(other.settings, _settings));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_taskSeries),const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_taskReminders),const DeepCollectionEquality().hash(_routines),const DeepCollectionEquality().hash(_routineExceptions),const DeepCollectionEquality().hash(_entries),const DeepCollectionEquality().hash(_settings));
}

@override
String toString() {
    return 'BackupData(categories: $categories, labels: $labels, taskSeries: $taskSeries, tasks: $tasks, taskReminders: $taskReminders, routines: $routines, routineExceptions: $routineExceptions, entries: $entries, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$BackupDataCopyWith<$Res> implements $BackupDataCopyWith<$Res> {
  factory _$BackupDataCopyWith(_BackupData value, $Res Function(_BackupData) _then) = __$BackupDataCopyWithImpl;
@override @useResult
$Res call({
 List<CategoryRecord> categories, List<LabelRecord> labels, List<TaskSeriesRecord> taskSeries, List<TaskRecord> tasks, List<TaskReminderRecord> taskReminders, List<RoutineRecord> routines, List<RoutineExceptionRecord> routineExceptions, List<EntryRecord> entries, Map<String, Object?> settings
});




}
/// @nodoc
class __$BackupDataCopyWithImpl<$Res>
    implements _$BackupDataCopyWith<$Res> {
  __$BackupDataCopyWithImpl(this._self, this._then);

  final _BackupData _self;
  final $Res Function(_BackupData) _then;

/// Create a copy of BackupData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? labels = null,Object? taskSeries = null,Object? tasks = null,Object? taskReminders = null,Object? routines = null,Object? routineExceptions = null,Object? entries = null,Object? settings = null,}) {
  return _then(_BackupData(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryRecord>,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<LabelRecord>,taskSeries: null == taskSeries ? _self._taskSeries : taskSeries // ignore: cast_nullable_to_non_nullable
as List<TaskSeriesRecord>,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskRecord>,taskReminders: null == taskReminders ? _self._taskReminders : taskReminders // ignore: cast_nullable_to_non_nullable
as List<TaskReminderRecord>,routines: null == routines ? _self._routines : routines // ignore: cast_nullable_to_non_nullable
as List<RoutineRecord>,routineExceptions: null == routineExceptions ? _self._routineExceptions : routineExceptions // ignore: cast_nullable_to_non_nullable
as List<RoutineExceptionRecord>,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<EntryRecord>,settings: null == settings ? _self._settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
