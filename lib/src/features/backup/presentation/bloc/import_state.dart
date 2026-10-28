part of 'import_bloc.dart';

@freezed
abstract class ImportState with _$ImportState {
  const factory ImportState({
    ImportSource? source,
    @Default(DataState<ImportPreview>.initial()) DataState<ImportPreview> preview,
    @Default(ImportMode.merge) ImportMode mode,
    @Default(false) bool importSettings,
    @Default(false) bool skipInvalid,

    /// Loading while the import runs; then the result (S24) or the failure.
    @Default(DataState<ImportResult>.initial()) DataState<ImportResult> result,
  }) = _ImportState;

  const ImportState._();

  bool get replaceOnly => source?.replaceOnly ?? false;

  /// The preview of the chosen mode.
  ImportSummary? get summary => switch (preview) {
    DataSuccess(:final data) => mode == ImportMode.replace ? data.replace : data.merge,
    _ => null,
  };

  /// Invalid records are only left out once the user has agreed to it.
  bool get canImport {
    final summary = this.summary;
    return summary != null && result is DataInitial && (summary.invalidCount == 0 || skipInvalid);
  }
}
