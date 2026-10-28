// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExportResult {

 String get fileName; int get recordCount;/// False when the user closed the share sheet or the save dialog.
 bool get completed;
/// Create a copy of ExportResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExportResultCopyWith<ExportResult> get copyWith => _$ExportResultCopyWithImpl<ExportResult>(this as ExportResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ExportResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportResult&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.recordCount, _this.recordCount) || other.recordCount == _this.recordCount)&&(identical(other.completed, _this.completed) || other.completed == _this.completed));
}


@override
int get hashCode {
  final _this = this as ExportResult;
  return Object.hash(runtimeType,_this.fileName,_this.recordCount,_this.completed);
}

@override
String toString() {
  final _this = this as ExportResult;
  return 'ExportResult(fileName: ${_this.fileName}, recordCount: ${_this.recordCount}, completed: ${_this.completed})';
}


}

/// @nodoc
abstract mixin class $ExportResultCopyWith<$Res>  {
  factory $ExportResultCopyWith(ExportResult value, $Res Function(ExportResult) _then) = _$ExportResultCopyWithImpl;
@useResult
$Res call({
 String fileName, int recordCount, bool completed
});




}
/// @nodoc
class _$ExportResultCopyWithImpl<$Res>
    implements $ExportResultCopyWith<$Res> {
  _$ExportResultCopyWithImpl(this._self, this._then);

  final ExportResult _self;
  final $Res Function(ExportResult) _then;

/// Create a copy of ExportResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? recordCount = null,Object? completed = null,}) {
  return _then(ExportResult(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,recordCount: null == recordCount ? _self.recordCount : recordCount // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExportResult].
extension ExportResultPatterns on ExportResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExportResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExportResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExportResult value)  $default,){
final _that = this;
switch (_that) {
case _ExportResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExportResult value)?  $default,){
final _that = this;
switch (_that) {
case _ExportResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileName,  int recordCount,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExportResult() when $default != null:
return $default(_that.fileName,_that.recordCount,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileName,  int recordCount,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _ExportResult():
return $default(_that.fileName,_that.recordCount,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileName,  int recordCount,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _ExportResult() when $default != null:
return $default(_that.fileName,_that.recordCount,_that.completed);case _:
  return null;

}
}

}

/// @nodoc


class _ExportResult implements ExportResult {
  const _ExportResult({required this.fileName, required this.recordCount, required this.completed});
  

@override final  String fileName;
@override final  int recordCount;
/// False when the user closed the share sheet or the save dialog.
@override final  bool completed;

/// Create a copy of ExportResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportResultCopyWith<_ExportResult> get copyWith => __$ExportResultCopyWithImpl<_ExportResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportResult&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.recordCount, recordCount) || other.recordCount == recordCount)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fileName,recordCount,completed);
}

@override
String toString() {
    return 'ExportResult(fileName: $fileName, recordCount: $recordCount, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$ExportResultCopyWith<$Res> implements $ExportResultCopyWith<$Res> {
  factory _$ExportResultCopyWith(_ExportResult value, $Res Function(_ExportResult) _then) = __$ExportResultCopyWithImpl;
@override @useResult
$Res call({
 String fileName, int recordCount, bool completed
});




}
/// @nodoc
class __$ExportResultCopyWithImpl<$Res>
    implements _$ExportResultCopyWith<$Res> {
  __$ExportResultCopyWithImpl(this._self, this._then);

  final _ExportResult _self;
  final $Res Function(_ExportResult) _then;

/// Create a copy of ExportResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? recordCount = null,Object? completed = null,}) {
  return _then(_ExportResult(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,recordCount: null == recordCount ? _self.recordCount : recordCount // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ImportSource {

 String get path;/// The name the user knows the file by.
 String get fileName;/// A picked file's temporary copy: deleted once it has been read.
 bool get isTemporaryCopy;/// Restoring a safety backup is always a Replace (plan §10.8).
 bool get replaceOnly;
/// Create a copy of ImportSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportSourceCopyWith<ImportSource> get copyWith => _$ImportSourceCopyWithImpl<ImportSource>(this as ImportSource, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportSource;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportSource&&(identical(other.path, _this.path) || other.path == _this.path)&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.isTemporaryCopy, _this.isTemporaryCopy) || other.isTemporaryCopy == _this.isTemporaryCopy)&&(identical(other.replaceOnly, _this.replaceOnly) || other.replaceOnly == _this.replaceOnly));
}


@override
int get hashCode {
  final _this = this as ImportSource;
  return Object.hash(runtimeType,_this.path,_this.fileName,_this.isTemporaryCopy,_this.replaceOnly);
}

@override
String toString() {
  final _this = this as ImportSource;
  return 'ImportSource(path: ${_this.path}, fileName: ${_this.fileName}, isTemporaryCopy: ${_this.isTemporaryCopy}, replaceOnly: ${_this.replaceOnly})';
}


}

/// @nodoc
abstract mixin class $ImportSourceCopyWith<$Res>  {
  factory $ImportSourceCopyWith(ImportSource value, $Res Function(ImportSource) _then) = _$ImportSourceCopyWithImpl;
@useResult
$Res call({
 String path, String fileName, bool isTemporaryCopy, bool replaceOnly
});




}
/// @nodoc
class _$ImportSourceCopyWithImpl<$Res>
    implements $ImportSourceCopyWith<$Res> {
  _$ImportSourceCopyWithImpl(this._self, this._then);

  final ImportSource _self;
  final $Res Function(ImportSource) _then;

/// Create a copy of ImportSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? fileName = null,Object? isTemporaryCopy = null,Object? replaceOnly = null,}) {
  return _then(ImportSource(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,isTemporaryCopy: null == isTemporaryCopy ? _self.isTemporaryCopy : isTemporaryCopy // ignore: cast_nullable_to_non_nullable
as bool,replaceOnly: null == replaceOnly ? _self.replaceOnly : replaceOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportSource].
extension ImportSourcePatterns on ImportSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportSource value)  $default,){
final _that = this;
switch (_that) {
case _ImportSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportSource value)?  $default,){
final _that = this;
switch (_that) {
case _ImportSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String fileName,  bool isTemporaryCopy,  bool replaceOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportSource() when $default != null:
return $default(_that.path,_that.fileName,_that.isTemporaryCopy,_that.replaceOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String fileName,  bool isTemporaryCopy,  bool replaceOnly)  $default,) {final _that = this;
switch (_that) {
case _ImportSource():
return $default(_that.path,_that.fileName,_that.isTemporaryCopy,_that.replaceOnly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String fileName,  bool isTemporaryCopy,  bool replaceOnly)?  $default,) {final _that = this;
switch (_that) {
case _ImportSource() when $default != null:
return $default(_that.path,_that.fileName,_that.isTemporaryCopy,_that.replaceOnly);case _:
  return null;

}
}

}

/// @nodoc


class _ImportSource implements ImportSource {
  const _ImportSource({required this.path, required this.fileName, this.isTemporaryCopy = false, this.replaceOnly = false});
  

@override final  String path;
/// The name the user knows the file by.
@override final  String fileName;
/// A picked file's temporary copy: deleted once it has been read.
@override@JsonKey() final  bool isTemporaryCopy;
/// Restoring a safety backup is always a Replace (plan §10.8).
@override@JsonKey() final  bool replaceOnly;

/// Create a copy of ImportSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportSourceCopyWith<_ImportSource> get copyWith => __$ImportSourceCopyWithImpl<_ImportSource>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportSource&&(identical(other.path, path) || other.path == path)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.isTemporaryCopy, isTemporaryCopy) || other.isTemporaryCopy == isTemporaryCopy)&&(identical(other.replaceOnly, replaceOnly) || other.replaceOnly == replaceOnly));
}


@override
int get hashCode {
    return Object.hash(runtimeType,path,fileName,isTemporaryCopy,replaceOnly);
}

@override
String toString() {
    return 'ImportSource(path: $path, fileName: $fileName, isTemporaryCopy: $isTemporaryCopy, replaceOnly: $replaceOnly)';
}


}

/// @nodoc
abstract mixin class _$ImportSourceCopyWith<$Res> implements $ImportSourceCopyWith<$Res> {
  factory _$ImportSourceCopyWith(_ImportSource value, $Res Function(_ImportSource) _then) = __$ImportSourceCopyWithImpl;
@override @useResult
$Res call({
 String path, String fileName, bool isTemporaryCopy, bool replaceOnly
});




}
/// @nodoc
class __$ImportSourceCopyWithImpl<$Res>
    implements _$ImportSourceCopyWith<$Res> {
  __$ImportSourceCopyWithImpl(this._self, this._then);

  final _ImportSource _self;
  final $Res Function(_ImportSource) _then;

/// Create a copy of ImportSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? fileName = null,Object? isTemporaryCopy = null,Object? replaceOnly = null,}) {
  return _then(_ImportSource(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,isTemporaryCopy: null == isTemporaryCopy ? _self.isTemporaryCopy : isTemporaryCopy // ignore: cast_nullable_to_non_nullable
as bool,replaceOnly: null == replaceOnly ? _self.replaceOnly : replaceOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
