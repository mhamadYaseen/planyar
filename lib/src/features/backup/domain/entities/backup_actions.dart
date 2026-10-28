import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_actions.freezed.dart';

/// Where an export goes (plan §8.11).
enum ExportDestination {
  /// The share sheet: Save to Files, Drive, email, …
  share,

  /// The system "Save as" dialog.
  device,
}

/// The outcome of one export.
@freezed
abstract class ExportResult with _$ExportResult {
  const factory ExportResult({
    required String fileName,
    required int recordCount,

    /// False when the user closed the share sheet or the save dialog.
    required bool completed,
  }) = _ExportResult;
}

/// A file to preview for import.
@freezed
abstract class ImportSource with _$ImportSource {
  const factory ImportSource({
    required String path,

    /// The name the user knows the file by.
    required String fileName,

    /// A picked file's temporary copy: deleted once it has been read.
    @Default(false) bool isTemporaryCopy,

    /// Restoring a safety backup is always a Replace (plan §10.8).
    @Default(false) bool replaceOnly,
  }) = _ImportSource;
}
