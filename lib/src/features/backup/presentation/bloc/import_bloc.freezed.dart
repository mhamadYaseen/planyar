// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ImportEvent()';
}


}

/// @nodoc
class $ImportEventCopyWith<$Res>  {
$ImportEventCopyWith(ImportEvent _, $Res Function(ImportEvent) __);
}


/// Adds pattern-matching-related methods to [ImportEvent].
extension ImportEventPatterns on ImportEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ModeChanged value)?  modeChanged,TResult Function( _ImportSettingsChanged value)?  importSettingsChanged,TResult Function( _SkipInvalidChanged value)?  skipInvalidChanged,TResult Function( _Confirmed value)?  confirmed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ModeChanged() when modeChanged != null:
return modeChanged(_that);case _ImportSettingsChanged() when importSettingsChanged != null:
return importSettingsChanged(_that);case _SkipInvalidChanged() when skipInvalidChanged != null:
return skipInvalidChanged(_that);case _Confirmed() when confirmed != null:
return confirmed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ModeChanged value)  modeChanged,required TResult Function( _ImportSettingsChanged value)  importSettingsChanged,required TResult Function( _SkipInvalidChanged value)  skipInvalidChanged,required TResult Function( _Confirmed value)  confirmed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ModeChanged():
return modeChanged(_that);case _ImportSettingsChanged():
return importSettingsChanged(_that);case _SkipInvalidChanged():
return skipInvalidChanged(_that);case _Confirmed():
return confirmed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ModeChanged value)?  modeChanged,TResult? Function( _ImportSettingsChanged value)?  importSettingsChanged,TResult? Function( _SkipInvalidChanged value)?  skipInvalidChanged,TResult? Function( _Confirmed value)?  confirmed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ModeChanged() when modeChanged != null:
return modeChanged(_that);case _ImportSettingsChanged() when importSettingsChanged != null:
return importSettingsChanged(_that);case _SkipInvalidChanged() when skipInvalidChanged != null:
return skipInvalidChanged(_that);case _Confirmed() when confirmed != null:
return confirmed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ImportSource source)?  started,TResult Function( ImportMode mode)?  modeChanged,TResult Function( bool value)?  importSettingsChanged,TResult Function( bool value)?  skipInvalidChanged,TResult Function()?  confirmed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.source);case _ModeChanged() when modeChanged != null:
return modeChanged(_that.mode);case _ImportSettingsChanged() when importSettingsChanged != null:
return importSettingsChanged(_that.value);case _SkipInvalidChanged() when skipInvalidChanged != null:
return skipInvalidChanged(_that.value);case _Confirmed() when confirmed != null:
return confirmed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ImportSource source)  started,required TResult Function( ImportMode mode)  modeChanged,required TResult Function( bool value)  importSettingsChanged,required TResult Function( bool value)  skipInvalidChanged,required TResult Function()  confirmed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.source);case _ModeChanged():
return modeChanged(_that.mode);case _ImportSettingsChanged():
return importSettingsChanged(_that.value);case _SkipInvalidChanged():
return skipInvalidChanged(_that.value);case _Confirmed():
return confirmed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ImportSource source)?  started,TResult? Function( ImportMode mode)?  modeChanged,TResult? Function( bool value)?  importSettingsChanged,TResult? Function( bool value)?  skipInvalidChanged,TResult? Function()?  confirmed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.source);case _ModeChanged() when modeChanged != null:
return modeChanged(_that.mode);case _ImportSettingsChanged() when importSettingsChanged != null:
return importSettingsChanged(_that.value);case _SkipInvalidChanged() when skipInvalidChanged != null:
return skipInvalidChanged(_that.value);case _Confirmed() when confirmed != null:
return confirmed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ImportEvent {
  const _Started(this.source);
  

 final  ImportSource source;

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,source);
}

@override
String toString() {
    return 'ImportEvent.started(source: $source)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $ImportEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 ImportSource source
});


$ImportSourceCopyWith<$Res> get source;

}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,}) {
  return _then(_Started(
null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ImportSource,
  ));
}

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSourceCopyWith<$Res> get source {
  
  return $ImportSourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

/// @nodoc


class _ModeChanged implements ImportEvent {
  const _ModeChanged(this.mode);
  

 final  ImportMode mode;

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModeChangedCopyWith<_ModeChanged> get copyWith => __$ModeChangedCopyWithImpl<_ModeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModeChanged&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode);
}

@override
String toString() {
    return 'ImportEvent.modeChanged(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$ModeChangedCopyWith<$Res> implements $ImportEventCopyWith<$Res> {
  factory _$ModeChangedCopyWith(_ModeChanged value, $Res Function(_ModeChanged) _then) = __$ModeChangedCopyWithImpl;
@useResult
$Res call({
 ImportMode mode
});




}
/// @nodoc
class __$ModeChangedCopyWithImpl<$Res>
    implements _$ModeChangedCopyWith<$Res> {
  __$ModeChangedCopyWithImpl(this._self, this._then);

  final _ModeChanged _self;
  final $Res Function(_ModeChanged) _then;

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_ModeChanged(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ImportMode,
  ));
}


}

/// @nodoc


class _ImportSettingsChanged implements ImportEvent {
  const _ImportSettingsChanged(this.value);
  

 final  bool value;

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportSettingsChangedCopyWith<_ImportSettingsChanged> get copyWith => __$ImportSettingsChangedCopyWithImpl<_ImportSettingsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportSettingsChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode {
    return Object.hash(runtimeType,value);
}

@override
String toString() {
    return 'ImportEvent.importSettingsChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$ImportSettingsChangedCopyWith<$Res> implements $ImportEventCopyWith<$Res> {
  factory _$ImportSettingsChangedCopyWith(_ImportSettingsChanged value, $Res Function(_ImportSettingsChanged) _then) = __$ImportSettingsChangedCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class __$ImportSettingsChangedCopyWithImpl<$Res>
    implements _$ImportSettingsChangedCopyWith<$Res> {
  __$ImportSettingsChangedCopyWithImpl(this._self, this._then);

  final _ImportSettingsChanged _self;
  final $Res Function(_ImportSettingsChanged) _then;

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_ImportSettingsChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SkipInvalidChanged implements ImportEvent {
  const _SkipInvalidChanged(this.value);
  

 final  bool value;

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkipInvalidChangedCopyWith<_SkipInvalidChanged> get copyWith => __$SkipInvalidChangedCopyWithImpl<_SkipInvalidChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkipInvalidChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode {
    return Object.hash(runtimeType,value);
}

@override
String toString() {
    return 'ImportEvent.skipInvalidChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SkipInvalidChangedCopyWith<$Res> implements $ImportEventCopyWith<$Res> {
  factory _$SkipInvalidChangedCopyWith(_SkipInvalidChanged value, $Res Function(_SkipInvalidChanged) _then) = __$SkipInvalidChangedCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class __$SkipInvalidChangedCopyWithImpl<$Res>
    implements _$SkipInvalidChangedCopyWith<$Res> {
  __$SkipInvalidChangedCopyWithImpl(this._self, this._then);

  final _SkipInvalidChanged _self;
  final $Res Function(_SkipInvalidChanged) _then;

/// Create a copy of ImportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_SkipInvalidChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Confirmed implements ImportEvent {
  const _Confirmed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Confirmed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ImportEvent.confirmed()';
}


}




/// @nodoc
mixin _$ImportState {

 ImportSource? get source; DataState<ImportPreview> get preview; ImportMode get mode; bool get importSettings; bool get skipInvalid;/// Loading while the import runs; then the result (S24) or the failure.
 DataState<ImportResult> get result;
/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportStateCopyWith<ImportState> get copyWith => _$ImportStateCopyWithImpl<ImportState>(this as ImportState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportState&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.preview, _this.preview) || other.preview == _this.preview)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.importSettings, _this.importSettings) || other.importSettings == _this.importSettings)&&(identical(other.skipInvalid, _this.skipInvalid) || other.skipInvalid == _this.skipInvalid)&&(identical(other.result, _this.result) || other.result == _this.result));
}


@override
int get hashCode {
  final _this = this as ImportState;
  return Object.hash(runtimeType,_this.source,_this.preview,_this.mode,_this.importSettings,_this.skipInvalid,_this.result);
}

@override
String toString() {
  final _this = this as ImportState;
  return 'ImportState(source: ${_this.source}, preview: ${_this.preview}, mode: ${_this.mode}, importSettings: ${_this.importSettings}, skipInvalid: ${_this.skipInvalid}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $ImportStateCopyWith<$Res>  {
  factory $ImportStateCopyWith(ImportState value, $Res Function(ImportState) _then) = _$ImportStateCopyWithImpl;
@useResult
$Res call({
 ImportSource? source, DataState<ImportPreview> preview, ImportMode mode, bool importSettings, bool skipInvalid, DataState<ImportResult> result
});


$ImportSourceCopyWith<$Res>? get source;$DataStateCopyWith<ImportPreview, $Res> get preview;$DataStateCopyWith<ImportResult, $Res> get result;

}
/// @nodoc
class _$ImportStateCopyWithImpl<$Res>
    implements $ImportStateCopyWith<$Res> {
  _$ImportStateCopyWithImpl(this._self, this._then);

  final ImportState _self;
  final $Res Function(ImportState) _then;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = freezed,Object? preview = null,Object? mode = null,Object? importSettings = null,Object? skipInvalid = null,Object? result = null,}) {
  return _then(ImportState(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ImportSource?,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as DataState<ImportPreview>,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ImportMode,importSettings: null == importSettings ? _self.importSettings : importSettings // ignore: cast_nullable_to_non_nullable
as bool,skipInvalid: null == skipInvalid ? _self.skipInvalid : skipInvalid // ignore: cast_nullable_to_non_nullable
as bool,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DataState<ImportResult>,
  ));
}
/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $ImportSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<ImportPreview, $Res> get preview {
  
  return $DataStateCopyWith<ImportPreview, $Res>(_self.preview, (value) {
    return _then(_self.copyWith(preview: value));
  });
}/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<ImportResult, $Res> get result {
  
  return $DataStateCopyWith<ImportResult, $Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [ImportState].
extension ImportStatePatterns on ImportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportState value)  $default,){
final _that = this;
switch (_that) {
case _ImportState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportState value)?  $default,){
final _that = this;
switch (_that) {
case _ImportState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImportSource? source,  DataState<ImportPreview> preview,  ImportMode mode,  bool importSettings,  bool skipInvalid,  DataState<ImportResult> result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportState() when $default != null:
return $default(_that.source,_that.preview,_that.mode,_that.importSettings,_that.skipInvalid,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImportSource? source,  DataState<ImportPreview> preview,  ImportMode mode,  bool importSettings,  bool skipInvalid,  DataState<ImportResult> result)  $default,) {final _that = this;
switch (_that) {
case _ImportState():
return $default(_that.source,_that.preview,_that.mode,_that.importSettings,_that.skipInvalid,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImportSource? source,  DataState<ImportPreview> preview,  ImportMode mode,  bool importSettings,  bool skipInvalid,  DataState<ImportResult> result)?  $default,) {final _that = this;
switch (_that) {
case _ImportState() when $default != null:
return $default(_that.source,_that.preview,_that.mode,_that.importSettings,_that.skipInvalid,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _ImportState extends ImportState {
  const _ImportState({this.source, this.preview = const DataState<ImportPreview>.initial(), this.mode = ImportMode.merge, this.importSettings = false, this.skipInvalid = false, this.result = const DataState<ImportResult>.initial()}): super._();
  

@override final  ImportSource? source;
@override@JsonKey() final  DataState<ImportPreview> preview;
@override@JsonKey() final  ImportMode mode;
@override@JsonKey() final  bool importSettings;
@override@JsonKey() final  bool skipInvalid;
/// Loading while the import runs; then the result (S24) or the failure.
@override@JsonKey() final  DataState<ImportResult> result;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportStateCopyWith<_ImportState> get copyWith => __$ImportStateCopyWithImpl<_ImportState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportState&&(identical(other.source, source) || other.source == source)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.importSettings, importSettings) || other.importSettings == importSettings)&&(identical(other.skipInvalid, skipInvalid) || other.skipInvalid == skipInvalid)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,source,preview,mode,importSettings,skipInvalid,result);
}

@override
String toString() {
    return 'ImportState(source: $source, preview: $preview, mode: $mode, importSettings: $importSettings, skipInvalid: $skipInvalid, result: $result)';
}


}

/// @nodoc
abstract mixin class _$ImportStateCopyWith<$Res> implements $ImportStateCopyWith<$Res> {
  factory _$ImportStateCopyWith(_ImportState value, $Res Function(_ImportState) _then) = __$ImportStateCopyWithImpl;
@override @useResult
$Res call({
 ImportSource? source, DataState<ImportPreview> preview, ImportMode mode, bool importSettings, bool skipInvalid, DataState<ImportResult> result
});


@override $ImportSourceCopyWith<$Res>? get source;@override $DataStateCopyWith<ImportPreview, $Res> get preview;@override $DataStateCopyWith<ImportResult, $Res> get result;

}
/// @nodoc
class __$ImportStateCopyWithImpl<$Res>
    implements _$ImportStateCopyWith<$Res> {
  __$ImportStateCopyWithImpl(this._self, this._then);

  final _ImportState _self;
  final $Res Function(_ImportState) _then;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = freezed,Object? preview = null,Object? mode = null,Object? importSettings = null,Object? skipInvalid = null,Object? result = null,}) {
  return _then(_ImportState(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ImportSource?,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as DataState<ImportPreview>,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ImportMode,importSettings: null == importSettings ? _self.importSettings : importSettings // ignore: cast_nullable_to_non_nullable
as bool,skipInvalid: null == skipInvalid ? _self.skipInvalid : skipInvalid // ignore: cast_nullable_to_non_nullable
as bool,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DataState<ImportResult>,
  ));
}

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $ImportSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<ImportPreview, $Res> get preview {
  
  return $DataStateCopyWith<ImportPreview, $Res>(_self.preview, (value) {
    return _then(_self.copyWith(preview: value));
  });
}/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<ImportResult, $Res> get result {
  
  return $DataStateCopyWith<ImportResult, $Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
