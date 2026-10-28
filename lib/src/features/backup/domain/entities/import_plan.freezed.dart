// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TableSummary {

/// New records inserted.
 int get added;/// Existing records replaced by the imported version.
 int get overwritten;/// Same as on this device — skipped.
 int get unchanged;/// Left out with a reason (see the issues list).
 int get invalid;/// Labels/categories matched to an existing one by name (D-25). They're
/// also counted as overwritten or identical.
 int get matchedByName;/// Entries skipped as exact duplicates of a local one (D-27).
 int get duplicates;/// Local routine occurrences/exceptions for the same routine and date,
/// replaced by the imported one (§10.7).
 int get replacedByKey;/// Replace only: records on this device that aren't in the file — the
/// import deletes them.
 int get removed;
/// Create a copy of TableSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableSummaryCopyWith<TableSummary> get copyWith => _$TableSummaryCopyWithImpl<TableSummary>(this as TableSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TableSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSummary&&(identical(other.added, _this.added) || other.added == _this.added)&&(identical(other.overwritten, _this.overwritten) || other.overwritten == _this.overwritten)&&(identical(other.unchanged, _this.unchanged) || other.unchanged == _this.unchanged)&&(identical(other.invalid, _this.invalid) || other.invalid == _this.invalid)&&(identical(other.matchedByName, _this.matchedByName) || other.matchedByName == _this.matchedByName)&&(identical(other.duplicates, _this.duplicates) || other.duplicates == _this.duplicates)&&(identical(other.replacedByKey, _this.replacedByKey) || other.replacedByKey == _this.replacedByKey)&&(identical(other.removed, _this.removed) || other.removed == _this.removed));
}


@override
int get hashCode {
  final _this = this as TableSummary;
  return Object.hash(runtimeType,_this.added,_this.overwritten,_this.unchanged,_this.invalid,_this.matchedByName,_this.duplicates,_this.replacedByKey,_this.removed);
}

@override
String toString() {
  final _this = this as TableSummary;
  return 'TableSummary(added: ${_this.added}, overwritten: ${_this.overwritten}, unchanged: ${_this.unchanged}, invalid: ${_this.invalid}, matchedByName: ${_this.matchedByName}, duplicates: ${_this.duplicates}, replacedByKey: ${_this.replacedByKey}, removed: ${_this.removed})';
}


}

/// @nodoc
abstract mixin class $TableSummaryCopyWith<$Res>  {
  factory $TableSummaryCopyWith(TableSummary value, $Res Function(TableSummary) _then) = _$TableSummaryCopyWithImpl;
@useResult
$Res call({
 int added, int overwritten, int unchanged, int invalid, int matchedByName, int duplicates, int replacedByKey, int removed
});




}
/// @nodoc
class _$TableSummaryCopyWithImpl<$Res>
    implements $TableSummaryCopyWith<$Res> {
  _$TableSummaryCopyWithImpl(this._self, this._then);

  final TableSummary _self;
  final $Res Function(TableSummary) _then;

/// Create a copy of TableSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? added = null,Object? overwritten = null,Object? unchanged = null,Object? invalid = null,Object? matchedByName = null,Object? duplicates = null,Object? replacedByKey = null,Object? removed = null,}) {
  return _then(TableSummary(
added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int,overwritten: null == overwritten ? _self.overwritten : overwritten // ignore: cast_nullable_to_non_nullable
as int,unchanged: null == unchanged ? _self.unchanged : unchanged // ignore: cast_nullable_to_non_nullable
as int,invalid: null == invalid ? _self.invalid : invalid // ignore: cast_nullable_to_non_nullable
as int,matchedByName: null == matchedByName ? _self.matchedByName : matchedByName // ignore: cast_nullable_to_non_nullable
as int,duplicates: null == duplicates ? _self.duplicates : duplicates // ignore: cast_nullable_to_non_nullable
as int,replacedByKey: null == replacedByKey ? _self.replacedByKey : replacedByKey // ignore: cast_nullable_to_non_nullable
as int,removed: null == removed ? _self.removed : removed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TableSummary].
extension TableSummaryPatterns on TableSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TableSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TableSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TableSummary value)  $default,){
final _that = this;
switch (_that) {
case _TableSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TableSummary value)?  $default,){
final _that = this;
switch (_that) {
case _TableSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int added,  int overwritten,  int unchanged,  int invalid,  int matchedByName,  int duplicates,  int replacedByKey,  int removed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TableSummary() when $default != null:
return $default(_that.added,_that.overwritten,_that.unchanged,_that.invalid,_that.matchedByName,_that.duplicates,_that.replacedByKey,_that.removed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int added,  int overwritten,  int unchanged,  int invalid,  int matchedByName,  int duplicates,  int replacedByKey,  int removed)  $default,) {final _that = this;
switch (_that) {
case _TableSummary():
return $default(_that.added,_that.overwritten,_that.unchanged,_that.invalid,_that.matchedByName,_that.duplicates,_that.replacedByKey,_that.removed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int added,  int overwritten,  int unchanged,  int invalid,  int matchedByName,  int duplicates,  int replacedByKey,  int removed)?  $default,) {final _that = this;
switch (_that) {
case _TableSummary() when $default != null:
return $default(_that.added,_that.overwritten,_that.unchanged,_that.invalid,_that.matchedByName,_that.duplicates,_that.replacedByKey,_that.removed);case _:
  return null;

}
}

}

/// @nodoc


class _TableSummary extends TableSummary {
  const _TableSummary({this.added = 0, this.overwritten = 0, this.unchanged = 0, this.invalid = 0, this.matchedByName = 0, this.duplicates = 0, this.replacedByKey = 0, this.removed = 0}): super._();
  

/// New records inserted.
@override@JsonKey() final  int added;
/// Existing records replaced by the imported version.
@override@JsonKey() final  int overwritten;
/// Same as on this device — skipped.
@override@JsonKey() final  int unchanged;
/// Left out with a reason (see the issues list).
@override@JsonKey() final  int invalid;
/// Labels/categories matched to an existing one by name (D-25). They're
/// also counted as overwritten or identical.
@override@JsonKey() final  int matchedByName;
/// Entries skipped as exact duplicates of a local one (D-27).
@override@JsonKey() final  int duplicates;
/// Local routine occurrences/exceptions for the same routine and date,
/// replaced by the imported one (§10.7).
@override@JsonKey() final  int replacedByKey;
/// Replace only: records on this device that aren't in the file — the
/// import deletes them.
@override@JsonKey() final  int removed;

/// Create a copy of TableSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableSummaryCopyWith<_TableSummary> get copyWith => __$TableSummaryCopyWithImpl<_TableSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableSummary&&(identical(other.added, added) || other.added == added)&&(identical(other.overwritten, overwritten) || other.overwritten == overwritten)&&(identical(other.unchanged, unchanged) || other.unchanged == unchanged)&&(identical(other.invalid, invalid) || other.invalid == invalid)&&(identical(other.matchedByName, matchedByName) || other.matchedByName == matchedByName)&&(identical(other.duplicates, duplicates) || other.duplicates == duplicates)&&(identical(other.replacedByKey, replacedByKey) || other.replacedByKey == replacedByKey)&&(identical(other.removed, removed) || other.removed == removed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,added,overwritten,unchanged,invalid,matchedByName,duplicates,replacedByKey,removed);
}

@override
String toString() {
    return 'TableSummary(added: $added, overwritten: $overwritten, unchanged: $unchanged, invalid: $invalid, matchedByName: $matchedByName, duplicates: $duplicates, replacedByKey: $replacedByKey, removed: $removed)';
}


}

/// @nodoc
abstract mixin class _$TableSummaryCopyWith<$Res> implements $TableSummaryCopyWith<$Res> {
  factory _$TableSummaryCopyWith(_TableSummary value, $Res Function(_TableSummary) _then) = __$TableSummaryCopyWithImpl;
@override @useResult
$Res call({
 int added, int overwritten, int unchanged, int invalid, int matchedByName, int duplicates, int replacedByKey, int removed
});




}
/// @nodoc
class __$TableSummaryCopyWithImpl<$Res>
    implements _$TableSummaryCopyWith<$Res> {
  __$TableSummaryCopyWithImpl(this._self, this._then);

  final _TableSummary _self;
  final $Res Function(_TableSummary) _then;

/// Create a copy of TableSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? added = null,Object? overwritten = null,Object? unchanged = null,Object? invalid = null,Object? matchedByName = null,Object? duplicates = null,Object? replacedByKey = null,Object? removed = null,}) {
  return _then(_TableSummary(
added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int,overwritten: null == overwritten ? _self.overwritten : overwritten // ignore: cast_nullable_to_non_nullable
as int,unchanged: null == unchanged ? _self.unchanged : unchanged // ignore: cast_nullable_to_non_nullable
as int,invalid: null == invalid ? _self.invalid : invalid // ignore: cast_nullable_to_non_nullable
as int,matchedByName: null == matchedByName ? _self.matchedByName : matchedByName // ignore: cast_nullable_to_non_nullable
as int,duplicates: null == duplicates ? _self.duplicates : duplicates // ignore: cast_nullable_to_non_nullable
as int,replacedByKey: null == replacedByKey ? _self.replacedByKey : replacedByKey // ignore: cast_nullable_to_non_nullable
as int,removed: null == removed ? _self.removed : removed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ImportSummary {

 ImportMode get mode; Map<BackupTable, TableSummary> get tables;/// Overwritten records (or, merging, routine changes replaced for the
/// same day) whose local version was edited later than the imported one
/// ("312 local records are newer…").
 int get localNewer; bool get settingsImported; List<RecordIssue> get issues; List<RecordRepair> get repairs;
/// Create a copy of ImportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<ImportSummary> get copyWith => _$ImportSummaryCopyWithImpl<ImportSummary>(this as ImportSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportSummary&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&const DeepCollectionEquality().equals(other.tables, _this.tables)&&(identical(other.localNewer, _this.localNewer) || other.localNewer == _this.localNewer)&&(identical(other.settingsImported, _this.settingsImported) || other.settingsImported == _this.settingsImported)&&const DeepCollectionEquality().equals(other.issues, _this.issues)&&const DeepCollectionEquality().equals(other.repairs, _this.repairs));
}


@override
int get hashCode {
  final _this = this as ImportSummary;
  return Object.hash(runtimeType,_this.mode,const DeepCollectionEquality().hash(_this.tables),_this.localNewer,_this.settingsImported,const DeepCollectionEquality().hash(_this.issues),const DeepCollectionEquality().hash(_this.repairs));
}

@override
String toString() {
  final _this = this as ImportSummary;
  return 'ImportSummary(mode: ${_this.mode}, tables: ${_this.tables}, localNewer: ${_this.localNewer}, settingsImported: ${_this.settingsImported}, issues: ${_this.issues}, repairs: ${_this.repairs})';
}


}

/// @nodoc
abstract mixin class $ImportSummaryCopyWith<$Res>  {
  factory $ImportSummaryCopyWith(ImportSummary value, $Res Function(ImportSummary) _then) = _$ImportSummaryCopyWithImpl;
@useResult
$Res call({
 ImportMode mode, Map<BackupTable, TableSummary> tables, int localNewer, bool settingsImported, List<RecordIssue> issues, List<RecordRepair> repairs
});




}
/// @nodoc
class _$ImportSummaryCopyWithImpl<$Res>
    implements $ImportSummaryCopyWith<$Res> {
  _$ImportSummaryCopyWithImpl(this._self, this._then);

  final ImportSummary _self;
  final $Res Function(ImportSummary) _then;

/// Create a copy of ImportSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? tables = null,Object? localNewer = null,Object? settingsImported = null,Object? issues = null,Object? repairs = null,}) {
  return _then(ImportSummary(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ImportMode,tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as Map<BackupTable, TableSummary>,localNewer: null == localNewer ? _self.localNewer : localNewer // ignore: cast_nullable_to_non_nullable
as int,settingsImported: null == settingsImported ? _self.settingsImported : settingsImported // ignore: cast_nullable_to_non_nullable
as bool,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as List<RecordIssue>,repairs: null == repairs ? _self.repairs : repairs // ignore: cast_nullable_to_non_nullable
as List<RecordRepair>,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportSummary].
extension ImportSummaryPatterns on ImportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportSummary value)  $default,){
final _that = this;
switch (_that) {
case _ImportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ImportSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImportMode mode,  Map<BackupTable, TableSummary> tables,  int localNewer,  bool settingsImported,  List<RecordIssue> issues,  List<RecordRepair> repairs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportSummary() when $default != null:
return $default(_that.mode,_that.tables,_that.localNewer,_that.settingsImported,_that.issues,_that.repairs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImportMode mode,  Map<BackupTable, TableSummary> tables,  int localNewer,  bool settingsImported,  List<RecordIssue> issues,  List<RecordRepair> repairs)  $default,) {final _that = this;
switch (_that) {
case _ImportSummary():
return $default(_that.mode,_that.tables,_that.localNewer,_that.settingsImported,_that.issues,_that.repairs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImportMode mode,  Map<BackupTable, TableSummary> tables,  int localNewer,  bool settingsImported,  List<RecordIssue> issues,  List<RecordRepair> repairs)?  $default,) {final _that = this;
switch (_that) {
case _ImportSummary() when $default != null:
return $default(_that.mode,_that.tables,_that.localNewer,_that.settingsImported,_that.issues,_that.repairs);case _:
  return null;

}
}

}

/// @nodoc


class _ImportSummary extends ImportSummary {
  const _ImportSummary({required this.mode, required  Map<BackupTable, TableSummary> tables, this.localNewer = 0, this.settingsImported = false,  List<RecordIssue> issues = const <RecordIssue>[],  List<RecordRepair> repairs = const <RecordRepair>[]}): _tables = tables,_issues = issues,_repairs = repairs,super._();
  

@override final  ImportMode mode;
 final  Map<BackupTable, TableSummary> _tables;
@override Map<BackupTable, TableSummary> get tables {
  if (_tables is EqualUnmodifiableMapView) return _tables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_tables);
}

/// Overwritten records (or, merging, routine changes replaced for the
/// same day) whose local version was edited later than the imported one
/// ("312 local records are newer…").
@override@JsonKey() final  int localNewer;
@override@JsonKey() final  bool settingsImported;
 final  List<RecordIssue> _issues;
@override@JsonKey() List<RecordIssue> get issues {
  if (_issues is EqualUnmodifiableListView) return _issues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_issues);
}

 final  List<RecordRepair> _repairs;
@override@JsonKey() List<RecordRepair> get repairs {
  if (_repairs is EqualUnmodifiableListView) return _repairs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_repairs);
}


/// Create a copy of ImportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportSummaryCopyWith<_ImportSummary> get copyWith => __$ImportSummaryCopyWithImpl<_ImportSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportSummary&&(identical(other.mode, mode) || other.mode == mode)&&const DeepCollectionEquality().equals(other.tables, _tables)&&(identical(other.localNewer, localNewer) || other.localNewer == localNewer)&&(identical(other.settingsImported, settingsImported) || other.settingsImported == settingsImported)&&const DeepCollectionEquality().equals(other.issues, _issues)&&const DeepCollectionEquality().equals(other.repairs, _repairs));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,const DeepCollectionEquality().hash(_tables),localNewer,settingsImported,const DeepCollectionEquality().hash(_issues),const DeepCollectionEquality().hash(_repairs));
}

@override
String toString() {
    return 'ImportSummary(mode: $mode, tables: $tables, localNewer: $localNewer, settingsImported: $settingsImported, issues: $issues, repairs: $repairs)';
}


}

/// @nodoc
abstract mixin class _$ImportSummaryCopyWith<$Res> implements $ImportSummaryCopyWith<$Res> {
  factory _$ImportSummaryCopyWith(_ImportSummary value, $Res Function(_ImportSummary) _then) = __$ImportSummaryCopyWithImpl;
@override @useResult
$Res call({
 ImportMode mode, Map<BackupTable, TableSummary> tables, int localNewer, bool settingsImported, List<RecordIssue> issues, List<RecordRepair> repairs
});




}
/// @nodoc
class __$ImportSummaryCopyWithImpl<$Res>
    implements _$ImportSummaryCopyWith<$Res> {
  __$ImportSummaryCopyWithImpl(this._self, this._then);

  final _ImportSummary _self;
  final $Res Function(_ImportSummary) _then;

/// Create a copy of ImportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? tables = null,Object? localNewer = null,Object? settingsImported = null,Object? issues = null,Object? repairs = null,}) {
  return _then(_ImportSummary(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ImportMode,tables: null == tables ? _self._tables : tables // ignore: cast_nullable_to_non_nullable
as Map<BackupTable, TableSummary>,localNewer: null == localNewer ? _self.localNewer : localNewer // ignore: cast_nullable_to_non_nullable
as int,settingsImported: null == settingsImported ? _self.settingsImported : settingsImported // ignore: cast_nullable_to_non_nullable
as bool,issues: null == issues ? _self._issues : issues // ignore: cast_nullable_to_non_nullable
as List<RecordIssue>,repairs: null == repairs ? _self._repairs : repairs // ignore: cast_nullable_to_non_nullable
as List<RecordRepair>,
  ));
}


}

/// @nodoc
mixin _$ImportPlan {

 ImportSummary get summary;/// Replace: delete every record first.
 bool get replaceAll;/// Records to insert or update, by primary key.
 BackupData get upserts;/// Merge: local rows replaced by an imported one with the same key.
 List<String> get deleteEntryIds; List<String> get deleteRoutineExceptionIds;/// Portable settings to write; null leaves settings alone.
 Map<String, Object?>? get settings;
/// Create a copy of ImportPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportPlanCopyWith<ImportPlan> get copyWith => _$ImportPlanCopyWithImpl<ImportPlan>(this as ImportPlan, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportPlan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportPlan&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.replaceAll, _this.replaceAll) || other.replaceAll == _this.replaceAll)&&(identical(other.upserts, _this.upserts) || other.upserts == _this.upserts)&&const DeepCollectionEquality().equals(other.deleteEntryIds, _this.deleteEntryIds)&&const DeepCollectionEquality().equals(other.deleteRoutineExceptionIds, _this.deleteRoutineExceptionIds)&&const DeepCollectionEquality().equals(other.settings, _this.settings));
}


@override
int get hashCode {
  final _this = this as ImportPlan;
  return Object.hash(runtimeType,_this.summary,_this.replaceAll,_this.upserts,const DeepCollectionEquality().hash(_this.deleteEntryIds),const DeepCollectionEquality().hash(_this.deleteRoutineExceptionIds),const DeepCollectionEquality().hash(_this.settings));
}

@override
String toString() {
  final _this = this as ImportPlan;
  return 'ImportPlan(summary: ${_this.summary}, replaceAll: ${_this.replaceAll}, upserts: ${_this.upserts}, deleteEntryIds: ${_this.deleteEntryIds}, deleteRoutineExceptionIds: ${_this.deleteRoutineExceptionIds}, settings: ${_this.settings})';
}


}

/// @nodoc
abstract mixin class $ImportPlanCopyWith<$Res>  {
  factory $ImportPlanCopyWith(ImportPlan value, $Res Function(ImportPlan) _then) = _$ImportPlanCopyWithImpl;
@useResult
$Res call({
 ImportSummary summary, bool replaceAll, BackupData upserts, List<String> deleteEntryIds, List<String> deleteRoutineExceptionIds, Map<String, Object?>? settings
});


$ImportSummaryCopyWith<$Res> get summary;$BackupDataCopyWith<$Res> get upserts;

}
/// @nodoc
class _$ImportPlanCopyWithImpl<$Res>
    implements $ImportPlanCopyWith<$Res> {
  _$ImportPlanCopyWithImpl(this._self, this._then);

  final ImportPlan _self;
  final $Res Function(ImportPlan) _then;

/// Create a copy of ImportPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? replaceAll = null,Object? upserts = null,Object? deleteEntryIds = null,Object? deleteRoutineExceptionIds = null,Object? settings = freezed,}) {
  return _then(ImportPlan(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ImportSummary,replaceAll: null == replaceAll ? _self.replaceAll : replaceAll // ignore: cast_nullable_to_non_nullable
as bool,upserts: null == upserts ? _self.upserts : upserts // ignore: cast_nullable_to_non_nullable
as BackupData,deleteEntryIds: null == deleteEntryIds ? _self.deleteEntryIds : deleteEntryIds // ignore: cast_nullable_to_non_nullable
as List<String>,deleteRoutineExceptionIds: null == deleteRoutineExceptionIds ? _self.deleteRoutineExceptionIds : deleteRoutineExceptionIds // ignore: cast_nullable_to_non_nullable
as List<String>,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}
/// Create a copy of ImportPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<$Res> get summary {
  
  return $ImportSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of ImportPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupDataCopyWith<$Res> get upserts {
  
  return $BackupDataCopyWith<$Res>(_self.upserts, (value) {
    return _then(_self.copyWith(upserts: value));
  });
}
}


/// Adds pattern-matching-related methods to [ImportPlan].
extension ImportPlanPatterns on ImportPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportPlan value)  $default,){
final _that = this;
switch (_that) {
case _ImportPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportPlan value)?  $default,){
final _that = this;
switch (_that) {
case _ImportPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImportSummary summary,  bool replaceAll,  BackupData upserts,  List<String> deleteEntryIds,  List<String> deleteRoutineExceptionIds,  Map<String, Object?>? settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportPlan() when $default != null:
return $default(_that.summary,_that.replaceAll,_that.upserts,_that.deleteEntryIds,_that.deleteRoutineExceptionIds,_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImportSummary summary,  bool replaceAll,  BackupData upserts,  List<String> deleteEntryIds,  List<String> deleteRoutineExceptionIds,  Map<String, Object?>? settings)  $default,) {final _that = this;
switch (_that) {
case _ImportPlan():
return $default(_that.summary,_that.replaceAll,_that.upserts,_that.deleteEntryIds,_that.deleteRoutineExceptionIds,_that.settings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImportSummary summary,  bool replaceAll,  BackupData upserts,  List<String> deleteEntryIds,  List<String> deleteRoutineExceptionIds,  Map<String, Object?>? settings)?  $default,) {final _that = this;
switch (_that) {
case _ImportPlan() when $default != null:
return $default(_that.summary,_that.replaceAll,_that.upserts,_that.deleteEntryIds,_that.deleteRoutineExceptionIds,_that.settings);case _:
  return null;

}
}

}

/// @nodoc


class _ImportPlan implements ImportPlan {
  const _ImportPlan({required this.summary, this.replaceAll = false, this.upserts = const BackupData(),  List<String> deleteEntryIds = const <String>[],  List<String> deleteRoutineExceptionIds = const <String>[],  Map<String, Object?>? settings}): _deleteEntryIds = deleteEntryIds,_deleteRoutineExceptionIds = deleteRoutineExceptionIds,_settings = settings;
  

@override final  ImportSummary summary;
/// Replace: delete every record first.
@override@JsonKey() final  bool replaceAll;
/// Records to insert or update, by primary key.
@override@JsonKey() final  BackupData upserts;
/// Merge: local rows replaced by an imported one with the same key.
 final  List<String> _deleteEntryIds;
/// Merge: local rows replaced by an imported one with the same key.
@override@JsonKey() List<String> get deleteEntryIds {
  if (_deleteEntryIds is EqualUnmodifiableListView) return _deleteEntryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deleteEntryIds);
}

 final  List<String> _deleteRoutineExceptionIds;
@override@JsonKey() List<String> get deleteRoutineExceptionIds {
  if (_deleteRoutineExceptionIds is EqualUnmodifiableListView) return _deleteRoutineExceptionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deleteRoutineExceptionIds);
}

/// Portable settings to write; null leaves settings alone.
 final  Map<String, Object?>? _settings;
/// Portable settings to write; null leaves settings alone.
@override Map<String, Object?>? get settings {
  final value = _settings;
  if (value == null) return null;
  if (_settings is EqualUnmodifiableMapView) return _settings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ImportPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportPlanCopyWith<_ImportPlan> get copyWith => __$ImportPlanCopyWithImpl<_ImportPlan>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportPlan&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.replaceAll, replaceAll) || other.replaceAll == replaceAll)&&(identical(other.upserts, upserts) || other.upserts == upserts)&&const DeepCollectionEquality().equals(other.deleteEntryIds, _deleteEntryIds)&&const DeepCollectionEquality().equals(other.deleteRoutineExceptionIds, _deleteRoutineExceptionIds)&&const DeepCollectionEquality().equals(other.settings, _settings));
}


@override
int get hashCode {
    return Object.hash(runtimeType,summary,replaceAll,upserts,const DeepCollectionEquality().hash(_deleteEntryIds),const DeepCollectionEquality().hash(_deleteRoutineExceptionIds),const DeepCollectionEquality().hash(_settings));
}

@override
String toString() {
    return 'ImportPlan(summary: $summary, replaceAll: $replaceAll, upserts: $upserts, deleteEntryIds: $deleteEntryIds, deleteRoutineExceptionIds: $deleteRoutineExceptionIds, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$ImportPlanCopyWith<$Res> implements $ImportPlanCopyWith<$Res> {
  factory _$ImportPlanCopyWith(_ImportPlan value, $Res Function(_ImportPlan) _then) = __$ImportPlanCopyWithImpl;
@override @useResult
$Res call({
 ImportSummary summary, bool replaceAll, BackupData upserts, List<String> deleteEntryIds, List<String> deleteRoutineExceptionIds, Map<String, Object?>? settings
});


@override $ImportSummaryCopyWith<$Res> get summary;@override $BackupDataCopyWith<$Res> get upserts;

}
/// @nodoc
class __$ImportPlanCopyWithImpl<$Res>
    implements _$ImportPlanCopyWith<$Res> {
  __$ImportPlanCopyWithImpl(this._self, this._then);

  final _ImportPlan _self;
  final $Res Function(_ImportPlan) _then;

/// Create a copy of ImportPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? replaceAll = null,Object? upserts = null,Object? deleteEntryIds = null,Object? deleteRoutineExceptionIds = null,Object? settings = freezed,}) {
  return _then(_ImportPlan(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ImportSummary,replaceAll: null == replaceAll ? _self.replaceAll : replaceAll // ignore: cast_nullable_to_non_nullable
as bool,upserts: null == upserts ? _self.upserts : upserts // ignore: cast_nullable_to_non_nullable
as BackupData,deleteEntryIds: null == deleteEntryIds ? _self._deleteEntryIds : deleteEntryIds // ignore: cast_nullable_to_non_nullable
as List<String>,deleteRoutineExceptionIds: null == deleteRoutineExceptionIds ? _self._deleteRoutineExceptionIds : deleteRoutineExceptionIds // ignore: cast_nullable_to_non_nullable
as List<String>,settings: freezed == settings ? _self._settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

/// Create a copy of ImportPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<$Res> get summary {
  
  return $ImportSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of ImportPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupDataCopyWith<$Res> get upserts {
  
  return $BackupDataCopyWith<$Res>(_self.upserts, (value) {
    return _then(_self.copyWith(upserts: value));
  });
}
}

/// @nodoc
mixin _$ImportLogEntry {

 Instant get at; ImportMode get mode; String get fileName; int get written; int get skipped; int get invalid;/// The safety backup made first, if there was data to save.
 String? get safetyBackupName;
/// Create a copy of ImportLogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportLogEntryCopyWith<ImportLogEntry> get copyWith => _$ImportLogEntryCopyWithImpl<ImportLogEntry>(this as ImportLogEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportLogEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportLogEntry&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.written, _this.written) || other.written == _this.written)&&(identical(other.skipped, _this.skipped) || other.skipped == _this.skipped)&&(identical(other.invalid, _this.invalid) || other.invalid == _this.invalid)&&(identical(other.safetyBackupName, _this.safetyBackupName) || other.safetyBackupName == _this.safetyBackupName));
}


@override
int get hashCode {
  final _this = this as ImportLogEntry;
  return Object.hash(runtimeType,_this.at,_this.mode,_this.fileName,_this.written,_this.skipped,_this.invalid,_this.safetyBackupName);
}

@override
String toString() {
  final _this = this as ImportLogEntry;
  return 'ImportLogEntry(at: ${_this.at}, mode: ${_this.mode}, fileName: ${_this.fileName}, written: ${_this.written}, skipped: ${_this.skipped}, invalid: ${_this.invalid}, safetyBackupName: ${_this.safetyBackupName})';
}


}

/// @nodoc
abstract mixin class $ImportLogEntryCopyWith<$Res>  {
  factory $ImportLogEntryCopyWith(ImportLogEntry value, $Res Function(ImportLogEntry) _then) = _$ImportLogEntryCopyWithImpl;
@useResult
$Res call({
 Instant at, ImportMode mode, String fileName, int written, int skipped, int invalid, String? safetyBackupName
});




}
/// @nodoc
class _$ImportLogEntryCopyWithImpl<$Res>
    implements $ImportLogEntryCopyWith<$Res> {
  _$ImportLogEntryCopyWithImpl(this._self, this._then);

  final ImportLogEntry _self;
  final $Res Function(ImportLogEntry) _then;

/// Create a copy of ImportLogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? at = null,Object? mode = null,Object? fileName = null,Object? written = null,Object? skipped = null,Object? invalid = null,Object? safetyBackupName = freezed,}) {
  return _then(ImportLogEntry(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as Instant,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ImportMode,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,written: null == written ? _self.written : written // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as int,invalid: null == invalid ? _self.invalid : invalid // ignore: cast_nullable_to_non_nullable
as int,safetyBackupName: freezed == safetyBackupName ? _self.safetyBackupName : safetyBackupName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportLogEntry].
extension ImportLogEntryPatterns on ImportLogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportLogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportLogEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportLogEntry value)  $default,){
final _that = this;
switch (_that) {
case _ImportLogEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportLogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ImportLogEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Instant at,  ImportMode mode,  String fileName,  int written,  int skipped,  int invalid,  String? safetyBackupName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportLogEntry() when $default != null:
return $default(_that.at,_that.mode,_that.fileName,_that.written,_that.skipped,_that.invalid,_that.safetyBackupName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Instant at,  ImportMode mode,  String fileName,  int written,  int skipped,  int invalid,  String? safetyBackupName)  $default,) {final _that = this;
switch (_that) {
case _ImportLogEntry():
return $default(_that.at,_that.mode,_that.fileName,_that.written,_that.skipped,_that.invalid,_that.safetyBackupName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Instant at,  ImportMode mode,  String fileName,  int written,  int skipped,  int invalid,  String? safetyBackupName)?  $default,) {final _that = this;
switch (_that) {
case _ImportLogEntry() when $default != null:
return $default(_that.at,_that.mode,_that.fileName,_that.written,_that.skipped,_that.invalid,_that.safetyBackupName);case _:
  return null;

}
}

}

/// @nodoc


class _ImportLogEntry implements ImportLogEntry {
  const _ImportLogEntry({required this.at, required this.mode, required this.fileName, required this.written, required this.skipped, required this.invalid, this.safetyBackupName});
  

@override final  Instant at;
@override final  ImportMode mode;
@override final  String fileName;
@override final  int written;
@override final  int skipped;
@override final  int invalid;
/// The safety backup made first, if there was data to save.
@override final  String? safetyBackupName;

/// Create a copy of ImportLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportLogEntryCopyWith<_ImportLogEntry> get copyWith => __$ImportLogEntryCopyWithImpl<_ImportLogEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportLogEntry&&(identical(other.at, at) || other.at == at)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.written, written) || other.written == written)&&(identical(other.skipped, skipped) || other.skipped == skipped)&&(identical(other.invalid, invalid) || other.invalid == invalid)&&(identical(other.safetyBackupName, safetyBackupName) || other.safetyBackupName == safetyBackupName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,at,mode,fileName,written,skipped,invalid,safetyBackupName);
}

@override
String toString() {
    return 'ImportLogEntry(at: $at, mode: $mode, fileName: $fileName, written: $written, skipped: $skipped, invalid: $invalid, safetyBackupName: $safetyBackupName)';
}


}

/// @nodoc
abstract mixin class _$ImportLogEntryCopyWith<$Res> implements $ImportLogEntryCopyWith<$Res> {
  factory _$ImportLogEntryCopyWith(_ImportLogEntry value, $Res Function(_ImportLogEntry) _then) = __$ImportLogEntryCopyWithImpl;
@override @useResult
$Res call({
 Instant at, ImportMode mode, String fileName, int written, int skipped, int invalid, String? safetyBackupName
});




}
/// @nodoc
class __$ImportLogEntryCopyWithImpl<$Res>
    implements _$ImportLogEntryCopyWith<$Res> {
  __$ImportLogEntryCopyWithImpl(this._self, this._then);

  final _ImportLogEntry _self;
  final $Res Function(_ImportLogEntry) _then;

/// Create a copy of ImportLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? at = null,Object? mode = null,Object? fileName = null,Object? written = null,Object? skipped = null,Object? invalid = null,Object? safetyBackupName = freezed,}) {
  return _then(_ImportLogEntry(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as Instant,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ImportMode,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,written: null == written ? _self.written : written // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as int,invalid: null == invalid ? _self.invalid : invalid // ignore: cast_nullable_to_non_nullable
as int,safetyBackupName: freezed == safetyBackupName ? _self.safetyBackupName : safetyBackupName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
