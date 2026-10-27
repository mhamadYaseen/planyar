// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EntryFormEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EntryFormEvent()';
}


}

/// @nodoc
class $EntryFormEventCopyWith<$Res>  {
$EntryFormEventCopyWith(EntryFormEvent _, $Res Function(EntryFormEvent) __);
}


/// Adds pattern-matching-related methods to [EntryFormEvent].
extension EntryFormEventPatterns on EntryFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _KindChanged value)?  kindChanged,TResult Function( _LabelSelected value)?  labelSelected,TResult Function( _StartDateSet value)?  startDateSet,TResult Function( _StartTimeSet value)?  startTimeSet,TResult Function( _StartNudged value)?  startNudged,TResult Function( _EndDateSet value)?  endDateSet,TResult Function( _EndTimeSet value)?  endTimeSet,TResult Function( _EndNudged value)?  endNudged,TResult Function( _DurationPicked value)?  durationPicked,TResult Function( _EndNowPressed value)?  endNowPressed,TResult Function( _OpenEndToggled value)?  openEndToggled,TResult Function( _NoteChanged value)?  noteChanged,TResult Function( _CategoryOverrideChanged value)?  categoryOverrideChanged,TResult Function( _SavePressed value)?  savePressed,TResult Function( _DeletePressed value)?  deletePressed,TResult Function( _OverlapCheckRequested value)?  overlapCheckRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _KindChanged() when kindChanged != null:
return kindChanged(_that);case _LabelSelected() when labelSelected != null:
return labelSelected(_that);case _StartDateSet() when startDateSet != null:
return startDateSet(_that);case _StartTimeSet() when startTimeSet != null:
return startTimeSet(_that);case _StartNudged() when startNudged != null:
return startNudged(_that);case _EndDateSet() when endDateSet != null:
return endDateSet(_that);case _EndTimeSet() when endTimeSet != null:
return endTimeSet(_that);case _EndNudged() when endNudged != null:
return endNudged(_that);case _DurationPicked() when durationPicked != null:
return durationPicked(_that);case _EndNowPressed() when endNowPressed != null:
return endNowPressed(_that);case _OpenEndToggled() when openEndToggled != null:
return openEndToggled(_that);case _NoteChanged() when noteChanged != null:
return noteChanged(_that);case _CategoryOverrideChanged() when categoryOverrideChanged != null:
return categoryOverrideChanged(_that);case _SavePressed() when savePressed != null:
return savePressed(_that);case _DeletePressed() when deletePressed != null:
return deletePressed(_that);case _OverlapCheckRequested() when overlapCheckRequested != null:
return overlapCheckRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _KindChanged value)  kindChanged,required TResult Function( _LabelSelected value)  labelSelected,required TResult Function( _StartDateSet value)  startDateSet,required TResult Function( _StartTimeSet value)  startTimeSet,required TResult Function( _StartNudged value)  startNudged,required TResult Function( _EndDateSet value)  endDateSet,required TResult Function( _EndTimeSet value)  endTimeSet,required TResult Function( _EndNudged value)  endNudged,required TResult Function( _DurationPicked value)  durationPicked,required TResult Function( _EndNowPressed value)  endNowPressed,required TResult Function( _OpenEndToggled value)  openEndToggled,required TResult Function( _NoteChanged value)  noteChanged,required TResult Function( _CategoryOverrideChanged value)  categoryOverrideChanged,required TResult Function( _SavePressed value)  savePressed,required TResult Function( _DeletePressed value)  deletePressed,required TResult Function( _OverlapCheckRequested value)  overlapCheckRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _KindChanged():
return kindChanged(_that);case _LabelSelected():
return labelSelected(_that);case _StartDateSet():
return startDateSet(_that);case _StartTimeSet():
return startTimeSet(_that);case _StartNudged():
return startNudged(_that);case _EndDateSet():
return endDateSet(_that);case _EndTimeSet():
return endTimeSet(_that);case _EndNudged():
return endNudged(_that);case _DurationPicked():
return durationPicked(_that);case _EndNowPressed():
return endNowPressed(_that);case _OpenEndToggled():
return openEndToggled(_that);case _NoteChanged():
return noteChanged(_that);case _CategoryOverrideChanged():
return categoryOverrideChanged(_that);case _SavePressed():
return savePressed(_that);case _DeletePressed():
return deletePressed(_that);case _OverlapCheckRequested():
return overlapCheckRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _KindChanged value)?  kindChanged,TResult? Function( _LabelSelected value)?  labelSelected,TResult? Function( _StartDateSet value)?  startDateSet,TResult? Function( _StartTimeSet value)?  startTimeSet,TResult? Function( _StartNudged value)?  startNudged,TResult? Function( _EndDateSet value)?  endDateSet,TResult? Function( _EndTimeSet value)?  endTimeSet,TResult? Function( _EndNudged value)?  endNudged,TResult? Function( _DurationPicked value)?  durationPicked,TResult? Function( _EndNowPressed value)?  endNowPressed,TResult? Function( _OpenEndToggled value)?  openEndToggled,TResult? Function( _NoteChanged value)?  noteChanged,TResult? Function( _CategoryOverrideChanged value)?  categoryOverrideChanged,TResult? Function( _SavePressed value)?  savePressed,TResult? Function( _DeletePressed value)?  deletePressed,TResult? Function( _OverlapCheckRequested value)?  overlapCheckRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _KindChanged() when kindChanged != null:
return kindChanged(_that);case _LabelSelected() when labelSelected != null:
return labelSelected(_that);case _StartDateSet() when startDateSet != null:
return startDateSet(_that);case _StartTimeSet() when startTimeSet != null:
return startTimeSet(_that);case _StartNudged() when startNudged != null:
return startNudged(_that);case _EndDateSet() when endDateSet != null:
return endDateSet(_that);case _EndTimeSet() when endTimeSet != null:
return endTimeSet(_that);case _EndNudged() when endNudged != null:
return endNudged(_that);case _DurationPicked() when durationPicked != null:
return durationPicked(_that);case _EndNowPressed() when endNowPressed != null:
return endNowPressed(_that);case _OpenEndToggled() when openEndToggled != null:
return openEndToggled(_that);case _NoteChanged() when noteChanged != null:
return noteChanged(_that);case _CategoryOverrideChanged() when categoryOverrideChanged != null:
return categoryOverrideChanged(_that);case _SavePressed() when savePressed != null:
return savePressed(_that);case _DeletePressed() when deletePressed != null:
return deletePressed(_that);case _OverlapCheckRequested() when overlapCheckRequested != null:
return overlapCheckRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EntryFormRequest request)?  started,TResult Function( EntryKind kind)?  kindChanged,TResult Function( String labelId)?  labelSelected,TResult Function( LocalDate date)?  startDateSet,TResult Function( WallTime time)?  startTimeSet,TResult Function( int minutes)?  startNudged,TResult Function( LocalDate date)?  endDateSet,TResult Function( WallTime time)?  endTimeSet,TResult Function( int minutes)?  endNudged,TResult Function( Duration duration)?  durationPicked,TResult Function()?  endNowPressed,TResult Function( bool open)?  openEndToggled,TResult Function( String note)?  noteChanged,TResult Function( String? categoryId)?  categoryOverrideChanged,TResult Function()?  savePressed,TResult Function()?  deletePressed,TResult Function()?  overlapCheckRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.request);case _KindChanged() when kindChanged != null:
return kindChanged(_that.kind);case _LabelSelected() when labelSelected != null:
return labelSelected(_that.labelId);case _StartDateSet() when startDateSet != null:
return startDateSet(_that.date);case _StartTimeSet() when startTimeSet != null:
return startTimeSet(_that.time);case _StartNudged() when startNudged != null:
return startNudged(_that.minutes);case _EndDateSet() when endDateSet != null:
return endDateSet(_that.date);case _EndTimeSet() when endTimeSet != null:
return endTimeSet(_that.time);case _EndNudged() when endNudged != null:
return endNudged(_that.minutes);case _DurationPicked() when durationPicked != null:
return durationPicked(_that.duration);case _EndNowPressed() when endNowPressed != null:
return endNowPressed();case _OpenEndToggled() when openEndToggled != null:
return openEndToggled(_that.open);case _NoteChanged() when noteChanged != null:
return noteChanged(_that.note);case _CategoryOverrideChanged() when categoryOverrideChanged != null:
return categoryOverrideChanged(_that.categoryId);case _SavePressed() when savePressed != null:
return savePressed();case _DeletePressed() when deletePressed != null:
return deletePressed();case _OverlapCheckRequested() when overlapCheckRequested != null:
return overlapCheckRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EntryFormRequest request)  started,required TResult Function( EntryKind kind)  kindChanged,required TResult Function( String labelId)  labelSelected,required TResult Function( LocalDate date)  startDateSet,required TResult Function( WallTime time)  startTimeSet,required TResult Function( int minutes)  startNudged,required TResult Function( LocalDate date)  endDateSet,required TResult Function( WallTime time)  endTimeSet,required TResult Function( int minutes)  endNudged,required TResult Function( Duration duration)  durationPicked,required TResult Function()  endNowPressed,required TResult Function( bool open)  openEndToggled,required TResult Function( String note)  noteChanged,required TResult Function( String? categoryId)  categoryOverrideChanged,required TResult Function()  savePressed,required TResult Function()  deletePressed,required TResult Function()  overlapCheckRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.request);case _KindChanged():
return kindChanged(_that.kind);case _LabelSelected():
return labelSelected(_that.labelId);case _StartDateSet():
return startDateSet(_that.date);case _StartTimeSet():
return startTimeSet(_that.time);case _StartNudged():
return startNudged(_that.minutes);case _EndDateSet():
return endDateSet(_that.date);case _EndTimeSet():
return endTimeSet(_that.time);case _EndNudged():
return endNudged(_that.minutes);case _DurationPicked():
return durationPicked(_that.duration);case _EndNowPressed():
return endNowPressed();case _OpenEndToggled():
return openEndToggled(_that.open);case _NoteChanged():
return noteChanged(_that.note);case _CategoryOverrideChanged():
return categoryOverrideChanged(_that.categoryId);case _SavePressed():
return savePressed();case _DeletePressed():
return deletePressed();case _OverlapCheckRequested():
return overlapCheckRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EntryFormRequest request)?  started,TResult? Function( EntryKind kind)?  kindChanged,TResult? Function( String labelId)?  labelSelected,TResult? Function( LocalDate date)?  startDateSet,TResult? Function( WallTime time)?  startTimeSet,TResult? Function( int minutes)?  startNudged,TResult? Function( LocalDate date)?  endDateSet,TResult? Function( WallTime time)?  endTimeSet,TResult? Function( int minutes)?  endNudged,TResult? Function( Duration duration)?  durationPicked,TResult? Function()?  endNowPressed,TResult? Function( bool open)?  openEndToggled,TResult? Function( String note)?  noteChanged,TResult? Function( String? categoryId)?  categoryOverrideChanged,TResult? Function()?  savePressed,TResult? Function()?  deletePressed,TResult? Function()?  overlapCheckRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.request);case _KindChanged() when kindChanged != null:
return kindChanged(_that.kind);case _LabelSelected() when labelSelected != null:
return labelSelected(_that.labelId);case _StartDateSet() when startDateSet != null:
return startDateSet(_that.date);case _StartTimeSet() when startTimeSet != null:
return startTimeSet(_that.time);case _StartNudged() when startNudged != null:
return startNudged(_that.minutes);case _EndDateSet() when endDateSet != null:
return endDateSet(_that.date);case _EndTimeSet() when endTimeSet != null:
return endTimeSet(_that.time);case _EndNudged() when endNudged != null:
return endNudged(_that.minutes);case _DurationPicked() when durationPicked != null:
return durationPicked(_that.duration);case _EndNowPressed() when endNowPressed != null:
return endNowPressed();case _OpenEndToggled() when openEndToggled != null:
return openEndToggled(_that.open);case _NoteChanged() when noteChanged != null:
return noteChanged(_that.note);case _CategoryOverrideChanged() when categoryOverrideChanged != null:
return categoryOverrideChanged(_that.categoryId);case _SavePressed() when savePressed != null:
return savePressed();case _DeletePressed() when deletePressed != null:
return deletePressed();case _OverlapCheckRequested() when overlapCheckRequested != null:
return overlapCheckRequested();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements EntryFormEvent {
  const _Started(this.request);
  

 final  EntryFormRequest request;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'EntryFormEvent.started(request: $request)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 EntryFormRequest request
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_Started(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as EntryFormRequest,
  ));
}


}

/// @nodoc


class _KindChanged implements EntryFormEvent {
  const _KindChanged(this.kind);
  

 final  EntryKind kind;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KindChangedCopyWith<_KindChanged> get copyWith => __$KindChangedCopyWithImpl<_KindChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _KindChanged&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind);
}

@override
String toString() {
    return 'EntryFormEvent.kindChanged(kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$KindChangedCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$KindChangedCopyWith(_KindChanged value, $Res Function(_KindChanged) _then) = __$KindChangedCopyWithImpl;
@useResult
$Res call({
 EntryKind kind
});




}
/// @nodoc
class __$KindChangedCopyWithImpl<$Res>
    implements _$KindChangedCopyWith<$Res> {
  __$KindChangedCopyWithImpl(this._self, this._then);

  final _KindChanged _self;
  final $Res Function(_KindChanged) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,}) {
  return _then(_KindChanged(
null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EntryKind,
  ));
}


}

/// @nodoc


class _LabelSelected implements EntryFormEvent {
  const _LabelSelected(this.labelId);
  

 final  String labelId;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelSelectedCopyWith<_LabelSelected> get copyWith => __$LabelSelectedCopyWithImpl<_LabelSelected>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabelSelected&&(identical(other.labelId, labelId) || other.labelId == labelId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,labelId);
}

@override
String toString() {
    return 'EntryFormEvent.labelSelected(labelId: $labelId)';
}


}

/// @nodoc
abstract mixin class _$LabelSelectedCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$LabelSelectedCopyWith(_LabelSelected value, $Res Function(_LabelSelected) _then) = __$LabelSelectedCopyWithImpl;
@useResult
$Res call({
 String labelId
});




}
/// @nodoc
class __$LabelSelectedCopyWithImpl<$Res>
    implements _$LabelSelectedCopyWith<$Res> {
  __$LabelSelectedCopyWithImpl(this._self, this._then);

  final _LabelSelected _self;
  final $Res Function(_LabelSelected) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? labelId = null,}) {
  return _then(_LabelSelected(
null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StartDateSet implements EntryFormEvent {
  const _StartDateSet(this.date);
  

 final  LocalDate date;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartDateSetCopyWith<_StartDateSet> get copyWith => __$StartDateSetCopyWithImpl<_StartDateSet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartDateSet&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date);
}

@override
String toString() {
    return 'EntryFormEvent.startDateSet(date: $date)';
}


}

/// @nodoc
abstract mixin class _$StartDateSetCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$StartDateSetCopyWith(_StartDateSet value, $Res Function(_StartDateSet) _then) = __$StartDateSetCopyWithImpl;
@useResult
$Res call({
 LocalDate date
});




}
/// @nodoc
class __$StartDateSetCopyWithImpl<$Res>
    implements _$StartDateSetCopyWith<$Res> {
  __$StartDateSetCopyWithImpl(this._self, this._then);

  final _StartDateSet _self;
  final $Res Function(_StartDateSet) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(_StartDateSet(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as LocalDate,
  ));
}


}

/// @nodoc


class _StartTimeSet implements EntryFormEvent {
  const _StartTimeSet(this.time);
  

 final  WallTime time;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartTimeSetCopyWith<_StartTimeSet> get copyWith => __$StartTimeSetCopyWithImpl<_StartTimeSet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartTimeSet&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode {
    return Object.hash(runtimeType,time);
}

@override
String toString() {
    return 'EntryFormEvent.startTimeSet(time: $time)';
}


}

/// @nodoc
abstract mixin class _$StartTimeSetCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$StartTimeSetCopyWith(_StartTimeSet value, $Res Function(_StartTimeSet) _then) = __$StartTimeSetCopyWithImpl;
@useResult
$Res call({
 WallTime time
});




}
/// @nodoc
class __$StartTimeSetCopyWithImpl<$Res>
    implements _$StartTimeSetCopyWith<$Res> {
  __$StartTimeSetCopyWithImpl(this._self, this._then);

  final _StartTimeSet _self;
  final $Res Function(_StartTimeSet) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? time = null,}) {
  return _then(_StartTimeSet(
null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as WallTime,
  ));
}


}

/// @nodoc


class _StartNudged implements EntryFormEvent {
  const _StartNudged(this.minutes);
  

 final  int minutes;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartNudgedCopyWith<_StartNudged> get copyWith => __$StartNudgedCopyWithImpl<_StartNudged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartNudged&&(identical(other.minutes, minutes) || other.minutes == minutes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,minutes);
}

@override
String toString() {
    return 'EntryFormEvent.startNudged(minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$StartNudgedCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$StartNudgedCopyWith(_StartNudged value, $Res Function(_StartNudged) _then) = __$StartNudgedCopyWithImpl;
@useResult
$Res call({
 int minutes
});




}
/// @nodoc
class __$StartNudgedCopyWithImpl<$Res>
    implements _$StartNudgedCopyWith<$Res> {
  __$StartNudgedCopyWithImpl(this._self, this._then);

  final _StartNudged _self;
  final $Res Function(_StartNudged) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minutes = null,}) {
  return _then(_StartNudged(
null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _EndDateSet implements EntryFormEvent {
  const _EndDateSet(this.date);
  

 final  LocalDate date;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndDateSetCopyWith<_EndDateSet> get copyWith => __$EndDateSetCopyWithImpl<_EndDateSet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndDateSet&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date);
}

@override
String toString() {
    return 'EntryFormEvent.endDateSet(date: $date)';
}


}

/// @nodoc
abstract mixin class _$EndDateSetCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$EndDateSetCopyWith(_EndDateSet value, $Res Function(_EndDateSet) _then) = __$EndDateSetCopyWithImpl;
@useResult
$Res call({
 LocalDate date
});




}
/// @nodoc
class __$EndDateSetCopyWithImpl<$Res>
    implements _$EndDateSetCopyWith<$Res> {
  __$EndDateSetCopyWithImpl(this._self, this._then);

  final _EndDateSet _self;
  final $Res Function(_EndDateSet) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(_EndDateSet(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as LocalDate,
  ));
}


}

/// @nodoc


class _EndTimeSet implements EntryFormEvent {
  const _EndTimeSet(this.time);
  

 final  WallTime time;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndTimeSetCopyWith<_EndTimeSet> get copyWith => __$EndTimeSetCopyWithImpl<_EndTimeSet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndTimeSet&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode {
    return Object.hash(runtimeType,time);
}

@override
String toString() {
    return 'EntryFormEvent.endTimeSet(time: $time)';
}


}

/// @nodoc
abstract mixin class _$EndTimeSetCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$EndTimeSetCopyWith(_EndTimeSet value, $Res Function(_EndTimeSet) _then) = __$EndTimeSetCopyWithImpl;
@useResult
$Res call({
 WallTime time
});




}
/// @nodoc
class __$EndTimeSetCopyWithImpl<$Res>
    implements _$EndTimeSetCopyWith<$Res> {
  __$EndTimeSetCopyWithImpl(this._self, this._then);

  final _EndTimeSet _self;
  final $Res Function(_EndTimeSet) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? time = null,}) {
  return _then(_EndTimeSet(
null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as WallTime,
  ));
}


}

/// @nodoc


class _EndNudged implements EntryFormEvent {
  const _EndNudged(this.minutes);
  

 final  int minutes;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndNudgedCopyWith<_EndNudged> get copyWith => __$EndNudgedCopyWithImpl<_EndNudged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndNudged&&(identical(other.minutes, minutes) || other.minutes == minutes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,minutes);
}

@override
String toString() {
    return 'EntryFormEvent.endNudged(minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$EndNudgedCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$EndNudgedCopyWith(_EndNudged value, $Res Function(_EndNudged) _then) = __$EndNudgedCopyWithImpl;
@useResult
$Res call({
 int minutes
});




}
/// @nodoc
class __$EndNudgedCopyWithImpl<$Res>
    implements _$EndNudgedCopyWith<$Res> {
  __$EndNudgedCopyWithImpl(this._self, this._then);

  final _EndNudged _self;
  final $Res Function(_EndNudged) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minutes = null,}) {
  return _then(_EndNudged(
null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DurationPicked implements EntryFormEvent {
  const _DurationPicked(this.duration);
  

 final  Duration duration;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DurationPickedCopyWith<_DurationPicked> get copyWith => __$DurationPickedCopyWithImpl<_DurationPicked>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DurationPicked&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode {
    return Object.hash(runtimeType,duration);
}

@override
String toString() {
    return 'EntryFormEvent.durationPicked(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$DurationPickedCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$DurationPickedCopyWith(_DurationPicked value, $Res Function(_DurationPicked) _then) = __$DurationPickedCopyWithImpl;
@useResult
$Res call({
 Duration duration
});




}
/// @nodoc
class __$DurationPickedCopyWithImpl<$Res>
    implements _$DurationPickedCopyWith<$Res> {
  __$DurationPickedCopyWithImpl(this._self, this._then);

  final _DurationPicked _self;
  final $Res Function(_DurationPicked) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_DurationPicked(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class _EndNowPressed implements EntryFormEvent {
  const _EndNowPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndNowPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EntryFormEvent.endNowPressed()';
}


}




/// @nodoc


class _OpenEndToggled implements EntryFormEvent {
  const _OpenEndToggled({required this.open});
  

 final  bool open;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenEndToggledCopyWith<_OpenEndToggled> get copyWith => __$OpenEndToggledCopyWithImpl<_OpenEndToggled>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenEndToggled&&(identical(other.open, open) || other.open == open));
}


@override
int get hashCode {
    return Object.hash(runtimeType,open);
}

@override
String toString() {
    return 'EntryFormEvent.openEndToggled(open: $open)';
}


}

/// @nodoc
abstract mixin class _$OpenEndToggledCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$OpenEndToggledCopyWith(_OpenEndToggled value, $Res Function(_OpenEndToggled) _then) = __$OpenEndToggledCopyWithImpl;
@useResult
$Res call({
 bool open
});




}
/// @nodoc
class __$OpenEndToggledCopyWithImpl<$Res>
    implements _$OpenEndToggledCopyWith<$Res> {
  __$OpenEndToggledCopyWithImpl(this._self, this._then);

  final _OpenEndToggled _self;
  final $Res Function(_OpenEndToggled) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? open = null,}) {
  return _then(_OpenEndToggled(
open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _NoteChanged implements EntryFormEvent {
  const _NoteChanged(this.note);
  

 final  String note;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteChangedCopyWith<_NoteChanged> get copyWith => __$NoteChangedCopyWithImpl<_NoteChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteChanged&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,note);
}

@override
String toString() {
    return 'EntryFormEvent.noteChanged(note: $note)';
}


}

/// @nodoc
abstract mixin class _$NoteChangedCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$NoteChangedCopyWith(_NoteChanged value, $Res Function(_NoteChanged) _then) = __$NoteChangedCopyWithImpl;
@useResult
$Res call({
 String note
});




}
/// @nodoc
class __$NoteChangedCopyWithImpl<$Res>
    implements _$NoteChangedCopyWith<$Res> {
  __$NoteChangedCopyWithImpl(this._self, this._then);

  final _NoteChanged _self;
  final $Res Function(_NoteChanged) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_NoteChanged(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CategoryOverrideChanged implements EntryFormEvent {
  const _CategoryOverrideChanged(this.categoryId);
  

 final  String? categoryId;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryOverrideChangedCopyWith<_CategoryOverrideChanged> get copyWith => __$CategoryOverrideChangedCopyWithImpl<_CategoryOverrideChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryOverrideChanged&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,categoryId);
}

@override
String toString() {
    return 'EntryFormEvent.categoryOverrideChanged(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$CategoryOverrideChangedCopyWith<$Res> implements $EntryFormEventCopyWith<$Res> {
  factory _$CategoryOverrideChangedCopyWith(_CategoryOverrideChanged value, $Res Function(_CategoryOverrideChanged) _then) = __$CategoryOverrideChangedCopyWithImpl;
@useResult
$Res call({
 String? categoryId
});




}
/// @nodoc
class __$CategoryOverrideChangedCopyWithImpl<$Res>
    implements _$CategoryOverrideChangedCopyWith<$Res> {
  __$CategoryOverrideChangedCopyWithImpl(this._self, this._then);

  final _CategoryOverrideChanged _self;
  final $Res Function(_CategoryOverrideChanged) _then;

/// Create a copy of EntryFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,}) {
  return _then(_CategoryOverrideChanged(
freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SavePressed implements EntryFormEvent {
  const _SavePressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EntryFormEvent.savePressed()';
}


}




/// @nodoc


class _DeletePressed implements EntryFormEvent {
  const _DeletePressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EntryFormEvent.deletePressed()';
}


}




/// @nodoc


class _OverlapCheckRequested implements EntryFormEvent {
  const _OverlapCheckRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlapCheckRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EntryFormEvent.overlapCheckRequested()';
}


}




/// @nodoc
mixin _$EntryFormState {

 EntryFormStatus get status;/// The entry being edited; null when creating.
 Entry? get original; EntryKind get kind;/// True once the user picked a kind; stops the automatic switch.
 bool get kindTouched; String? get labelId; Instant? get start;/// Null = "No end yet".
 Instant? get end;/// True once the user set the end; stops planned-duration defaults.
 bool get endTouched;/// The end before "No end yet" was chosen, to bring it back.
 Instant? get endBeforeOpen; String get note; String? get categoryOverrideId;/// Every label (archived too, for names) and the quick-chip order.
 Map<String, Label> get labels; List<Label> get quickLabels;/// Same-kind entries this one would overlap — a warning, never a block.
 List<Entry> get overlaps; EntryCheck get check;/// The saved or deleted entry, for the caller's Undo snackbar.
 Entry? get result; Failure? get failure;
/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryFormStateCopyWith<EntryFormState> get copyWith => _$EntryFormStateCopyWithImpl<EntryFormState>(this as EntryFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EntryFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryFormState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.original, _this.original) || other.original == _this.original)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.kindTouched, _this.kindTouched) || other.kindTouched == _this.kindTouched)&&(identical(other.labelId, _this.labelId) || other.labelId == _this.labelId)&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end)&&(identical(other.endTouched, _this.endTouched) || other.endTouched == _this.endTouched)&&(identical(other.endBeforeOpen, _this.endBeforeOpen) || other.endBeforeOpen == _this.endBeforeOpen)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.categoryOverrideId, _this.categoryOverrideId) || other.categoryOverrideId == _this.categoryOverrideId)&&const DeepCollectionEquality().equals(other.labels, _this.labels)&&const DeepCollectionEquality().equals(other.quickLabels, _this.quickLabels)&&const DeepCollectionEquality().equals(other.overlaps, _this.overlaps)&&(identical(other.check, _this.check) || other.check == _this.check)&&(identical(other.result, _this.result) || other.result == _this.result)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as EntryFormState;
  return Object.hash(runtimeType,_this.status,_this.original,_this.kind,_this.kindTouched,_this.labelId,_this.start,_this.end,_this.endTouched,_this.endBeforeOpen,_this.note,_this.categoryOverrideId,const DeepCollectionEquality().hash(_this.labels),const DeepCollectionEquality().hash(_this.quickLabels),const DeepCollectionEquality().hash(_this.overlaps),_this.check,_this.result,_this.failure);
}

@override
String toString() {
  final _this = this as EntryFormState;
  return 'EntryFormState(status: ${_this.status}, original: ${_this.original}, kind: ${_this.kind}, kindTouched: ${_this.kindTouched}, labelId: ${_this.labelId}, start: ${_this.start}, end: ${_this.end}, endTouched: ${_this.endTouched}, endBeforeOpen: ${_this.endBeforeOpen}, note: ${_this.note}, categoryOverrideId: ${_this.categoryOverrideId}, labels: ${_this.labels}, quickLabels: ${_this.quickLabels}, overlaps: ${_this.overlaps}, check: ${_this.check}, result: ${_this.result}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $EntryFormStateCopyWith<$Res>  {
  factory $EntryFormStateCopyWith(EntryFormState value, $Res Function(EntryFormState) _then) = _$EntryFormStateCopyWithImpl;
@useResult
$Res call({
 EntryFormStatus status, Entry? original, EntryKind kind, bool kindTouched, String? labelId, Instant? start, Instant? end, bool endTouched, Instant? endBeforeOpen, String note, String? categoryOverrideId, Map<String, Label> labels, List<Label> quickLabels, List<Entry> overlaps, EntryCheck check, Entry? result, Failure? failure
});


$EntryCopyWith<$Res>? get original;$EntryCopyWith<$Res>? get result;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$EntryFormStateCopyWithImpl<$Res>
    implements $EntryFormStateCopyWith<$Res> {
  _$EntryFormStateCopyWithImpl(this._self, this._then);

  final EntryFormState _self;
  final $Res Function(EntryFormState) _then;

/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? original = freezed,Object? kind = null,Object? kindTouched = null,Object? labelId = freezed,Object? start = freezed,Object? end = freezed,Object? endTouched = null,Object? endBeforeOpen = freezed,Object? note = null,Object? categoryOverrideId = freezed,Object? labels = null,Object? quickLabels = null,Object? overlaps = null,Object? check = null,Object? result = freezed,Object? failure = freezed,}) {
  return _then(EntryFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EntryFormStatus,original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Entry?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EntryKind,kindTouched: null == kindTouched ? _self.kindTouched : kindTouched // ignore: cast_nullable_to_non_nullable
as bool,labelId: freezed == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Instant?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant?,endTouched: null == endTouched ? _self.endTouched : endTouched // ignore: cast_nullable_to_non_nullable
as bool,endBeforeOpen: freezed == endBeforeOpen ? _self.endBeforeOpen : endBeforeOpen // ignore: cast_nullable_to_non_nullable
as Instant?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,categoryOverrideId: freezed == categoryOverrideId ? _self.categoryOverrideId : categoryOverrideId // ignore: cast_nullable_to_non_nullable
as String?,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as Map<String, Label>,quickLabels: null == quickLabels ? _self.quickLabels : quickLabels // ignore: cast_nullable_to_non_nullable
as List<Label>,overlaps: null == overlaps ? _self.overlaps : overlaps // ignore: cast_nullable_to_non_nullable
as List<Entry>,check: null == check ? _self.check : check // ignore: cast_nullable_to_non_nullable
as EntryCheck,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Entry?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $EntryCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $EntryCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [EntryFormState].
extension EntryFormStatePatterns on EntryFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntryFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntryFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntryFormState value)  $default,){
final _that = this;
switch (_that) {
case _EntryFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntryFormState value)?  $default,){
final _that = this;
switch (_that) {
case _EntryFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EntryFormStatus status,  Entry? original,  EntryKind kind,  bool kindTouched,  String? labelId,  Instant? start,  Instant? end,  bool endTouched,  Instant? endBeforeOpen,  String note,  String? categoryOverrideId,  Map<String, Label> labels,  List<Label> quickLabels,  List<Entry> overlaps,  EntryCheck check,  Entry? result,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntryFormState() when $default != null:
return $default(_that.status,_that.original,_that.kind,_that.kindTouched,_that.labelId,_that.start,_that.end,_that.endTouched,_that.endBeforeOpen,_that.note,_that.categoryOverrideId,_that.labels,_that.quickLabels,_that.overlaps,_that.check,_that.result,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EntryFormStatus status,  Entry? original,  EntryKind kind,  bool kindTouched,  String? labelId,  Instant? start,  Instant? end,  bool endTouched,  Instant? endBeforeOpen,  String note,  String? categoryOverrideId,  Map<String, Label> labels,  List<Label> quickLabels,  List<Entry> overlaps,  EntryCheck check,  Entry? result,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _EntryFormState():
return $default(_that.status,_that.original,_that.kind,_that.kindTouched,_that.labelId,_that.start,_that.end,_that.endTouched,_that.endBeforeOpen,_that.note,_that.categoryOverrideId,_that.labels,_that.quickLabels,_that.overlaps,_that.check,_that.result,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EntryFormStatus status,  Entry? original,  EntryKind kind,  bool kindTouched,  String? labelId,  Instant? start,  Instant? end,  bool endTouched,  Instant? endBeforeOpen,  String note,  String? categoryOverrideId,  Map<String, Label> labels,  List<Label> quickLabels,  List<Entry> overlaps,  EntryCheck check,  Entry? result,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _EntryFormState() when $default != null:
return $default(_that.status,_that.original,_that.kind,_that.kindTouched,_that.labelId,_that.start,_that.end,_that.endTouched,_that.endBeforeOpen,_that.note,_that.categoryOverrideId,_that.labels,_that.quickLabels,_that.overlaps,_that.check,_that.result,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _EntryFormState extends EntryFormState {
  const _EntryFormState({this.status = EntryFormStatus.loading, this.original, this.kind = EntryKind.actual, this.kindTouched = false, this.labelId, this.start, this.end, this.endTouched = false, this.endBeforeOpen, this.note = '', this.categoryOverrideId,  Map<String, Label> labels = const <String, Label>{},  List<Label> quickLabels = const <Label>[],  List<Entry> overlaps = const <Entry>[], this.check = const EntryCheck(), this.result, this.failure}): _labels = labels,_quickLabels = quickLabels,_overlaps = overlaps,super._();
  

@override@JsonKey() final  EntryFormStatus status;
/// The entry being edited; null when creating.
@override final  Entry? original;
@override@JsonKey() final  EntryKind kind;
/// True once the user picked a kind; stops the automatic switch.
@override@JsonKey() final  bool kindTouched;
@override final  String? labelId;
@override final  Instant? start;
/// Null = "No end yet".
@override final  Instant? end;
/// True once the user set the end; stops planned-duration defaults.
@override@JsonKey() final  bool endTouched;
/// The end before "No end yet" was chosen, to bring it back.
@override final  Instant? endBeforeOpen;
@override@JsonKey() final  String note;
@override final  String? categoryOverrideId;
/// Every label (archived too, for names) and the quick-chip order.
 final  Map<String, Label> _labels;
/// Every label (archived too, for names) and the quick-chip order.
@override@JsonKey() Map<String, Label> get labels {
  if (_labels is EqualUnmodifiableMapView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_labels);
}

 final  List<Label> _quickLabels;
@override@JsonKey() List<Label> get quickLabels {
  if (_quickLabels is EqualUnmodifiableListView) return _quickLabels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quickLabels);
}

/// Same-kind entries this one would overlap — a warning, never a block.
 final  List<Entry> _overlaps;
/// Same-kind entries this one would overlap — a warning, never a block.
@override@JsonKey() List<Entry> get overlaps {
  if (_overlaps is EqualUnmodifiableListView) return _overlaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_overlaps);
}

@override@JsonKey() final  EntryCheck check;
/// The saved or deleted entry, for the caller's Undo snackbar.
@override final  Entry? result;
@override final  Failure? failure;

/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryFormStateCopyWith<_EntryFormState> get copyWith => __$EntryFormStateCopyWithImpl<_EntryFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryFormState&&(identical(other.status, status) || other.status == status)&&(identical(other.original, original) || other.original == original)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.kindTouched, kindTouched) || other.kindTouched == kindTouched)&&(identical(other.labelId, labelId) || other.labelId == labelId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.endTouched, endTouched) || other.endTouched == endTouched)&&(identical(other.endBeforeOpen, endBeforeOpen) || other.endBeforeOpen == endBeforeOpen)&&(identical(other.note, note) || other.note == note)&&(identical(other.categoryOverrideId, categoryOverrideId) || other.categoryOverrideId == categoryOverrideId)&&const DeepCollectionEquality().equals(other.labels, _labels)&&const DeepCollectionEquality().equals(other.quickLabels, _quickLabels)&&const DeepCollectionEquality().equals(other.overlaps, _overlaps)&&(identical(other.check, check) || other.check == check)&&(identical(other.result, result) || other.result == result)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,original,kind,kindTouched,labelId,start,end,endTouched,endBeforeOpen,note,categoryOverrideId,const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_quickLabels),const DeepCollectionEquality().hash(_overlaps),check,result,failure);
}

@override
String toString() {
    return 'EntryFormState(status: $status, original: $original, kind: $kind, kindTouched: $kindTouched, labelId: $labelId, start: $start, end: $end, endTouched: $endTouched, endBeforeOpen: $endBeforeOpen, note: $note, categoryOverrideId: $categoryOverrideId, labels: $labels, quickLabels: $quickLabels, overlaps: $overlaps, check: $check, result: $result, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$EntryFormStateCopyWith<$Res> implements $EntryFormStateCopyWith<$Res> {
  factory _$EntryFormStateCopyWith(_EntryFormState value, $Res Function(_EntryFormState) _then) = __$EntryFormStateCopyWithImpl;
@override @useResult
$Res call({
 EntryFormStatus status, Entry? original, EntryKind kind, bool kindTouched, String? labelId, Instant? start, Instant? end, bool endTouched, Instant? endBeforeOpen, String note, String? categoryOverrideId, Map<String, Label> labels, List<Label> quickLabels, List<Entry> overlaps, EntryCheck check, Entry? result, Failure? failure
});


@override $EntryCopyWith<$Res>? get original;@override $EntryCopyWith<$Res>? get result;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$EntryFormStateCopyWithImpl<$Res>
    implements _$EntryFormStateCopyWith<$Res> {
  __$EntryFormStateCopyWithImpl(this._self, this._then);

  final _EntryFormState _self;
  final $Res Function(_EntryFormState) _then;

/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? original = freezed,Object? kind = null,Object? kindTouched = null,Object? labelId = freezed,Object? start = freezed,Object? end = freezed,Object? endTouched = null,Object? endBeforeOpen = freezed,Object? note = null,Object? categoryOverrideId = freezed,Object? labels = null,Object? quickLabels = null,Object? overlaps = null,Object? check = null,Object? result = freezed,Object? failure = freezed,}) {
  return _then(_EntryFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EntryFormStatus,original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Entry?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EntryKind,kindTouched: null == kindTouched ? _self.kindTouched : kindTouched // ignore: cast_nullable_to_non_nullable
as bool,labelId: freezed == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Instant?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant?,endTouched: null == endTouched ? _self.endTouched : endTouched // ignore: cast_nullable_to_non_nullable
as bool,endBeforeOpen: freezed == endBeforeOpen ? _self.endBeforeOpen : endBeforeOpen // ignore: cast_nullable_to_non_nullable
as Instant?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,categoryOverrideId: freezed == categoryOverrideId ? _self.categoryOverrideId : categoryOverrideId // ignore: cast_nullable_to_non_nullable
as String?,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as Map<String, Label>,quickLabels: null == quickLabels ? _self._quickLabels : quickLabels // ignore: cast_nullable_to_non_nullable
as List<Label>,overlaps: null == overlaps ? _self._overlaps : overlaps // ignore: cast_nullable_to_non_nullable
as List<Entry>,check: null == check ? _self.check : check // ignore: cast_nullable_to_non_nullable
as EntryCheck,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Entry?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $EntryCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $EntryCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of EntryFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
