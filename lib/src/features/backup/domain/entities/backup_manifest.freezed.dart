// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_manifest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackupManifest {

 int get formatVersion;/// Informational fields — a hand-edited file may lack them.
 String get appVersion; int get dbSchemaVersion; Instant? get createdAt; String get deviceTimeZone; String get platform; Map<BackupTable, int> get counts;/// Lower-case hex SHA-256 of the `data.json` bytes.
 String get dataSha256;
/// Create a copy of BackupManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupManifestCopyWith<BackupManifest> get copyWith => _$BackupManifestCopyWithImpl<BackupManifest>(this as BackupManifest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BackupManifest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupManifest&&(identical(other.formatVersion, _this.formatVersion) || other.formatVersion == _this.formatVersion)&&(identical(other.appVersion, _this.appVersion) || other.appVersion == _this.appVersion)&&(identical(other.dbSchemaVersion, _this.dbSchemaVersion) || other.dbSchemaVersion == _this.dbSchemaVersion)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.deviceTimeZone, _this.deviceTimeZone) || other.deviceTimeZone == _this.deviceTimeZone)&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&const DeepCollectionEquality().equals(other.counts, _this.counts)&&(identical(other.dataSha256, _this.dataSha256) || other.dataSha256 == _this.dataSha256));
}


@override
int get hashCode {
  final _this = this as BackupManifest;
  return Object.hash(runtimeType,_this.formatVersion,_this.appVersion,_this.dbSchemaVersion,_this.createdAt,_this.deviceTimeZone,_this.platform,const DeepCollectionEquality().hash(_this.counts),_this.dataSha256);
}

@override
String toString() {
  final _this = this as BackupManifest;
  return 'BackupManifest(formatVersion: ${_this.formatVersion}, appVersion: ${_this.appVersion}, dbSchemaVersion: ${_this.dbSchemaVersion}, createdAt: ${_this.createdAt}, deviceTimeZone: ${_this.deviceTimeZone}, platform: ${_this.platform}, counts: ${_this.counts}, dataSha256: ${_this.dataSha256})';
}


}

/// @nodoc
abstract mixin class $BackupManifestCopyWith<$Res>  {
  factory $BackupManifestCopyWith(BackupManifest value, $Res Function(BackupManifest) _then) = _$BackupManifestCopyWithImpl;
@useResult
$Res call({
 int formatVersion, String appVersion, int dbSchemaVersion, Instant? createdAt, String deviceTimeZone, String platform, Map<BackupTable, int> counts, String dataSha256
});




}
/// @nodoc
class _$BackupManifestCopyWithImpl<$Res>
    implements $BackupManifestCopyWith<$Res> {
  _$BackupManifestCopyWithImpl(this._self, this._then);

  final BackupManifest _self;
  final $Res Function(BackupManifest) _then;

/// Create a copy of BackupManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formatVersion = null,Object? appVersion = null,Object? dbSchemaVersion = null,Object? createdAt = freezed,Object? deviceTimeZone = null,Object? platform = null,Object? counts = null,Object? dataSha256 = null,}) {
  return _then(BackupManifest(
formatVersion: null == formatVersion ? _self.formatVersion : formatVersion // ignore: cast_nullable_to_non_nullable
as int,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,dbSchemaVersion: null == dbSchemaVersion ? _self.dbSchemaVersion : dbSchemaVersion // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant?,deviceTimeZone: null == deviceTimeZone ? _self.deviceTimeZone : deviceTimeZone // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as Map<BackupTable, int>,dataSha256: null == dataSha256 ? _self.dataSha256 : dataSha256 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupManifest].
extension BackupManifestPatterns on BackupManifest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupManifest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupManifest value)  $default,){
final _that = this;
switch (_that) {
case _BackupManifest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupManifest value)?  $default,){
final _that = this;
switch (_that) {
case _BackupManifest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int formatVersion,  String appVersion,  int dbSchemaVersion,  Instant? createdAt,  String deviceTimeZone,  String platform,  Map<BackupTable, int> counts,  String dataSha256)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupManifest() when $default != null:
return $default(_that.formatVersion,_that.appVersion,_that.dbSchemaVersion,_that.createdAt,_that.deviceTimeZone,_that.platform,_that.counts,_that.dataSha256);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int formatVersion,  String appVersion,  int dbSchemaVersion,  Instant? createdAt,  String deviceTimeZone,  String platform,  Map<BackupTable, int> counts,  String dataSha256)  $default,) {final _that = this;
switch (_that) {
case _BackupManifest():
return $default(_that.formatVersion,_that.appVersion,_that.dbSchemaVersion,_that.createdAt,_that.deviceTimeZone,_that.platform,_that.counts,_that.dataSha256);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int formatVersion,  String appVersion,  int dbSchemaVersion,  Instant? createdAt,  String deviceTimeZone,  String platform,  Map<BackupTable, int> counts,  String dataSha256)?  $default,) {final _that = this;
switch (_that) {
case _BackupManifest() when $default != null:
return $default(_that.formatVersion,_that.appVersion,_that.dbSchemaVersion,_that.createdAt,_that.deviceTimeZone,_that.platform,_that.counts,_that.dataSha256);case _:
  return null;

}
}

}

/// @nodoc


class _BackupManifest implements BackupManifest {
  const _BackupManifest({required this.formatVersion, this.appVersion = '', this.dbSchemaVersion = 0, this.createdAt, this.deviceTimeZone = '', this.platform = '',  Map<BackupTable, int> counts = const <BackupTable, int>{}, required this.dataSha256}): _counts = counts;
  

@override final  int formatVersion;
/// Informational fields — a hand-edited file may lack them.
@override@JsonKey() final  String appVersion;
@override@JsonKey() final  int dbSchemaVersion;
@override final  Instant? createdAt;
@override@JsonKey() final  String deviceTimeZone;
@override@JsonKey() final  String platform;
 final  Map<BackupTable, int> _counts;
@override@JsonKey() Map<BackupTable, int> get counts {
  if (_counts is EqualUnmodifiableMapView) return _counts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_counts);
}

/// Lower-case hex SHA-256 of the `data.json` bytes.
@override final  String dataSha256;

/// Create a copy of BackupManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupManifestCopyWith<_BackupManifest> get copyWith => __$BackupManifestCopyWithImpl<_BackupManifest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupManifest&&(identical(other.formatVersion, formatVersion) || other.formatVersion == formatVersion)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.dbSchemaVersion, dbSchemaVersion) || other.dbSchemaVersion == dbSchemaVersion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deviceTimeZone, deviceTimeZone) || other.deviceTimeZone == deviceTimeZone)&&(identical(other.platform, platform) || other.platform == platform)&&const DeepCollectionEquality().equals(other.counts, _counts)&&(identical(other.dataSha256, dataSha256) || other.dataSha256 == dataSha256));
}


@override
int get hashCode {
    return Object.hash(runtimeType,formatVersion,appVersion,dbSchemaVersion,createdAt,deviceTimeZone,platform,const DeepCollectionEquality().hash(_counts),dataSha256);
}

@override
String toString() {
    return 'BackupManifest(formatVersion: $formatVersion, appVersion: $appVersion, dbSchemaVersion: $dbSchemaVersion, createdAt: $createdAt, deviceTimeZone: $deviceTimeZone, platform: $platform, counts: $counts, dataSha256: $dataSha256)';
}


}

/// @nodoc
abstract mixin class _$BackupManifestCopyWith<$Res> implements $BackupManifestCopyWith<$Res> {
  factory _$BackupManifestCopyWith(_BackupManifest value, $Res Function(_BackupManifest) _then) = __$BackupManifestCopyWithImpl;
@override @useResult
$Res call({
 int formatVersion, String appVersion, int dbSchemaVersion, Instant? createdAt, String deviceTimeZone, String platform, Map<BackupTable, int> counts, String dataSha256
});




}
/// @nodoc
class __$BackupManifestCopyWithImpl<$Res>
    implements _$BackupManifestCopyWith<$Res> {
  __$BackupManifestCopyWithImpl(this._self, this._then);

  final _BackupManifest _self;
  final $Res Function(_BackupManifest) _then;

/// Create a copy of BackupManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formatVersion = null,Object? appVersion = null,Object? dbSchemaVersion = null,Object? createdAt = freezed,Object? deviceTimeZone = null,Object? platform = null,Object? counts = null,Object? dataSha256 = null,}) {
  return _then(_BackupManifest(
formatVersion: null == formatVersion ? _self.formatVersion : formatVersion // ignore: cast_nullable_to_non_nullable
as int,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,dbSchemaVersion: null == dbSchemaVersion ? _self.dbSchemaVersion : dbSchemaVersion // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant?,deviceTimeZone: null == deviceTimeZone ? _self.deviceTimeZone : deviceTimeZone // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,counts: null == counts ? _self._counts : counts // ignore: cast_nullable_to_non_nullable
as Map<BackupTable, int>,dataSha256: null == dataSha256 ? _self.dataSha256 : dataSha256 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
