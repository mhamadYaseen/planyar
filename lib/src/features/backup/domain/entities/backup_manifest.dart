import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/instant.dart';
import 'backup_records.dart';

part 'backup_manifest.freezed.dart';

/// `manifest.json`: the small file an import reads first (plan §10.4).
@freezed
abstract class BackupManifest with _$BackupManifest {
  const factory BackupManifest({
    required int formatVersion,

    /// Informational fields — a hand-edited file may lack them.
    @Default('') String appVersion,
    @Default(0) int dbSchemaVersion,
    Instant? createdAt,
    @Default('') String deviceTimeZone,
    @Default('') String platform,
    @Default(<BackupTable, int>{}) Map<BackupTable, int> counts,

    /// Lower-case hex SHA-256 of the `data.json` bytes.
    required String dataSha256,
  }) = _BackupManifest;
}

/// Why a whole file can't be imported (plan §10.6 stages 1–3). Nothing is
/// changed in any of these cases.
enum BackupFileProblem {
  /// Not a ZIP, no manifest or data file, wrong `format` or unreadable JSON.
  notABackup,

  /// The data doesn't match its checksum, or its structure is broken.
  damaged,

  /// Made by a newer app version, or uses a feature this version lacks
  /// (e.g. encryption) (BAK-06).
  newerVersion,

  /// Over the size limits (200 MB file, 500 MB unpacked).
  tooLarge,

  /// The file couldn't be read at all (permission, removed, I/O error).
  unreadable,
}

final class BackupFileException implements Exception {
  const BackupFileException(this.problem, [this.detail = '']);

  final BackupFileProblem problem;

  /// Developer-facing detail (never shown as the main message).
  final String detail;

  @override
  String toString() => 'BackupFileException(${problem.name}${detail.isEmpty ? '' : ': $detail'})';
}
