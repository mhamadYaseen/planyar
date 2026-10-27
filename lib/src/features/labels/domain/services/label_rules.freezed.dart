// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'label_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateOption {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOption);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CreateOption()';
}


}

/// @nodoc
class $CreateOptionCopyWith<$Res>  {
$CreateOptionCopyWith(CreateOption _, $Res Function(CreateOption) __);
}


/// Adds pattern-matching-related methods to [CreateOption].
extension CreateOptionPatterns on CreateOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoCreateOption value)?  none,TResult Function( CreateNewLabel value)?  create,TResult Function( RestoreArchivedLabel value)?  restore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoCreateOption() when none != null:
return none(_that);case CreateNewLabel() when create != null:
return create(_that);case RestoreArchivedLabel() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoCreateOption value)  none,required TResult Function( CreateNewLabel value)  create,required TResult Function( RestoreArchivedLabel value)  restore,}){
final _that = this;
switch (_that) {
case NoCreateOption():
return none(_that);case CreateNewLabel():
return create(_that);case RestoreArchivedLabel():
return restore(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoCreateOption value)?  none,TResult? Function( CreateNewLabel value)?  create,TResult? Function( RestoreArchivedLabel value)?  restore,}){
final _that = this;
switch (_that) {
case NoCreateOption() when none != null:
return none(_that);case CreateNewLabel() when create != null:
return create(_that);case RestoreArchivedLabel() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( String name)?  create,TResult Function( Label label)?  restore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoCreateOption() when none != null:
return none();case CreateNewLabel() when create != null:
return create(_that.name);case RestoreArchivedLabel() when restore != null:
return restore(_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( String name)  create,required TResult Function( Label label)  restore,}) {final _that = this;
switch (_that) {
case NoCreateOption():
return none();case CreateNewLabel():
return create(_that.name);case RestoreArchivedLabel():
return restore(_that.label);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( String name)?  create,TResult? Function( Label label)?  restore,}) {final _that = this;
switch (_that) {
case NoCreateOption() when none != null:
return none();case CreateNewLabel() when create != null:
return create(_that.name);case RestoreArchivedLabel() when restore != null:
return restore(_that.label);case _:
  return null;

}
}

}

/// @nodoc


class NoCreateOption implements CreateOption {
  const NoCreateOption();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NoCreateOption);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CreateOption.none()';
}


}




/// @nodoc


class CreateNewLabel implements CreateOption {
  const CreateNewLabel(this.name);
  

 final  String name;

/// Create a copy of CreateOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNewLabelCopyWith<CreateNewLabel> get copyWith => _$CreateNewLabelCopyWithImpl<CreateNewLabel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewLabel&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name);
}

@override
String toString() {
    return 'CreateOption.create(name: $name)';
}


}

/// @nodoc
abstract mixin class $CreateNewLabelCopyWith<$Res> implements $CreateOptionCopyWith<$Res> {
  factory $CreateNewLabelCopyWith(CreateNewLabel value, $Res Function(CreateNewLabel) _then) = _$CreateNewLabelCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$CreateNewLabelCopyWithImpl<$Res>
    implements $CreateNewLabelCopyWith<$Res> {
  _$CreateNewLabelCopyWithImpl(this._self, this._then);

  final CreateNewLabel _self;
  final $Res Function(CreateNewLabel) _then;

/// Create a copy of CreateOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(CreateNewLabel(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RestoreArchivedLabel implements CreateOption {
  const RestoreArchivedLabel(this.label);
  

 final  Label label;

/// Create a copy of CreateOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestoreArchivedLabelCopyWith<RestoreArchivedLabel> get copyWith => _$RestoreArchivedLabelCopyWithImpl<RestoreArchivedLabel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RestoreArchivedLabel&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label);
}

@override
String toString() {
    return 'CreateOption.restore(label: $label)';
}


}

/// @nodoc
abstract mixin class $RestoreArchivedLabelCopyWith<$Res> implements $CreateOptionCopyWith<$Res> {
  factory $RestoreArchivedLabelCopyWith(RestoreArchivedLabel value, $Res Function(RestoreArchivedLabel) _then) = _$RestoreArchivedLabelCopyWithImpl;
@useResult
$Res call({
 Label label
});


$LabelCopyWith<$Res> get label;

}
/// @nodoc
class _$RestoreArchivedLabelCopyWithImpl<$Res>
    implements $RestoreArchivedLabelCopyWith<$Res> {
  _$RestoreArchivedLabelCopyWithImpl(this._self, this._then);

  final RestoreArchivedLabel _self;
  final $Res Function(RestoreArchivedLabel) _then;

/// Create a copy of CreateOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,}) {
  return _then(RestoreArchivedLabel(
null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Label,
  ));
}

/// Create a copy of CreateOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelCopyWith<$Res> get label {
  
  return $LabelCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}

// dart format on
