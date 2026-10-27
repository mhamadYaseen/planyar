// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayViewEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DayViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DayViewEvent()';
}


}

/// @nodoc
class $DayViewEventCopyWith<$Res>  {
$DayViewEventCopyWith(DayViewEvent _, $Res Function(DayViewEvent) __);
}


/// Adds pattern-matching-related methods to [DayViewEvent].
extension DayViewEventPatterns on DayViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LaneModeChanged value)?  laneModeChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LaneModeChanged() when laneModeChanged != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LaneModeChanged value)  laneModeChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LaneModeChanged():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LaneModeChanged value)?  laneModeChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LaneModeChanged() when laneModeChanged != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( LaneMode mode)?  laneModeChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LaneModeChanged() when laneModeChanged != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( LaneMode mode)  laneModeChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _LaneModeChanged():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( LaneMode mode)?  laneModeChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LaneModeChanged() when laneModeChanged != null:
return laneModeChanged(_that.mode);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements DayViewEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DayViewEvent.started()';
}


}




/// @nodoc


class _LaneModeChanged implements DayViewEvent {
  const _LaneModeChanged(this.mode);
  

 final  LaneMode mode;

/// Create a copy of DayViewEvent
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
    return 'DayViewEvent.laneModeChanged(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$LaneModeChangedCopyWith<$Res> implements $DayViewEventCopyWith<$Res> {
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

/// Create a copy of DayViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_LaneModeChanged(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LaneMode,
  ));
}


}

/// @nodoc
mixin _$DayViewState {

 LocalDate get date; LaneMode get laneMode; DataState<DayView> get view;
/// Create a copy of DayViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayViewStateCopyWith<DayViewState> get copyWith => _$DayViewStateCopyWithImpl<DayViewState>(this as DayViewState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayViewState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayViewState&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.laneMode, _this.laneMode) || other.laneMode == _this.laneMode)&&(identical(other.view, _this.view) || other.view == _this.view));
}


@override
int get hashCode {
  final _this = this as DayViewState;
  return Object.hash(runtimeType,_this.date,_this.laneMode,_this.view);
}

@override
String toString() {
  final _this = this as DayViewState;
  return 'DayViewState(date: ${_this.date}, laneMode: ${_this.laneMode}, view: ${_this.view})';
}


}

/// @nodoc
abstract mixin class $DayViewStateCopyWith<$Res>  {
  factory $DayViewStateCopyWith(DayViewState value, $Res Function(DayViewState) _then) = _$DayViewStateCopyWithImpl;
@useResult
$Res call({
 LocalDate date, LaneMode laneMode, DataState<DayView> view
});


$DataStateCopyWith<DayView, $Res> get view;

}
/// @nodoc
class _$DayViewStateCopyWithImpl<$Res>
    implements $DayViewStateCopyWith<$Res> {
  _$DayViewStateCopyWithImpl(this._self, this._then);

  final DayViewState _self;
  final $Res Function(DayViewState) _then;

/// Create a copy of DayViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? laneMode = null,Object? view = null,}) {
  return _then(DayViewState(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as LocalDate,laneMode: null == laneMode ? _self.laneMode : laneMode // ignore: cast_nullable_to_non_nullable
as LaneMode,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as DataState<DayView>,
  ));
}
/// Create a copy of DayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<DayView, $Res> get view {
  
  return $DataStateCopyWith<DayView, $Res>(_self.view, (value) {
    return _then(_self.copyWith(view: value));
  });
}
}


/// Adds pattern-matching-related methods to [DayViewState].
extension DayViewStatePatterns on DayViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayViewState value)  $default,){
final _that = this;
switch (_that) {
case _DayViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayViewState value)?  $default,){
final _that = this;
switch (_that) {
case _DayViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocalDate date,  LaneMode laneMode,  DataState<DayView> view)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayViewState() when $default != null:
return $default(_that.date,_that.laneMode,_that.view);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocalDate date,  LaneMode laneMode,  DataState<DayView> view)  $default,) {final _that = this;
switch (_that) {
case _DayViewState():
return $default(_that.date,_that.laneMode,_that.view);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocalDate date,  LaneMode laneMode,  DataState<DayView> view)?  $default,) {final _that = this;
switch (_that) {
case _DayViewState() when $default != null:
return $default(_that.date,_that.laneMode,_that.view);case _:
  return null;

}
}

}

/// @nodoc


class _DayViewState implements DayViewState {
  const _DayViewState({required this.date, required this.laneMode, this.view = const DataState<DayView>.loading()});
  

@override final  LocalDate date;
@override final  LaneMode laneMode;
@override@JsonKey() final  DataState<DayView> view;

/// Create a copy of DayViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayViewStateCopyWith<_DayViewState> get copyWith => __$DayViewStateCopyWithImpl<_DayViewState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayViewState&&(identical(other.date, date) || other.date == date)&&(identical(other.laneMode, laneMode) || other.laneMode == laneMode)&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,laneMode,view);
}

@override
String toString() {
    return 'DayViewState(date: $date, laneMode: $laneMode, view: $view)';
}


}

/// @nodoc
abstract mixin class _$DayViewStateCopyWith<$Res> implements $DayViewStateCopyWith<$Res> {
  factory _$DayViewStateCopyWith(_DayViewState value, $Res Function(_DayViewState) _then) = __$DayViewStateCopyWithImpl;
@override @useResult
$Res call({
 LocalDate date, LaneMode laneMode, DataState<DayView> view
});


@override $DataStateCopyWith<DayView, $Res> get view;

}
/// @nodoc
class __$DayViewStateCopyWithImpl<$Res>
    implements _$DayViewStateCopyWith<$Res> {
  __$DayViewStateCopyWithImpl(this._self, this._then);

  final _DayViewState _self;
  final $Res Function(_DayViewState) _then;

/// Create a copy of DayViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? laneMode = null,Object? view = null,}) {
  return _then(_DayViewState(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as LocalDate,laneMode: null == laneMode ? _self.laneMode : laneMode // ignore: cast_nullable_to_non_nullable
as LaneMode,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as DataState<DayView>,
  ));
}

/// Create a copy of DayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<DayView, $Res> get view {
  
  return $DataStateCopyWith<DayView, $Res>(_self.view, (value) {
    return _then(_self.copyWith(view: value));
  });
}
}

// dart format on
