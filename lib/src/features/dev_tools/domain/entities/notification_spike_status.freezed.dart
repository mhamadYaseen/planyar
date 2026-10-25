// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_spike_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationSpikeStatus {

 NotificationPermissions get permissions; String get timeZoneId; int get pendingCount;
/// Create a copy of NotificationSpikeStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationSpikeStatusCopyWith<NotificationSpikeStatus> get copyWith => _$NotificationSpikeStatusCopyWithImpl<NotificationSpikeStatus>(this as NotificationSpikeStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NotificationSpikeStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationSpikeStatus&&(identical(other.permissions, _this.permissions) || other.permissions == _this.permissions)&&(identical(other.timeZoneId, _this.timeZoneId) || other.timeZoneId == _this.timeZoneId)&&(identical(other.pendingCount, _this.pendingCount) || other.pendingCount == _this.pendingCount));
}


@override
int get hashCode {
  final _this = this as NotificationSpikeStatus;
  return Object.hash(runtimeType,_this.permissions,_this.timeZoneId,_this.pendingCount);
}

@override
String toString() {
  final _this = this as NotificationSpikeStatus;
  return 'NotificationSpikeStatus(permissions: ${_this.permissions}, timeZoneId: ${_this.timeZoneId}, pendingCount: ${_this.pendingCount})';
}


}

/// @nodoc
abstract mixin class $NotificationSpikeStatusCopyWith<$Res>  {
  factory $NotificationSpikeStatusCopyWith(NotificationSpikeStatus value, $Res Function(NotificationSpikeStatus) _then) = _$NotificationSpikeStatusCopyWithImpl;
@useResult
$Res call({
 NotificationPermissions permissions, String timeZoneId, int pendingCount
});




}
/// @nodoc
class _$NotificationSpikeStatusCopyWithImpl<$Res>
    implements $NotificationSpikeStatusCopyWith<$Res> {
  _$NotificationSpikeStatusCopyWithImpl(this._self, this._then);

  final NotificationSpikeStatus _self;
  final $Res Function(NotificationSpikeStatus) _then;

/// Create a copy of NotificationSpikeStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permissions = null,Object? timeZoneId = null,Object? pendingCount = null,}) {
  return _then(NotificationSpikeStatus(
permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as NotificationPermissions,timeZoneId: null == timeZoneId ? _self.timeZoneId : timeZoneId // ignore: cast_nullable_to_non_nullable
as String,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationSpikeStatus].
extension NotificationSpikeStatusPatterns on NotificationSpikeStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationSpikeStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationSpikeStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationSpikeStatus value)  $default,){
final _that = this;
switch (_that) {
case _NotificationSpikeStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationSpikeStatus value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationSpikeStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationPermissions permissions,  String timeZoneId,  int pendingCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationSpikeStatus() when $default != null:
return $default(_that.permissions,_that.timeZoneId,_that.pendingCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationPermissions permissions,  String timeZoneId,  int pendingCount)  $default,) {final _that = this;
switch (_that) {
case _NotificationSpikeStatus():
return $default(_that.permissions,_that.timeZoneId,_that.pendingCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationPermissions permissions,  String timeZoneId,  int pendingCount)?  $default,) {final _that = this;
switch (_that) {
case _NotificationSpikeStatus() when $default != null:
return $default(_that.permissions,_that.timeZoneId,_that.pendingCount);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationSpikeStatus implements NotificationSpikeStatus {
  const _NotificationSpikeStatus({required this.permissions, required this.timeZoneId, required this.pendingCount});
  

@override final  NotificationPermissions permissions;
@override final  String timeZoneId;
@override final  int pendingCount;

/// Create a copy of NotificationSpikeStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationSpikeStatusCopyWith<_NotificationSpikeStatus> get copyWith => __$NotificationSpikeStatusCopyWithImpl<_NotificationSpikeStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationSpikeStatus&&(identical(other.permissions, permissions) || other.permissions == permissions)&&(identical(other.timeZoneId, timeZoneId) || other.timeZoneId == timeZoneId)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,permissions,timeZoneId,pendingCount);
}

@override
String toString() {
    return 'NotificationSpikeStatus(permissions: $permissions, timeZoneId: $timeZoneId, pendingCount: $pendingCount)';
}


}

/// @nodoc
abstract mixin class _$NotificationSpikeStatusCopyWith<$Res> implements $NotificationSpikeStatusCopyWith<$Res> {
  factory _$NotificationSpikeStatusCopyWith(_NotificationSpikeStatus value, $Res Function(_NotificationSpikeStatus) _then) = __$NotificationSpikeStatusCopyWithImpl;
@override @useResult
$Res call({
 NotificationPermissions permissions, String timeZoneId, int pendingCount
});




}
/// @nodoc
class __$NotificationSpikeStatusCopyWithImpl<$Res>
    implements _$NotificationSpikeStatusCopyWith<$Res> {
  __$NotificationSpikeStatusCopyWithImpl(this._self, this._then);

  final _NotificationSpikeStatus _self;
  final $Res Function(_NotificationSpikeStatus) _then;

/// Create a copy of NotificationSpikeStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permissions = null,Object? timeZoneId = null,Object? pendingCount = null,}) {
  return _then(_NotificationSpikeStatus(
permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as NotificationPermissions,timeZoneId: null == timeZoneId ? _self.timeZoneId : timeZoneId // ignore: cast_nullable_to_non_nullable
as String,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ScheduledTestNotification {

 Instant get at; WallTime get localTime;
/// Create a copy of ScheduledTestNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduledTestNotificationCopyWith<ScheduledTestNotification> get copyWith => _$ScheduledTestNotificationCopyWithImpl<ScheduledTestNotification>(this as ScheduledTestNotification, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScheduledTestNotification;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduledTestNotification&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.localTime, _this.localTime) || other.localTime == _this.localTime));
}


@override
int get hashCode {
  final _this = this as ScheduledTestNotification;
  return Object.hash(runtimeType,_this.at,_this.localTime);
}

@override
String toString() {
  final _this = this as ScheduledTestNotification;
  return 'ScheduledTestNotification(at: ${_this.at}, localTime: ${_this.localTime})';
}


}

/// @nodoc
abstract mixin class $ScheduledTestNotificationCopyWith<$Res>  {
  factory $ScheduledTestNotificationCopyWith(ScheduledTestNotification value, $Res Function(ScheduledTestNotification) _then) = _$ScheduledTestNotificationCopyWithImpl;
@useResult
$Res call({
 Instant at, WallTime localTime
});




}
/// @nodoc
class _$ScheduledTestNotificationCopyWithImpl<$Res>
    implements $ScheduledTestNotificationCopyWith<$Res> {
  _$ScheduledTestNotificationCopyWithImpl(this._self, this._then);

  final ScheduledTestNotification _self;
  final $Res Function(ScheduledTestNotification) _then;

/// Create a copy of ScheduledTestNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? at = null,Object? localTime = null,}) {
  return _then(ScheduledTestNotification(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as Instant,localTime: null == localTime ? _self.localTime : localTime // ignore: cast_nullable_to_non_nullable
as WallTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduledTestNotification].
extension ScheduledTestNotificationPatterns on ScheduledTestNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduledTestNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduledTestNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduledTestNotification value)  $default,){
final _that = this;
switch (_that) {
case _ScheduledTestNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduledTestNotification value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduledTestNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Instant at,  WallTime localTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduledTestNotification() when $default != null:
return $default(_that.at,_that.localTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Instant at,  WallTime localTime)  $default,) {final _that = this;
switch (_that) {
case _ScheduledTestNotification():
return $default(_that.at,_that.localTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Instant at,  WallTime localTime)?  $default,) {final _that = this;
switch (_that) {
case _ScheduledTestNotification() when $default != null:
return $default(_that.at,_that.localTime);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduledTestNotification implements ScheduledTestNotification {
  const _ScheduledTestNotification({required this.at, required this.localTime});
  

@override final  Instant at;
@override final  WallTime localTime;

/// Create a copy of ScheduledTestNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduledTestNotificationCopyWith<_ScheduledTestNotification> get copyWith => __$ScheduledTestNotificationCopyWithImpl<_ScheduledTestNotification>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduledTestNotification&&(identical(other.at, at) || other.at == at)&&(identical(other.localTime, localTime) || other.localTime == localTime));
}


@override
int get hashCode {
    return Object.hash(runtimeType,at,localTime);
}

@override
String toString() {
    return 'ScheduledTestNotification(at: $at, localTime: $localTime)';
}


}

/// @nodoc
abstract mixin class _$ScheduledTestNotificationCopyWith<$Res> implements $ScheduledTestNotificationCopyWith<$Res> {
  factory _$ScheduledTestNotificationCopyWith(_ScheduledTestNotification value, $Res Function(_ScheduledTestNotification) _then) = __$ScheduledTestNotificationCopyWithImpl;
@override @useResult
$Res call({
 Instant at, WallTime localTime
});




}
/// @nodoc
class __$ScheduledTestNotificationCopyWithImpl<$Res>
    implements _$ScheduledTestNotificationCopyWith<$Res> {
  __$ScheduledTestNotificationCopyWithImpl(this._self, this._then);

  final _ScheduledTestNotification _self;
  final $Res Function(_ScheduledTestNotification) _then;

/// Create a copy of ScheduledTestNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? at = null,Object? localTime = null,}) {
  return _then(_ScheduledTestNotification(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as Instant,localTime: null == localTime ? _self.localTime : localTime // ignore: cast_nullable_to_non_nullable
as WallTime,
  ));
}


}

// dart format on
