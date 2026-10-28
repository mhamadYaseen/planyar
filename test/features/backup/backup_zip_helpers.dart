import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_manifest.dart';
import 'package:planyar/src/features/backup/domain/services/backup_format.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_writer.dart';

/// A ZIP holding exactly [files].
Uint8List zipOf(Map<String, List<int>> files) {
  final archive = Archive();
  files.forEach((name, bytes) => archive.addFile(ArchiveFile.bytes(name, bytes)));
  return ZipEncoder().encodeBytes(archive);
}

/// The manifest for [dataBytes], with an optional change.
List<int> manifestFor(List<int> dataBytes, [void Function(Map<String, Object?> m)? change]) {
  final json = {
    ...BackupJsonWriter.manifest(
      BackupManifest(
        formatVersion: BackupFormat.version,
        appVersion: '1.0.0+1',
        dbSchemaVersion: 1,
        createdAt: Instant.parse('2026-10-25T14:30:00Z'),
        deviceTimeZone: 'Asia/Baghdad',
        platform: 'android',
        dataSha256: sha256.convert(dataBytes).toString(),
      ),
    ),
  };
  change?.call(json);
  return utf8.encode(jsonEncode(json));
}

/// A backup ZIP of [json] (data.json) with a matching checksum.
Uint8List backupOf(Map<String, Object?> json, {void Function(Map<String, Object?> m)? manifest}) {
  final data = utf8.encode(jsonEncode(json));
  return zipOf({'manifest.json': manifestFor(data, manifest), 'data.json': data});
}

/// A backup ZIP whose data.json is [dataBytes] verbatim (checksum matches).
Uint8List backupOfBytes(List<int> dataBytes) =>
    zipOf({'manifest.json': manifestFor(dataBytes), 'data.json': dataBytes});
