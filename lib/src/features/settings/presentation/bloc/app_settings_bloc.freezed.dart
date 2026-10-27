// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettingsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppSettingsEvent()';
}


}

/// @nodoc
class $AppSettingsEventCopyWith<$Res>  {
$AppSettingsEventCopyWith(AppSettingsEvent _, $Res Function(AppSettingsEvent) __);
}


/// Adds pattern-matching-related methods to [AppSettingsEvent].
extension AppSettingsEventPatterns on AppSettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ThemeModeChanged value)?  themeModeChanged,TResult Function( _FirstDayChanged value)?  firstDayOfWeekChanged,TResult Function( _DayViewModeChanged value)?  dayViewModeChanged,TResult Function( _LaneModeChanged value)?  laneModeChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ThemeModeChanged() when themeModeChanged != null:
return themeModeChanged(_that);case _FirstDayChanged() when firstDayOfWeekChanged != null:
return firstDayOfWeekChanged(_that);case _DayViewModeChanged() when dayViewModeChanged != null:
return dayViewModeChanged(_that);case _LaneModeChanged() when laneModeChanged != null:
return laneModeChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ThemeModeChanged value)  themeModeChanged,required TResult Function( _FirstDayChanged value)  firstDayOfWeekChanged,required TResult Function( _DayViewModeChanged value)  dayViewModeChanged,required TResult Function( _LaneModeChanged value)  laneModeChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ThemeModeChanged():
return themeModeChanged(_that);case _FirstDayChanged():
return firstDayOfWeekChanged(_that);case _DayViewModeChanged():
return dayViewModeChanged(_that);case _LaneModeChanged():
return laneModeChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ThemeModeChanged value)?  themeModeChanged,TResult? Function( _FirstDayChanged value)?  firstDayOfWeekChanged,TResult? Function( _DayViewModeChanged value)?  dayViewModeChanged,TResult? Function( _LaneModeChanged value)?  laneModeChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ThemeModeChanged() when themeModeChanged != null:
return themeModeChanged(_that);case _FirstDayChanged() when firstDayOfWeekChanged != null:
return firstDayOfWeekChanged(_that);case _DayViewModeChanged() when dayViewModeChanged != null:
return dayViewModeChanged(_that);case _LaneModeChanged() when laneModeChanged != null:
return laneModeChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( AppThemeMode mode)?  themeModeChanged,TResult Function( int weekday)?  firstDayOfWeekChanged,TResult Function( DayViewMode mode)?  dayViewModeChanged,TResult Function( LaneMode mode)?  laneModeChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _ThemeModeChanged() when themeModeChanged != null:
return themeModeChanged(_that.mode);case _FirstDayChanged() when firstDayOfWeekChanged != null:
return firstDayOfWeekChanged(_that.weekday);case _DayViewModeChanged() when dayViewModeChanged != null:
return dayViewModeChanged(_that.mode);case _LaneModeChanged() when laneModeChanged != null:
return laneModeChanged(_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( AppThemeMode mode)  themeModeChanged,required TResult Function( int weekday)  firstDayOfWeekChanged,required TResult Function( DayViewMode mode)  dayViewModeChanged,required TResult Function( LaneMode mode)  laneModeChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _ThemeModeChanged():
return themeModeChanged(_that.mode);case _FirstDayChanged():
return firstDayOfWeekChanged(_that.weekday);case _DayViewModeChanged():
return dayViewModeChanged(_that.mode);case _LaneModeChanged():
return laneModeChanged(_that.mode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( AppThemeMode mode)?  themeModeChanged,TResult? Function( int weekday)?  firstDayOfWeekChanged,TResult? Function( DayViewMode mode)?  dayViewModeChanged,TResult? Function( LaneMode mode)?  laneModeChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _ThemeModeChanged() when themeModeChanged != null:
return themeModeChanged(_that.mode);case _FirstDayChanged() when firstDayOfWeekChanged != null:
return firstDayOfWeekChanged(_that.weekday);case _DayViewModeChanged() when dayViewModeChanged != null:
return dayViewModeChanged(_that.mode);case _LaneModeChanged() when laneModeChanged != null:
return laneModeChanged(_that.mode);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AppSettingsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppSettingsEvent.started()';
}


}




/// @nodoc


class _ThemeModeChanged implements AppSettingsEvent {
  const _ThemeModeChanged(this.mode);
  

 final  AppThemeMode mode;

/// Create a copy of AppSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeModeChangedCopyWith<_ThemeModeChanged> get copyWith => __$ThemeModeChangedCopyWithImpl<_ThemeModeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeModeChanged&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode);
}

@override
String toString() {
    return 'AppSettingsEvent.themeModeChanged(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$ThemeModeChangedCopyWith<$Res> implements $AppSettingsEventCopyWith<$Res> {
  factory _$ThemeModeChangedCopyWith(_ThemeModeChanged value, $Res Function(_ThemeModeChanged) _then) = __$ThemeModeChangedCopyWithImpl;
@useResult
$Res call({
 AppThemeMode mode
});




}
/// @nodoc
class __$ThemeModeChangedCopyWithImpl<$Res>
    implements _$ThemeModeChangedCopyWith<$Res> {
  __$ThemeModeChangedCopyWithImpl(this._self, this._then);

  final _ThemeModeChanged _self;
  final $Res Function(_ThemeModeChanged) _then;

/// Create a copy of AppSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_ThemeModeChanged(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,
  ));
}


}

/// @nodoc


class _FirstDayChanged implements AppSettingsEvent {
  const _FirstDayChanged(this.weekday);
  

 final  int weekday;

/// Create a copy of AppSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirstDayChangedCopyWith<_FirstDayChanged> get copyWith => __$FirstDayChangedCopyWithImpl<_FirstDayChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirstDayChanged&&(identical(other.weekday, weekday) || other.weekday == weekday));
}


@override
int get hashCode {
    return Object.hash(runtimeType,weekday);
}

@override
String toString() {
    return 'AppSettingsEvent.firstDayOfWeekChanged(weekday: $weekday)';
}


}

/// @nodoc
abstract mixin class _$FirstDayChangedCopyWith<$Res> implements $AppSettingsEventCopyWith<$Res> {
  factory _$FirstDayChangedCopyWith(_FirstDayChanged value, $Res Function(_FirstDayChanged) _then) = __$FirstDayChangedCopyWithImpl;
@useResult
$Res call({
 int weekday
});




}
/// @nodoc
class __$FirstDayChangedCopyWithImpl<$Res>
    implements _$FirstDayChangedCopyWith<$Res> {
  __$FirstDayChangedCopyWithImpl(this._self, this._then);

  final _FirstDayChanged _self;
  final $Res Function(_FirstDayChanged) _then;

/// Create a copy of AppSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? weekday = null,}) {
  return _then(_FirstDayChanged(
null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DayViewModeChanged implements AppSettingsEvent {
  const _DayViewModeChanged(this.mode);
  

 final  DayViewMode mode;

/// Create a copy of AppSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayViewModeChangedCopyWith<_DayViewModeChanged> get copyWith => __$DayViewModeChangedCopyWithImpl<_DayViewModeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayViewModeChanged&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode);
}

@override
String toString() {
    return 'AppSettingsEvent.dayViewModeChanged(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$DayViewModeChangedCopyWith<$Res> implements $AppSettingsEventCopyWith<$Res> {
  factory _$DayViewModeChangedCopyWith(_DayViewModeChanged value, $Res Function(_DayViewModeChanged) _then) = __$DayViewModeChangedCopyWithImpl;
@useResult
$Res call({
 DayViewMode mode
});




}
/// @nodoc
class __$DayViewModeChangedCopyWithImpl<$Res>
    implements _$DayViewModeChangedCopyWith<$Res> {
  __$DayViewModeChangedCopyWithImpl(this._self, this._then);

  final _DayViewModeChanged _self;
  final $Res Function(_DayViewModeChanged) _then;

/// Create a copy of AppSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_DayViewModeChanged(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as DayViewMode,
  ));
}


}

/// @nodoc


class _LaneModeChanged implements AppSettingsEvent {
  const _LaneModeChanged(this.mode);
  

 final  LaneMode mode;

/// Create a copy of AppSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaneModeChangedCopyWith<_LaneModeChanged> get copyWith => __$LaneModeChangedCopyWithImpl<_LaneModeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaneModeChanged&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode);
}

@override
String toString() {
    return 'AppSettingsEvent.laneModeChanged(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$LaneModeChangedCopyWith<$Res> implements $AppSettingsEventCopyWith<$Res> {
  factory _$LaneModeChangedCopyWith(_LaneModeChanged value, $Res Function(_LaneModeChanged) _then) = __$LaneModeChangedCopyWithImpl;
@useResult
$Res call({
 LaneMode mode
});




}
/// @nodoc
class __$LaneModeChangedCopyWithImpl<$Res>
    implements _$LaneModeChangedCopyWith<$Res> {
  __$LaneModeChangedCopyWithImpl(this._self, this._then);

  final _LaneModeChanged _self;
  final $Res Function(_LaneModeChanged) _then;

/// Create a copy of AppSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_LaneModeChanged(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LaneMode,
  ));
}


}

// dart format on
