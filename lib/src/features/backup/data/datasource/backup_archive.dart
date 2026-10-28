import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';

import '../../../../core/time/instant.dart';
import '../../domain/entities/backup_manifest.dart';
import '../../domain/entities/backup_records.dart';
import '../../domain/entities/import_report.dart';
import '../../domain/services/backup_format.dart';
import '../../domain/services/backup_json_reader.dart';
import '../../domain/services/backup_json_writer.dart';
import '../../domain/services/backup_manifest_reader.dart';

/// What the manifest records about the exporting app and device.
final class ExportInfo {
  const ExportInfo({
    required this.appVersion,
    required this.dbSchemaVersion,
    required this.createdAt,
    required this.deviceTimeZone,
    required this.platform,
  });

  final String appVersion;
  final int dbSchemaVersion;
  final Instant createdAt;
  final String deviceTimeZone;
  final String platform;
}

/// A decoded, validated backup file (stages 1–5).
final class DecodedBackup {
  const DecodedBackup(this.manifest, this.parsed);

  final BackupManifest manifest;
  final ParsedBackup parsed;
}

/// The backup ZIP: `manifest.json` + `data.json` (plan §10.4). Pure and
/// synchronous so it can run in a background isolate (`Isolate.run`).
abstract final class BackupArchive {
  static const _zipMagic = [0x50, 0x4b, 0x03, 0x04];

  /// Pretty-printed with one space: still readable on a computer, and
  /// whitespace costs almost nothing once compressed.
  static const _dataEncoder = JsonEncoder.withIndent(' ');
  static const _manifestEncoder = JsonEncoder.withIndent('  ');

  /// The `data.json` bytes for [data] — canonical, so equal data gives equal
  /// bytes (the round-trip check compares these).
  static Uint8List encodeData(BackupData data) => utf8.encode(_dataEncoder.convert(BackupJsonWriter.data(data)));

  static Uint8List encode(BackupData data, ExportInfo info) {
    final dataBytes = encodeData(data);
    final manifest = BackupManifest(
      formatVersion: BackupFormat.version,
      appVersion: info.appVersion,
      dbSchemaVersion: info.dbSchemaVersion,
      createdAt: info.createdAt,
      deviceTimeZone: info.deviceTimeZone,
      platform: info.platform,
      counts: data.counts,
      dataSha256: sha256.convert(dataBytes).toString(),
    );
    final manifestBytes = utf8.encode(_manifestEncoder.convert(BackupJsonWriter.manifest(manifest)));
    final archive = Archive()
      ..addFile(ArchiveFile.bytes(BackupFormat.manifestFile, manifestBytes))
      ..addFile(ArchiveFile.bytes(BackupFormat.dataFile, dataBytes));
    return ZipEncoder().encodeBytes(archive);
  }

  /// Stages 1–5 of plan §10.6. Every file is untrusted: only the two known
  /// entries are read, by exact name, into memory (never extracted to disk
  /// by path, so no zip-slip); sizes and the compression ratio are capped
  /// before anything is inflated. Throws [BackupFileException].
  static DecodedBackup decode(Uint8List bytes) {
    if (bytes.length > BackupFormat.maxFileBytes) throw const BackupFileException(BackupFileProblem.tooLarge);
    if (bytes.length < _zipMagic.length || !_hasZipMagic(bytes)) {
      throw const BackupFileException(BackupFileProblem.notABackup, 'not a ZIP file');
    }
    final Archive archive;
    try {
      archive = ZipDecoder().decodeBytes(bytes);
    } on Object catch (e) {
      throw BackupFileException(BackupFileProblem.notABackup, 'unreadable ZIP: $e');
    }
    final manifestEntry = archive.findFile(BackupFormat.manifestFile);
    final dataEntry = archive.findFile(BackupFormat.dataFile);
    if (manifestEntry == null || dataEntry == null || !manifestEntry.isFile || !dataEntry.isFile) {
      throw const BackupFileException(BackupFileProblem.notABackup, 'manifest.json or data.json missing');
    }
    // A zip entry is never inflated past the size it declares, so these
    // checks bound the memory a hostile file can take.
    if (manifestEntry.size > BackupFormat.maxManifestBytes) {
      throw const BackupFileException(BackupFileProblem.notABackup, 'manifest too large');
    }
    final unpacked = manifestEntry.size + dataEntry.size;
    if (unpacked > BackupFormat.maxUnpackedBytes) throw const BackupFileException(BackupFileProblem.tooLarge);
    if (unpacked > BackupFormat.ratioCheckFromBytes && unpacked > bytes.length * BackupFormat.maxCompressionRatio) {
      throw const BackupFileException(BackupFileProblem.damaged, 'compression ratio');
    }

    final manifest = BackupManifestReader.read(_json(_read(manifestEntry), BackupFileProblem.notABackup));
    final dataBytes = _read(dataEntry);
    if (sha256.convert(dataBytes).toString() != manifest.dataSha256) {
      throw const BackupFileException(BackupFileProblem.damaged, 'checksum mismatch');
    }
    final data = _json(dataBytes, BackupFileProblem.damaged);
    if (data is! Map<String, Object?>) {
      throw const BackupFileException(BackupFileProblem.damaged, 'data.json is not an object');
    }
    try {
      final upgraded = BackupUpgrader.upgrade(data, fromVersion: manifest.formatVersion);
      return DecodedBackup(manifest, const BackupJsonReader().read(upgraded));
    } on BackupFileException {
      rethrow;
    } on Object catch (e) {
      // The reader handles every case we know of; anything else in a hostile
      // file still means "damaged", never a crash.
      throw BackupFileException(BackupFileProblem.damaged, 'unreadable data: $e');
    }
  }

  static bool _hasZipMagic(Uint8List bytes) {
    for (var i = 0; i < _zipMagic.length; i++) {
      if (bytes[i] != _zipMagic[i]) return false;
    }
    return true;
  }

  static Uint8List _read(ArchiveFile entry) {
    try {
      return entry.readBytes() ?? Uint8List(0);
    } on Object catch (e) {
      throw BackupFileException(BackupFileProblem.damaged, 'unreadable ${entry.name}: $e');
    }
  }

  /// Strict UTF-8 (malformed bytes are an error, not U+FFFD) and JSON.
  static Object? _json(Uint8List bytes, BackupFileProblem problem) {
    try {
      return jsonDecode(utf8.decode(bytes));
    } on FormatException catch (e) {
      throw BackupFileException(problem, 'bad JSON: ${e.message}');
    }
  }
}
