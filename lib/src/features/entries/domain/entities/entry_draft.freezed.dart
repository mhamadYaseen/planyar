// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EntryDraft {

 EntryKind get kind; String get labelId; Instant get start; Instant? get end; String? get note; String? get categoryOverrideId; String? get taskId;
/// Create a copy of EntryDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryDraftCopyWith<EntryDraft> get copyWith => _$EntryDraftCopyWithImpl<EntryDraft>(this as EntryDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EntryDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryDraft&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.labelId, _this.labelId) || other.labelId == _this.labelId)&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.categoryOverrideId, _this.categoryOverrideId) || other.categoryOverrideId == _this.categoryOverrideId)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId));
}


@override
int get hashCode {
  final _this = this as EntryDraft;
  return Object.hash(runtimeType,_this.kind,_this.labelId,_this.start,_this.end,_this.note,_this.categoryOverrideId,_this.taskId);
}

@override
String toString() {
  final _this = this as EntryDraft;
  return 'EntryDraft(kind: ${_this.kind}, labelId: ${_this.labelId}, start: ${_this.start}, end: ${_this.end}, note: ${_this.note}, categoryOverrideId: ${_this.categoryOverrideId}, taskId: ${_this.taskId})';
}


}

/// @nodoc
abstract mixin class $EntryDraftCopyWith<$Res>  {
  factory $EntryDraftCopyWith(EntryDraft value, $Res Function(EntryDraft) _then) = _$EntryDraftCopyWithImpl;
@useResult
$Res call({
 EntryKind kind, String labelId, Instant start, Instant? end, String? note, String? categoryOverrideId, String? taskId
});




}
/// @nodoc
class _$EntryDraftCopyWithImpl<$Res>
    implements $EntryDraftCopyWith<$Res> {
  _$EntryDraftCopyWithImpl(this._self, this._then);

  final EntryDraft _self;
  final $Res Function(EntryDraft) _then;

/// Create a copy of EntryDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? labelId = null,Object? start = null,Object? end = freezed,Object? note = freezed,Object? categoryOverrideId = freezed,Object? taskId = freezed,}) {
  return _then(EntryDraft(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EntryKind,labelId: null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Instant,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,categoryOverrideId: freezed == categoryOverrideId ? _self.categoryOverrideId : categoryOverrideId // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EntryDraft].
extension EntryDraftPatterns on EntryDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntryDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntryDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntryDraft value)  $default,){
final _that = this;
switch (_that) {
case _EntryDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntryDraft value)?  $default,){
final _that = this;
switch (_that) {
case _EntryDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EntryKind kind,  String labelId,  Instant start,  Instant? end,  String? note,  String? categoryOverrideId,  String? taskId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntryDraft() when $default != null:
return $default(_that.kind,_that.labelId,_that.start,_that.end,_that.note,_that.categoryOverrideId,_that.taskId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EntryKind kind,  String labelId,  Instant start,  Instant? end,  String? note,  String? categoryOverrideId,  String? taskId)  $default,) {final _that = this;
switch (_that) {
case _EntryDraft():
return $default(_that.kind,_that.labelId,_that.start,_that.end,_that.note,_that.categoryOverrideId,_that.taskId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EntryKind kind,  String labelId,  Instant start,  Instant? end,  String? note,  String? categoryOverrideId,  String? taskId)?  $default,) {final _that = this;
switch (_that) {
case _EntryDraft() when $default != null:
return $default(_that.kind,_that.labelId,_that.start,_that.end,_that.note,_that.categoryOverrideId,_that.taskId);case _:
  return null;

}
}

}

/// @nodoc


class _EntryDraft implements EntryDraft {
  const _EntryDraft({required this.kind, required this.labelId, required this.start, this.end, this.note, this.categoryOverrideId, this.taskId});
  

@override final  EntryKind kind;
@override final  String labelId;
@override final  Instant start;
@override final  Instant? end;
@override final  String? note;
@override final  String? categoryOverrideId;
@override final  String? taskId;

/// Create a copy of EntryDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryDraftCopyWith<_EntryDraft> get copyWith => __$EntryDraftCopyWithImpl<_EntryDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryDraft&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.labelId, labelId) || other.labelId == labelId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.note, note) || other.note == note)&&(identical(other.categoryOverrideId, categoryOverrideId) || other.categoryOverrideId == categoryOverrideId)&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,labelId,start,end,note,categoryOverrideId,taskId);
}

@override
String toString() {
    return 'EntryDraft(kind: $kind, labelId: $labelId, start: $start, end: $end, note: $note, categoryOverrideId: $categoryOverrideId, taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class _$EntryDraftCopyWith<$Res> implements $EntryDraftCopyWith<$Res> {
  factory _$EntryDraftCopyWith(_EntryDraft value, $Res Function(_EntryDraft) _then) = __$EntryDraftCopyWithImpl;
@override @useResult
$Res call({
 EntryKind kind, String labelId, Instant start, Instant? end, String? note, String? categoryOverrideId, String? taskId
});




}
/// @nodoc
class __$EntryDraftCopyWithImpl<$Res>
    implements _$EntryDraftCopyWith<$Res> {
  __$EntryDraftCopyWithImpl(this._self, this._then);

  final _EntryDraft _self;
  final $Res Function(_EntryDraft) _then;

/// Create a copy of EntryDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? labelId = null,Object? start = null,Object? end = freezed,Object? note = freezed,Object? categoryOverrideId = freezed,Object? taskId = freezed,}) {
  return _then(_EntryDraft(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EntryKind,labelId: null == labelId ? _self.labelId : labelId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Instant,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,categoryOverrideId: freezed == categoryOverrideId ? _self.categoryOverrideId : categoryOverrideId // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
