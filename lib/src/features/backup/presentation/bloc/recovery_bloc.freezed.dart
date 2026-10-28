// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recovery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecoveryEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoveryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RecoveryEvent()';
}


}

/// @nodoc
class $RecoveryEventCopyWith<$Res>  {
$RecoveryEventCopyWith(RecoveryEvent _, $Res Function(RecoveryEvent) __);
}


/// Adds pattern-matching-related methods to [RecoveryEvent].
extension RecoveryEventPatterns on RecoveryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RestoreLatestPressed value)?  restoreLatestPressed,TResult Function( _ImportPressed value)?  importPressed,TResult Function( _RestoreConfirmed value)?  restoreConfirmed,TResult Function( _RestoreCancelled value)?  restoreCancelled,TResult Function( _ExportPressed value)?  exportPressed,TResult Function( _FailureShown value)?  failureShown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RestoreLatestPressed() when restoreLatestPressed != null:
return restoreLatestPressed(_that);case _ImportPressed() when importPressed != null:
return importPressed(_that);case _RestoreConfirmed() when restoreConfirmed != null:
return restoreConfirmed(_that);case _RestoreCancelled() when restoreCancelled != null:
return restoreCancelled(_that);case _ExportPressed() when exportPressed != null:
return exportPressed(_that);case _FailureShown() when failureShown != null:
return failureShown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RestoreLatestPressed value)  restoreLatestPressed,required TResult Function( _ImportPressed value)  importPressed,required TResult Function( _RestoreConfirmed value)  restoreConfirmed,required TResult Function( _RestoreCancelled value)  restoreCancelled,required TResult Function( _ExportPressed value)  exportPressed,required TResult Function( _FailureShown value)  failureShown,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RestoreLatestPressed():
return restoreLatestPressed(_that);case _ImportPressed():
return importPressed(_that);case _RestoreConfirmed():
return restoreConfirmed(_that);case _RestoreCancelled():
return restoreCancelled(_that);case _ExportPressed():
return exportPressed(_that);case _FailureShown():
return failureShown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RestoreLatestPressed value)?  restoreLatestPressed,TResult? Function( _ImportPressed value)?  importPressed,TResult? Function( _RestoreConfirmed value)?  restoreConfirmed,TResult? Function( _RestoreCancelled value)?  restoreCancelled,TResult? Function( _ExportPressed value)?  exportPressed,TResult? Function( _FailureShown value)?  failureShown,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RestoreLatestPressed() when restoreLatestPressed != null:
return restoreLatestPressed(_that);case _ImportPressed() when importPressed != null:
return importPressed(_that);case _RestoreConfirmed() when restoreConfirmed != null:
return restoreConfirmed(_that);case _RestoreCancelled() when restoreCancelled != null:
return restoreCancelled(_that);case _ExportPressed() when exportPressed != null:
return exportPressed(_that);case _FailureShown() when failureShown != null:
return failureShown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  restoreLatestPressed,TResult Function()?  importPressed,TResult Function()?  restoreConfirmed,TResult Function()?  restoreCancelled,TResult Function( ShareAnchor? anchor)?  exportPressed,TResult Function()?  failureShown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RestoreLatestPressed() when restoreLatestPressed != null:
return restoreLatestPressed();case _ImportPressed() when importPressed != null:
return importPressed();case _RestoreConfirmed() when restoreConfirmed != null:
return restoreConfirmed();case _RestoreCancelled() when restoreCancelled != null:
return restoreCancelled();case _ExportPressed() when exportPressed != null:
return exportPressed(_that.anchor);case _FailureShown() when failureShown != null:
return failureShown();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  restoreLatestPressed,required TResult Function()  importPressed,required TResult Function()  restoreConfirmed,required TResult Function()  restoreCancelled,required TResult Function( ShareAnchor? anchor)  exportPressed,required TResult Function()  failureShown,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RestoreLatestPressed():
return restoreLatestPressed();case _ImportPressed():
return importPressed();case _RestoreConfirmed():
return restoreConfirmed();case _RestoreCancelled():
return restoreCancelled();case _ExportPressed():
return exportPressed(_that.anchor);case _FailureShown():
return failureShown();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  restoreLatestPressed,TResult? Function()?  importPressed,TResult? Function()?  restoreConfirmed,TResult? Function()?  restoreCancelled,TResult? Function( ShareAnchor? anchor)?  exportPressed,TResult? Function()?  failureShown,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RestoreLatestPressed() when restoreLatestPressed != null:
return restoreLatestPressed();case _ImportPressed() when importPressed != null:
return importPressed();case _RestoreConfirmed() when restoreConfirmed != null:
return restoreConfirmed();case _RestoreCancelled() when restoreCancelled != null:
return restoreCancelled();case _ExportPressed() when exportPressed != null:
return exportPressed(_that.anchor);case _FailureShown() when failureShown != null:
return failureShown();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RecoveryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RecoveryEvent.started()';
}


}




/// @nodoc


class _RestoreLatestPressed implements RecoveryEvent {
  const _RestoreLatestPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreLatestPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RecoveryEvent.restoreLatestPressed()';
}


}




/// @nodoc


class _ImportPressed implements RecoveryEvent {
  const _ImportPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RecoveryEvent.importPressed()';
}


}




/// @nodoc


class _RestoreConfirmed implements RecoveryEvent {
  const _RestoreConfirmed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreConfirmed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RecoveryEvent.restoreConfirmed()';
}


}




/// @nodoc


class _RestoreCancelled implements RecoveryEvent {
  const _RestoreCancelled();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RecoveryEvent.restoreCancelled()';
}


}




/// @nodoc


class _ExportPressed implements RecoveryEvent {
  const _ExportPressed({this.anchor});
  

 final  ShareAnchor? anchor;

/// Create a copy of RecoveryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportPressedCopyWith<_ExportPressed> get copyWith => __$ExportPressedCopyWithImpl<_ExportPressed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportPressed&&(identical(other.anchor, anchor) || other.anchor == anchor));
}


@override
int get hashCode {
    return Object.hash(runtimeType,anchor);
}

@override
String toString() {
    return 'RecoveryEvent.exportPressed(anchor: $anchor)';
}


}

/// @nodoc
abstract mixin class _$ExportPressedCopyWith<$Res> implements $RecoveryEventCopyWith<$Res> {
  factory _$ExportPressedCopyWith(_ExportPressed value, $Res Function(_ExportPressed) _then) = __$ExportPressedCopyWithImpl;
@useResult
$Res call({
 ShareAnchor? anchor
});




}
/// @nodoc
class __$ExportPressedCopyWithImpl<$Res>
    implements _$ExportPressedCopyWith<$Res> {
  __$ExportPressedCopyWithImpl(this._self, this._then);

  final _ExportPressed _self;
  final $Res Function(_ExportPressed) _then;

/// Create a copy of RecoveryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? anchor = freezed,}) {
  return _then(_ExportPressed(
anchor: freezed == anchor ? _self.anchor : anchor // ignore: cast_nullable_to_non_nullable
as ShareAnchor?,
  ));
}


}

/// @nodoc


class _FailureShown implements RecoveryEvent {
  const _FailureShown();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureShown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RecoveryEvent.failureShown()';
}


}




/// @nodoc
mixin _$RecoveryState {

/// Importable (ZIP) safety backups, newest first.
 DataState<List<SafetyBackup>> get safetyBackups; bool get busy;/// A read, valid backup waiting for the user's confirmation.
 ReadBackup? get pending;/// Shown once in a snackbar.
 Failure? get failure;/// A backup was restored: the app can start again.
 bool get restored;
/// Create a copy of RecoveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoveryStateCopyWith<RecoveryState> get copyWith => _$RecoveryStateCopyWithImpl<RecoveryState>(this as RecoveryState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RecoveryState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoveryState&&(identical(other.safetyBackups, _this.safetyBackups) || other.safetyBackups == _this.safetyBackups)&&(identical(other.busy, _this.busy) || other.busy == _this.busy)&&(identical(other.pending, _this.pending) || other.pending == _this.pending)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.restored, _this.restored) || other.restored == _this.restored));
}


@override
int get hashCode {
  final _this = this as RecoveryState;
  return Object.hash(runtimeType,_this.safetyBackups,_this.busy,_this.pending,_this.failure,_this.restored);
}

@override
String toString() {
  final _this = this as RecoveryState;
  return 'RecoveryState(safetyBackups: ${_this.safetyBackups}, busy: ${_this.busy}, pending: ${_this.pending}, failure: ${_this.failure}, restored: ${_this.restored})';
}


}

/// @nodoc
abstract mixin class $RecoveryStateCopyWith<$Res>  {
  factory $RecoveryStateCopyWith(RecoveryState value, $Res Function(RecoveryState) _then) = _$RecoveryStateCopyWithImpl;
@useResult
$Res call({
 DataState<List<SafetyBackup>> safetyBackups, bool busy, ReadBackup? pending, Failure? failure, bool restored
});


$DataStateCopyWith<List<SafetyBackup>, $Res> get safetyBackups;$ReadBackupCopyWith<$Res>? get pending;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$RecoveryStateCopyWithImpl<$Res>
    implements $RecoveryStateCopyWith<$Res> {
  _$RecoveryStateCopyWithImpl(this._self, this._then);

  final RecoveryState _self;
  final $Res Function(RecoveryState) _then;

/// Create a copy of RecoveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? safetyBackups = null,Object? busy = null,Object? pending = freezed,Object? failure = freezed,Object? restored = null,}) {
  return _then(RecoveryState(
safetyBackups: null == safetyBackups ? _self.safetyBackups : safetyBackups // ignore: cast_nullable_to_non_nullable
as DataState<List<SafetyBackup>>,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,pending: freezed == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as ReadBackup?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,restored: null == restored ? _self.restored : restored // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RecoveryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<List<SafetyBackup>, $Res> get safetyBackups {
  
  return $DataStateCopyWith<List<SafetyBackup>, $Res>(_self.safetyBackups, (value) {
    return _then(_self.copyWith(safetyBackups: value));
  });
}/// Create a copy of RecoveryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReadBackupCopyWith<$Res>? get pending {
    if (_self.pending == null) {
    return null;
  }

  return $ReadBackupCopyWith<$Res>(_self.pending!, (value) {
    return _then(_self.copyWith(pending: value));
  });
}/// Create a copy of RecoveryState
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


/// Adds pattern-matching-related methods to [RecoveryState].
extension RecoveryStatePatterns on RecoveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecoveryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecoveryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecoveryState value)  $default,){
final _that = this;
switch (_that) {
case _RecoveryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecoveryState value)?  $default,){
final _that = this;
switch (_that) {
case _RecoveryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DataState<List<SafetyBackup>> safetyBackups,  bool busy,  ReadBackup? pending,  Failure? failure,  bool restored)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecoveryState() when $default != null:
return $default(_that.safetyBackups,_that.busy,_that.pending,_that.failure,_that.restored);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DataState<List<SafetyBackup>> safetyBackups,  bool busy,  ReadBackup? pending,  Failure? failure,  bool restored)  $default,) {final _that = this;
switch (_that) {
case _RecoveryState():
return $default(_that.safetyBackups,_that.busy,_that.pending,_that.failure,_that.restored);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DataState<List<SafetyBackup>> safetyBackups,  bool busy,  ReadBackup? pending,  Failure? failure,  bool restored)?  $default,) {final _that = this;
switch (_that) {
case _RecoveryState() when $default != null:
return $default(_that.safetyBackups,_that.busy,_that.pending,_that.failure,_that.restored);case _:
  return null;

}
}

}

/// @nodoc


class _RecoveryState extends RecoveryState {
  const _RecoveryState({this.safetyBackups = const DataState<List<SafetyBackup>>.initial(), this.busy = false, this.pending, this.failure, this.restored = false}): super._();
  

/// Importable (ZIP) safety backups, newest first.
@override@JsonKey() final  DataState<List<SafetyBackup>> safetyBackups;
@override@JsonKey() final  bool busy;
/// A read, valid backup waiting for the user's confirmation.
@override final  ReadBackup? pending;
/// Shown once in a snackbar.
@override final  Failure? failure;
/// A backup was restored: the app can start again.
@override@JsonKey() final  bool restored;

/// Create a copy of RecoveryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecoveryStateCopyWith<_RecoveryState> get copyWith => __$RecoveryStateCopyWithImpl<_RecoveryState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecoveryState&&(identical(other.safetyBackups, safetyBackups) || other.safetyBackups == safetyBackups)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.restored, restored) || other.restored == restored));
}


@override
int get hashCode {
    return Object.hash(runtimeType,safetyBackups,busy,pending,failure,restored);
}

@override
String toString() {
    return 'RecoveryState(safetyBackups: $safetyBackups, busy: $busy, pending: $pending, failure: $failure, restored: $restored)';
}


}

/// @nodoc
abstract mixin class _$RecoveryStateCopyWith<$Res> implements $RecoveryStateCopyWith<$Res> {
  factory _$RecoveryStateCopyWith(_RecoveryState value, $Res Function(_RecoveryState) _then) = __$RecoveryStateCopyWithImpl;
@override @useResult
$Res call({
 DataState<List<SafetyBackup>> safetyBackups, bool busy, ReadBackup? pending, Failure? failure, bool restored
});


@override $DataStateCopyWith<List<SafetyBackup>, $Res> get safetyBackups;@override $ReadBackupCopyWith<$Res>? get pending;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$RecoveryStateCopyWithImpl<$Res>
    implements _$RecoveryStateCopyWith<$Res> {
  __$RecoveryStateCopyWithImpl(this._self, this._then);

  final _RecoveryState _self;
  final $Res Function(_RecoveryState) _then;

/// Create a copy of RecoveryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? safetyBackups = null,Object? busy = null,Object? pending = freezed,Object? failure = freezed,Object? restored = null,}) {
  return _then(_RecoveryState(
safetyBackups: null == safetyBackups ? _self.safetyBackups : safetyBackups // ignore: cast_nullable_to_non_nullable
as DataState<List<SafetyBackup>>,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,pending: freezed == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as ReadBackup?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,restored: null == restored ? _self.restored : restored // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RecoveryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<List<SafetyBackup>, $Res> get safetyBackups {
  
  return $DataStateCopyWith<List<SafetyBackup>, $Res>(_self.safetyBackups, (value) {
    return _then(_self.copyWith(safetyBackups: value));
  });
}/// Create a copy of RecoveryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReadBackupCopyWith<$Res>? get pending {
    if (_self.pending == null) {
    return null;
  }

  return $ReadBackupCopyWith<$Res>(_self.pending!, (value) {
    return _then(_self.copyWith(pending: value));
  });
}/// Create a copy of RecoveryState
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
