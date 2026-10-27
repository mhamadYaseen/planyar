// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Entry {

 String get id; EntryKind get kind; String get labelId; Instant get start;/// Null = open entry (§6.9).
 Instant? get end; String? get categoryOverrideId; String? get note; String? get taskId;/// IANA zone and offset at save time — informational (§6.1).
 String get tzId; int get utcOffsetMin; EntrySource get source; String? get routineId; LocalDate? get occurrenceDate; String? get plannedEntryId; Instant get createdAt; Instant get updatedAt;
/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryCopyWith<Entry> get copyWith => _$EntryCopyWithImpl<Entry>(this as Entry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Entry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Entry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.labelId, _this.labelId) || other.labelId == _this.labelId)&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end)&&(identical(other.categoryOverrideId, _this.categoryOverrideId) || other.categoryOverrideId == _this.categoryOverrideId)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.tzId, _this.tzId) || other.tzId == _this.tzId)&&(identical(other.utcOffsetMin, _this.utcOffsetMin) || other.utcOffsetMin == _this.utcOffsetMin)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.routineId, _this.routineId) || other.routineId == _this.routineId)&&(identical(other.occurrenceDate, _this.occurrenceDate) || other.occurrenceDate == _this.occurrenceDate)&&(identical(other.plannedEntryId, _this.plannedEntryId) || other.plannedEntryId == _this.plannedEntryId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as Entry;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.labelId,_this.start,_this.end,_this.categoryOverrideId,_this.note,_this.taskId,_this.tzId,_this.utcOffsetMin,_this.source,_this.routineId,_this.occurrenceDate,_this.plannedEntryId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as Entry;
  return 'Entry(id: ${_this.id}, kind: ${_this.kind}, labelId: ${_this.labelId}, start: ${_this.start}, end: ${_this.end}, categoryOverrideId: ${_this.categoryOverrideId}, note: ${_this.note}, taskId: ${_this.taskId}, tzId: ${_this.tzId}, utcOffsetMin: ${_this.utcOffsetMin}, source: ${_this.source}, routineId: ${_this.routineId}, occurrenceDate: ${_this.occurrenceDate}, plannedEntryId: ${_this.plannedEntryId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $EntryCopyWith<$Res>  {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) _then) = _$EntryCopyWithImpl;
@useResult
$Res call({
 String id, EntryKind kind, String labelId, Instant start, Instant? end, String? categoryOverrideId, String? note, String? taskId, String tzId, int utcOffsetMin, EntrySource source, String? routineId, LocalDate? occurrenceDate, String? plannedEntryId, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class _$EntryCopyWithImpl<$Res>
    implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._self, this._then);

  final Entry _self;
  final $Res Function(Entry) _then;

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? labelId = null,Object? start = null,Object? end = freezed,Object? categoryOverrideId = freezed,Object? note = freezed,Object? taskId = freezed,Object? tzId = null,Object? utcOffsetMin = null,Object? source = null,Object? routineId = freezed,Object? occurrenceDate = freezed,Object? plannedEntryId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(Entry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EntryKind,labelId: null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Instant,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant?,categoryOverrideId: freezed == categoryOverrideId ? _self.categoryOverrideId : categoryOverrideId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,tzId: null == tzId ? _self.tzId : tzId // ignore: cast_nullable_to_non_nullable
as String,utcOffsetMin: null == utcOffsetMin ? _self.utcOffsetMin : utcOffsetMin // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as EntrySource,routineId: freezed == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String?,occurrenceDate: freezed == occurrenceDate ? _self.occurrenceDate : occurrenceDate // ignore: cast_nullable_to_non_nullable
as LocalDate?,plannedEntryId: freezed == plannedEntryId ? _self.plannedEntryId : plannedEntryId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

}


/// Adds pattern-matching-related methods to [Entry].
extension EntryPatterns on Entry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Entry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Entry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Entry value)  $default,){
final _that = this;
switch (_that) {
case _Entry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Entry value)?  $default,){
final _that = this;
switch (_that) {
case _Entry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EntryKind kind,  String labelId,  Instant start,  Instant? end,  String? categoryOverrideId,  String? note,  String? taskId,  String tzId,  int utcOffsetMin,  EntrySource source,  String? routineId,  LocalDate? occurrenceDate,  String? plannedEntryId,  Instant createdAt,  Instant updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Entry() when $default != null:
return $default(_that.id,_that.kind,_that.labelId,_that.start,_that.end,_that.categoryOverrideId,_that.note,_that.taskId,_that.tzId,_that.utcOffsetMin,_that.source,_that.routineId,_that.occurrenceDate,_that.plannedEntryId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EntryKind kind,  String labelId,  Instant start,  Instant? end,  String? categoryOverrideId,  String? note,  String? taskId,  String tzId,  int utcOffsetMin,  EntrySource source,  String? routineId,  LocalDate? occurrenceDate,  String? plannedEntryId,  Instant createdAt,  Instant updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Entry():
return $default(_that.id,_that.kind,_that.labelId,_that.start,_that.end,_that.categoryOverrideId,_that.note,_that.taskId,_that.tzId,_that.utcOffsetMin,_that.source,_that.routineId,_that.occurrenceDate,_that.plannedEntryId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EntryKind kind,  String labelId,  Instant start,  Instant? end,  String? categoryOverrideId,  String? note,  String? taskId,  String tzId,  int utcOffsetMin,  EntrySource source,  String? routineId,  LocalDate? occurrenceDate,  String? plannedEntryId,  Instant createdAt,  Instant updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Entry() when $default != null:
return $default(_that.id,_that.kind,_that.labelId,_that.start,_that.end,_that.categoryOverrideId,_that.note,_that.taskId,_that.tzId,_that.utcOffsetMin,_that.source,_that.routineId,_that.occurrenceDate,_that.plannedEntryId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Entry extends Entry {
  const _Entry({required this.id, required this.kind, required this.labelId, required this.start, this.end, this.categoryOverrideId, this.note, this.taskId, required this.tzId, required this.utcOffsetMin, this.source = EntrySource.manual, this.routineId, this.occurrenceDate, this.plannedEntryId, required this.createdAt, required this.updatedAt}): super._();
  

@override final  String id;
@override final  EntryKind kind;
@override final  String labelId;
@override final  Instant start;
/// Null = open entry (§6.9).
@override final  Instant? end;
@override final  String? categoryOverrideId;
@override final  String? note;
@override final  String? taskId;
/// IANA zone and offset at save time — informational (§6.1).
@override final  String tzId;
@override final  int utcOffsetMin;
@override@JsonKey() final  EntrySource source;
@override final  String? routineId;
@override final  LocalDate? occurrenceDate;
@override final  String? plannedEntryId;
@override final  Instant createdAt;
@override final  Instant updatedAt;

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryCopyWith<_Entry> get copyWith => __$EntryCopyWithImpl<_Entry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Entry&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.labelId, labelId) || other.labelId == labelId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.categoryOverrideId, categoryOverrideId) || other.categoryOverrideId == categoryOverrideId)&&(identical(other.note, note) || other.note == note)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.tzId, tzId) || other.tzId == tzId)&&(identical(other.utcOffsetMin, utcOffsetMin) || other.utcOffsetMin == utcOffsetMin)&&(identical(other.source, source) || other.source == source)&&(identical(other.routineId, routineId) || other.routineId == routineId)&&(identical(other.occurrenceDate, occurrenceDate) || other.occurrenceDate == occurrenceDate)&&(identical(other.plannedEntryId, plannedEntryId) || other.plannedEntryId == plannedEntryId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,labelId,start,end,categoryOverrideId,note,taskId,tzId,utcOffsetMin,source,routineId,occurrenceDate,plannedEntryId,createdAt,updatedAt);
}

@override
String toString() {
    return 'Entry(id: $id, kind: $kind, labelId: $labelId, start: $start, end: $end, categoryOverrideId: $categoryOverrideId, note: $note, taskId: $taskId, tzId: $tzId, utcOffsetMin: $utcOffsetMin, source: $source, routineId: $routineId, occurrenceDate: $occurrenceDate, plannedEntryId: $plannedEntryId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$EntryCopyWith(_Entry value, $Res Function(_Entry) _then) = __$EntryCopyWithImpl;
@override @useResult
$Res call({
 String id, EntryKind kind, String labelId, Instant start, Instant? end, String? categoryOverrideId, String? note, String? taskId, String tzId, int utcOffsetMin, EntrySource source, String? routineId, LocalDate? occurrenceDate, String? plannedEntryId, Instant createdAt, Instant updatedAt
});




}
/// @nodoc
class __$EntryCopyWithImpl<$Res>
    implements _$EntryCopyWith<$Res> {
  __$EntryCopyWithImpl(this._self, this._then);

  final _Entry _self;
  final $Res Function(_Entry) _then;

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? labelId = null,Object? start = null,Object? end = freezed,Object? categoryOverrideId = freezed,Object? note = freezed,Object? taskId = freezed,Object? tzId = null,Object? utcOffsetMin = null,Object? source = null,Object? routineId = freezed,Object? occurrenceDate = freezed,Object? plannedEntryId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Entry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EntryKind,labelId: null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Instant,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant?,categoryOverrideId: freezed == categoryOverrideId ? _self.categoryOverrideId : categoryOverrideId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,tzId: null == tzId ? _self.tzId : tzId // ignore: cast_nullable_to_non_nullable
as String,utcOffsetMin: null == utcOffsetMin ? _self.utcOffsetMin : utcOffsetMin // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as EntrySource,routineId: freezed == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String?,occurrenceDate: freezed == occurrenceDate ? _self.occurrenceDate : occurrenceDate // ignore: cast_nullable_to_non_nullable
as LocalDate?,plannedEntryId: freezed == plannedEntryId ? _self.plannedEntryId : plannedEntryId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Instant,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}


}

// dart format on
