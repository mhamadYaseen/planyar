// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryEditorEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEditorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CategoryEditorEvent()';
}


}

/// @nodoc
class $CategoryEditorEventCopyWith<$Res>  {
$CategoryEditorEventCopyWith(CategoryEditorEvent _, $Res Function(CategoryEditorEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryEditorEvent].
extension CategoryEditorEventPatterns on CategoryEditorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _NameChanged value)?  nameChanged,TResult Function( _ColorPicked value)?  colorPicked,TResult Function( _SavePressed value)?  savePressed,TResult Function( _DeleteConfirmed value)?  deleteConfirmed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _ColorPicked() when colorPicked != null:
return colorPicked(_that);case _SavePressed() when savePressed != null:
return savePressed(_that);case _DeleteConfirmed() when deleteConfirmed != null:
return deleteConfirmed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _NameChanged value)  nameChanged,required TResult Function( _ColorPicked value)  colorPicked,required TResult Function( _SavePressed value)  savePressed,required TResult Function( _DeleteConfirmed value)  deleteConfirmed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _NameChanged():
return nameChanged(_that);case _ColorPicked():
return colorPicked(_that);case _SavePressed():
return savePressed(_that);case _DeleteConfirmed():
return deleteConfirmed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _NameChanged value)?  nameChanged,TResult? Function( _ColorPicked value)?  colorPicked,TResult? Function( _SavePressed value)?  savePressed,TResult? Function( _DeleteConfirmed value)?  deleteConfirmed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _ColorPicked() when colorPicked != null:
return colorPicked(_that);case _SavePressed() when savePressed != null:
return savePressed(_that);case _DeleteConfirmed() when deleteConfirmed != null:
return deleteConfirmed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? categoryId)?  started,TResult Function( String name)?  nameChanged,TResult Function( String? colorKey)?  colorPicked,TResult Function()?  savePressed,TResult Function( String? moveTo)?  deleteConfirmed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.categoryId);case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _ColorPicked() when colorPicked != null:
return colorPicked(_that.colorKey);case _SavePressed() when savePressed != null:
return savePressed();case _DeleteConfirmed() when deleteConfirmed != null:
return deleteConfirmed(_that.moveTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? categoryId)  started,required TResult Function( String name)  nameChanged,required TResult Function( String? colorKey)  colorPicked,required TResult Function()  savePressed,required TResult Function( String? moveTo)  deleteConfirmed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.categoryId);case _NameChanged():
return nameChanged(_that.name);case _ColorPicked():
return colorPicked(_that.colorKey);case _SavePressed():
return savePressed();case _DeleteConfirmed():
return deleteConfirmed(_that.moveTo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? categoryId)?  started,TResult? Function( String name)?  nameChanged,TResult? Function( String? colorKey)?  colorPicked,TResult? Function()?  savePressed,TResult? Function( String? moveTo)?  deleteConfirmed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.categoryId);case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _ColorPicked() when colorPicked != null:
return colorPicked(_that.colorKey);case _SavePressed() when savePressed != null:
return savePressed();case _DeleteConfirmed() when deleteConfirmed != null:
return deleteConfirmed(_that.moveTo);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CategoryEditorEvent {
  const _Started({this.categoryId});
  

 final  String? categoryId;

/// Create a copy of CategoryEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,categoryId);
}

@override
String toString() {
    return 'CategoryEditorEvent.started(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $CategoryEditorEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String? categoryId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of CategoryEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,}) {
  return _then(_Started(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _NameChanged implements CategoryEditorEvent {
  const _NameChanged(this.name);
  

 final  String name;

/// Create a copy of CategoryEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameChangedCopyWith<_NameChanged> get copyWith => __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameChanged&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name);
}

@override
String toString() {
    return 'CategoryEditorEvent.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class _$NameChangedCopyWith<$Res> implements $CategoryEditorEventCopyWith<$Res> {
  factory _$NameChangedCopyWith(_NameChanged value, $Res Function(_NameChanged) _then) = __$NameChangedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$NameChangedCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(this._self, this._then);

  final _NameChanged _self;
  final $Res Function(_NameChanged) _then;

/// Create a copy of CategoryEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_NameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ColorPicked implements CategoryEditorEvent {
  const _ColorPicked(this.colorKey);
  

 final  String? colorKey;

/// Create a copy of CategoryEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorPickedCopyWith<_ColorPicked> get copyWith => __$ColorPickedCopyWithImpl<_ColorPicked>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorPicked&&(identical(other.colorKey, colorKey) || other.colorKey == colorKey));
}


@override
int get hashCode {
    return Object.hash(runtimeType,colorKey);
}

@override
String toString() {
    return 'CategoryEditorEvent.colorPicked(colorKey: $colorKey)';
}


}

/// @nodoc
abstract mixin class _$ColorPickedCopyWith<$Res> implements $CategoryEditorEventCopyWith<$Res> {
  factory _$ColorPickedCopyWith(_ColorPicked value, $Res Function(_ColorPicked) _then) = __$ColorPickedCopyWithImpl;
@useResult
$Res call({
 String? colorKey
});




}
/// @nodoc
class __$ColorPickedCopyWithImpl<$Res>
    implements _$ColorPickedCopyWith<$Res> {
  __$ColorPickedCopyWithImpl(this._self, this._then);

  final _ColorPicked _self;
  final $Res Function(_ColorPicked) _then;

/// Create a copy of CategoryEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? colorKey = freezed,}) {
  return _then(_ColorPicked(
freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SavePressed implements CategoryEditorEvent {
  const _SavePressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CategoryEditorEvent.savePressed()';
}


}




/// @nodoc


class _DeleteConfirmed implements CategoryEditorEvent {
  const _DeleteConfirmed({this.moveTo});
  

 final  String? moveTo;

/// Create a copy of CategoryEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteConfirmedCopyWith<_DeleteConfirmed> get copyWith => __$DeleteConfirmedCopyWithImpl<_DeleteConfirmed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteConfirmed&&(identical(other.moveTo, moveTo) || other.moveTo == moveTo));
}


@override
int get hashCode {
    return Object.hash(runtimeType,moveTo);
}

@override
String toString() {
    return 'CategoryEditorEvent.deleteConfirmed(moveTo: $moveTo)';
}


}

/// @nodoc
abstract mixin class _$DeleteConfirmedCopyWith<$Res> implements $CategoryEditorEventCopyWith<$Res> {
  factory _$DeleteConfirmedCopyWith(_DeleteConfirmed value, $Res Function(_DeleteConfirmed) _then) = __$DeleteConfirmedCopyWithImpl;
@useResult
$Res call({
 String? moveTo
});




}
/// @nodoc
class __$DeleteConfirmedCopyWithImpl<$Res>
    implements _$DeleteConfirmedCopyWith<$Res> {
  __$DeleteConfirmedCopyWithImpl(this._self, this._then);

  final _DeleteConfirmed _self;
  final $Res Function(_DeleteConfirmed) _then;

/// Create a copy of CategoryEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? moveTo = freezed,}) {
  return _then(_DeleteConfirmed(
moveTo: freezed == moveTo ? _self.moveTo : moveTo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CategoryEditorState {

 EditorStatus get status; Category? get original; String get name; String? get colorKey; CategoryUsage? get usage;/// Other categories, as destinations for a delete.
 List<Category> get others; NameProblem? get nameProblem; Failure? get failure;
/// Create a copy of CategoryEditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryEditorStateCopyWith<CategoryEditorState> get copyWith => _$CategoryEditorStateCopyWithImpl<CategoryEditorState>(this as CategoryEditorState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CategoryEditorState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEditorState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.original, _this.original) || other.original == _this.original)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.colorKey, _this.colorKey) || other.colorKey == _this.colorKey)&&(identical(other.usage, _this.usage) || other.usage == _this.usage)&&const DeepCollectionEquality().equals(other.others, _this.others)&&(identical(other.nameProblem, _this.nameProblem) || other.nameProblem == _this.nameProblem)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as CategoryEditorState;
  return Object.hash(runtimeType,_this.status,_this.original,_this.name,_this.colorKey,_this.usage,const DeepCollectionEquality().hash(_this.others),_this.nameProblem,_this.failure);
}

@override
String toString() {
  final _this = this as CategoryEditorState;
  return 'CategoryEditorState(status: ${_this.status}, original: ${_this.original}, name: ${_this.name}, colorKey: ${_this.colorKey}, usage: ${_this.usage}, others: ${_this.others}, nameProblem: ${_this.nameProblem}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $CategoryEditorStateCopyWith<$Res>  {
  factory $CategoryEditorStateCopyWith(CategoryEditorState value, $Res Function(CategoryEditorState) _then) = _$CategoryEditorStateCopyWithImpl;
@useResult
$Res call({
 EditorStatus status, Category? original, String name, String? colorKey, CategoryUsage? usage, List<Category> others, NameProblem? nameProblem, Failure? failure
});


$CategoryCopyWith<$Res>? get original;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$CategoryEditorStateCopyWithImpl<$Res>
    implements $CategoryEditorStateCopyWith<$Res> {
  _$CategoryEditorStateCopyWithImpl(this._self, this._then);

  final CategoryEditorState _self;
  final $Res Function(CategoryEditorState) _then;

/// Create a copy of CategoryEditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? original = freezed,Object? name = null,Object? colorKey = freezed,Object? usage = freezed,Object? others = null,Object? nameProblem = freezed,Object? failure = freezed,}) {
  return _then(CategoryEditorState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditorStatus,original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Category?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorKey: freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as CategoryUsage?,others: null == others ? _self.others : others // ignore: cast_nullable_to_non_nullable
as List<Category>,nameProblem: freezed == nameProblem ? _self.nameProblem : nameProblem // ignore: cast_nullable_to_non_nullable
as NameProblem?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of CategoryEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of CategoryEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryEditorState].
extension CategoryEditorStatePatterns on CategoryEditorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryEditorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryEditorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryEditorState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryEditorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryEditorState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryEditorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditorStatus status,  Category? original,  String name,  String? colorKey,  CategoryUsage? usage,  List<Category> others,  NameProblem? nameProblem,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryEditorState() when $default != null:
return $default(_that.status,_that.original,_that.name,_that.colorKey,_that.usage,_that.others,_that.nameProblem,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditorStatus status,  Category? original,  String name,  String? colorKey,  CategoryUsage? usage,  List<Category> others,  NameProblem? nameProblem,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _CategoryEditorState():
return $default(_that.status,_that.original,_that.name,_that.colorKey,_that.usage,_that.others,_that.nameProblem,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditorStatus status,  Category? original,  String name,  String? colorKey,  CategoryUsage? usage,  List<Category> others,  NameProblem? nameProblem,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _CategoryEditorState() when $default != null:
return $default(_that.status,_that.original,_that.name,_that.colorKey,_that.usage,_that.others,_that.nameProblem,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryEditorState extends CategoryEditorState {
  const _CategoryEditorState({this.status = EditorStatus.loading, this.original, this.name = '', this.colorKey, this.usage,  List<Category> others = const <Category>[], this.nameProblem, this.failure}): _others = others,super._();
  

@override@JsonKey() final  EditorStatus status;
@override final  Category? original;
@override@JsonKey() final  String name;
@override final  String? colorKey;
@override final  CategoryUsage? usage;
/// Other categories, as destinations for a delete.
 final  List<Category> _others;
/// Other categories, as destinations for a delete.
@override@JsonKey() List<Category> get others {
  if (_others is EqualUnmodifiableListView) return _others;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_others);
}

@override final  NameProblem? nameProblem;
@override final  Failure? failure;

/// Create a copy of CategoryEditorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryEditorStateCopyWith<_CategoryEditorState> get copyWith => __$CategoryEditorStateCopyWithImpl<_CategoryEditorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryEditorState&&(identical(other.status, status) || other.status == status)&&(identical(other.original, original) || other.original == original)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorKey, colorKey) || other.colorKey == colorKey)&&(identical(other.usage, usage) || other.usage == usage)&&const DeepCollectionEquality().equals(other.others, _others)&&(identical(other.nameProblem, nameProblem) || other.nameProblem == nameProblem)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,original,name,colorKey,usage,const DeepCollectionEquality().hash(_others),nameProblem,failure);
}

@override
String toString() {
    return 'CategoryEditorState(status: $status, original: $original, name: $name, colorKey: $colorKey, usage: $usage, others: $others, nameProblem: $nameProblem, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$CategoryEditorStateCopyWith<$Res> implements $CategoryEditorStateCopyWith<$Res> {
  factory _$CategoryEditorStateCopyWith(_CategoryEditorState value, $Res Function(_CategoryEditorState) _then) = __$CategoryEditorStateCopyWithImpl;
@override @useResult
$Res call({
 EditorStatus status, Category? original, String name, String? colorKey, CategoryUsage? usage, List<Category> others, NameProblem? nameProblem, Failure? failure
});


@override $CategoryCopyWith<$Res>? get original;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$CategoryEditorStateCopyWithImpl<$Res>
    implements _$CategoryEditorStateCopyWith<$Res> {
  __$CategoryEditorStateCopyWithImpl(this._self, this._then);

  final _CategoryEditorState _self;
  final $Res Function(_CategoryEditorState) _then;

/// Create a copy of CategoryEditorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? original = freezed,Object? name = null,Object? colorKey = freezed,Object? usage = freezed,Object? others = null,Object? nameProblem = freezed,Object? failure = freezed,}) {
  return _then(_CategoryEditorState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditorStatus,original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Category?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorKey: freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as CategoryUsage?,others: null == others ? _self._others : others // ignore: cast_nullable_to_non_nullable
as List<Category>,nameProblem: freezed == nameProblem ? _self.nameProblem : nameProblem // ignore: cast_nullable_to_non_nullable
as NameProblem?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of CategoryEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of CategoryEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
