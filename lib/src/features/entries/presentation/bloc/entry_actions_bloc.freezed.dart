// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_actions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UndoableAction {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UndoableAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UndoableAction()';
}


}

/// @nodoc
class $UndoableActionCopyWith<$Res>  {
$UndoableActionCopyWith(UndoableAction _, $Res Function(UndoableAction) __);
}


/// Adds pattern-matching-related methods to [UndoableAction].
extension UndoableActionPatterns on UndoableAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EntryCreated value)?  created,TResult Function( EntryEdited value)?  edited,TResult Function( EntryDeletedAction value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EntryCreated() when created != null:
return created(_that);case EntryEdited() when edited != null:
return edited(_that);case EntryDeletedAction() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EntryCreated value)  created,required TResult Function( EntryEdited value)  edited,required TResult Function( EntryDeletedAction value)  deleted,}){
final _that = this;
switch (_that) {
case EntryCreated():
return created(_that);case EntryEdited():
return edited(_that);case EntryDeletedAction():
return deleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EntryCreated value)?  created,TResult? Function( EntryEdited value)?  edited,TResult? Function( EntryDeletedAction value)?  deleted,}){
final _that = this;
switch (_that) {
case EntryCreated() when created != null:
return created(_that);case EntryEdited() when edited != null:
return edited(_that);case EntryDeletedAction() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Entry entry)?  created,TResult Function( Entry before,  Entry after)?  edited,TResult Function( Entry entry)?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EntryCreated() when created != null:
return created(_that.entry);case EntryEdited() when edited != null:
return edited(_that.before,_that.after);case EntryDeletedAction() when deleted != null:
return deleted(_that.entry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Entry entry)  created,required TResult Function( Entry before,  Entry after)  edited,required TResult Function( Entry entry)  deleted,}) {final _that = this;
switch (_that) {
case EntryCreated():
return created(_that.entry);case EntryEdited():
return edited(_that.before,_that.after);case EntryDeletedAction():
return deleted(_that.entry);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Entry entry)?  created,TResult? Function( Entry before,  Entry after)?  edited,TResult? Function( Entry entry)?  deleted,}) {final _that = this;
switch (_that) {
case EntryCreated() when created != null:
return created(_that.entry);case EntryEdited() when edited != null:
return edited(_that.before,_that.after);case EntryDeletedAction() when deleted != null:
return deleted(_that.entry);case _:
  return null;

}
}

}

/// @nodoc


class EntryCreated implements UndoableAction {
  const EntryCreated(this.entry);
  

 final  Entry entry;

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryCreatedCopyWith<EntryCreated> get copyWith => _$EntryCreatedCopyWithImpl<EntryCreated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryCreated&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode {
    return Object.hash(runtimeType,entry);
}

@override
String toString() {
    return 'UndoableAction.created(entry: $entry)';
}


}

/// @nodoc
abstract mixin class $EntryCreatedCopyWith<$Res> implements $UndoableActionCopyWith<$Res> {
  factory $EntryCreatedCopyWith(EntryCreated value, $Res Function(EntryCreated) _then) = _$EntryCreatedCopyWithImpl;
@useResult
$Res call({
 Entry entry
});


$EntryCopyWith<$Res> get entry;

}
/// @nodoc
class _$EntryCreatedCopyWithImpl<$Res>
    implements $EntryCreatedCopyWith<$Res> {
  _$EntryCreatedCopyWithImpl(this._self, this._then);

  final EntryCreated _self;
  final $Res Function(EntryCreated) _then;

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entry = null,}) {
  return _then(EntryCreated(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as Entry,
  ));
}

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res> get entry {
  
  return $EntryCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}
}

/// @nodoc


class EntryEdited implements UndoableAction {
  const EntryEdited({required this.before, required this.after});
  

 final  Entry before;
 final  Entry after;

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryEditedCopyWith<EntryEdited> get copyWith => _$EntryEditedCopyWithImpl<EntryEdited>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryEdited&&(identical(other.before, before) || other.before == before)&&(identical(other.after, after) || other.after == after));
}


@override
int get hashCode {
    return Object.hash(runtimeType,before,after);
}

@override
String toString() {
    return 'UndoableAction.edited(before: $before, after: $after)';
}


}

/// @nodoc
abstract mixin class $EntryEditedCopyWith<$Res> implements $UndoableActionCopyWith<$Res> {
  factory $EntryEditedCopyWith(EntryEdited value, $Res Function(EntryEdited) _then) = _$EntryEditedCopyWithImpl;
@useResult
$Res call({
 Entry before, Entry after
});


$EntryCopyWith<$Res> get before;$EntryCopyWith<$Res> get after;

}
/// @nodoc
class _$EntryEditedCopyWithImpl<$Res>
    implements $EntryEditedCopyWith<$Res> {
  _$EntryEditedCopyWithImpl(this._self, this._then);

  final EntryEdited _self;
  final $Res Function(EntryEdited) _then;

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? before = null,Object? after = null,}) {
  return _then(EntryEdited(
before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as Entry,after: null == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as Entry,
  ));
}

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res> get before {
  
  return $EntryCopyWith<$Res>(_self.before, (value) {
    return _then(_self.copyWith(before: value));
  });
}/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res> get after {
  
  return $EntryCopyWith<$Res>(_self.after, (value) {
    return _then(_self.copyWith(after: value));
  });
}
}

/// @nodoc


class EntryDeletedAction implements UndoableAction {
  const EntryDeletedAction(this.entry);
  

 final  Entry entry;

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryDeletedActionCopyWith<EntryDeletedAction> get copyWith => _$EntryDeletedActionCopyWithImpl<EntryDeletedAction>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryDeletedAction&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode {
    return Object.hash(runtimeType,entry);
}

@override
String toString() {
    return 'UndoableAction.deleted(entry: $entry)';
}


}

/// @nodoc
abstract mixin class $EntryDeletedActionCopyWith<$Res> implements $UndoableActionCopyWith<$Res> {
  factory $EntryDeletedActionCopyWith(EntryDeletedAction value, $Res Function(EntryDeletedAction) _then) = _$EntryDeletedActionCopyWithImpl;
@useResult
$Res call({
 Entry entry
});


$EntryCopyWith<$Res> get entry;

}
/// @nodoc
class _$EntryDeletedActionCopyWithImpl<$Res>
    implements $EntryDeletedActionCopyWith<$Res> {
  _$EntryDeletedActionCopyWithImpl(this._self, this._then);

  final EntryDeletedAction _self;
  final $Res Function(EntryDeletedAction) _then;

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entry = null,}) {
  return _then(EntryDeletedAction(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as Entry,
  ));
}

/// Create a copy of UndoableAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res> get entry {
  
  return $EntryCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}
}

/// @nodoc
mixin _$EntryActionsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryActionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EntryActionsEvent()';
}


}

/// @nodoc
class $EntryActionsEventCopyWith<$Res>  {
$EntryActionsEventCopyWith(EntryActionsEvent _, $Res Function(EntryActionsEvent) __);
}


/// Adds pattern-matching-related methods to [EntryActionsEvent].
extension EntryActionsEventPatterns on EntryActionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EndSet value)?  endSet,TResult Function( _DeleteRequested value)?  deleteRequested,TResult Function( _UndoRequested value)?  undoRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EndSet() when endSet != null:
return endSet(_that);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that);case _UndoRequested() when undoRequested != null:
return undoRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EndSet value)  endSet,required TResult Function( _DeleteRequested value)  deleteRequested,required TResult Function( _UndoRequested value)  undoRequested,}){
final _that = this;
switch (_that) {
case _EndSet():
return endSet(_that);case _DeleteRequested():
return deleteRequested(_that);case _UndoRequested():
return undoRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EndSet value)?  endSet,TResult? Function( _DeleteRequested value)?  deleteRequested,TResult? Function( _UndoRequested value)?  undoRequested,}){
final _that = this;
switch (_that) {
case _EndSet() when endSet != null:
return endSet(_that);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that);case _UndoRequested() when undoRequested != null:
return undoRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Entry entry,  Instant end)?  endSet,TResult Function( Entry entry)?  deleteRequested,TResult Function( UndoableAction action)?  undoRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EndSet() when endSet != null:
return endSet(_that.entry,_that.end);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that.entry);case _UndoRequested() when undoRequested != null:
return undoRequested(_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Entry entry,  Instant end)  endSet,required TResult Function( Entry entry)  deleteRequested,required TResult Function( UndoableAction action)  undoRequested,}) {final _that = this;
switch (_that) {
case _EndSet():
return endSet(_that.entry,_that.end);case _DeleteRequested():
return deleteRequested(_that.entry);case _UndoRequested():
return undoRequested(_that.action);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Entry entry,  Instant end)?  endSet,TResult? Function( Entry entry)?  deleteRequested,TResult? Function( UndoableAction action)?  undoRequested,}) {final _that = this;
switch (_that) {
case _EndSet() when endSet != null:
return endSet(_that.entry,_that.end);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that.entry);case _UndoRequested() when undoRequested != null:
return undoRequested(_that.action);case _:
  return null;

}
}

}

/// @nodoc


class _EndSet implements EntryActionsEvent {
  const _EndSet(this.entry, this.end);
  

 final  Entry entry;
 final  Instant end;

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndSetCopyWith<_EndSet> get copyWith => __$EndSetCopyWithImpl<_EndSet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndSet&&(identical(other.entry, entry) || other.entry == entry)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode {
    return Object.hash(runtimeType,entry,end);
}

@override
String toString() {
    return 'EntryActionsEvent.endSet(entry: $entry, end: $end)';
}


}

/// @nodoc
abstract mixin class _$EndSetCopyWith<$Res> implements $EntryActionsEventCopyWith<$Res> {
  factory _$EndSetCopyWith(_EndSet value, $Res Function(_EndSet) _then) = __$EndSetCopyWithImpl;
@useResult
$Res call({
 Entry entry, Instant end
});


$EntryCopyWith<$Res> get entry;

}
/// @nodoc
class __$EndSetCopyWithImpl<$Res>
    implements _$EndSetCopyWith<$Res> {
  __$EndSetCopyWithImpl(this._self, this._then);

  final _EndSet _self;
  final $Res Function(_EndSet) _then;

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entry = null,Object? end = null,}) {
  return _then(_EndSet(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as Entry,null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Instant,
  ));
}

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res> get entry {
  
  return $EntryCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}
}

/// @nodoc


class _DeleteRequested implements EntryActionsEvent {
  const _DeleteRequested(this.entry);
  

 final  Entry entry;

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteRequestedCopyWith<_DeleteRequested> get copyWith => __$DeleteRequestedCopyWithImpl<_DeleteRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteRequested&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode {
    return Object.hash(runtimeType,entry);
}

@override
String toString() {
    return 'EntryActionsEvent.deleteRequested(entry: $entry)';
}


}

/// @nodoc
abstract mixin class _$DeleteRequestedCopyWith<$Res> implements $EntryActionsEventCopyWith<$Res> {
  factory _$DeleteRequestedCopyWith(_DeleteRequested value, $Res Function(_DeleteRequested) _then) = __$DeleteRequestedCopyWithImpl;
@useResult
$Res call({
 Entry entry
});


$EntryCopyWith<$Res> get entry;

}
/// @nodoc
class __$DeleteRequestedCopyWithImpl<$Res>
    implements _$DeleteRequestedCopyWith<$Res> {
  __$DeleteRequestedCopyWithImpl(this._self, this._then);

  final _DeleteRequested _self;
  final $Res Function(_DeleteRequested) _then;

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entry = null,}) {
  return _then(_DeleteRequested(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as Entry,
  ));
}

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryCopyWith<$Res> get entry {
  
  return $EntryCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}
}

/// @nodoc


class _UndoRequested implements EntryActionsEvent {
  const _UndoRequested(this.action);
  

 final  UndoableAction action;

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UndoRequestedCopyWith<_UndoRequested> get copyWith => __$UndoRequestedCopyWithImpl<_UndoRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UndoRequested&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode {
    return Object.hash(runtimeType,action);
}

@override
String toString() {
    return 'EntryActionsEvent.undoRequested(action: $action)';
}


}

/// @nodoc
abstract mixin class _$UndoRequestedCopyWith<$Res> implements $EntryActionsEventCopyWith<$Res> {
  factory _$UndoRequestedCopyWith(_UndoRequested value, $Res Function(_UndoRequested) _then) = __$UndoRequestedCopyWithImpl;
@useResult
$Res call({
 UndoableAction action
});


$UndoableActionCopyWith<$Res> get action;

}
/// @nodoc
class __$UndoRequestedCopyWithImpl<$Res>
    implements _$UndoRequestedCopyWith<$Res> {
  __$UndoRequestedCopyWithImpl(this._self, this._then);

  final _UndoRequested _self;
  final $Res Function(_UndoRequested) _then;

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(_UndoRequested(
null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as UndoableAction,
  ));
}

/// Create a copy of EntryActionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UndoableActionCopyWith<$Res> get action {
  
  return $UndoableActionCopyWith<$Res>(_self.action, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

/// @nodoc
mixin _$EntryActionsState {

/// The last undoable action; [sequence] changes on every action so a
/// listener shows a snackbar even for an identical one.
 UndoableAction? get lastAction; int get sequence; Failure? get failure;
/// Create a copy of EntryActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryActionsStateCopyWith<EntryActionsState> get copyWith => _$EntryActionsStateCopyWithImpl<EntryActionsState>(this as EntryActionsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EntryActionsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryActionsState&&(identical(other.lastAction, _this.lastAction) || other.lastAction == _this.lastAction)&&(identical(other.sequence, _this.sequence) || other.sequence == _this.sequence)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as EntryActionsState;
  return Object.hash(runtimeType,_this.lastAction,_this.sequence,_this.failure);
}

@override
String toString() {
  final _this = this as EntryActionsState;
  return 'EntryActionsState(lastAction: ${_this.lastAction}, sequence: ${_this.sequence}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $EntryActionsStateCopyWith<$Res>  {
  factory $EntryActionsStateCopyWith(EntryActionsState value, $Res Function(EntryActionsState) _then) = _$EntryActionsStateCopyWithImpl;
@useResult
$Res call({
 UndoableAction? lastAction, int sequence, Failure? failure
});


$UndoableActionCopyWith<$Res>? get lastAction;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$EntryActionsStateCopyWithImpl<$Res>
    implements $EntryActionsStateCopyWith<$Res> {
  _$EntryActionsStateCopyWithImpl(this._self, this._then);

  final EntryActionsState _self;
  final $Res Function(EntryActionsState) _then;

/// Create a copy of EntryActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastAction = freezed,Object? sequence = null,Object? failure = freezed,}) {
  return _then(EntryActionsState(
lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as UndoableAction?,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of EntryActionsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UndoableActionCopyWith<$Res>? get lastAction {
    if (_self.lastAction == null) {
    return null;
  }

  return $UndoableActionCopyWith<$Res>(_self.lastAction!, (value) {
    return _then(_self.copyWith(lastAction: value));
  });
}/// Create a copy of EntryActionsState
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


/// Adds pattern-matching-related methods to [EntryActionsState].
extension EntryActionsStatePatterns on EntryActionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntryActionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntryActionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntryActionsState value)  $default,){
final _that = this;
switch (_that) {
case _EntryActionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntryActionsState value)?  $default,){
final _that = this;
switch (_that) {
case _EntryActionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UndoableAction? lastAction,  int sequence,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntryActionsState() when $default != null:
return $default(_that.lastAction,_that.sequence,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UndoableAction? lastAction,  int sequence,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _EntryActionsState():
return $default(_that.lastAction,_that.sequence,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UndoableAction? lastAction,  int sequence,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _EntryActionsState() when $default != null:
return $default(_that.lastAction,_that.sequence,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _EntryActionsState implements EntryActionsState {
  const _EntryActionsState({this.lastAction, this.sequence = 0, this.failure});
  

/// The last undoable action; [sequence] changes on every action so a
/// listener shows a snackbar even for an identical one.
@override final  UndoableAction? lastAction;
@override@JsonKey() final  int sequence;
@override final  Failure? failure;

/// Create a copy of EntryActionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryActionsStateCopyWith<_EntryActionsState> get copyWith => __$EntryActionsStateCopyWithImpl<_EntryActionsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryActionsState&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,lastAction,sequence,failure);
}

@override
String toString() {
    return 'EntryActionsState(lastAction: $lastAction, sequence: $sequence, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$EntryActionsStateCopyWith<$Res> implements $EntryActionsStateCopyWith<$Res> {
  factory _$EntryActionsStateCopyWith(_EntryActionsState value, $Res Function(_EntryActionsState) _then) = __$EntryActionsStateCopyWithImpl;
@override @useResult
$Res call({
 UndoableAction? lastAction, int sequence, Failure? failure
});


@override $UndoableActionCopyWith<$Res>? get lastAction;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$EntryActionsStateCopyWithImpl<$Res>
    implements _$EntryActionsStateCopyWith<$Res> {
  __$EntryActionsStateCopyWithImpl(this._self, this._then);

  final _EntryActionsState _self;
  final $Res Function(_EntryActionsState) _then;

/// Create a copy of EntryActionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastAction = freezed,Object? sequence = null,Object? failure = freezed,}) {
  return _then(_EntryActionsState(
lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as UndoableAction?,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of EntryActionsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UndoableActionCopyWith<$Res>? get lastAction {
    if (_self.lastAction == null) {
    return null;
  }

  return $UndoableActionCopyWith<$Res>(_self.lastAction!, (value) {
    return _then(_self.copyWith(lastAction: value));
  });
}/// Create a copy of EntryActionsState
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
