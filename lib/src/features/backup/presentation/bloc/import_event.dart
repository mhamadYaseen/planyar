part of 'import_bloc.dart';

@freezed
sealed class ImportEvent with _$ImportEvent {
  /// Reads and previews [source].
  const factory ImportEvent.started(ImportSource source) = _Started;

  const factory ImportEvent.modeChanged(ImportMode mode) = _ModeChanged;

  /// Merge: "Also import settings" (D-26).
  const factory ImportEvent.importSettingsChanged(bool value) = _ImportSettingsChanged;

  /// "Import without them": required when records can't be imported (J17 AC2).
  const factory ImportEvent.skipInvalidChanged(bool value) = _SkipInvalidChanged;

  /// The user confirmed (Replace has asked once more by then).
  const factory ImportEvent.confirmed() = _Confirmed;
}
