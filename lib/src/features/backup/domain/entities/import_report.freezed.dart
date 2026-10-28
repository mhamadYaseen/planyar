// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecordIssue {

 BackupTable get table; int? get index; String? get id; IssueReason get reason;/// The file field at fault, e.g. `endUtc`.
 String? get field;
/// Create a copy of RecordIssue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordIssueCopyWith<RecordIssue> get copyWith => _$RecordIssueCopyWithImpl<RecordIssue>(this as RecordIssue, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RecordIssue;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordIssue&&(identical(other.table, _this.table) || other.table == _this.table)&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.field, _this.field) || other.field == _this.field));
}


@override
int get hashCode {
  final _this = this as RecordIssue;
  return Object.hash(runtimeType,_this.table,_this.index,_this.id,_this.reason,_this.field);
}

@override
String toString() {
  final _this = this as RecordIssue;
  return 'RecordIssue(table: ${_this.table}, index: ${_this.index}, id: ${_this.id}, reason: ${_this.reason}, field: ${_this.field})';
}


}

/// @nodoc
abstract mixin class $RecordIssueCopyWith<$Res>  {
  factory $RecordIssueCopyWith(RecordIssue value, $Res Function(RecordIssue) _then) = _$RecordIssueCopyWithImpl;
@useResult
$Res call({
 BackupTable table, int? index, String? id, IssueReason reason, String? field
});




}
/// @nodoc
class _$RecordIssueCopyWithImpl<$Res>
    implements $RecordIssueCopyWith<$Res> {
  _$RecordIssueCopyWithImpl(this._self, this._then);

  final RecordIssue _self;
  final $Res Function(RecordIssue) _then;

/// Create a copy of RecordIssue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? table = null,Object? index = freezed,Object? id = freezed,Object? reason = null,Object? field = freezed,}) {
  return _then(RecordIssue(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as BackupTable,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as IssueReason,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecordIssue].
extension RecordIssuePatterns on RecordIssue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecordIssue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecordIssue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecordIssue value)  $default,){
final _that = this;
switch (_that) {
case _RecordIssue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecordIssue value)?  $default,){
final _that = this;
switch (_that) {
case _RecordIssue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BackupTable table,  int? index,  String? id,  IssueReason reason,  String? field)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecordIssue() when $default != null:
return $default(_that.table,_that.index,_that.id,_that.reason,_that.field);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BackupTable table,  int? index,  String? id,  IssueReason reason,  String? field)  $default,) {final _that = this;
switch (_that) {
case _RecordIssue():
return $default(_that.table,_that.index,_that.id,_that.reason,_that.field);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BackupTable table,  int? index,  String? id,  IssueReason reason,  String? field)?  $default,) {final _that = this;
switch (_that) {
case _RecordIssue() when $default != null:
return $default(_that.table,_that.index,_that.id,_that.reason,_that.field);case _:
  return null;

}
}

}

/// @nodoc


class _RecordIssue implements RecordIssue {
  const _RecordIssue({required this.table, this.index, this.id, required this.reason, this.field});
  

@override final  BackupTable table;
@override final  int? index;
@override final  String? id;
@override final  IssueReason reason;
/// The file field at fault, e.g. `endUtc`.
@override final  String? field;

/// Create a copy of RecordIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordIssueCopyWith<_RecordIssue> get copyWith => __$RecordIssueCopyWithImpl<_RecordIssue>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecordIssue&&(identical(other.table, table) || other.table == table)&&(identical(other.index, index) || other.index == index)&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.field, field) || other.field == field));
}


@override
int get hashCode {
    return Object.hash(runtimeType,table,index,id,reason,field);
}

@override
String toString() {
    return 'RecordIssue(table: $table, index: $index, id: $id, reason: $reason, field: $field)';
}


}

/// @nodoc
abstract mixin class _$RecordIssueCopyWith<$Res> implements $RecordIssueCopyWith<$Res> {
  factory _$RecordIssueCopyWith(_RecordIssue value, $Res Function(_RecordIssue) _then) = __$RecordIssueCopyWithImpl;
@override @useResult
$Res call({
 BackupTable table, int? index, String? id, IssueReason reason, String? field
});




}
/// @nodoc
class __$RecordIssueCopyWithImpl<$Res>
    implements _$RecordIssueCopyWith<$Res> {
  __$RecordIssueCopyWithImpl(this._self, this._then);

  final _RecordIssue _self;
  final $Res Function(_RecordIssue) _then;

/// Create a copy of RecordIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? table = null,Object? index = freezed,Object? id = freezed,Object? reason = null,Object? field = freezed,}) {
  return _then(_RecordIssue(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as BackupTable,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as IssueReason,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$RecordRepair {

 BackupTable get table; String get id; RepairKind get kind; String? get field;
/// Create a copy of RecordRepair
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordRepairCopyWith<RecordRepair> get copyWith => _$RecordRepairCopyWithImpl<RecordRepair>(this as RecordRepair, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RecordRepair;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordRepair&&(identical(other.table, _this.table) || other.table == _this.table)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.field, _this.field) || other.field == _this.field));
}


@override
int get hashCode {
  final _this = this as RecordRepair;
  return Object.hash(runtimeType,_this.table,_this.id,_this.kind,_this.field);
}

@override
String toString() {
  final _this = this as RecordRepair;
  return 'RecordRepair(table: ${_this.table}, id: ${_this.id}, kind: ${_this.kind}, field: ${_this.field})';
}


}

/// @nodoc
abstract mixin class $RecordRepairCopyWith<$Res>  {
  factory $RecordRepairCopyWith(RecordRepair value, $Res Function(RecordRepair) _then) = _$RecordRepairCopyWithImpl;
@useResult
$Res call({
 BackupTable table, String id, RepairKind kind, String? field
});




}
/// @nodoc
class _$RecordRepairCopyWithImpl<$Res>
    implements $RecordRepairCopyWith<$Res> {
  _$RecordRepairCopyWithImpl(this._self, this._then);

  final RecordRepair _self;
  final $Res Function(RecordRepair) _then;

/// Create a copy of RecordRepair
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? table = null,Object? id = null,Object? kind = null,Object? field = freezed,}) {
  return _then(RecordRepair(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as BackupTable,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RepairKind,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecordRepair].
extension RecordRepairPatterns on RecordRepair {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecordRepair value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecordRepair() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecordRepair value)  $default,){
final _that = this;
switch (_that) {
case _RecordRepair():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecordRepair value)?  $default,){
final _that = this;
switch (_that) {
case _RecordRepair() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BackupTable table,  String id,  RepairKind kind,  String? field)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecordRepair() when $default != null:
return $default(_that.table,_that.id,_that.kind,_that.field);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BackupTable table,  String id,  RepairKind kind,  String? field)  $default,) {final _that = this;
switch (_that) {
case _RecordRepair():
return $default(_that.table,_that.id,_that.kind,_that.field);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BackupTable table,  String id,  RepairKind kind,  String? field)?  $default,) {final _that = this;
switch (_that) {
case _RecordRepair() when $default != null:
return $default(_that.table,_that.id,_that.kind,_that.field);case _:
  return null;

}
}

}

/// @nodoc


class _RecordRepair implements RecordRepair {
  const _RecordRepair({required this.table, required this.id, required this.kind, this.field});
  

@override final  BackupTable table;
@override final  String id;
@override final  RepairKind kind;
@override final  String? field;

/// Create a copy of RecordRepair
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordRepairCopyWith<_RecordRepair> get copyWith => __$RecordRepairCopyWithImpl<_RecordRepair>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecordRepair&&(identical(other.table, table) || other.table == table)&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.field, field) || other.field == field));
}


@override
int get hashCode {
    return Object.hash(runtimeType,table,id,kind,field);
}

@override
String toString() {
    return 'RecordRepair(table: $table, id: $id, kind: $kind, field: $field)';
}


}

/// @nodoc
abstract mixin class _$RecordRepairCopyWith<$Res> implements $RecordRepairCopyWith<$Res> {
  factory _$RecordRepairCopyWith(_RecordRepair value, $Res Function(_RecordRepair) _then) = __$RecordRepairCopyWithImpl;
@override @useResult
$Res call({
 BackupTable table, String id, RepairKind kind, String? field
});




}
/// @nodoc
class __$RecordRepairCopyWithImpl<$Res>
    implements _$RecordRepairCopyWith<$Res> {
  __$RecordRepairCopyWithImpl(this._self, this._then);

  final _RecordRepair _self;
  final $Res Function(_RecordRepair) _then;

/// Create a copy of RecordRepair
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? table = null,Object? id = null,Object? kind = null,Object? field = freezed,}) {
  return _then(_RecordRepair(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as BackupTable,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RepairKind,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ParsedBackup {

 BackupData get data; List<RecordIssue> get issues; List<RecordRepair> get repairs;
/// Create a copy of ParsedBackup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedBackupCopyWith<ParsedBackup> get copyWith => _$ParsedBackupCopyWithImpl<ParsedBackup>(this as ParsedBackup, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ParsedBackup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedBackup&&(identical(other.data, _this.data) || other.data == _this.data)&&const DeepCollectionEquality().equals(other.issues, _this.issues)&&const DeepCollectionEquality().equals(other.repairs, _this.repairs));
}


@override
int get hashCode {
  final _this = this as ParsedBackup;
  return Object.hash(runtimeType,_this.data,const DeepCollectionEquality().hash(_this.issues),const DeepCollectionEquality().hash(_this.repairs));
}

@override
String toString() {
  final _this = this as ParsedBackup;
  return 'ParsedBackup(data: ${_this.data}, issues: ${_this.issues}, repairs: ${_this.repairs})';
}


}

/// @nodoc
abstract mixin class $ParsedBackupCopyWith<$Res>  {
  factory $ParsedBackupCopyWith(ParsedBackup value, $Res Function(ParsedBackup) _then) = _$ParsedBackupCopyWithImpl;
@useResult
$Res call({
 BackupData data, List<RecordIssue> issues, List<RecordRepair> repairs
});


$BackupDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ParsedBackupCopyWithImpl<$Res>
    implements $ParsedBackupCopyWith<$Res> {
  _$ParsedBackupCopyWithImpl(this._self, this._then);

  final ParsedBackup _self;
  final $Res Function(ParsedBackup) _then;

/// Create a copy of ParsedBackup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? issues = null,Object? repairs = null,}) {
  return _then(ParsedBackup(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BackupData,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as List<RecordIssue>,repairs: null == repairs ? _self.repairs : repairs // ignore: cast_nullable_to_non_nullable
as List<RecordRepair>,
  ));
}
/// Create a copy of ParsedBackup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupDataCopyWith<$Res> get data {
  
  return $BackupDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParsedBackup].
extension ParsedBackupPatterns on ParsedBackup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedBackup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedBackup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedBackup value)  $default,){
final _that = this;
switch (_that) {
case _ParsedBackup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedBackup value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedBackup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BackupData data,  List<RecordIssue> issues,  List<RecordRepair> repairs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedBackup() when $default != null:
return $default(_that.data,_that.issues,_that.repairs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BackupData data,  List<RecordIssue> issues,  List<RecordRepair> repairs)  $default,) {final _that = this;
switch (_that) {
case _ParsedBackup():
return $default(_that.data,_that.issues,_that.repairs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BackupData data,  List<RecordIssue> issues,  List<RecordRepair> repairs)?  $default,) {final _that = this;
switch (_that) {
case _ParsedBackup() when $default != null:
return $default(_that.data,_that.issues,_that.repairs);case _:
  return null;

}
}

}

/// @nodoc


class _ParsedBackup implements ParsedBackup {
  const _ParsedBackup({required this.data,  List<RecordIssue> issues = const <RecordIssue>[],  List<RecordRepair> repairs = const <RecordRepair>[]}): _issues = issues,_repairs = repairs;
  

@override final  BackupData data;
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


/// Create a copy of ParsedBackup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedBackupCopyWith<_ParsedBackup> get copyWith => __$ParsedBackupCopyWithImpl<_ParsedBackup>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedBackup&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.issues, _issues)&&const DeepCollectionEquality().equals(other.repairs, _repairs));
}


@override
int get hashCode {
    return Object.hash(runtimeType,data,const DeepCollectionEquality().hash(_issues),const DeepCollectionEquality().hash(_repairs));
}

@override
String toString() {
    return 'ParsedBackup(data: $data, issues: $issues, repairs: $repairs)';
}


}

/// @nodoc
abstract mixin class _$ParsedBackupCopyWith<$Res> implements $ParsedBackupCopyWith<$Res> {
  factory _$ParsedBackupCopyWith(_ParsedBackup value, $Res Function(_ParsedBackup) _then) = __$ParsedBackupCopyWithImpl;
@override @useResult
$Res call({
 BackupData data, List<RecordIssue> issues, List<RecordRepair> repairs
});


@override $BackupDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ParsedBackupCopyWithImpl<$Res>
    implements _$ParsedBackupCopyWith<$Res> {
  __$ParsedBackupCopyWithImpl(this._self, this._then);

  final _ParsedBackup _self;
  final $Res Function(_ParsedBackup) _then;

/// Create a copy of ParsedBackup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? issues = null,Object? repairs = null,}) {
  return _then(_ParsedBackup(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BackupData,issues: null == issues ? _self._issues : issues // ignore: cast_nullable_to_non_nullable
as List<RecordIssue>,repairs: null == repairs ? _self._repairs : repairs // ignore: cast_nullable_to_non_nullable
as List<RecordRepair>,
  ));
}

/// Create a copy of ParsedBackup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupDataCopyWith<$Res> get data {
  
  return $BackupDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
