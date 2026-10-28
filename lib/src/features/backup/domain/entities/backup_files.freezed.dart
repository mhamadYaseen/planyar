// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_files.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExportedBackup {

 String get path;/// e.g. `planyar-backup-2026-10-25-1730.zip` (local time).
 String get fileName; int get sizeBytes; int get recordCount;
/// Create a copy of ExportedBackup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExportedBackupCopyWith<ExportedBackup> get copyWith => _$ExportedBackupCopyWithImpl<ExportedBackup>(this as ExportedBackup, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ExportedBackup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportedBackup&&(identical(other.path, _this.path) || other.path == _this.path)&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.sizeBytes, _this.sizeBytes) || other.sizeBytes == _this.sizeBytes)&&(identical(other.recordCount, _this.recordCount) || other.recordCount == _this.recordCount));
}


@override
int get hashCode {
  final _this = this as ExportedBackup;
  return Object.hash(runtimeType,_this.path,_this.fileName,_this.sizeBytes,_this.recordCount);
}

@override
String toString() {
  final _this = this as ExportedBackup;
  return 'ExportedBackup(path: ${_this.path}, fileName: ${_this.fileName}, sizeBytes: ${_this.sizeBytes}, recordCount: ${_this.recordCount})';
}


}

/// @nodoc
abstract mixin class $ExportedBackupCopyWith<$Res>  {
  factory $ExportedBackupCopyWith(ExportedBackup value, $Res Function(ExportedBackup) _then) = _$ExportedBackupCopyWithImpl;
@useResult
$Res call({
 String path, String fileName, int sizeBytes, int recordCount
});




}
/// @nodoc
class _$ExportedBackupCopyWithImpl<$Res>
    implements $ExportedBackupCopyWith<$Res> {
  _$ExportedBackupCopyWithImpl(this._self, this._then);

  final ExportedBackup _self;
  final $Res Function(ExportedBackup) _then;

/// Create a copy of ExportedBackup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? fileName = null,Object? sizeBytes = null,Object? recordCount = null,}) {
  return _then(ExportedBackup(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,recordCount: null == recordCount ? _self.recordCount : recordCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExportedBackup].
extension ExportedBackupPatterns on ExportedBackup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExportedBackup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExportedBackup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExportedBackup value)  $default,){
final _that = this;
switch (_that) {
case _ExportedBackup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExportedBackup value)?  $default,){
final _that = this;
switch (_that) {
case _ExportedBackup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String fileName,  int sizeBytes,  int recordCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExportedBackup() when $default != null:
return $default(_that.path,_that.fileName,_that.sizeBytes,_that.recordCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String fileName,  int sizeBytes,  int recordCount)  $default,) {final _that = this;
switch (_that) {
case _ExportedBackup():
return $default(_that.path,_that.fileName,_that.sizeBytes,_that.recordCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String fileName,  int sizeBytes,  int recordCount)?  $default,) {final _that = this;
switch (_that) {
case _ExportedBackup() when $default != null:
return $default(_that.path,_that.fileName,_that.sizeBytes,_that.recordCount);case _:
  return null;

}
}

}

/// @nodoc


class _ExportedBackup implements ExportedBackup {
  const _ExportedBackup({required this.path, required this.fileName, required this.sizeBytes, required this.recordCount});
  

@override final  String path;
/// e.g. `planyar-backup-2026-10-25-1730.zip` (local time).
@override final  String fileName;
@override final  int sizeBytes;
@override final  int recordCount;

/// Create a copy of ExportedBackup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportedBackupCopyWith<_ExportedBackup> get copyWith => __$ExportedBackupCopyWithImpl<_ExportedBackup>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportedBackup&&(identical(other.path, path) || other.path == path)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.recordCount, recordCount) || other.recordCount == recordCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,path,fileName,sizeBytes,recordCount);
}

@override
String toString() {
    return 'ExportedBackup(path: $path, fileName: $fileName, sizeBytes: $sizeBytes, recordCount: $recordCount)';
}


}

/// @nodoc
abstract mixin class _$ExportedBackupCopyWith<$Res> implements $ExportedBackupCopyWith<$Res> {
  factory _$ExportedBackupCopyWith(_ExportedBackup value, $Res Function(_ExportedBackup) _then) = __$ExportedBackupCopyWithImpl;
@override @useResult
$Res call({
 String path, String fileName, int sizeBytes, int recordCount
});




}
/// @nodoc
class __$ExportedBackupCopyWithImpl<$Res>
    implements _$ExportedBackupCopyWith<$Res> {
  __$ExportedBackupCopyWithImpl(this._self, this._then);

  final _ExportedBackup _self;
  final $Res Function(_ExportedBackup) _then;

/// Create a copy of ExportedBackup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? fileName = null,Object? sizeBytes = null,Object? recordCount = null,}) {
  return _then(_ExportedBackup(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,recordCount: null == recordCount ? _self.recordCount : recordCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ReadBackup {

 String get fileName; int get sizeBytes; BackupManifest get manifest; ParsedBackup get parsed;
/// Create a copy of ReadBackup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadBackupCopyWith<ReadBackup> get copyWith => _$ReadBackupCopyWithImpl<ReadBackup>(this as ReadBackup, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReadBackup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadBackup&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.sizeBytes, _this.sizeBytes) || other.sizeBytes == _this.sizeBytes)&&(identical(other.manifest, _this.manifest) || other.manifest == _this.manifest)&&(identical(other.parsed, _this.parsed) || other.parsed == _this.parsed));
}


@override
int get hashCode {
  final _this = this as ReadBackup;
  return Object.hash(runtimeType,_this.fileName,_this.sizeBytes,_this.manifest,_this.parsed);
}

@override
String toString() {
  final _this = this as ReadBackup;
  return 'ReadBackup(fileName: ${_this.fileName}, sizeBytes: ${_this.sizeBytes}, manifest: ${_this.manifest}, parsed: ${_this.parsed})';
}


}

/// @nodoc
abstract mixin class $ReadBackupCopyWith<$Res>  {
  factory $ReadBackupCopyWith(ReadBackup value, $Res Function(ReadBackup) _then) = _$ReadBackupCopyWithImpl;
@useResult
$Res call({
 String fileName, int sizeBytes, BackupManifest manifest, ParsedBackup parsed
});


$BackupManifestCopyWith<$Res> get manifest;$ParsedBackupCopyWith<$Res> get parsed;

}
/// @nodoc
class _$ReadBackupCopyWithImpl<$Res>
    implements $ReadBackupCopyWith<$Res> {
  _$ReadBackupCopyWithImpl(this._self, this._then);

  final ReadBackup _self;
  final $Res Function(ReadBackup) _then;

/// Create a copy of ReadBackup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? sizeBytes = null,Object? manifest = null,Object? parsed = null,}) {
  return _then(ReadBackup(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,manifest: null == manifest ? _self.manifest : manifest // ignore: cast_nullable_to_non_nullable
as BackupManifest,parsed: null == parsed ? _self.parsed : parsed // ignore: cast_nullable_to_non_nullable
as ParsedBackup,
  ));
}
/// Create a copy of ReadBackup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupManifestCopyWith<$Res> get manifest {
  
  return $BackupManifestCopyWith<$Res>(_self.manifest, (value) {
    return _then(_self.copyWith(manifest: value));
  });
}/// Create a copy of ReadBackup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedBackupCopyWith<$Res> get parsed {
  
  return $ParsedBackupCopyWith<$Res>(_self.parsed, (value) {
    return _then(_self.copyWith(parsed: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReadBackup].
extension ReadBackupPatterns on ReadBackup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadBackup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadBackup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadBackup value)  $default,){
final _that = this;
switch (_that) {
case _ReadBackup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadBackup value)?  $default,){
final _that = this;
switch (_that) {
case _ReadBackup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileName,  int sizeBytes,  BackupManifest manifest,  ParsedBackup parsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadBackup() when $default != null:
return $default(_that.fileName,_that.sizeBytes,_that.manifest,_that.parsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileName,  int sizeBytes,  BackupManifest manifest,  ParsedBackup parsed)  $default,) {final _that = this;
switch (_that) {
case _ReadBackup():
return $default(_that.fileName,_that.sizeBytes,_that.manifest,_that.parsed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileName,  int sizeBytes,  BackupManifest manifest,  ParsedBackup parsed)?  $default,) {final _that = this;
switch (_that) {
case _ReadBackup() when $default != null:
return $default(_that.fileName,_that.sizeBytes,_that.manifest,_that.parsed);case _:
  return null;

}
}

}

/// @nodoc


class _ReadBackup implements ReadBackup {
  const _ReadBackup({required this.fileName, required this.sizeBytes, required this.manifest, required this.parsed});
  

@override final  String fileName;
@override final  int sizeBytes;
@override final  BackupManifest manifest;
@override final  ParsedBackup parsed;

/// Create a copy of ReadBackup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadBackupCopyWith<_ReadBackup> get copyWith => __$ReadBackupCopyWithImpl<_ReadBackup>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadBackup&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.manifest, manifest) || other.manifest == manifest)&&(identical(other.parsed, parsed) || other.parsed == parsed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fileName,sizeBytes,manifest,parsed);
}

@override
String toString() {
    return 'ReadBackup(fileName: $fileName, sizeBytes: $sizeBytes, manifest: $manifest, parsed: $parsed)';
}


}

/// @nodoc
abstract mixin class _$ReadBackupCopyWith<$Res> implements $ReadBackupCopyWith<$Res> {
  factory _$ReadBackupCopyWith(_ReadBackup value, $Res Function(_ReadBackup) _then) = __$ReadBackupCopyWithImpl;
@override @useResult
$Res call({
 String fileName, int sizeBytes, BackupManifest manifest, ParsedBackup parsed
});


@override $BackupManifestCopyWith<$Res> get manifest;@override $ParsedBackupCopyWith<$Res> get parsed;

}
/// @nodoc
class __$ReadBackupCopyWithImpl<$Res>
    implements _$ReadBackupCopyWith<$Res> {
  __$ReadBackupCopyWithImpl(this._self, this._then);

  final _ReadBackup _self;
  final $Res Function(_ReadBackup) _then;

/// Create a copy of ReadBackup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? sizeBytes = null,Object? manifest = null,Object? parsed = null,}) {
  return _then(_ReadBackup(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,manifest: null == manifest ? _self.manifest : manifest // ignore: cast_nullable_to_non_nullable
as BackupManifest,parsed: null == parsed ? _self.parsed : parsed // ignore: cast_nullable_to_non_nullable
as ParsedBackup,
  ));
}

/// Create a copy of ReadBackup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupManifestCopyWith<$Res> get manifest {
  
  return $BackupManifestCopyWith<$Res>(_self.manifest, (value) {
    return _then(_self.copyWith(manifest: value));
  });
}/// Create a copy of ReadBackup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedBackupCopyWith<$Res> get parsed {
  
  return $ParsedBackupCopyWith<$Res>(_self.parsed, (value) {
    return _then(_self.copyWith(parsed: value));
  });
}
}

/// @nodoc
mixin _$ImportPreview {

 ReadBackup get backup; ImportSummary get replace; ImportSummary get merge;/// Records on this device now (for "Replace deletes …").
 int get localRecordCount;
/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportPreviewCopyWith<ImportPreview> get copyWith => _$ImportPreviewCopyWithImpl<ImportPreview>(this as ImportPreview, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportPreview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportPreview&&(identical(other.backup, _this.backup) || other.backup == _this.backup)&&(identical(other.replace, _this.replace) || other.replace == _this.replace)&&(identical(other.merge, _this.merge) || other.merge == _this.merge)&&(identical(other.localRecordCount, _this.localRecordCount) || other.localRecordCount == _this.localRecordCount));
}


@override
int get hashCode {
  final _this = this as ImportPreview;
  return Object.hash(runtimeType,_this.backup,_this.replace,_this.merge,_this.localRecordCount);
}

@override
String toString() {
  final _this = this as ImportPreview;
  return 'ImportPreview(backup: ${_this.backup}, replace: ${_this.replace}, merge: ${_this.merge}, localRecordCount: ${_this.localRecordCount})';
}


}

/// @nodoc
abstract mixin class $ImportPreviewCopyWith<$Res>  {
  factory $ImportPreviewCopyWith(ImportPreview value, $Res Function(ImportPreview) _then) = _$ImportPreviewCopyWithImpl;
@useResult
$Res call({
 ReadBackup backup, ImportSummary replace, ImportSummary merge, int localRecordCount
});


$ReadBackupCopyWith<$Res> get backup;$ImportSummaryCopyWith<$Res> get replace;$ImportSummaryCopyWith<$Res> get merge;

}
/// @nodoc
class _$ImportPreviewCopyWithImpl<$Res>
    implements $ImportPreviewCopyWith<$Res> {
  _$ImportPreviewCopyWithImpl(this._self, this._then);

  final ImportPreview _self;
  final $Res Function(ImportPreview) _then;

/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backup = null,Object? replace = null,Object? merge = null,Object? localRecordCount = null,}) {
  return _then(ImportPreview(
backup: null == backup ? _self.backup : backup // ignore: cast_nullable_to_non_nullable
as ReadBackup,replace: null == replace ? _self.replace : replace // ignore: cast_nullable_to_non_nullable
as ImportSummary,merge: null == merge ? _self.merge : merge // ignore: cast_nullable_to_non_nullable
as ImportSummary,localRecordCount: null == localRecordCount ? _self.localRecordCount : localRecordCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReadBackupCopyWith<$Res> get backup {
  
  return $ReadBackupCopyWith<$Res>(_self.backup, (value) {
    return _then(_self.copyWith(backup: value));
  });
}/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<$Res> get replace {
  
  return $ImportSummaryCopyWith<$Res>(_self.replace, (value) {
    return _then(_self.copyWith(replace: value));
  });
}/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<$Res> get merge {
  
  return $ImportSummaryCopyWith<$Res>(_self.merge, (value) {
    return _then(_self.copyWith(merge: value));
  });
}
}


/// Adds pattern-matching-related methods to [ImportPreview].
extension ImportPreviewPatterns on ImportPreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportPreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportPreview value)  $default,){
final _that = this;
switch (_that) {
case _ImportPreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportPreview value)?  $default,){
final _that = this;
switch (_that) {
case _ImportPreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReadBackup backup,  ImportSummary replace,  ImportSummary merge,  int localRecordCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportPreview() when $default != null:
return $default(_that.backup,_that.replace,_that.merge,_that.localRecordCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReadBackup backup,  ImportSummary replace,  ImportSummary merge,  int localRecordCount)  $default,) {final _that = this;
switch (_that) {
case _ImportPreview():
return $default(_that.backup,_that.replace,_that.merge,_that.localRecordCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReadBackup backup,  ImportSummary replace,  ImportSummary merge,  int localRecordCount)?  $default,) {final _that = this;
switch (_that) {
case _ImportPreview() when $default != null:
return $default(_that.backup,_that.replace,_that.merge,_that.localRecordCount);case _:
  return null;

}
}

}

/// @nodoc


class _ImportPreview implements ImportPreview {
  const _ImportPreview({required this.backup, required this.replace, required this.merge, required this.localRecordCount});
  

@override final  ReadBackup backup;
@override final  ImportSummary replace;
@override final  ImportSummary merge;
/// Records on this device now (for "Replace deletes …").
@override final  int localRecordCount;

/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportPreviewCopyWith<_ImportPreview> get copyWith => __$ImportPreviewCopyWithImpl<_ImportPreview>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportPreview&&(identical(other.backup, backup) || other.backup == backup)&&(identical(other.replace, replace) || other.replace == replace)&&(identical(other.merge, merge) || other.merge == merge)&&(identical(other.localRecordCount, localRecordCount) || other.localRecordCount == localRecordCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,backup,replace,merge,localRecordCount);
}

@override
String toString() {
    return 'ImportPreview(backup: $backup, replace: $replace, merge: $merge, localRecordCount: $localRecordCount)';
}


}

/// @nodoc
abstract mixin class _$ImportPreviewCopyWith<$Res> implements $ImportPreviewCopyWith<$Res> {
  factory _$ImportPreviewCopyWith(_ImportPreview value, $Res Function(_ImportPreview) _then) = __$ImportPreviewCopyWithImpl;
@override @useResult
$Res call({
 ReadBackup backup, ImportSummary replace, ImportSummary merge, int localRecordCount
});


@override $ReadBackupCopyWith<$Res> get backup;@override $ImportSummaryCopyWith<$Res> get replace;@override $ImportSummaryCopyWith<$Res> get merge;

}
/// @nodoc
class __$ImportPreviewCopyWithImpl<$Res>
    implements _$ImportPreviewCopyWith<$Res> {
  __$ImportPreviewCopyWithImpl(this._self, this._then);

  final _ImportPreview _self;
  final $Res Function(_ImportPreview) _then;

/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backup = null,Object? replace = null,Object? merge = null,Object? localRecordCount = null,}) {
  return _then(_ImportPreview(
backup: null == backup ? _self.backup : backup // ignore: cast_nullable_to_non_nullable
as ReadBackup,replace: null == replace ? _self.replace : replace // ignore: cast_nullable_to_non_nullable
as ImportSummary,merge: null == merge ? _self.merge : merge // ignore: cast_nullable_to_non_nullable
as ImportSummary,localRecordCount: null == localRecordCount ? _self.localRecordCount : localRecordCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReadBackupCopyWith<$Res> get backup {
  
  return $ReadBackupCopyWith<$Res>(_self.backup, (value) {
    return _then(_self.copyWith(backup: value));
  });
}/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<$Res> get replace {
  
  return $ImportSummaryCopyWith<$Res>(_self.replace, (value) {
    return _then(_self.copyWith(replace: value));
  });
}/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<$Res> get merge {
  
  return $ImportSummaryCopyWith<$Res>(_self.merge, (value) {
    return _then(_self.copyWith(merge: value));
  });
}
}

/// @nodoc
mixin _$ImportResult {

 ImportSummary get summary;/// Null when there was nothing to save first (empty device).
 SafetyBackup? get safetyBackup;/// False if the post-import `quick_check` reported a problem. The data is
/// in place and the safety backup can undo it.
 bool get integrityOk;
/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportResultCopyWith<ImportResult> get copyWith => _$ImportResultCopyWithImpl<ImportResult>(this as ImportResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportResult&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.safetyBackup, _this.safetyBackup) || other.safetyBackup == _this.safetyBackup)&&(identical(other.integrityOk, _this.integrityOk) || other.integrityOk == _this.integrityOk));
}


@override
int get hashCode {
  final _this = this as ImportResult;
  return Object.hash(runtimeType,_this.summary,_this.safetyBackup,_this.integrityOk);
}

@override
String toString() {
  final _this = this as ImportResult;
  return 'ImportResult(summary: ${_this.summary}, safetyBackup: ${_this.safetyBackup}, integrityOk: ${_this.integrityOk})';
}


}

/// @nodoc
abstract mixin class $ImportResultCopyWith<$Res>  {
  factory $ImportResultCopyWith(ImportResult value, $Res Function(ImportResult) _then) = _$ImportResultCopyWithImpl;
@useResult
$Res call({
 ImportSummary summary, SafetyBackup? safetyBackup, bool integrityOk
});


$ImportSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$ImportResultCopyWithImpl<$Res>
    implements $ImportResultCopyWith<$Res> {
  _$ImportResultCopyWithImpl(this._self, this._then);

  final ImportResult _self;
  final $Res Function(ImportResult) _then;

/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? safetyBackup = freezed,Object? integrityOk = null,}) {
  return _then(ImportResult(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ImportSummary,safetyBackup: freezed == safetyBackup ? _self.safetyBackup : safetyBackup // ignore: cast_nullable_to_non_nullable
as SafetyBackup?,integrityOk: null == integrityOk ? _self.integrityOk : integrityOk // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<$Res> get summary {
  
  return $ImportSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ImportResult].
extension ImportResultPatterns on ImportResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportResult value)  $default,){
final _that = this;
switch (_that) {
case _ImportResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportResult value)?  $default,){
final _that = this;
switch (_that) {
case _ImportResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImportSummary summary,  SafetyBackup? safetyBackup,  bool integrityOk)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportResult() when $default != null:
return $default(_that.summary,_that.safetyBackup,_that.integrityOk);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImportSummary summary,  SafetyBackup? safetyBackup,  bool integrityOk)  $default,) {final _that = this;
switch (_that) {
case _ImportResult():
return $default(_that.summary,_that.safetyBackup,_that.integrityOk);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImportSummary summary,  SafetyBackup? safetyBackup,  bool integrityOk)?  $default,) {final _that = this;
switch (_that) {
case _ImportResult() when $default != null:
return $default(_that.summary,_that.safetyBackup,_that.integrityOk);case _:
  return null;

}
}

}

/// @nodoc


class _ImportResult implements ImportResult {
  const _ImportResult({required this.summary, this.safetyBackup, this.integrityOk = true});
  

@override final  ImportSummary summary;
/// Null when there was nothing to save first (empty device).
@override final  SafetyBackup? safetyBackup;
/// False if the post-import `quick_check` reported a problem. The data is
/// in place and the safety backup can undo it.
@override@JsonKey() final  bool integrityOk;

/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportResultCopyWith<_ImportResult> get copyWith => __$ImportResultCopyWithImpl<_ImportResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportResult&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.safetyBackup, safetyBackup) || other.safetyBackup == safetyBackup)&&(identical(other.integrityOk, integrityOk) || other.integrityOk == integrityOk));
}


@override
int get hashCode {
    return Object.hash(runtimeType,summary,safetyBackup,integrityOk);
}

@override
String toString() {
    return 'ImportResult(summary: $summary, safetyBackup: $safetyBackup, integrityOk: $integrityOk)';
}


}

/// @nodoc
abstract mixin class _$ImportResultCopyWith<$Res> implements $ImportResultCopyWith<$Res> {
  factory _$ImportResultCopyWith(_ImportResult value, $Res Function(_ImportResult) _then) = __$ImportResultCopyWithImpl;
@override @useResult
$Res call({
 ImportSummary summary, SafetyBackup? safetyBackup, bool integrityOk
});


@override $ImportSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$ImportResultCopyWithImpl<$Res>
    implements _$ImportResultCopyWith<$Res> {
  __$ImportResultCopyWithImpl(this._self, this._then);

  final _ImportResult _self;
  final $Res Function(_ImportResult) _then;

/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? safetyBackup = freezed,Object? integrityOk = null,}) {
  return _then(_ImportResult(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ImportSummary,safetyBackup: freezed == safetyBackup ? _self.safetyBackup : safetyBackup // ignore: cast_nullable_to_non_nullable
as SafetyBackup?,integrityOk: null == integrityOk ? _self.integrityOk : integrityOk // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<$Res> get summary {
  
  return $ImportSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

/// @nodoc
mixin _$BackupStatus {

 Instant? get lastExportAt; List<ImportLogEntry> get importLog;
/// Create a copy of BackupStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupStatusCopyWith<BackupStatus> get copyWith => _$BackupStatusCopyWithImpl<BackupStatus>(this as BackupStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BackupStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupStatus&&(identical(other.lastExportAt, _this.lastExportAt) || other.lastExportAt == _this.lastExportAt)&&const DeepCollectionEquality().equals(other.importLog, _this.importLog));
}


@override
int get hashCode {
  final _this = this as BackupStatus;
  return Object.hash(runtimeType,_this.lastExportAt,const DeepCollectionEquality().hash(_this.importLog));
}

@override
String toString() {
  final _this = this as BackupStatus;
  return 'BackupStatus(lastExportAt: ${_this.lastExportAt}, importLog: ${_this.importLog})';
}


}

/// @nodoc
abstract mixin class $BackupStatusCopyWith<$Res>  {
  factory $BackupStatusCopyWith(BackupStatus value, $Res Function(BackupStatus) _then) = _$BackupStatusCopyWithImpl;
@useResult
$Res call({
 Instant? lastExportAt, List<ImportLogEntry> importLog
});




}
/// @nodoc
class _$BackupStatusCopyWithImpl<$Res>
    implements $BackupStatusCopyWith<$Res> {
  _$BackupStatusCopyWithImpl(this._self, this._then);

  final BackupStatus _self;
  final $Res Function(BackupStatus) _then;

/// Create a copy of BackupStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastExportAt = freezed,Object? importLog = null,}) {
  return _then(BackupStatus(
lastExportAt: freezed == lastExportAt ? _self.lastExportAt : lastExportAt // ignore: cast_nullable_to_non_nullable
as Instant?,importLog: null == importLog ? _self.importLog : importLog // ignore: cast_nullable_to_non_nullable
as List<ImportLogEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupStatus].
extension BackupStatusPatterns on BackupStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupStatus value)  $default,){
final _that = this;
switch (_that) {
case _BackupStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupStatus value)?  $default,){
final _that = this;
switch (_that) {
case _BackupStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Instant? lastExportAt,  List<ImportLogEntry> importLog)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupStatus() when $default != null:
return $default(_that.lastExportAt,_that.importLog);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Instant? lastExportAt,  List<ImportLogEntry> importLog)  $default,) {final _that = this;
switch (_that) {
case _BackupStatus():
return $default(_that.lastExportAt,_that.importLog);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Instant? lastExportAt,  List<ImportLogEntry> importLog)?  $default,) {final _that = this;
switch (_that) {
case _BackupStatus() when $default != null:
return $default(_that.lastExportAt,_that.importLog);case _:
  return null;

}
}

}

/// @nodoc


class _BackupStatus implements BackupStatus {
  const _BackupStatus({this.lastExportAt,  List<ImportLogEntry> importLog = const <ImportLogEntry>[]}): _importLog = importLog;
  

@override final  Instant? lastExportAt;
 final  List<ImportLogEntry> _importLog;
@override@JsonKey() List<ImportLogEntry> get importLog {
  if (_importLog is EqualUnmodifiableListView) return _importLog;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_importLog);
}


/// Create a copy of BackupStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupStatusCopyWith<_BackupStatus> get copyWith => __$BackupStatusCopyWithImpl<_BackupStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupStatus&&(identical(other.lastExportAt, lastExportAt) || other.lastExportAt == lastExportAt)&&const DeepCollectionEquality().equals(other.importLog, _importLog));
}


@override
int get hashCode {
    return Object.hash(runtimeType,lastExportAt,const DeepCollectionEquality().hash(_importLog));
}

@override
String toString() {
    return 'BackupStatus(lastExportAt: $lastExportAt, importLog: $importLog)';
}


}

/// @nodoc
abstract mixin class _$BackupStatusCopyWith<$Res> implements $BackupStatusCopyWith<$Res> {
  factory _$BackupStatusCopyWith(_BackupStatus value, $Res Function(_BackupStatus) _then) = __$BackupStatusCopyWithImpl;
@override @useResult
$Res call({
 Instant? lastExportAt, List<ImportLogEntry> importLog
});




}
/// @nodoc
class __$BackupStatusCopyWithImpl<$Res>
    implements _$BackupStatusCopyWith<$Res> {
  __$BackupStatusCopyWithImpl(this._self, this._then);

  final _BackupStatus _self;
  final $Res Function(_BackupStatus) _then;

/// Create a copy of BackupStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastExportAt = freezed,Object? importLog = null,}) {
  return _then(_BackupStatus(
lastExportAt: freezed == lastExportAt ? _self.lastExportAt : lastExportAt // ignore: cast_nullable_to_non_nullable
as Instant?,importLog: null == importLog ? _self._importLog : importLog // ignore: cast_nullable_to_non_nullable
as List<ImportLogEntry>,
  ));
}


}

// dart format on
