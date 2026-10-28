// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NextPressed value)?  nextPressed,TResult Function( _BackPressed value)?  backPressed,TResult Function( _StarterToggled value)?  starterToggled,TResult Function( _SkipPressed value)?  skipPressed,TResult Function( _RestorePressed value)?  restorePressed,TResult Function( _RestoreOpened value)?  restoreOpened,TResult Function( _Restored value)?  restored,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NextPressed() when nextPressed != null:
return nextPressed(_that);case _BackPressed() when backPressed != null:
return backPressed(_that);case _StarterToggled() when starterToggled != null:
return starterToggled(_that);case _SkipPressed() when skipPressed != null:
return skipPressed(_that);case _RestorePressed() when restorePressed != null:
return restorePressed(_that);case _RestoreOpened() when restoreOpened != null:
return restoreOpened(_that);case _Restored() when restored != null:
return restored(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NextPressed value)  nextPressed,required TResult Function( _BackPressed value)  backPressed,required TResult Function( _StarterToggled value)  starterToggled,required TResult Function( _SkipPressed value)  skipPressed,required TResult Function( _RestorePressed value)  restorePressed,required TResult Function( _RestoreOpened value)  restoreOpened,required TResult Function( _Restored value)  restored,}){
final _that = this;
switch (_that) {
case _NextPressed():
return nextPressed(_that);case _BackPressed():
return backPressed(_that);case _StarterToggled():
return starterToggled(_that);case _SkipPressed():
return skipPressed(_that);case _RestorePressed():
return restorePressed(_that);case _RestoreOpened():
return restoreOpened(_that);case _Restored():
return restored(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NextPressed value)?  nextPressed,TResult? Function( _BackPressed value)?  backPressed,TResult? Function( _StarterToggled value)?  starterToggled,TResult? Function( _SkipPressed value)?  skipPressed,TResult? Function( _RestorePressed value)?  restorePressed,TResult? Function( _RestoreOpened value)?  restoreOpened,TResult? Function( _Restored value)?  restored,}){
final _that = this;
switch (_that) {
case _NextPressed() when nextPressed != null:
return nextPressed(_that);case _BackPressed() when backPressed != null:
return backPressed(_that);case _StarterToggled() when starterToggled != null:
return starterToggled(_that);case _SkipPressed() when skipPressed != null:
return skipPressed(_that);case _RestorePressed() when restorePressed != null:
return restorePressed(_that);case _RestoreOpened() when restoreOpened != null:
return restoreOpened(_that);case _Restored() when restored != null:
return restored(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  nextPressed,TResult Function()?  backPressed,TResult Function( String name)?  starterToggled,TResult Function()?  skipPressed,TResult Function()?  restorePressed,TResult Function()?  restoreOpened,TResult Function()?  restored,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NextPressed() when nextPressed != null:
return nextPressed();case _BackPressed() when backPressed != null:
return backPressed();case _StarterToggled() when starterToggled != null:
return starterToggled(_that.name);case _SkipPressed() when skipPressed != null:
return skipPressed();case _RestorePressed() when restorePressed != null:
return restorePressed();case _RestoreOpened() when restoreOpened != null:
return restoreOpened();case _Restored() when restored != null:
return restored();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  nextPressed,required TResult Function()  backPressed,required TResult Function( String name)  starterToggled,required TResult Function()  skipPressed,required TResult Function()  restorePressed,required TResult Function()  restoreOpened,required TResult Function()  restored,}) {final _that = this;
switch (_that) {
case _NextPressed():
return nextPressed();case _BackPressed():
return backPressed();case _StarterToggled():
return starterToggled(_that.name);case _SkipPressed():
return skipPressed();case _RestorePressed():
return restorePressed();case _RestoreOpened():
return restoreOpened();case _Restored():
return restored();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  nextPressed,TResult? Function()?  backPressed,TResult? Function( String name)?  starterToggled,TResult? Function()?  skipPressed,TResult? Function()?  restorePressed,TResult? Function()?  restoreOpened,TResult? Function()?  restored,}) {final _that = this;
switch (_that) {
case _NextPressed() when nextPressed != null:
return nextPressed();case _BackPressed() when backPressed != null:
return backPressed();case _StarterToggled() when starterToggled != null:
return starterToggled(_that.name);case _SkipPressed() when skipPressed != null:
return skipPressed();case _RestorePressed() when restorePressed != null:
return restorePressed();case _RestoreOpened() when restoreOpened != null:
return restoreOpened();case _Restored() when restored != null:
return restored();case _:
  return null;

}
}

}

/// @nodoc


class _NextPressed implements OnboardingEvent {
  const _NextPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent.nextPressed()';
}


}




/// @nodoc


class _BackPressed implements OnboardingEvent {
  const _BackPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent.backPressed()';
}


}




/// @nodoc


class _StarterToggled implements OnboardingEvent {
  const _StarterToggled(this.name);
  

 final  String name;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StarterToggledCopyWith<_StarterToggled> get copyWith => __$StarterToggledCopyWithImpl<_StarterToggled>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StarterToggled&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name);
}

@override
String toString() {
    return 'OnboardingEvent.starterToggled(name: $name)';
}


}

/// @nodoc
abstract mixin class _$StarterToggledCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$StarterToggledCopyWith(_StarterToggled value, $Res Function(_StarterToggled) _then) = __$StarterToggledCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$StarterToggledCopyWithImpl<$Res>
    implements _$StarterToggledCopyWith<$Res> {
  __$StarterToggledCopyWithImpl(this._self, this._then);

  final _StarterToggled _self;
  final $Res Function(_StarterToggled) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_StarterToggled(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SkipPressed implements OnboardingEvent {
  const _SkipPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkipPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent.skipPressed()';
}


}




/// @nodoc


class _RestorePressed implements OnboardingEvent {
  const _RestorePressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestorePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent.restorePressed()';
}


}




/// @nodoc


class _RestoreOpened implements OnboardingEvent {
  const _RestoreOpened();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreOpened);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent.restoreOpened()';
}


}




/// @nodoc


class _Restored implements OnboardingEvent {
  const _Restored();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restored);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent.restored()';
}


}




/// @nodoc
mixin _$OnboardingState {

 OnboardingStep get step;/// Starter names; all preselected (plan §5.4).
 Set<String> get selected; bool get finishing; bool get done; Failure? get failure;/// A picked backup to preview; cleared with `restoreOpened`.
 ImportSource? get pendingRestore; bool get picking;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OnboardingState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.step, _this.step) || other.step == _this.step)&&const DeepCollectionEquality().equals(other.selected, _this.selected)&&(identical(other.finishing, _this.finishing) || other.finishing == _this.finishing)&&(identical(other.done, _this.done) || other.done == _this.done)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.pendingRestore, _this.pendingRestore) || other.pendingRestore == _this.pendingRestore)&&(identical(other.picking, _this.picking) || other.picking == _this.picking));
}


@override
int get hashCode {
  final _this = this as OnboardingState;
  return Object.hash(runtimeType,_this.step,const DeepCollectionEquality().hash(_this.selected),_this.finishing,_this.done,_this.failure,_this.pendingRestore,_this.picking);
}

@override
String toString() {
  final _this = this as OnboardingState;
  return 'OnboardingState(step: ${_this.step}, selected: ${_this.selected}, finishing: ${_this.finishing}, done: ${_this.done}, failure: ${_this.failure}, pendingRestore: ${_this.pendingRestore}, picking: ${_this.picking})';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 OnboardingStep step, Set<String> selected, bool finishing, bool done, Failure? failure, ImportSource? pendingRestore, bool picking
});


$FailureCopyWith<$Res>? get failure;$ImportSourceCopyWith<$Res>? get pendingRestore;

}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? selected = null,Object? finishing = null,Object? done = null,Object? failure = freezed,Object? pendingRestore = freezed,Object? picking = null,}) {
  return _then(OnboardingState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as OnboardingStep,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as Set<String>,finishing: null == finishing ? _self.finishing : finishing // ignore: cast_nullable_to_non_nullable
as bool,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,pendingRestore: freezed == pendingRestore ? _self.pendingRestore : pendingRestore // ignore: cast_nullable_to_non_nullable
as ImportSource?,picking: null == picking ? _self.picking : picking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of OnboardingState
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
}/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSourceCopyWith<$Res>? get pendingRestore {
    if (_self.pendingRestore == null) {
    return null;
  }

  return $ImportSourceCopyWith<$Res>(_self.pendingRestore!, (value) {
    return _then(_self.copyWith(pendingRestore: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OnboardingStep step,  Set<String> selected,  bool finishing,  bool done,  Failure? failure,  ImportSource? pendingRestore,  bool picking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.step,_that.selected,_that.finishing,_that.done,_that.failure,_that.pendingRestore,_that.picking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OnboardingStep step,  Set<String> selected,  bool finishing,  bool done,  Failure? failure,  ImportSource? pendingRestore,  bool picking)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.step,_that.selected,_that.finishing,_that.done,_that.failure,_that.pendingRestore,_that.picking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OnboardingStep step,  Set<String> selected,  bool finishing,  bool done,  Failure? failure,  ImportSource? pendingRestore,  bool picking)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.step,_that.selected,_that.finishing,_that.done,_that.failure,_that.pendingRestore,_that.picking);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.step = OnboardingStep.welcome, required  Set<String> selected, this.finishing = false, this.done = false, this.failure, this.pendingRestore, this.picking = false}): _selected = selected;
  

@override@JsonKey() final  OnboardingStep step;
/// Starter names; all preselected (plan §5.4).
 final  Set<String> _selected;
/// Starter names; all preselected (plan §5.4).
@override Set<String> get selected {
  if (_selected is EqualUnmodifiableSetView) return _selected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selected);
}

@override@JsonKey() final  bool finishing;
@override@JsonKey() final  bool done;
@override final  Failure? failure;
/// A picked backup to preview; cleared with `restoreOpened`.
@override final  ImportSource? pendingRestore;
@override@JsonKey() final  bool picking;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other.selected, _selected)&&(identical(other.finishing, finishing) || other.finishing == finishing)&&(identical(other.done, done) || other.done == done)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.pendingRestore, pendingRestore) || other.pendingRestore == pendingRestore)&&(identical(other.picking, picking) || other.picking == picking));
}


@override
int get hashCode {
    return Object.hash(runtimeType,step,const DeepCollectionEquality().hash(_selected),finishing,done,failure,pendingRestore,picking);
}

@override
String toString() {
    return 'OnboardingState(step: $step, selected: $selected, finishing: $finishing, done: $done, failure: $failure, pendingRestore: $pendingRestore, picking: $picking)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 OnboardingStep step, Set<String> selected, bool finishing, bool done, Failure? failure, ImportSource? pendingRestore, bool picking
});


@override $FailureCopyWith<$Res>? get failure;@override $ImportSourceCopyWith<$Res>? get pendingRestore;

}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? selected = null,Object? finishing = null,Object? done = null,Object? failure = freezed,Object? pendingRestore = freezed,Object? picking = null,}) {
  return _then(_OnboardingState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as OnboardingStep,selected: null == selected ? _self._selected : selected // ignore: cast_nullable_to_non_nullable
as Set<String>,finishing: null == finishing ? _self.finishing : finishing // ignore: cast_nullable_to_non_nullable
as bool,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,pendingRestore: freezed == pendingRestore ? _self.pendingRestore : pendingRestore // ignore: cast_nullable_to_non_nullable
as ImportSource?,picking: null == picking ? _self.picking : picking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of OnboardingState
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
}/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSourceCopyWith<$Res>? get pendingRestore {
    if (_self.pendingRestore == null) {
    return null;
  }

  return $ImportSourceCopyWith<$Res>(_self.pendingRestore!, (value) {
    return _then(_self.copyWith(pendingRestore: value));
  });
}
}

// dart format on
