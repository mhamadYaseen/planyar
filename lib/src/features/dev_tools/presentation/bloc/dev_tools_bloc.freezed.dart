// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dev_tools_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DevToolsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DevToolsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DevToolsEvent()';
}


}

/// @nodoc
class $DevToolsEventCopyWith<$Res>  {
$DevToolsEventCopyWith(DevToolsEvent _, $Res Function(DevToolsEvent) __);
}


/// Adds pattern-matching-related methods to [DevToolsEvent].
extension DevToolsEventPatterns on DevToolsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _PermissionRequested value)?  permissionRequested,TResult Function( _ShowNowPressed value)?  showNowPressed,TResult Function( _SchedulePressed value)?  schedulePressed,TResult Function( _CancelAllPressed value)?  cancelAllPressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PermissionRequested() when permissionRequested != null:
return permissionRequested(_that);case _ShowNowPressed() when showNowPressed != null:
return showNowPressed(_that);case _SchedulePressed() when schedulePressed != null:
return schedulePressed(_that);case _CancelAllPressed() when cancelAllPressed != null:
return cancelAllPressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _PermissionRequested value)  permissionRequested,required TResult Function( _ShowNowPressed value)  showNowPressed,required TResult Function( _SchedulePressed value)  schedulePressed,required TResult Function( _CancelAllPressed value)  cancelAllPressed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _PermissionRequested():
return permissionRequested(_that);case _ShowNowPressed():
return showNowPressed(_that);case _SchedulePressed():
return schedulePressed(_that);case _CancelAllPressed():
return cancelAllPressed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _PermissionRequested value)?  permissionRequested,TResult? Function( _ShowNowPressed value)?  showNowPressed,TResult? Function( _SchedulePressed value)?  schedulePressed,TResult? Function( _CancelAllPressed value)?  cancelAllPressed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PermissionRequested() when permissionRequested != null:
return permissionRequested(_that);case _ShowNowPressed() when showNowPressed != null:
return showNowPressed(_that);case _SchedulePressed() when schedulePressed != null:
return schedulePressed(_that);case _CancelAllPressed() when cancelAllPressed != null:
return cancelAllPressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  permissionRequested,TResult Function( TestNotificationText text)?  showNowPressed,TResult Function( TestNotificationText text)?  schedulePressed,TResult Function()?  cancelAllPressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PermissionRequested() when permissionRequested != null:
return permissionRequested();case _ShowNowPressed() when showNowPressed != null:
return showNowPressed(_that.text);case _SchedulePressed() when schedulePressed != null:
return schedulePressed(_that.text);case _CancelAllPressed() when cancelAllPressed != null:
return cancelAllPressed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  permissionRequested,required TResult Function( TestNotificationText text)  showNowPressed,required TResult Function( TestNotificationText text)  schedulePressed,required TResult Function()  cancelAllPressed,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _PermissionRequested():
return permissionRequested();case _ShowNowPressed():
return showNowPressed(_that.text);case _SchedulePressed():
return schedulePressed(_that.text);case _CancelAllPressed():
return cancelAllPressed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  permissionRequested,TResult? Function( TestNotificationText text)?  showNowPressed,TResult? Function( TestNotificationText text)?  schedulePressed,TResult? Function()?  cancelAllPressed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PermissionRequested() when permissionRequested != null:
return permissionRequested();case _ShowNowPressed() when showNowPressed != null:
return showNowPressed(_that.text);case _SchedulePressed() when schedulePressed != null:
return schedulePressed(_that.text);case _CancelAllPressed() when cancelAllPressed != null:
return cancelAllPressed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements DevToolsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DevToolsEvent.started()';
}


}




/// @nodoc


class _PermissionRequested implements DevToolsEvent {
  const _PermissionRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DevToolsEvent.permissionRequested()';
}


}




/// @nodoc


class _ShowNowPressed implements DevToolsEvent {
  const _ShowNowPressed(this.text);
  

 final  TestNotificationText text;

/// Create a copy of DevToolsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowNowPressedCopyWith<_ShowNowPressed> get copyWith => __$ShowNowPressedCopyWithImpl<_ShowNowPressed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowNowPressed&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'DevToolsEvent.showNowPressed(text: $text)';
}


}

/// @nodoc
abstract mixin class _$ShowNowPressedCopyWith<$Res> implements $DevToolsEventCopyWith<$Res> {
  factory _$ShowNowPressedCopyWith(_ShowNowPressed value, $Res Function(_ShowNowPressed) _then) = __$ShowNowPressedCopyWithImpl;
@useResult
$Res call({
 TestNotificationText text
});




}
/// @nodoc
class __$ShowNowPressedCopyWithImpl<$Res>
    implements _$ShowNowPressedCopyWith<$Res> {
  __$ShowNowPressedCopyWithImpl(this._self, this._then);

  final _ShowNowPressed _self;
  final $Res Function(_ShowNowPressed) _then;

/// Create a copy of DevToolsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_ShowNowPressed(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as TestNotificationText,
  ));
}


}

/// @nodoc


class _SchedulePressed implements DevToolsEvent {
  const _SchedulePressed(this.text);
  

 final  TestNotificationText text;

/// Create a copy of DevToolsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchedulePressedCopyWith<_SchedulePressed> get copyWith => __$SchedulePressedCopyWithImpl<_SchedulePressed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchedulePressed&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'DevToolsEvent.schedulePressed(text: $text)';
}


}

/// @nodoc
abstract mixin class _$SchedulePressedCopyWith<$Res> implements $DevToolsEventCopyWith<$Res> {
  factory _$SchedulePressedCopyWith(_SchedulePressed value, $Res Function(_SchedulePressed) _then) = __$SchedulePressedCopyWithImpl;
@useResult
$Res call({
 TestNotificationText text
});




}
/// @nodoc
class __$SchedulePressedCopyWithImpl<$Res>
    implements _$SchedulePressedCopyWith<$Res> {
  __$SchedulePressedCopyWithImpl(this._self, this._then);

  final _SchedulePressed _self;
  final $Res Function(_SchedulePressed) _then;

/// Create a copy of DevToolsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_SchedulePressed(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as TestNotificationText,
  ));
}


}

/// @nodoc


class _CancelAllPressed implements DevToolsEvent {
  const _CancelAllPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelAllPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DevToolsEvent.cancelAllPressed()';
}


}




/// @nodoc
mixin _$DevToolsState {

 DataState<NotificationSpikeStatus> get status;/// The last scheduled test reminder.
 ScheduledTestNotification? get lastScheduled;/// The last action's failure, shown once in a snackbar.
 Failure? get actionFailure;
/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevToolsStateCopyWith<DevToolsState> get copyWith => _$DevToolsStateCopyWithImpl<DevToolsState>(this as DevToolsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DevToolsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevToolsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.lastScheduled, _this.lastScheduled) || other.lastScheduled == _this.lastScheduled)&&(identical(other.actionFailure, _this.actionFailure) || other.actionFailure == _this.actionFailure));
}


@override
int get hashCode {
  final _this = this as DevToolsState;
  return Object.hash(runtimeType,_this.status,_this.lastScheduled,_this.actionFailure);
}

@override
String toString() {
  final _this = this as DevToolsState;
  return 'DevToolsState(status: ${_this.status}, lastScheduled: ${_this.lastScheduled}, actionFailure: ${_this.actionFailure})';
}


}

/// @nodoc
abstract mixin class $DevToolsStateCopyWith<$Res>  {
  factory $DevToolsStateCopyWith(DevToolsState value, $Res Function(DevToolsState) _then) = _$DevToolsStateCopyWithImpl;
@useResult
$Res call({
 DataState<NotificationSpikeStatus> status, ScheduledTestNotification? lastScheduled, Failure? actionFailure
});


$DataStateCopyWith<NotificationSpikeStatus, $Res> get status;$ScheduledTestNotificationCopyWith<$Res>? get lastScheduled;$FailureCopyWith<$Res>? get actionFailure;

}
/// @nodoc
class _$DevToolsStateCopyWithImpl<$Res>
    implements $DevToolsStateCopyWith<$Res> {
  _$DevToolsStateCopyWithImpl(this._self, this._then);

  final DevToolsState _self;
  final $Res Function(DevToolsState) _then;

/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? lastScheduled = freezed,Object? actionFailure = freezed,}) {
  return _then(DevToolsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DataState<NotificationSpikeStatus>,lastScheduled: freezed == lastScheduled ? _self.lastScheduled : lastScheduled // ignore: cast_nullable_to_non_nullable
as ScheduledTestNotification?,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<NotificationSpikeStatus, $Res> get status {
  
  return $DataStateCopyWith<NotificationSpikeStatus, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduledTestNotificationCopyWith<$Res>? get lastScheduled {
    if (_self.lastScheduled == null) {
    return null;
  }

  return $ScheduledTestNotificationCopyWith<$Res>(_self.lastScheduled!, (value) {
    return _then(_self.copyWith(lastScheduled: value));
  });
}/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get actionFailure {
    if (_self.actionFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.actionFailure!, (value) {
    return _then(_self.copyWith(actionFailure: value));
  });
}
}


/// Adds pattern-matching-related methods to [DevToolsState].
extension DevToolsStatePatterns on DevToolsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevToolsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevToolsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevToolsState value)  $default,){
final _that = this;
switch (_that) {
case _DevToolsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevToolsState value)?  $default,){
final _that = this;
switch (_that) {
case _DevToolsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DataState<NotificationSpikeStatus> status,  ScheduledTestNotification? lastScheduled,  Failure? actionFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevToolsState() when $default != null:
return $default(_that.status,_that.lastScheduled,_that.actionFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DataState<NotificationSpikeStatus> status,  ScheduledTestNotification? lastScheduled,  Failure? actionFailure)  $default,) {final _that = this;
switch (_that) {
case _DevToolsState():
return $default(_that.status,_that.lastScheduled,_that.actionFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DataState<NotificationSpikeStatus> status,  ScheduledTestNotification? lastScheduled,  Failure? actionFailure)?  $default,) {final _that = this;
switch (_that) {
case _DevToolsState() when $default != null:
return $default(_that.status,_that.lastScheduled,_that.actionFailure);case _:
  return null;

}
}

}

/// @nodoc


class _DevToolsState implements DevToolsState {
  const _DevToolsState({this.status = const DataState<NotificationSpikeStatus>.initial(), this.lastScheduled, this.actionFailure});
  

@override@JsonKey() final  DataState<NotificationSpikeStatus> status;
/// The last scheduled test reminder.
@override final  ScheduledTestNotification? lastScheduled;
/// The last action's failure, shown once in a snackbar.
@override final  Failure? actionFailure;

/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevToolsStateCopyWith<_DevToolsState> get copyWith => __$DevToolsStateCopyWithImpl<_DevToolsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevToolsState&&(identical(other.status, status) || other.status == status)&&(identical(other.lastScheduled, lastScheduled) || other.lastScheduled == lastScheduled)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,lastScheduled,actionFailure);
}

@override
String toString() {
    return 'DevToolsState(status: $status, lastScheduled: $lastScheduled, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class _$DevToolsStateCopyWith<$Res> implements $DevToolsStateCopyWith<$Res> {
  factory _$DevToolsStateCopyWith(_DevToolsState value, $Res Function(_DevToolsState) _then) = __$DevToolsStateCopyWithImpl;
@override @useResult
$Res call({
 DataState<NotificationSpikeStatus> status, ScheduledTestNotification? lastScheduled, Failure? actionFailure
});


@override $DataStateCopyWith<NotificationSpikeStatus, $Res> get status;@override $ScheduledTestNotificationCopyWith<$Res>? get lastScheduled;@override $FailureCopyWith<$Res>? get actionFailure;

}
/// @nodoc
class __$DevToolsStateCopyWithImpl<$Res>
    implements _$DevToolsStateCopyWith<$Res> {
  __$DevToolsStateCopyWithImpl(this._self, this._then);

  final _DevToolsState _self;
  final $Res Function(_DevToolsState) _then;

/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? lastScheduled = freezed,Object? actionFailure = freezed,}) {
  return _then(_DevToolsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DataState<NotificationSpikeStatus>,lastScheduled: freezed == lastScheduled ? _self.lastScheduled : lastScheduled // ignore: cast_nullable_to_non_nullable
as ScheduledTestNotification?,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<NotificationSpikeStatus, $Res> get status {
  
  return $DataStateCopyWith<NotificationSpikeStatus, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduledTestNotificationCopyWith<$Res>? get lastScheduled {
    if (_self.lastScheduled == null) {
    return null;
  }

  return $ScheduledTestNotificationCopyWith<$Res>(_self.lastScheduled!, (value) {
    return _then(_self.copyWith(lastScheduled: value));
  });
}/// Create a copy of DevToolsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get actionFailure {
    if (_self.actionFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.actionFailure!, (value) {
    return _then(_self.copyWith(actionFailure: value));
  });
}
}

// dart format on
