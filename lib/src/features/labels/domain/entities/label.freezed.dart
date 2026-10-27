// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Label {

 String get id; String get name;/// Lower-cased, trimmed, whitespace collapsed — see `nameKeyOf`.
 String get nameKey;/// A key from `labelColorKeys`, e.g. `teal`.
 String get colorKey; String? get iconKey; String? get categoryId; bool get isArchived; int get sortOrder; Instant get createdAt; Instant get updatedAt;
/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelCopyWith<Label> get copyWith => _$LabelCopyWithImpl<Label>(this as Label, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Label;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Label&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameKey, _this.nameKey) || other.nameKey == _this.nameKey)&&(identical(other.colorKey, _this.colorKey) || other.colorKey == _this.colorKey)&&(identical(other.iconKey, _this.iconKey) || other.iconKey == _this.iconKey)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as Label;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameKey,_this.colorKey,_this.iconKey,_this.categoryId,_this.isArchived,_this.sortOrder,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as Label;
  return 'Label(id: ${_this.id}, name: ${_this.name}, nameKey: ${_this.nameKey}, colorKey: ${_this.colorKey}, iconKey: ${_this.iconKey}, categoryId: ${_this.categoryId}, isArchived: ${_this.isArchived}, sortOrder: ${_this.sortOrder}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $LabelCopyWith<$Res>  {
  factory $LabelCopyWith(Label value, $Res Function(Label) _then) = _$LabelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String nameKey, String colorKey, String? iconKey, String? categoryId, bool isArchived, int sortOrder, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$LabelCopyWithImpl<$Res>
    implements $LabelCopyWith<$Res> {
  _$LabelCopyWithImpl(this._self, this._then);

  final Label _self;
  final $Res Function(Label) _then;

/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameKey = null,Object? colorKey = null,Object? iconKey = freezed,Object? categoryId = freezed,Object? isArchived = null,Object? sortOrder = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(Label(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameKey: null == nameKey ? _self.nameKey : nameKey // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [Label].
extension LabelPatterns on Label {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Label value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Label() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Label value)  $default,){
final _that = this;
switch (_that) {
case _Label():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Label value)?  $default,){
final _that = this;
switch (_that) {
case _Label() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String nameKey,  String colorKey,  String? iconKey,  String? categoryId,  bool isArchived,  int sortOrder,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Label() when $default != null:
return $default(_that.id,_that.name,_that.nameKey,_that.colorKey,_that.iconKey,_that.categoryId,_that.isArchived,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String nameKey,  String colorKey,  String? iconKey,  String? categoryId,  bool isArchived,  int sortOrder,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Label():
return $default(_that.id,_that.name,_that.nameKey,_that.colorKey,_that.iconKey,_that.categoryId,_that.isArchived,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String nameKey,  String colorKey,  String? iconKey,  String? categoryId,  bool isArchived,  int sortOrder,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Label() when $default != null:
return $default(_that.id,_that.name,_that.nameKey,_that.colorKey,_that.iconKey,_that.categoryId,_that.isArchived,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Label implements Label {
  const _Label({required this.id, required this.name, required this.nameKey, required this.colorKey, this.iconKey, this.categoryId, this.isArchived = false, this.sortOrder = 0, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String name;
/// Lower-cased, trimmed, whitespace collapsed — see `nameKeyOf`.
@override final  String nameKey;
/// A key from `labelColorKeys`, e.g. `teal`.
@override final  String colorKey;
@override final  String? iconKey;
@override final  String? categoryId;
@override@JsonKey() final  bool isArchived;
@override@JsonKey() final  int sortOrder;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelCopyWith<_Label> get copyWith => __$LabelCopyWithImpl<_Label>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Label&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameKey, nameKey) || other.nameKey == nameKey)&&(identical(other.colorKey, colorKey) || other.colorKey == colorKey)&&(identical(other.iconKey, iconKey) || other.iconKey == iconKey)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameKey,colorKey,iconKey,categoryId,isArchived,sortOrder,createdAt,updatedAt);
}

@override
String toString() {
    return 'Label(id: $id, name: $name, nameKey: $nameKey, colorKey: $colorKey, iconKey: $iconKey, categoryId: $categoryId, isArchived: $isArchived, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LabelCopyWith<$Res> implements $LabelCopyWith<$Res> {
  factory _$LabelCopyWith(_Label value, $Res Function(_Label) _then) = __$LabelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String nameKey, String colorKey, String? iconKey, String? categoryId, bool isArchived, int sortOrder, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$LabelCopyWithImpl<$Res>
    implements _$LabelCopyWith<$Res> {
  __$LabelCopyWithImpl(this._self, this._then);

  final _Label _self;
  final $Res Function(_Label) _then;

/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameKey = null,Object? colorKey = null,Object? iconKey = freezed,Object? categoryId = freezed,Object? isArchived = null,Object? sortOrder = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Label(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameKey: null == nameKey ? _self.nameKey : nameKey // ignore: cast_nullable_to_non_nullable
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
mixin _$Category {

 String get id; String get name; String get nameKey; String? get colorKey; int get sortOrder; Instant get createdAt; Instant get updatedAt;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Category;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameKey, _this.nameKey) || other.nameKey == _this.nameKey)&&(identical(other.colorKey, _this.colorKey) || other.colorKey == _this.colorKey)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as Category;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameKey,_this.colorKey,_this.sortOrder,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as Category;
  return 'Category(id: ${_this.id}, name: ${_this.name}, nameKey: ${_this.nameKey}, colorKey: ${_this.colorKey}, sortOrder: ${_this.sortOrder}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String nameKey, String? colorKey, int sortOrder, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameKey = null,Object? colorKey = freezed,Object? sortOrder = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameKey: null == nameKey ? _self.nameKey : nameKey // ignore: cast_nullable_to_non_nullable
as String,colorKey: freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String nameKey,  String? colorKey,  int sortOrder,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.nameKey,_that.colorKey,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String nameKey,  String? colorKey,  int sortOrder,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.name,_that.nameKey,_that.colorKey,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String nameKey,  String? colorKey,  int sortOrder,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.nameKey,_that.colorKey,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Category implements Category {
  const _Category({required this.id, required this.name, required this.nameKey, this.colorKey, this.sortOrder = 0, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  String nameKey;
@override final  String? colorKey;
@override@JsonKey() final  int sortOrder;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameKey, nameKey) || other.nameKey == nameKey)&&(identical(other.colorKey, colorKey) || other.colorKey == colorKey)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameKey,colorKey,sortOrder,createdAt,updatedAt);
}

@override
String toString() {
    return 'Category(id: $id, name: $name, nameKey: $nameKey, colorKey: $colorKey, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String nameKey, String? colorKey, int sortOrder, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameKey = null,Object? colorKey = freezed,Object? sortOrder = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameKey: null == nameKey ? _self.nameKey : nameKey // ignore: cast_nullable_to_non_nullable
as String,colorKey: freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

/// @nodoc
mixin _$LabelUsage {

 int get entries; int get routines; int get routineExceptions;
/// Create a copy of LabelUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelUsageCopyWith<LabelUsage> get copyWith => _$LabelUsageCopyWithImpl<LabelUsage>(this as LabelUsage, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LabelUsage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelUsage&&(identical(other.entries, _this.entries) || other.entries == _this.entries)&&(identical(other.routines, _this.routines) || other.routines == _this.routines)&&(identical(other.routineExceptions, _this.routineExceptions) || other.routineExceptions == _this.routineExceptions));
}


@override
int get hashCode {
  final _this = this as LabelUsage;
  return Object.hash(runtimeType,_this.entries,_this.routines,_this.routineExceptions);
}

@override
String toString() {
  final _this = this as LabelUsage;
  return 'LabelUsage(entries: ${_this.entries}, routines: ${_this.routines}, routineExceptions: ${_this.routineExceptions})';
}


}

/// @nodoc
abstract mixin class $LabelUsageCopyWith<$Res>  {
  factory $LabelUsageCopyWith(LabelUsage value, $Res Function(LabelUsage) _then) = _$LabelUsageCopyWithImpl;
@useResult
$Res call({
 int entries, int routines, int routineExceptions
});




}
/// @nodoc
class _$LabelUsageCopyWithImpl<$Res>
    implements $LabelUsageCopyWith<$Res> {
  _$LabelUsageCopyWithImpl(this._self, this._then);

  final LabelUsage _self;
  final $Res Function(LabelUsage) _then;

/// Create a copy of LabelUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,Object? routines = null,Object? routineExceptions = null,}) {
  return _then(LabelUsage(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as int,routines: null == routines ? _self.routines : routines // ignore: cast_nullable_to_non_nullable
as int,routineExceptions: null == routineExceptions ? _self.routineExceptions : routineExceptions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LabelUsage].
extension LabelUsagePatterns on LabelUsage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabelUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabelUsage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabelUsage value)  $default,){
final _that = this;
switch (_that) {
case _LabelUsage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabelUsage value)?  $default,){
final _that = this;
switch (_that) {
case _LabelUsage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int entries,  int routines,  int routineExceptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabelUsage() when $default != null:
return $default(_that.entries,_that.routines,_that.routineExceptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int entries,  int routines,  int routineExceptions)  $default,) {final _that = this;
switch (_that) {
case _LabelUsage():
return $default(_that.entries,_that.routines,_that.routineExceptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int entries,  int routines,  int routineExceptions)?  $default,) {final _that = this;
switch (_that) {
case _LabelUsage() when $default != null:
return $default(_that.entries,_that.routines,_that.routineExceptions);case _:
  return null;

}
}

}

/// @nodoc


class _LabelUsage extends LabelUsage {
  const _LabelUsage({this.entries = 0, this.routines = 0, this.routineExceptions = 0}): super._();
  

@override@JsonKey() final  int entries;
@override@JsonKey() final  int routines;
@override@JsonKey() final  int routineExceptions;

/// Create a copy of LabelUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelUsageCopyWith<_LabelUsage> get copyWith => __$LabelUsageCopyWithImpl<_LabelUsage>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabelUsage&&(identical(other.entries, entries) || other.entries == entries)&&(identical(other.routines, routines) || other.routines == routines)&&(identical(other.routineExceptions, routineExceptions) || other.routineExceptions == routineExceptions));
}


@override
int get hashCode {
    return Object.hash(runtimeType,entries,routines,routineExceptions);
}

@override
String toString() {
    return 'LabelUsage(entries: $entries, routines: $routines, routineExceptions: $routineExceptions)';
}


}

/// @nodoc
abstract mixin class _$LabelUsageCopyWith<$Res> implements $LabelUsageCopyWith<$Res> {
  factory _$LabelUsageCopyWith(_LabelUsage value, $Res Function(_LabelUsage) _then) = __$LabelUsageCopyWithImpl;
@override @useResult
$Res call({
 int entries, int routines, int routineExceptions
});




}
/// @nodoc
class __$LabelUsageCopyWithImpl<$Res>
    implements _$LabelUsageCopyWith<$Res> {
  __$LabelUsageCopyWithImpl(this._self, this._then);

  final _LabelUsage _self;
  final $Res Function(_LabelUsage) _then;

/// Create a copy of LabelUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? routines = null,Object? routineExceptions = null,}) {
  return _then(_LabelUsage(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as int,routines: null == routines ? _self.routines : routines // ignore: cast_nullable_to_non_nullable
as int,routineExceptions: null == routineExceptions ? _self.routineExceptions : routineExceptions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
