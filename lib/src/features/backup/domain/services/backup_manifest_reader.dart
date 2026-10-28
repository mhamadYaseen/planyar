import '../../../../core/time/instant.dart';
import '../entities/backup_manifest.dart';
import '../entities/backup_records.dart';
import 'backup_format.dart';

/// Reads `manifest.json` (plan §10.6 stage 2). Throws [BackupFileException]
/// for a wrong format, a newer version or a missing checksum; informational
/// fields that are missing or odd just get defaults.
abstract final class BackupManifestReader {
  static final _sha256 = RegExp(r'^[0-9a-f]{64}$');

  static BackupManifest read(Object? json) {
    if (json is! Map<String, Object?> || json['format'] != BackupFormat.name) {
      throw const BackupFileException(BackupFileProblem.notABackup, 'not a planyar-backup manifest');
    }
    final version = json['formatVersion'];
    if (version is! int || version < 1) {
      throw const BackupFileException(BackupFileProblem.notABackup, 'formatVersion');
    }
    if (version > BackupFormat.version) {
      throw BackupFileException(BackupFileProblem.newerVersion, 'formatVersion $version');
    }
    // Password-protected backups are a later feature (BAK-07).
    if ((json['encryption'] ?? BackupFormat.encryptionNone) != BackupFormat.encryptionNone) {
      throw const BackupFileException(BackupFileProblem.newerVersion, 'encrypted');
    }
    if ((json['dataFile'] ?? BackupFormat.dataFile) != BackupFormat.dataFile) {
      throw const BackupFileException(BackupFileProblem.notABackup, 'dataFile');
    }
    final checksum = json['dataSha256'];
    if (checksum is! String || !_sha256.hasMatch(checksum.toLowerCase())) {
      throw const BackupFileException(BackupFileProblem.damaged, 'dataSha256');
    }
    final counts = json['counts'];
    return BackupManifest(
      formatVersion: version,
      appVersion: _string(json['appVersion']),
      dbSchemaVersion: json['dbSchemaVersion'] is int ? json['dbSchemaVersion']! as int : 0,
      createdAt: _instant(json['createdAtUtc']),
      deviceTimeZone: _string(json['deviceTimeZone']),
      platform: _string(json['platform']),
      counts: {
        if (counts is Map<String, Object?>)
          for (final table in BackupTable.values)
            if (counts[table.name] case final int n) table: n,
      },
      dataSha256: checksum.toLowerCase(),
    );
  }

  static String _string(Object? value) => value is String && value.length <= 200 ? value : '';

  static Instant? _instant(Object? value) {
    if (value is! String) return null;
    try {
      return Instant.parse(value);
    } on FormatException {
      return null;
    }
  }
}

/// Stage 3: brings an older `data.json` up to [BackupFormat.version]
/// (BAK-06). Each step is a pure function from one format version to the
/// next, kept forever and tested against a frozen fixture file of that
/// version (`test/fixtures/backups/vN/`).
abstract final class BackupUpgrader {
  /// Source version → its upgrade to the next one. Empty while only v1
  /// exists.
  static final Map<int, Map<String, Object?> Function(Map<String, Object?>)> steps = {};

  static Map<String, Object?> upgrade(Map<String, Object?> data, {required int fromVersion}) {
    var current = data;
    for (var version = fromVersion; version < BackupFormat.version; version++) {
      final step = steps[version];
      if (step == null) throw BackupFileException(BackupFileProblem.damaged, 'no upgrade from v$version');
      current = step(current);
    }
    return current;
  }
}
