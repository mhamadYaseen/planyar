// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodayEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TodayEvent()';
}


}

/// @nodoc
class $TodayEventCopyWith<$Res>  {
$TodayEventCopyWith(TodayEvent _, $Res Function(TodayEvent) __);
}


/// Adds pattern-matching-related methods to [TodayEvent].
extension TodayEventPatterns on TodayEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _DateSelected value)?  dateSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DateSelected() when dateSelected != null:
return dateSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _DateSelected value)  dateSelected,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _DateSelected():
return dateSelected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _DateSelected value)?  dateSelected,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DateSelected() when dateSelected != null:
return dateSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( LocalDate date)?  dateSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DateSelected() when dateSelected != null:
return dateSelected(_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( LocalDate date)  dateSelected,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _DateSelected():
return dateSelected(_that.date);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( LocalDate date)?  dateSelected,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DateSelected() when dateSelected != null:
return dateSelected(_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TodayEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TodayEvent.started()';
}


}




/// @nodoc


class _DateSelected implements TodayEvent {
  const _DateSelected(this.date);
  

 final  LocalDate date;

/// Create a copy of TodayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateSelectedCopyWith<_DateSelected> get copyWith => __$DateSelectedCopyWithImpl<_DateSelected>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateSelected&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date);
}

@override
String toString() {
    return 'TodayEvent.dateSelected(date: $date)';
}


}

/// @nodoc
abstract mixin class _$DateSelectedCopyWith<$Res> implements $TodayEventCopyWith<$Res> {
  factory _$DateSelectedCopyWith(_DateSelected value, $Res Function(_DateSelected) _then) = __$DateSelectedCopyWithImpl;
@useResult
$Res call({
 LocalDate date
});




}
/// @nodoc
class __$DateSelectedCopyWithImpl<$Res>
    implements _$DateSelectedCopyWith<$Res> {
  __$DateSelectedCopyWithImpl(this._self, this._then);

  final _DateSelected _self;
  final $Res Function(_DateSelected) _then;

/// Create a copy of TodayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(_DateSelected(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as LocalDate,
  ));
}


}

/// @nodoc
mixin _$TodayState {

 LocalDate get today; LocalDate get selected;/// Open entries anywhere — the "◷ 2 to finish" chip (VIEW-05, §6.9).
 int get openCount;
/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayStateCopyWith<TodayState> get copyWith => _$TodayStateCopyWithImpl<TodayState>(this as TodayState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TodayState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayState&&(identical(other.today, _this.today) || other.today == _this.today)&&(identical(other.selected, _this.selected) || other.selected == _this.selected)&&(identical(other.openCount, _this.openCount) || other.openCount == _this.openCount));
}


@override
int get hashCode {
  final _this = this as TodayState;
  return Object.hash(runtimeType,_this.today,_this.selected,_this.openCount);
}

@override
String toString() {
  final _this = this as TodayState;
  return 'TodayState(today: ${_this.today}, selected: ${_this.selected}, openCount: ${_this.openCount})';
}


}

/// @nodoc
abstract mixin class $TodayStateCopyWith<$Res>  {
  factory $TodayStateCopyWith(TodayState value, $Res Function(TodayState) _then) = _$TodayStateCopyWithImpl;
@useResult
$Res call({
 LocalDate today, LocalDate selected, int openCount
});




}
/// @nodoc
class _$TodayStateCopyWithImpl<$Res>
    implements $TodayStateCopyWith<$Res> {
  _$TodayStateCopyWithImpl(this._self, this._then);

  final TodayState _self;
  final $Res Function(TodayState) _then;

/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? today = null,Object? selected = null,Object? openCount = null,}) {
  return _then(TodayState(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as LocalDate,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as LocalDate,openCount: null == openCount ? _self.openCount : openCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TodayState].
extension TodayStatePatterns on TodayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayState value)  $default,){
final _that = this;
switch (_that) {
case _TodayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayState value)?  $default,){
final _that = this;
switch (_that) {
case _TodayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocalDate today,  LocalDate selected,  int openCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayState() when $default != null:
return $default(_that.today,_that.selected,_that.openCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocalDate today,  LocalDate selected,  int openCount)  $default,) {final _that = this;
switch (_that) {
case _TodayState():
return $default(_that.today,_that.selected,_that.openCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocalDate today,  LocalDate selected,  int openCount)?  $default,) {final _that = this;
switch (_that) {
case _TodayState() when $default != null:
return $default(_that.today,_that.selected,_that.openCount);case _:
  return null;

}
}

}

/// @nodoc


class _TodayState implements TodayState {
  const _TodayState({required this.today, required this.selected, this.openCount = 0});
  

@override final  LocalDate today;
@override final  LocalDate selected;
/// Open entries anywhere — the "◷ 2 to finish" chip (VIEW-05, §6.9).
@override@JsonKey() final  int openCount;

/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayStateCopyWith<_TodayState> get copyWith => __$TodayStateCopyWithImpl<_TodayState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayState&&(identical(other.today, today) || other.today == today)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.openCount, openCount) || other.openCount == openCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,today,selected,openCount);
}

@override
String toString() {
    return 'TodayState(today: $today, selected: $selected, openCount: $openCount)';
}


}

/// @nodoc
abstract mixin class _$TodayStateCopyWith<$Res> implements $TodayStateCopyWith<$Res> {
  factory _$TodayStateCopyWith(_TodayState value, $Res Function(_TodayState) _then) = __$TodayStateCopyWithImpl;
@override @useResult
$Res call({
 LocalDate today, LocalDate selected, int openCount
});




}
/// @nodoc
class __$TodayStateCopyWithImpl<$Res>
    implements _$TodayStateCopyWith<$Res> {
  __$TodayStateCopyWithImpl(this._self, this._then);

  final _TodayState _self;
  final $Res Function(_TodayState) _then;

/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? today = null,Object? selected = null,Object? openCount = null,}) {
  return _then(_TodayState(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as LocalDate,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as LocalDate,openCount: null == openCount ? _self.openCount : openCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
