// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'label_picker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LabelPickerEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelPickerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LabelPickerEvent()';
}


}

/// @nodoc
class $LabelPickerEventCopyWith<$Res>  {
$LabelPickerEventCopyWith(LabelPickerEvent _, $Res Function(LabelPickerEvent) __);
}


/// Adds pattern-matching-related methods to [LabelPickerEvent].
extension LabelPickerEventPatterns on LabelPickerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _QueryChanged value)?  queryChanged,TResult Function( _CreatePressed value)?  createPressed,TResult Function( _RestorePressed value)?  restorePressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _CreatePressed() when createPressed != null:
return createPressed(_that);case _RestorePressed() when restorePressed != null:
return restorePressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _QueryChanged value)  queryChanged,required TResult Function( _CreatePressed value)  createPressed,required TResult Function( _RestorePressed value)  restorePressed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _QueryChanged():
return queryChanged(_that);case _CreatePressed():
return createPressed(_that);case _RestorePressed():
return restorePressed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _QueryChanged value)?  queryChanged,TResult? Function( _CreatePressed value)?  createPressed,TResult? Function( _RestorePressed value)?  restorePressed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _CreatePressed() when createPressed != null:
return createPressed(_that);case _RestorePressed() when restorePressed != null:
return restorePressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String query)?  queryChanged,TResult Function()?  createPressed,TResult Function( Label label)?  restorePressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _CreatePressed() when createPressed != null:
return createPressed();case _RestorePressed() when restorePressed != null:
return restorePressed(_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String query)  queryChanged,required TResult Function()  createPressed,required TResult Function( Label label)  restorePressed,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _QueryChanged():
return queryChanged(_that.query);case _CreatePressed():
return createPressed();case _RestorePressed():
return restorePressed(_that.label);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String query)?  queryChanged,TResult? Function()?  createPressed,TResult? Function( Label label)?  restorePressed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _CreatePressed() when createPressed != null:
return createPressed();case _RestorePressed() when restorePressed != null:
return restorePressed(_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LabelPickerEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LabelPickerEvent.started()';
}


}




/// @nodoc


class _QueryChanged implements LabelPickerEvent {
  const _QueryChanged(this.query);
  

 final  String query;

/// Create a copy of LabelPickerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryChangedCopyWith<_QueryChanged> get copyWith => __$QueryChangedCopyWithImpl<_QueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query);
}

@override
String toString() {
    return 'LabelPickerEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$QueryChangedCopyWith<$Res> implements $LabelPickerEventCopyWith<$Res> {
  factory _$QueryChangedCopyWith(_QueryChanged value, $Res Function(_QueryChanged) _then) = __$QueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$QueryChangedCopyWithImpl<$Res>
    implements _$QueryChangedCopyWith<$Res> {
  __$QueryChangedCopyWithImpl(this._self, this._then);

  final _QueryChanged _self;
  final $Res Function(_QueryChanged) _then;

/// Create a copy of LabelPickerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_QueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreatePressed implements LabelPickerEvent {
  const _CreatePressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LabelPickerEvent.createPressed()';
}


}




/// @nodoc


class _RestorePressed implements LabelPickerEvent {
  const _RestorePressed(this.label);
  

 final  Label label;

/// Create a copy of LabelPickerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestorePressedCopyWith<_RestorePressed> get copyWith => __$RestorePressedCopyWithImpl<_RestorePressed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestorePressed&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label);
}

@override
String toString() {
    return 'LabelPickerEvent.restorePressed(label: $label)';
}


}

/// @nodoc
abstract mixin class _$RestorePressedCopyWith<$Res> implements $LabelPickerEventCopyWith<$Res> {
  factory _$RestorePressedCopyWith(_RestorePressed value, $Res Function(_RestorePressed) _then) = __$RestorePressedCopyWithImpl;
@useResult
$Res call({
 Label label
});


$LabelCopyWith<$Res> get label;

}
/// @nodoc
class __$RestorePressedCopyWithImpl<$Res>
    implements _$RestorePressedCopyWith<$Res> {
  __$RestorePressedCopyWithImpl(this._self, this._then);

  final _RestorePressed _self;
  final $Res Function(_RestorePressed) _then;

/// Create a copy of LabelPickerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,}) {
  return _then(_RestorePressed(
null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Label,
  ));
}

/// Create a copy of LabelPickerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelCopyWith<$Res> get label {
  
  return $LabelCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}

/// @nodoc
mixin _$LabelPickerState {

 bool get loading; List<Label> get labels; Map<String, int> get recentUse; String get query; List<Label> get quickChips;/// The list under the search field: everything when the query is empty.
 List<Label> get results; CreateOption get createOption;/// A label created or restored here — the sheet returns it.
 Label? get picked; Failure? get failure;
/// Create a copy of LabelPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelPickerStateCopyWith<LabelPickerState> get copyWith => _$LabelPickerStateCopyWithImpl<LabelPickerState>(this as LabelPickerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LabelPickerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelPickerState&&(identical(other.loading, _this.loading) || other.loading == _this.loading)&&const DeepCollectionEquality().equals(other.labels, _this.labels)&&const DeepCollectionEquality().equals(other.recentUse, _this.recentUse)&&(identical(other.query, _this.query) || other.query == _this.query)&&const DeepCollectionEquality().equals(other.quickChips, _this.quickChips)&&const DeepCollectionEquality().equals(other.results, _this.results)&&(identical(other.createOption, _this.createOption) || other.createOption == _this.createOption)&&(identical(other.picked, _this.picked) || other.picked == _this.picked)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as LabelPickerState;
  return Object.hash(runtimeType,_this.loading,const DeepCollectionEquality().hash(_this.labels),const DeepCollectionEquality().hash(_this.recentUse),_this.query,const DeepCollectionEquality().hash(_this.quickChips),const DeepCollectionEquality().hash(_this.results),_this.createOption,_this.picked,_this.failure);
}

@override
String toString() {
  final _this = this as LabelPickerState;
  return 'LabelPickerState(loading: ${_this.loading}, labels: ${_this.labels}, recentUse: ${_this.recentUse}, query: ${_this.query}, quickChips: ${_this.quickChips}, results: ${_this.results}, createOption: ${_this.createOption}, picked: ${_this.picked}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $LabelPickerStateCopyWith<$Res>  {
  factory $LabelPickerStateCopyWith(LabelPickerState value, $Res Function(LabelPickerState) _then) = _$LabelPickerStateCopyWithImpl;
@useResult
$Res call({
 bool loading, List<Label> labels, Map<String, int> recentUse, String query, List<Label> quickChips, List<Label> results, CreateOption createOption, Label? picked, Failure? failure
});


$CreateOptionCopyWith<$Res> get createOption;$LabelCopyWith<$Res>? get picked;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$LabelPickerStateCopyWithImpl<$Res>
    implements $LabelPickerStateCopyWith<$Res> {
  _$LabelPickerStateCopyWithImpl(this._self, this._then);

  final LabelPickerState _self;
  final $Res Function(LabelPickerState) _then;

/// Create a copy of LabelPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? labels = null,Object? recentUse = null,Object? query = null,Object? quickChips = null,Object? results = null,Object? createOption = null,Object? picked = freezed,Object? failure = freezed,}) {
  return _then(LabelPickerState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<Label>,recentUse: null == recentUse ? _self.recentUse : recentUse // ignore: cast_nullable_to_non_nullable
as Map<String, int>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,quickChips: null == quickChips ? _self.quickChips : quickChips // ignore: cast_nullable_to_non_nullable
as List<Label>,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Label>,createOption: null == createOption ? _self.createOption : createOption // ignore: cast_nullable_to_non_nullable
as CreateOption,picked: freezed == picked ? _self.picked : picked // ignore: cast_nullable_to_non_nullable
as Label?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of LabelPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateOptionCopyWith<$Res> get createOption {
  
  return $CreateOptionCopyWith<$Res>(_self.createOption, (value) {
    return _then(_self.copyWith(createOption: value));
  });
}/// Create a copy of LabelPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelCopyWith<$Res>? get picked {
    if (_self.picked == null) {
    return null;
  }

  return $LabelCopyWith<$Res>(_self.picked!, (value) {
    return _then(_self.copyWith(picked: value));
  });
}/// Create a copy of LabelPickerState
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


/// Adds pattern-matching-related methods to [LabelPickerState].
extension LabelPickerStatePatterns on LabelPickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabelPickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabelPickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabelPickerState value)  $default,){
final _that = this;
switch (_that) {
case _LabelPickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabelPickerState value)?  $default,){
final _that = this;
switch (_that) {
case _LabelPickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  List<Label> labels,  Map<String, int> recentUse,  String query,  List<Label> quickChips,  List<Label> results,  CreateOption createOption,  Label? picked,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabelPickerState() when $default != null:
return $default(_that.loading,_that.labels,_that.recentUse,_that.query,_that.quickChips,_that.results,_that.createOption,_that.picked,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  List<Label> labels,  Map<String, int> recentUse,  String query,  List<Label> quickChips,  List<Label> results,  CreateOption createOption,  Label? picked,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _LabelPickerState():
return $default(_that.loading,_that.labels,_that.recentUse,_that.query,_that.quickChips,_that.results,_that.createOption,_that.picked,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  List<Label> labels,  Map<String, int> recentUse,  String query,  List<Label> quickChips,  List<Label> results,  CreateOption createOption,  Label? picked,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _LabelPickerState() when $default != null:
return $default(_that.loading,_that.labels,_that.recentUse,_that.query,_that.quickChips,_that.results,_that.createOption,_that.picked,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _LabelPickerState implements LabelPickerState {
  const _LabelPickerState({this.loading = true,  List<Label> labels = const <Label>[],  Map<String, int> recentUse = const <String, int>{}, this.query = '',  List<Label> quickChips = const <Label>[],  List<Label> results = const <Label>[], this.createOption = const CreateOption.none(), this.picked, this.failure}): _labels = labels,_recentUse = recentUse,_quickChips = quickChips,_results = results;
  

@override@JsonKey() final  bool loading;
 final  List<Label> _labels;
@override@JsonKey() List<Label> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}

 final  Map<String, int> _recentUse;
@override@JsonKey() Map<String, int> get recentUse {
  if (_recentUse is EqualUnmodifiableMapView) return _recentUse;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_recentUse);
}

@override@JsonKey() final  String query;
 final  List<Label> _quickChips;
@override@JsonKey() List<Label> get quickChips {
  if (_quickChips is EqualUnmodifiableListView) return _quickChips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quickChips);
}

/// The list under the search field: everything when the query is empty.
 final  List<Label> _results;
/// The list under the search field: everything when the query is empty.
@override@JsonKey() List<Label> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey() final  CreateOption createOption;
/// A label created or restored here — the sheet returns it.
@override final  Label? picked;
@override final  Failure? failure;

/// Create a copy of LabelPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelPickerStateCopyWith<_LabelPickerState> get copyWith => __$LabelPickerStateCopyWithImpl<_LabelPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabelPickerState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.labels, _labels)&&const DeepCollectionEquality().equals(other.recentUse, _recentUse)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.quickChips, _quickChips)&&const DeepCollectionEquality().equals(other.results, _results)&&(identical(other.createOption, createOption) || other.createOption == createOption)&&(identical(other.picked, picked) || other.picked == picked)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_recentUse),query,const DeepCollectionEquality().hash(_quickChips),const DeepCollectionEquality().hash(_results),createOption,picked,failure);
}

@override
String toString() {
    return 'LabelPickerState(loading: $loading, labels: $labels, recentUse: $recentUse, query: $query, quickChips: $quickChips, results: $results, createOption: $createOption, picked: $picked, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$LabelPickerStateCopyWith<$Res> implements $LabelPickerStateCopyWith<$Res> {
  factory _$LabelPickerStateCopyWith(_LabelPickerState value, $Res Function(_LabelPickerState) _then) = __$LabelPickerStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, List<Label> labels, Map<String, int> recentUse, String query, List<Label> quickChips, List<Label> results, CreateOption createOption, Label? picked, Failure? failure
});


@override $CreateOptionCopyWith<$Res> get createOption;@override $LabelCopyWith<$Res>? get picked;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$LabelPickerStateCopyWithImpl<$Res>
    implements _$LabelPickerStateCopyWith<$Res> {
  __$LabelPickerStateCopyWithImpl(this._self, this._then);

  final _LabelPickerState _self;
  final $Res Function(_LabelPickerState) _then;

/// Create a copy of LabelPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? labels = null,Object? recentUse = null,Object? query = null,Object? quickChips = null,Object? results = null,Object? createOption = null,Object? picked = freezed,Object? failure = freezed,}) {
  return _then(_LabelPickerState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<Label>,recentUse: null == recentUse ? _self._recentUse : recentUse // ignore: cast_nullable_to_non_nullable
as Map<String, int>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,quickChips: null == quickChips ? _self._quickChips : quickChips // ignore: cast_nullable_to_non_nullable
as List<Label>,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Label>,createOption: null == createOption ? _self.createOption : createOption // ignore: cast_nullable_to_non_nullable
as CreateOption,picked: freezed == picked ? _self.picked : picked // ignore: cast_nullable_to_non_nullable
as Label?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of LabelPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateOptionCopyWith<$Res> get createOption {
  
  return $CreateOptionCopyWith<$Res>(_self.createOption, (value) {
    return _then(_self.copyWith(createOption: value));
  });
}/// Create a copy of LabelPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelCopyWith<$Res>? get picked {
    if (_self.picked == null) {
    return null;
  }

  return $LabelCopyWith<$Res>(_self.picked!, (value) {
    return _then(_self.copyWith(picked: value));
  });
}/// Create a copy of LabelPickerState
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
