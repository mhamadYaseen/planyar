// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'erase_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EraseEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EraseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EraseEvent()';
}


}

/// @nodoc
class $EraseEventCopyWith<$Res>  {
$EraseEventCopyWith(EraseEvent _, $Res Function(EraseEvent) __);
}


/// Adds pattern-matching-related methods to [EraseEvent].
extension EraseEventPatterns on EraseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TextChanged value)?  textChanged,TResult Function( _ExportPressed value)?  exportPressed,TResult Function( _ErasePressed value)?  erasePressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextChanged() when textChanged != null:
return textChanged(_that);case _ExportPressed() when exportPressed != null:
return exportPressed(_that);case _ErasePressed() when erasePressed != null:
return erasePressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TextChanged value)  textChanged,required TResult Function( _ExportPressed value)  exportPressed,required TResult Function( _ErasePressed value)  erasePressed,}){
final _that = this;
switch (_that) {
case _TextChanged():
return textChanged(_that);case _ExportPressed():
return exportPressed(_that);case _ErasePressed():
return erasePressed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TextChanged value)?  textChanged,TResult? Function( _ExportPressed value)?  exportPressed,TResult? Function( _ErasePressed value)?  erasePressed,}){
final _that = this;
switch (_that) {
case _TextChanged() when textChanged != null:
return textChanged(_that);case _ExportPressed() when exportPressed != null:
return exportPressed(_that);case _ErasePressed() when erasePressed != null:
return erasePressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  textChanged,TResult Function( ShareAnchor? anchor)?  exportPressed,TResult Function()?  erasePressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextChanged() when textChanged != null:
return textChanged(_that.text);case _ExportPressed() when exportPressed != null:
return exportPressed(_that.anchor);case _ErasePressed() when erasePressed != null:
return erasePressed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  textChanged,required TResult Function( ShareAnchor? anchor)  exportPressed,required TResult Function()  erasePressed,}) {final _that = this;
switch (_that) {
case _TextChanged():
return textChanged(_that.text);case _ExportPressed():
return exportPressed(_that.anchor);case _ErasePressed():
return erasePressed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  textChanged,TResult? Function( ShareAnchor? anchor)?  exportPressed,TResult? Function()?  erasePressed,}) {final _that = this;
switch (_that) {
case _TextChanged() when textChanged != null:
return textChanged(_that.text);case _ExportPressed() when exportPressed != null:
return exportPressed(_that.anchor);case _ErasePressed() when erasePressed != null:
return erasePressed();case _:
  return null;

}
}

}

/// @nodoc


class _TextChanged implements EraseEvent {
  const _TextChanged(this.text);
  

 final  String text;

/// Create a copy of EraseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextChangedCopyWith<_TextChanged> get copyWith => __$TextChangedCopyWithImpl<_TextChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextChanged&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'EraseEvent.textChanged(text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextChangedCopyWith<$Res> implements $EraseEventCopyWith<$Res> {
  factory _$TextChangedCopyWith(_TextChanged value, $Res Function(_TextChanged) _then) = __$TextChangedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class __$TextChangedCopyWithImpl<$Res>
    implements _$TextChangedCopyWith<$Res> {
  __$TextChangedCopyWithImpl(this._self, this._then);

  final _TextChanged _self;
  final $Res Function(_TextChanged) _then;

/// Create a copy of EraseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_TextChanged(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ExportPressed implements EraseEvent {
  const _ExportPressed({this.anchor});
  

 final  ShareAnchor? anchor;

/// Create a copy of EraseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportPressedCopyWith<_ExportPressed> get copyWith => __$ExportPressedCopyWithImpl<_ExportPressed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportPressed&&(identical(other.anchor, anchor) || other.anchor == anchor));
}


@override
int get hashCode {
    return Object.hash(runtimeType,anchor);
}

@override
String toString() {
    return 'EraseEvent.exportPressed(anchor: $anchor)';
}


}

/// @nodoc
abstract mixin class _$ExportPressedCopyWith<$Res> implements $EraseEventCopyWith<$Res> {
  factory _$ExportPressedCopyWith(_ExportPressed value, $Res Function(_ExportPressed) _then) = __$ExportPressedCopyWithImpl;
@useResult
$Res call({
 ShareAnchor? anchor
});




}
/// @nodoc
class __$ExportPressedCopyWithImpl<$Res>
    implements _$ExportPressedCopyWith<$Res> {
  __$ExportPressedCopyWithImpl(this._self, this._then);

  final _ExportPressed _self;
  final $Res Function(_ExportPressed) _then;

/// Create a copy of EraseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? anchor = freezed,}) {
  return _then(_ExportPressed(
anchor: freezed == anchor ? _self.anchor : anchor // ignore: cast_nullable_to_non_nullable
as ShareAnchor?,
  ));
}


}

/// @nodoc


class _ErasePressed implements EraseEvent {
  const _ErasePressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErasePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EraseEvent.erasePressed()';
}


}




/// @nodoc
mixin _$EraseState {

 String get text; DataState<ExportResult> get export;/// Success holds the safety backup (null on an empty device).
 DataState<SafetyBackup?> get erase;
/// Create a copy of EraseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EraseStateCopyWith<EraseState> get copyWith => _$EraseStateCopyWithImpl<EraseState>(this as EraseState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EraseState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EraseState&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.export, _this.export) || other.export == _this.export)&&(identical(other.erase, _this.erase) || other.erase == _this.erase));
}


@override
int get hashCode {
  final _this = this as EraseState;
  return Object.hash(runtimeType,_this.text,_this.export,_this.erase);
}

@override
String toString() {
  final _this = this as EraseState;
  return 'EraseState(text: ${_this.text}, export: ${_this.export}, erase: ${_this.erase})';
}


}

/// @nodoc
abstract mixin class $EraseStateCopyWith<$Res>  {
  factory $EraseStateCopyWith(EraseState value, $Res Function(EraseState) _then) = _$EraseStateCopyWithImpl;
@useResult
$Res call({
 String text, DataState<ExportResult> export, DataState<SafetyBackup?> erase
});


$DataStateCopyWith<ExportResult, $Res> get export;$DataStateCopyWith<SafetyBackup?, $Res> get erase;

}
/// @nodoc
class _$EraseStateCopyWithImpl<$Res>
    implements $EraseStateCopyWith<$Res> {
  _$EraseStateCopyWithImpl(this._self, this._then);

  final EraseState _self;
  final $Res Function(EraseState) _then;

/// Create a copy of EraseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? export = null,Object? erase = null,}) {
  return _then(EraseState(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,export: null == export ? _self.export : export // ignore: cast_nullable_to_non_nullable
as DataState<ExportResult>,erase: null == erase ? _self.erase : erase // ignore: cast_nullable_to_non_nullable
as DataState<SafetyBackup?>,
  ));
}
/// Create a copy of EraseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<ExportResult, $Res> get export {
  
  return $DataStateCopyWith<ExportResult, $Res>(_self.export, (value) {
    return _then(_self.copyWith(export: value));
  });
}/// Create a copy of EraseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<SafetyBackup?, $Res> get erase {
  
  return $DataStateCopyWith<SafetyBackup?, $Res>(_self.erase, (value) {
    return _then(_self.copyWith(erase: value));
  });
}
}


/// Adds pattern-matching-related methods to [EraseState].
extension EraseStatePatterns on EraseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EraseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EraseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EraseState value)  $default,){
final _that = this;
switch (_that) {
case _EraseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EraseState value)?  $default,){
final _that = this;
switch (_that) {
case _EraseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  DataState<ExportResult> export,  DataState<SafetyBackup?> erase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EraseState() when $default != null:
return $default(_that.text,_that.export,_that.erase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  DataState<ExportResult> export,  DataState<SafetyBackup?> erase)  $default,) {final _that = this;
switch (_that) {
case _EraseState():
return $default(_that.text,_that.export,_that.erase);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  DataState<ExportResult> export,  DataState<SafetyBackup?> erase)?  $default,) {final _that = this;
switch (_that) {
case _EraseState() when $default != null:
return $default(_that.text,_that.export,_that.erase);case _:
  return null;

}
}

}

/// @nodoc


class _EraseState extends EraseState {
  const _EraseState({this.text = '', this.export = const DataState<ExportResult>.initial(), this.erase = const DataState<SafetyBackup?>.initial()}): super._();
  

@override@JsonKey() final  String text;
@override@JsonKey() final  DataState<ExportResult> export;
/// Success holds the safety backup (null on an empty device).
@override@JsonKey() final  DataState<SafetyBackup?> erase;

/// Create a copy of EraseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EraseStateCopyWith<_EraseState> get copyWith => __$EraseStateCopyWithImpl<_EraseState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EraseState&&(identical(other.text, text) || other.text == text)&&(identical(other.export, export) || other.export == export)&&(identical(other.erase, erase) || other.erase == erase));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text,export,erase);
}

@override
String toString() {
    return 'EraseState(text: $text, export: $export, erase: $erase)';
}


}

/// @nodoc
abstract mixin class _$EraseStateCopyWith<$Res> implements $EraseStateCopyWith<$Res> {
  factory _$EraseStateCopyWith(_EraseState value, $Res Function(_EraseState) _then) = __$EraseStateCopyWithImpl;
@override @useResult
$Res call({
 String text, DataState<ExportResult> export, DataState<SafetyBackup?> erase
});


@override $DataStateCopyWith<ExportResult, $Res> get export;@override $DataStateCopyWith<SafetyBackup?, $Res> get erase;

}
/// @nodoc
class __$EraseStateCopyWithImpl<$Res>
    implements _$EraseStateCopyWith<$Res> {
  __$EraseStateCopyWithImpl(this._self, this._then);

  final _EraseState _self;
  final $Res Function(_EraseState) _then;

/// Create a copy of EraseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? export = null,Object? erase = null,}) {
  return _then(_EraseState(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,export: null == export ? _self.export : export // ignore: cast_nullable_to_non_nullable
as DataState<ExportResult>,erase: null == erase ? _self.erase : erase // ignore: cast_nullable_to_non_nullable
as DataState<SafetyBackup?>,
  ));
}

/// Create a copy of EraseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<ExportResult, $Res> get export {
  
  return $DataStateCopyWith<ExportResult, $Res>(_self.export, (value) {
    return _then(_self.copyWith(export: value));
  });
}/// Create a copy of EraseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<SafetyBackup?, $Res> get erase {
  
  return $DataStateCopyWith<SafetyBackup?, $Res>(_self.erase, (value) {
    return _then(_self.copyWith(erase: value));
  });
}
}

// dart format on
