// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'label_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LabelEditorEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelEditorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LabelEditorEvent()';
}


}

/// @nodoc
class $LabelEditorEventCopyWith<$Res>  {
$LabelEditorEventCopyWith(LabelEditorEvent _, $Res Function(LabelEditorEvent) __);
}


/// Adds pattern-matching-related methods to [LabelEditorEvent].
extension LabelEditorEventPatterns on LabelEditorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _NameChanged value)?  nameChanged,TResult Function( _ColorPicked value)?  colorPicked,TResult Function( _IconPicked value)?  iconPicked,TResult Function( _CategoryPicked value)?  categoryPicked,TResult Function( _SavePressed value)?  savePressed,TResult Function( _ArchiveToggled value)?  archiveToggled,TResult Function( _DeletePressed value)?  deletePressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _ColorPicked() when colorPicked != null:
return colorPicked(_that);case _IconPicked() when iconPicked != null:
return iconPicked(_that);case _CategoryPicked() when categoryPicked != null:
return categoryPicked(_that);case _SavePressed() when savePressed != null:
return savePressed(_that);case _ArchiveToggled() when archiveToggled != null:
return archiveToggled(_that);case _DeletePressed() when deletePressed != null:
return deletePressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _NameChanged value)  nameChanged,required TResult Function( _ColorPicked value)  colorPicked,required TResult Function( _IconPicked value)  iconPicked,required TResult Function( _CategoryPicked value)  categoryPicked,required TResult Function( _SavePressed value)  savePressed,required TResult Function( _ArchiveToggled value)  archiveToggled,required TResult Function( _DeletePressed value)  deletePressed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _NameChanged():
return nameChanged(_that);case _ColorPicked():
return colorPicked(_that);case _IconPicked():
return iconPicked(_that);case _CategoryPicked():
return categoryPicked(_that);case _SavePressed():
return savePressed(_that);case _ArchiveToggled():
return archiveToggled(_that);case _DeletePressed():
return deletePressed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _NameChanged value)?  nameChanged,TResult? Function( _ColorPicked value)?  colorPicked,TResult? Function( _IconPicked value)?  iconPicked,TResult? Function( _CategoryPicked value)?  categoryPicked,TResult? Function( _SavePressed value)?  savePressed,TResult? Function( _ArchiveToggled value)?  archiveToggled,TResult? Function( _DeletePressed value)?  deletePressed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _ColorPicked() when colorPicked != null:
return colorPicked(_that);case _IconPicked() when iconPicked != null:
return iconPicked(_that);case _CategoryPicked() when categoryPicked != null:
return categoryPicked(_that);case _SavePressed() when savePressed != null:
return savePressed(_that);case _ArchiveToggled() when archiveToggled != null:
return archiveToggled(_that);case _DeletePressed() when deletePressed != null:
return deletePressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? labelId)?  started,TResult Function( String name)?  nameChanged,TResult Function( String colorKey)?  colorPicked,TResult Function( String? iconKey)?  iconPicked,TResult Function( String? categoryId)?  categoryPicked,TResult Function()?  savePressed,TResult Function()?  archiveToggled,TResult Function()?  deletePressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.labelId);case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _ColorPicked() when colorPicked != null:
return colorPicked(_that.colorKey);case _IconPicked() when iconPicked != null:
return iconPicked(_that.iconKey);case _CategoryPicked() when categoryPicked != null:
return categoryPicked(_that.categoryId);case _SavePressed() when savePressed != null:
return savePressed();case _ArchiveToggled() when archiveToggled != null:
return archiveToggled();case _DeletePressed() when deletePressed != null:
return deletePressed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? labelId)  started,required TResult Function( String name)  nameChanged,required TResult Function( String colorKey)  colorPicked,required TResult Function( String? iconKey)  iconPicked,required TResult Function( String? categoryId)  categoryPicked,required TResult Function()  savePressed,required TResult Function()  archiveToggled,required TResult Function()  deletePressed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.labelId);case _NameChanged():
return nameChanged(_that.name);case _ColorPicked():
return colorPicked(_that.colorKey);case _IconPicked():
return iconPicked(_that.iconKey);case _CategoryPicked():
return categoryPicked(_that.categoryId);case _SavePressed():
return savePressed();case _ArchiveToggled():
return archiveToggled();case _DeletePressed():
return deletePressed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? labelId)?  started,TResult? Function( String name)?  nameChanged,TResult? Function( String colorKey)?  colorPicked,TResult? Function( String? iconKey)?  iconPicked,TResult? Function( String? categoryId)?  categoryPicked,TResult? Function()?  savePressed,TResult? Function()?  archiveToggled,TResult? Function()?  deletePressed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.labelId);case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _ColorPicked() when colorPicked != null:
return colorPicked(_that.colorKey);case _IconPicked() when iconPicked != null:
return iconPicked(_that.iconKey);case _CategoryPicked() when categoryPicked != null:
return categoryPicked(_that.categoryId);case _SavePressed() when savePressed != null:
return savePressed();case _ArchiveToggled() when archiveToggled != null:
return archiveToggled();case _DeletePressed() when deletePressed != null:
return deletePressed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LabelEditorEvent {
  const _Started({this.labelId});
  

 final  String? labelId;

/// Create a copy of LabelEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.labelId, labelId) || other.labelId == labelId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,labelId);
}

@override
String toString() {
    return 'LabelEditorEvent.started(labelId: $labelId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $LabelEditorEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String? labelId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of LabelEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? labelId = freezed,}) {
  return _then(_Started(
labelId: freezed == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _NameChanged implements LabelEditorEvent {
  const _NameChanged(this.name);
  

 final  String name;

/// Create a copy of LabelEditorEvent
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
    return 'LabelEditorEvent.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class _$NameChangedCopyWith<$Res> implements $LabelEditorEventCopyWith<$Res> {
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

/// Create a copy of LabelEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_NameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ColorPicked implements LabelEditorEvent {
  const _ColorPicked(this.colorKey);
  

 final  String colorKey;

/// Create a copy of LabelEditorEvent
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
    return 'LabelEditorEvent.colorPicked(colorKey: $colorKey)';
}


}

/// @nodoc
abstract mixin class _$ColorPickedCopyWith<$Res> implements $LabelEditorEventCopyWith<$Res> {
  factory _$ColorPickedCopyWith(_ColorPicked value, $Res Function(_ColorPicked) _then) = __$ColorPickedCopyWithImpl;
@useResult
$Res call({
 String colorKey
});




}
/// @nodoc
class __$ColorPickedCopyWithImpl<$Res>
    implements _$ColorPickedCopyWith<$Res> {
  __$ColorPickedCopyWithImpl(this._self, this._then);

  final _ColorPicked _self;
  final $Res Function(_ColorPicked) _then;

/// Create a copy of LabelEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? colorKey = null,}) {
  return _then(_ColorPicked(
null == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _IconPicked implements LabelEditorEvent {
  const _IconPicked(this.iconKey);
  

 final  String? iconKey;

/// Create a copy of LabelEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IconPickedCopyWith<_IconPicked> get copyWith => __$IconPickedCopyWithImpl<_IconPicked>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IconPicked&&(identical(other.iconKey, iconKey) || other.iconKey == iconKey));
}


@override
int get hashCode {
    return Object.hash(runtimeType,iconKey);
}

@override
String toString() {
    return 'LabelEditorEvent.iconPicked(iconKey: $iconKey)';
}


}

/// @nodoc
abstract mixin class _$IconPickedCopyWith<$Res> implements $LabelEditorEventCopyWith<$Res> {
  factory _$IconPickedCopyWith(_IconPicked value, $Res Function(_IconPicked) _then) = __$IconPickedCopyWithImpl;
@useResult
$Res call({
 String? iconKey
});




}
/// @nodoc
class __$IconPickedCopyWithImpl<$Res>
    implements _$IconPickedCopyWith<$Res> {
  __$IconPickedCopyWithImpl(this._self, this._then);

  final _IconPicked _self;
  final $Res Function(_IconPicked) _then;

/// Create a copy of LabelEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? iconKey = freezed,}) {
  return _then(_IconPicked(
freezed == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _CategoryPicked implements LabelEditorEvent {
  const _CategoryPicked(this.categoryId);
  

 final  String? categoryId;

/// Create a copy of LabelEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryPickedCopyWith<_CategoryPicked> get copyWith => __$CategoryPickedCopyWithImpl<_CategoryPicked>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryPicked&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,categoryId);
}

@override
String toString() {
    return 'LabelEditorEvent.categoryPicked(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$CategoryPickedCopyWith<$Res> implements $LabelEditorEventCopyWith<$Res> {
  factory _$CategoryPickedCopyWith(_CategoryPicked value, $Res Function(_CategoryPicked) _then) = __$CategoryPickedCopyWithImpl;
@useResult
$Res call({
 String? categoryId
});




}
/// @nodoc
class __$CategoryPickedCopyWithImpl<$Res>
    implements _$CategoryPickedCopyWith<$Res> {
  __$CategoryPickedCopyWithImpl(this._self, this._then);

  final _CategoryPicked _self;
  final $Res Function(_CategoryPicked) _then;

/// Create a copy of LabelEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,}) {
  return _then(_CategoryPicked(
freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SavePressed implements LabelEditorEvent {
  const _SavePressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LabelEditorEvent.savePressed()';
}


}




/// @nodoc


class _ArchiveToggled implements LabelEditorEvent {
  const _ArchiveToggled();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchiveToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LabelEditorEvent.archiveToggled()';
}


}




/// @nodoc


class _DeletePressed implements LabelEditorEvent {
  const _DeletePressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LabelEditorEvent.deletePressed()';
}


}




/// @nodoc
mixin _$LabelEditorState {

 EditorStatus get status; Label? get original; String get name; String? get colorKey; String? get iconKey; String? get categoryId; List<Category> get categories;/// Decides whether Delete is allowed and explains why not (LBL-04, J20).
 LabelUsage? get usage; NameProblem? get nameProblem; Failure? get failure;
/// Create a copy of LabelEditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelEditorStateCopyWith<LabelEditorState> get copyWith => _$LabelEditorStateCopyWithImpl<LabelEditorState>(this as LabelEditorState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LabelEditorState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelEditorState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.original, _this.original) || other.original == _this.original)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.colorKey, _this.colorKey) || other.colorKey == _this.colorKey)&&(identical(other.iconKey, _this.iconKey) || other.iconKey == _this.iconKey)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&(identical(other.usage, _this.usage) || other.usage == _this.usage)&&(identical(other.nameProblem, _this.nameProblem) || other.nameProblem == _this.nameProblem)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as LabelEditorState;
  return Object.hash(runtimeType,_this.status,_this.original,_this.name,_this.colorKey,_this.iconKey,_this.categoryId,const DeepCollectionEquality().hash(_this.categories),_this.usage,_this.nameProblem,_this.failure);
}

@override
String toString() {
  final _this = this as LabelEditorState;
  return 'LabelEditorState(status: ${_this.status}, original: ${_this.original}, name: ${_this.name}, colorKey: ${_this.colorKey}, iconKey: ${_this.iconKey}, categoryId: ${_this.categoryId}, categories: ${_this.categories}, usage: ${_this.usage}, nameProblem: ${_this.nameProblem}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $LabelEditorStateCopyWith<$Res>  {
  factory $LabelEditorStateCopyWith(LabelEditorState value, $Res Function(LabelEditorState) _then) = _$LabelEditorStateCopyWithImpl;
@useResult
$Res call({
 EditorStatus status, Label? original, String name, String? colorKey, String? iconKey, String? categoryId, List<Category> categories, LabelUsage? usage, NameProblem? nameProblem, Failure? failure
});


$LabelCopyWith<$Res>? get original;$LabelUsageCopyWith<$Res>? get usage;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$LabelEditorStateCopyWithImpl<$Res>
    implements $LabelEditorStateCopyWith<$Res> {
  _$LabelEditorStateCopyWithImpl(this._self, this._then);

  final LabelEditorState _self;
  final $Res Function(LabelEditorState) _then;

/// Create a copy of LabelEditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? original = freezed,Object? name = null,Object? colorKey = freezed,Object? iconKey = freezed,Object? categoryId = freezed,Object? categories = null,Object? usage = freezed,Object? nameProblem = freezed,Object? failure = freezed,}) {
  return _then(LabelEditorState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditorStatus,original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Label?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorKey: freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,iconKey: freezed == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as LabelUsage?,nameProblem: freezed == nameProblem ? _self.nameProblem : nameProblem // ignore: cast_nullable_to_non_nullable
as NameProblem?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of LabelEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $LabelCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of LabelEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelUsageCopyWith<$Res>? get usage {
    if (_self.usage == null) {
    return null;
  }

  return $LabelUsageCopyWith<$Res>(_self.usage!, (value) {
    return _then(_self.copyWith(usage: value));
  });
}/// Create a copy of LabelEditorState
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


/// Adds pattern-matching-related methods to [LabelEditorState].
extension LabelEditorStatePatterns on LabelEditorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabelEditorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabelEditorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabelEditorState value)  $default,){
final _that = this;
switch (_that) {
case _LabelEditorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabelEditorState value)?  $default,){
final _that = this;
switch (_that) {
case _LabelEditorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditorStatus status,  Label? original,  String name,  String? colorKey,  String? iconKey,  String? categoryId,  List<Category> categories,  LabelUsage? usage,  NameProblem? nameProblem,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabelEditorState() when $default != null:
return $default(_that.status,_that.original,_that.name,_that.colorKey,_that.iconKey,_that.categoryId,_that.categories,_that.usage,_that.nameProblem,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditorStatus status,  Label? original,  String name,  String? colorKey,  String? iconKey,  String? categoryId,  List<Category> categories,  LabelUsage? usage,  NameProblem? nameProblem,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _LabelEditorState():
return $default(_that.status,_that.original,_that.name,_that.colorKey,_that.iconKey,_that.categoryId,_that.categories,_that.usage,_that.nameProblem,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditorStatus status,  Label? original,  String name,  String? colorKey,  String? iconKey,  String? categoryId,  List<Category> categories,  LabelUsage? usage,  NameProblem? nameProblem,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _LabelEditorState() when $default != null:
return $default(_that.status,_that.original,_that.name,_that.colorKey,_that.iconKey,_that.categoryId,_that.categories,_that.usage,_that.nameProblem,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _LabelEditorState extends LabelEditorState {
  const _LabelEditorState({this.status = EditorStatus.loading, this.original, this.name = '', this.colorKey, this.iconKey, this.categoryId,  List<Category> categories = const <Category>[], this.usage, this.nameProblem, this.failure}): _categories = categories,super._();
  

@override@JsonKey() final  EditorStatus status;
@override final  Label? original;
@override@JsonKey() final  String name;
@override final  String? colorKey;
@override final  String? iconKey;
@override final  String? categoryId;
 final  List<Category> _categories;
@override@JsonKey() List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

/// Decides whether Delete is allowed and explains why not (LBL-04, J20).
@override final  LabelUsage? usage;
@override final  NameProblem? nameProblem;
@override final  Failure? failure;

/// Create a copy of LabelEditorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelEditorStateCopyWith<_LabelEditorState> get copyWith => __$LabelEditorStateCopyWithImpl<_LabelEditorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabelEditorState&&(identical(other.status, status) || other.status == status)&&(identical(other.original, original) || other.original == original)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorKey, colorKey) || other.colorKey == colorKey)&&(identical(other.iconKey, iconKey) || other.iconKey == iconKey)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.categories, _categories)&&(identical(other.usage, usage) || other.usage == usage)&&(identical(other.nameProblem, nameProblem) || other.nameProblem == nameProblem)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,original,name,colorKey,iconKey,categoryId,const DeepCollectionEquality().hash(_categories),usage,nameProblem,failure);
}

@override
String toString() {
    return 'LabelEditorState(status: $status, original: $original, name: $name, colorKey: $colorKey, iconKey: $iconKey, categoryId: $categoryId, categories: $categories, usage: $usage, nameProblem: $nameProblem, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$LabelEditorStateCopyWith<$Res> implements $LabelEditorStateCopyWith<$Res> {
  factory _$LabelEditorStateCopyWith(_LabelEditorState value, $Res Function(_LabelEditorState) _then) = __$LabelEditorStateCopyWithImpl;
@override @useResult
$Res call({
 EditorStatus status, Label? original, String name, String? colorKey, String? iconKey, String? categoryId, List<Category> categories, LabelUsage? usage, NameProblem? nameProblem, Failure? failure
});


@override $LabelCopyWith<$Res>? get original;@override $LabelUsageCopyWith<$Res>? get usage;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$LabelEditorStateCopyWithImpl<$Res>
    implements _$LabelEditorStateCopyWith<$Res> {
  __$LabelEditorStateCopyWithImpl(this._self, this._then);

  final _LabelEditorState _self;
  final $Res Function(_LabelEditorState) _then;

/// Create a copy of LabelEditorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? original = freezed,Object? name = null,Object? colorKey = freezed,Object? iconKey = freezed,Object? categoryId = freezed,Object? categories = null,Object? usage = freezed,Object? nameProblem = freezed,Object? failure = freezed,}) {
  return _then(_LabelEditorState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditorStatus,original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Label?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorKey: freezed == colorKey ? _self.colorKey : colorKey // ignore: cast_nullable_to_non_nullable
as String?,iconKey: freezed == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as LabelUsage?,nameProblem: freezed == nameProblem ? _self.nameProblem : nameProblem // ignore: cast_nullable_to_non_nullable
as NameProblem?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of LabelEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $LabelCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of LabelEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelUsageCopyWith<$Res>? get usage {
    if (_self.usage == null) {
    return null;
  }

  return $LabelUsageCopyWith<$Res>(_self.usage!, (value) {
    return _then(_self.copyWith(usage: value));
  });
}/// Create a copy of LabelEditorState
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
