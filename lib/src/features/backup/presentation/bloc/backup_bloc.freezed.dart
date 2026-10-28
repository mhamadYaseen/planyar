// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackupEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackupEvent()';
}


}

/// @nodoc
class $BackupEventCopyWith<$Res>  {
$BackupEventCopyWith(BackupEvent _, $Res Function(BackupEvent) __);
}


/// Adds pattern-matching-related methods to [BackupEvent].
extension BackupEventPatterns on BackupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SafetyBackupsRefreshed value)?  safetyBackupsRefreshed,TResult Function( _ExportPressed value)?  exportPressed,TResult Function( _ImportPressed value)?  importPressed,TResult Function( _RestorePressed value)?  restorePressed,TResult Function( _SafetySharePressed value)?  safetySharePressed,TResult Function( _NoticeShown value)?  noticeShown,TResult Function( _ImportOpened value)?  importOpened,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SafetyBackupsRefreshed() when safetyBackupsRefreshed != null:
return safetyBackupsRefreshed(_that);case _ExportPressed() when exportPressed != null:
return exportPressed(_that);case _ImportPressed() when importPressed != null:
return importPressed(_that);case _RestorePressed() when restorePressed != null:
return restorePressed(_that);case _SafetySharePressed() when safetySharePressed != null:
return safetySharePressed(_that);case _NoticeShown() when noticeShown != null:
return noticeShown(_that);case _ImportOpened() when importOpened != null:
return importOpened(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SafetyBackupsRefreshed value)  safetyBackupsRefreshed,required TResult Function( _ExportPressed value)  exportPressed,required TResult Function( _ImportPressed value)  importPressed,required TResult Function( _RestorePressed value)  restorePressed,required TResult Function( _SafetySharePressed value)  safetySharePressed,required TResult Function( _NoticeShown value)  noticeShown,required TResult Function( _ImportOpened value)  importOpened,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SafetyBackupsRefreshed():
return safetyBackupsRefreshed(_that);case _ExportPressed():
return exportPressed(_that);case _ImportPressed():
return importPressed(_that);case _RestorePressed():
return restorePressed(_that);case _SafetySharePressed():
return safetySharePressed(_that);case _NoticeShown():
return noticeShown(_that);case _ImportOpened():
return importOpened(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SafetyBackupsRefreshed value)?  safetyBackupsRefreshed,TResult? Function( _ExportPressed value)?  exportPressed,TResult? Function( _ImportPressed value)?  importPressed,TResult? Function( _RestorePressed value)?  restorePressed,TResult? Function( _SafetySharePressed value)?  safetySharePressed,TResult? Function( _NoticeShown value)?  noticeShown,TResult? Function( _ImportOpened value)?  importOpened,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SafetyBackupsRefreshed() when safetyBackupsRefreshed != null:
return safetyBackupsRefreshed(_that);case _ExportPressed() when exportPressed != null:
return exportPressed(_that);case _ImportPressed() when importPressed != null:
return importPressed(_that);case _RestorePressed() when restorePressed != null:
return restorePressed(_that);case _SafetySharePressed() when safetySharePressed != null:
return safetySharePressed(_that);case _NoticeShown() when noticeShown != null:
return noticeShown(_that);case _ImportOpened() when importOpened != null:
return importOpened(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  safetyBackupsRefreshed,TResult Function( ExportDestination destination,  ShareAnchor? anchor)?  exportPressed,TResult Function()?  importPressed,TResult Function( SafetyBackup backup)?  restorePressed,TResult Function( SafetyBackup backup,  ShareAnchor? anchor)?  safetySharePressed,TResult Function()?  noticeShown,TResult Function()?  importOpened,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SafetyBackupsRefreshed() when safetyBackupsRefreshed != null:
return safetyBackupsRefreshed();case _ExportPressed() when exportPressed != null:
return exportPressed(_that.destination,_that.anchor);case _ImportPressed() when importPressed != null:
return importPressed();case _RestorePressed() when restorePressed != null:
return restorePressed(_that.backup);case _SafetySharePressed() when safetySharePressed != null:
return safetySharePressed(_that.backup,_that.anchor);case _NoticeShown() when noticeShown != null:
return noticeShown();case _ImportOpened() when importOpened != null:
return importOpened();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  safetyBackupsRefreshed,required TResult Function( ExportDestination destination,  ShareAnchor? anchor)  exportPressed,required TResult Function()  importPressed,required TResult Function( SafetyBackup backup)  restorePressed,required TResult Function( SafetyBackup backup,  ShareAnchor? anchor)  safetySharePressed,required TResult Function()  noticeShown,required TResult Function()  importOpened,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SafetyBackupsRefreshed():
return safetyBackupsRefreshed();case _ExportPressed():
return exportPressed(_that.destination,_that.anchor);case _ImportPressed():
return importPressed();case _RestorePressed():
return restorePressed(_that.backup);case _SafetySharePressed():
return safetySharePressed(_that.backup,_that.anchor);case _NoticeShown():
return noticeShown();case _ImportOpened():
return importOpened();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  safetyBackupsRefreshed,TResult? Function( ExportDestination destination,  ShareAnchor? anchor)?  exportPressed,TResult? Function()?  importPressed,TResult? Function( SafetyBackup backup)?  restorePressed,TResult? Function( SafetyBackup backup,  ShareAnchor? anchor)?  safetySharePressed,TResult? Function()?  noticeShown,TResult? Function()?  importOpened,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SafetyBackupsRefreshed() when safetyBackupsRefreshed != null:
return safetyBackupsRefreshed();case _ExportPressed() when exportPressed != null:
return exportPressed(_that.destination,_that.anchor);case _ImportPressed() when importPressed != null:
return importPressed();case _RestorePressed() when restorePressed != null:
return restorePressed(_that.backup);case _SafetySharePressed() when safetySharePressed != null:
return safetySharePressed(_that.backup,_that.anchor);case _NoticeShown() when noticeShown != null:
return noticeShown();case _ImportOpened() when importOpened != null:
return importOpened();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements BackupEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackupEvent.started()';
}


}




/// @nodoc


class _SafetyBackupsRefreshed implements BackupEvent {
  const _SafetyBackupsRefreshed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SafetyBackupsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackupEvent.safetyBackupsRefreshed()';
}


}




/// @nodoc


class _ExportPressed implements BackupEvent {
  const _ExportPressed(this.destination, {this.anchor});
  

 final  ExportDestination destination;
 final  ShareAnchor? anchor;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportPressedCopyWith<_ExportPressed> get copyWith => __$ExportPressedCopyWithImpl<_ExportPressed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportPressed&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.anchor, anchor) || other.anchor == anchor));
}


@override
int get hashCode {
    return Object.hash(runtimeType,destination,anchor);
}

@override
String toString() {
    return 'BackupEvent.exportPressed(destination: $destination, anchor: $anchor)';
}


}

/// @nodoc
abstract mixin class _$ExportPressedCopyWith<$Res> implements $BackupEventCopyWith<$Res> {
  factory _$ExportPressedCopyWith(_ExportPressed value, $Res Function(_ExportPressed) _then) = __$ExportPressedCopyWithImpl;
@useResult
$Res call({
 ExportDestination destination, ShareAnchor? anchor
});




}
/// @nodoc
class __$ExportPressedCopyWithImpl<$Res>
    implements _$ExportPressedCopyWith<$Res> {
  __$ExportPressedCopyWithImpl(this._self, this._then);

  final _ExportPressed _self;
  final $Res Function(_ExportPressed) _then;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? destination = null,Object? anchor = freezed,}) {
  return _then(_ExportPressed(
null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as ExportDestination,anchor: freezed == anchor ? _self.anchor : anchor // ignore: cast_nullable_to_non_nullable
as ShareAnchor?,
  ));
}


}

/// @nodoc


class _ImportPressed implements BackupEvent {
  const _ImportPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackupEvent.importPressed()';
}


}




/// @nodoc


class _RestorePressed implements BackupEvent {
  const _RestorePressed(this.backup);
  

 final  SafetyBackup backup;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestorePressedCopyWith<_RestorePressed> get copyWith => __$RestorePressedCopyWithImpl<_RestorePressed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestorePressed&&(identical(other.backup, backup) || other.backup == backup));
}


@override
int get hashCode {
    return Object.hash(runtimeType,backup);
}

@override
String toString() {
    return 'BackupEvent.restorePressed(backup: $backup)';
}


}

/// @nodoc
abstract mixin class _$RestorePressedCopyWith<$Res> implements $BackupEventCopyWith<$Res> {
  factory _$RestorePressedCopyWith(_RestorePressed value, $Res Function(_RestorePressed) _then) = __$RestorePressedCopyWithImpl;
@useResult
$Res call({
 SafetyBackup backup
});




}
/// @nodoc
class __$RestorePressedCopyWithImpl<$Res>
    implements _$RestorePressedCopyWith<$Res> {
  __$RestorePressedCopyWithImpl(this._self, this._then);

  final _RestorePressed _self;
  final $Res Function(_RestorePressed) _then;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? backup = null,}) {
  return _then(_RestorePressed(
null == backup ? _self.backup : backup // ignore: cast_nullable_to_non_nullable
as SafetyBackup,
  ));
}


}

/// @nodoc


class _SafetySharePressed implements BackupEvent {
  const _SafetySharePressed(this.backup, {this.anchor});
  

 final  SafetyBackup backup;
 final  ShareAnchor? anchor;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SafetySharePressedCopyWith<_SafetySharePressed> get copyWith => __$SafetySharePressedCopyWithImpl<_SafetySharePressed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SafetySharePressed&&(identical(other.backup, backup) || other.backup == backup)&&(identical(other.anchor, anchor) || other.anchor == anchor));
}


@override
int get hashCode {
    return Object.hash(runtimeType,backup,anchor);
}

@override
String toString() {
    return 'BackupEvent.safetySharePressed(backup: $backup, anchor: $anchor)';
}


}

/// @nodoc
abstract mixin class _$SafetySharePressedCopyWith<$Res> implements $BackupEventCopyWith<$Res> {
  factory _$SafetySharePressedCopyWith(_SafetySharePressed value, $Res Function(_SafetySharePressed) _then) = __$SafetySharePressedCopyWithImpl;
@useResult
$Res call({
 SafetyBackup backup, ShareAnchor? anchor
});




}
/// @nodoc
class __$SafetySharePressedCopyWithImpl<$Res>
    implements _$SafetySharePressedCopyWith<$Res> {
  __$SafetySharePressedCopyWithImpl(this._self, this._then);

  final _SafetySharePressed _self;
  final $Res Function(_SafetySharePressed) _then;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? backup = null,Object? anchor = freezed,}) {
  return _then(_SafetySharePressed(
null == backup ? _self.backup : backup // ignore: cast_nullable_to_non_nullable
as SafetyBackup,anchor: freezed == anchor ? _self.anchor : anchor // ignore: cast_nullable_to_non_nullable
as ShareAnchor?,
  ));
}


}

/// @nodoc


class _NoticeShown implements BackupEvent {
  const _NoticeShown();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoticeShown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackupEvent.noticeShown()';
}


}




/// @nodoc


class _ImportOpened implements BackupEvent {
  const _ImportOpened();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportOpened);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackupEvent.importOpened()';
}


}




/// @nodoc
mixin _$BackupNotice {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackupNotice()';
}


}

/// @nodoc
class $BackupNoticeCopyWith<$Res>  {
$BackupNoticeCopyWith(BackupNotice _, $Res Function(BackupNotice) __);
}


/// Adds pattern-matching-related methods to [BackupNotice].
extension BackupNoticePatterns on BackupNotice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExportedNotice value)?  exported,TResult Function( FailedNotice value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExportedNotice() when exported != null:
return exported(_that);case FailedNotice() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExportedNotice value)  exported,required TResult Function( FailedNotice value)  failed,}){
final _that = this;
switch (_that) {
case ExportedNotice():
return exported(_that);case FailedNotice():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExportedNotice value)?  exported,TResult? Function( FailedNotice value)?  failed,}){
final _that = this;
switch (_that) {
case ExportedNotice() when exported != null:
return exported(_that);case FailedNotice() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String fileName,  ExportDestination destination)?  exported,TResult Function( Failure failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExportedNotice() when exported != null:
return exported(_that.fileName,_that.destination);case FailedNotice() when failed != null:
return failed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String fileName,  ExportDestination destination)  exported,required TResult Function( Failure failure)  failed,}) {final _that = this;
switch (_that) {
case ExportedNotice():
return exported(_that.fileName,_that.destination);case FailedNotice():
return failed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String fileName,  ExportDestination destination)?  exported,TResult? Function( Failure failure)?  failed,}) {final _that = this;
switch (_that) {
case ExportedNotice() when exported != null:
return exported(_that.fileName,_that.destination);case FailedNotice() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ExportedNotice implements BackupNotice {
  const ExportedNotice({required this.fileName, required this.destination});
  

 final  String fileName;
 final  ExportDestination destination;

/// Create a copy of BackupNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExportedNoticeCopyWith<ExportedNotice> get copyWith => _$ExportedNoticeCopyWithImpl<ExportedNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportedNotice&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.destination, destination) || other.destination == destination));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fileName,destination);
}

@override
String toString() {
    return 'BackupNotice.exported(fileName: $fileName, destination: $destination)';
}


}

/// @nodoc
abstract mixin class $ExportedNoticeCopyWith<$Res> implements $BackupNoticeCopyWith<$Res> {
  factory $ExportedNoticeCopyWith(ExportedNotice value, $Res Function(ExportedNotice) _then) = _$ExportedNoticeCopyWithImpl;
@useResult
$Res call({
 String fileName, ExportDestination destination
});




}
/// @nodoc
class _$ExportedNoticeCopyWithImpl<$Res>
    implements $ExportedNoticeCopyWith<$Res> {
  _$ExportedNoticeCopyWithImpl(this._self, this._then);

  final ExportedNotice _self;
  final $Res Function(ExportedNotice) _then;

/// Create a copy of BackupNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? destination = null,}) {
  return _then(ExportedNotice(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as ExportDestination,
  ));
}


}

/// @nodoc


class FailedNotice implements BackupNotice {
  const FailedNotice(this.failure);
  

 final  Failure failure;

/// Create a copy of BackupNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedNoticeCopyWith<FailedNotice> get copyWith => _$FailedNoticeCopyWithImpl<FailedNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FailedNotice&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'BackupNotice.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FailedNoticeCopyWith<$Res> implements $BackupNoticeCopyWith<$Res> {
  factory $FailedNoticeCopyWith(FailedNotice value, $Res Function(FailedNotice) _then) = _$FailedNoticeCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$FailedNoticeCopyWithImpl<$Res>
    implements $FailedNoticeCopyWith<$Res> {
  _$FailedNoticeCopyWithImpl(this._self, this._then);

  final FailedNotice _self;
  final $Res Function(FailedNotice) _then;

/// Create a copy of BackupNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(FailedNotice(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of BackupNotice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc
mixin _$BackupState {

 BackupStatus get status; DataState<List<SafetyBackup>> get safetyBackups; BackupTask? get busy;/// Shown once, then cleared with `noticeShown`.
 BackupNotice? get notice;/// A file to open in the import preview; cleared with `importOpened`.
 ImportSource? get pendingImport;
/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupStateCopyWith<BackupState> get copyWith => _$BackupStateCopyWithImpl<BackupState>(this as BackupState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BackupState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.safetyBackups, _this.safetyBackups) || other.safetyBackups == _this.safetyBackups)&&(identical(other.busy, _this.busy) || other.busy == _this.busy)&&(identical(other.notice, _this.notice) || other.notice == _this.notice)&&(identical(other.pendingImport, _this.pendingImport) || other.pendingImport == _this.pendingImport));
}


@override
int get hashCode {
  final _this = this as BackupState;
  return Object.hash(runtimeType,_this.status,_this.safetyBackups,_this.busy,_this.notice,_this.pendingImport);
}

@override
String toString() {
  final _this = this as BackupState;
  return 'BackupState(status: ${_this.status}, safetyBackups: ${_this.safetyBackups}, busy: ${_this.busy}, notice: ${_this.notice}, pendingImport: ${_this.pendingImport})';
}


}

/// @nodoc
abstract mixin class $BackupStateCopyWith<$Res>  {
  factory $BackupStateCopyWith(BackupState value, $Res Function(BackupState) _then) = _$BackupStateCopyWithImpl;
@useResult
$Res call({
 BackupStatus status, DataState<List<SafetyBackup>> safetyBackups, BackupTask? busy, BackupNotice? notice, ImportSource? pendingImport
});


$BackupStatusCopyWith<$Res> get status;$DataStateCopyWith<List<SafetyBackup>, $Res> get safetyBackups;$BackupNoticeCopyWith<$Res>? get notice;$ImportSourceCopyWith<$Res>? get pendingImport;

}
/// @nodoc
class _$BackupStateCopyWithImpl<$Res>
    implements $BackupStateCopyWith<$Res> {
  _$BackupStateCopyWithImpl(this._self, this._then);

  final BackupState _self;
  final $Res Function(BackupState) _then;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? safetyBackups = null,Object? busy = freezed,Object? notice = freezed,Object? pendingImport = freezed,}) {
  return _then(BackupState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BackupStatus,safetyBackups: null == safetyBackups ? _self.safetyBackups : safetyBackups // ignore: cast_nullable_to_non_nullable
as DataState<List<SafetyBackup>>,busy: freezed == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as BackupTask?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as BackupNotice?,pendingImport: freezed == pendingImport ? _self.pendingImport : pendingImport // ignore: cast_nullable_to_non_nullable
as ImportSource?,
  ));
}
/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupStatusCopyWith<$Res> get status {
  
  return $BackupStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<List<SafetyBackup>, $Res> get safetyBackups {
  
  return $DataStateCopyWith<List<SafetyBackup>, $Res>(_self.safetyBackups, (value) {
    return _then(_self.copyWith(safetyBackups: value));
  });
}/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupNoticeCopyWith<$Res>? get notice {
    if (_self.notice == null) {
    return null;
  }

  return $BackupNoticeCopyWith<$Res>(_self.notice!, (value) {
    return _then(_self.copyWith(notice: value));
  });
}/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSourceCopyWith<$Res>? get pendingImport {
    if (_self.pendingImport == null) {
    return null;
  }

  return $ImportSourceCopyWith<$Res>(_self.pendingImport!, (value) {
    return _then(_self.copyWith(pendingImport: value));
  });
}
}


/// Adds pattern-matching-related methods to [BackupState].
extension BackupStatePatterns on BackupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupState value)  $default,){
final _that = this;
switch (_that) {
case _BackupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupState value)?  $default,){
final _that = this;
switch (_that) {
case _BackupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BackupStatus status,  DataState<List<SafetyBackup>> safetyBackups,  BackupTask? busy,  BackupNotice? notice,  ImportSource? pendingImport)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupState() when $default != null:
return $default(_that.status,_that.safetyBackups,_that.busy,_that.notice,_that.pendingImport);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BackupStatus status,  DataState<List<SafetyBackup>> safetyBackups,  BackupTask? busy,  BackupNotice? notice,  ImportSource? pendingImport)  $default,) {final _that = this;
switch (_that) {
case _BackupState():
return $default(_that.status,_that.safetyBackups,_that.busy,_that.notice,_that.pendingImport);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BackupStatus status,  DataState<List<SafetyBackup>> safetyBackups,  BackupTask? busy,  BackupNotice? notice,  ImportSource? pendingImport)?  $default,) {final _that = this;
switch (_that) {
case _BackupState() when $default != null:
return $default(_that.status,_that.safetyBackups,_that.busy,_that.notice,_that.pendingImport);case _:
  return null;

}
}

}

/// @nodoc


class _BackupState implements BackupState {
  const _BackupState({this.status = const BackupStatus(), this.safetyBackups = const DataState<List<SafetyBackup>>.initial(), this.busy, this.notice, this.pendingImport});
  

@override@JsonKey() final  BackupStatus status;
@override@JsonKey() final  DataState<List<SafetyBackup>> safetyBackups;
@override final  BackupTask? busy;
/// Shown once, then cleared with `noticeShown`.
@override final  BackupNotice? notice;
/// A file to open in the import preview; cleared with `importOpened`.
@override final  ImportSource? pendingImport;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupStateCopyWith<_BackupState> get copyWith => __$BackupStateCopyWithImpl<_BackupState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupState&&(identical(other.status, status) || other.status == status)&&(identical(other.safetyBackups, safetyBackups) || other.safetyBackups == safetyBackups)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.pendingImport, pendingImport) || other.pendingImport == pendingImport));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,safetyBackups,busy,notice,pendingImport);
}

@override
String toString() {
    return 'BackupState(status: $status, safetyBackups: $safetyBackups, busy: $busy, notice: $notice, pendingImport: $pendingImport)';
}


}

/// @nodoc
abstract mixin class _$BackupStateCopyWith<$Res> implements $BackupStateCopyWith<$Res> {
  factory _$BackupStateCopyWith(_BackupState value, $Res Function(_BackupState) _then) = __$BackupStateCopyWithImpl;
@override @useResult
$Res call({
 BackupStatus status, DataState<List<SafetyBackup>> safetyBackups, BackupTask? busy, BackupNotice? notice, ImportSource? pendingImport
});


@override $BackupStatusCopyWith<$Res> get status;@override $DataStateCopyWith<List<SafetyBackup>, $Res> get safetyBackups;@override $BackupNoticeCopyWith<$Res>? get notice;@override $ImportSourceCopyWith<$Res>? get pendingImport;

}
/// @nodoc
class __$BackupStateCopyWithImpl<$Res>
    implements _$BackupStateCopyWith<$Res> {
  __$BackupStateCopyWithImpl(this._self, this._then);

  final _BackupState _self;
  final $Res Function(_BackupState) _then;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? safetyBackups = null,Object? busy = freezed,Object? notice = freezed,Object? pendingImport = freezed,}) {
  return _then(_BackupState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BackupStatus,safetyBackups: null == safetyBackups ? _self.safetyBackups : safetyBackups // ignore: cast_nullable_to_non_nullable
as DataState<List<SafetyBackup>>,busy: freezed == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as BackupTask?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as BackupNotice?,pendingImport: freezed == pendingImport ? _self.pendingImport : pendingImport // ignore: cast_nullable_to_non_nullable
as ImportSource?,
  ));
}

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupStatusCopyWith<$Res> get status {
  
  return $BackupStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataStateCopyWith<List<SafetyBackup>, $Res> get safetyBackups {
  
  return $DataStateCopyWith<List<SafetyBackup>, $Res>(_self.safetyBackups, (value) {
    return _then(_self.copyWith(safetyBackups: value));
  });
}/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackupNoticeCopyWith<$Res>? get notice {
    if (_self.notice == null) {
    return null;
  }

  return $BackupNoticeCopyWith<$Res>(_self.notice!, (value) {
    return _then(_self.copyWith(notice: value));
  });
}/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportSourceCopyWith<$Res>? get pendingImport {
    if (_self.pendingImport == null) {
    return null;
  }

  return $ImportSourceCopyWith<$Res>(_self.pendingImport!, (value) {
    return _then(_self.copyWith(pendingImport: value));
  });
}
}

// dart format on
