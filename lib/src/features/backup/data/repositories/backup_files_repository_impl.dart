import 'dart:io';
import 'dart:isolate';

import '../../../../core/files/file_gateway.dart';
import '../../../../core/files/safety_backup.dart';
import '../../../../core/files/safety_backup_store.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../domain/entities/backup_files.dart';
import '../../domain/entities/backup_manifest.dart';
import '../../domain/entities/backup_records.dart';
import '../../domain/repositories/backup_files_repository.dart';
import '../../domain/services/backup_format.dart';
import '../datasource/backup_archive.dart';

final class BackupFilesRepositoryImpl implements BackupFilesRepository {
  BackupFilesRepositoryImpl({
    required this._files,
    required this._safety,
    required this._timeZones,
    required this._appVersion,
    required this._dbSchemaVersion,
    required this._platform,
  });

  final FileGateway _files;
  final SafetyBackupStore _safety;
  final TimeZoneService _timeZones;
  final String _appVersion;
  final int _dbSchemaVersion;
  final String _platform;

  static const _sqliteMimeType = 'application/vnd.sqlite3';

  ExportInfo _info(Instant at) => ExportInfo(
    appVersion: _appVersion,
    dbSchemaVersion: _dbSchemaVersion,
    createdAt: at,
    deviceTimeZone: _timeZones.zoneId,
    platform: _platform,
  );

  @override
  Future<ExportedBackup> writeExport(BackupData data, {required Instant at}) async {
    final math = _timeZones.dayMath;
    final fileName = BackupFormat.exportFileName(math.dateOf(at), math.wallTimeOf(at));
    final path = '${await _files.temporaryDirectory()}/$fileName';
    final size = await _encodeToFile(path, data, _info(at));
    return ExportedBackup(
      path: path,
      fileName: fileName,
      sizeBytes: size,
      recordCount: data.counts.values.fold(0, (sum, n) => sum + n),
    );
  }

  // The isolate closures live in static methods so they capture only their
  // arguments — never `this` (which holds unsendable platform objects).

  static Future<int> _encodeToFile(String path, BackupData data, ExportInfo info) => Isolate.run(() {
    final bytes = BackupArchive.encode(data, info);
    File(path).writeAsBytesSync(bytes, flush: true);
    return bytes.length;
  });

  static Future<List<int>> _encode(BackupData data, ExportInfo info) =>
      Isolate.run(() => BackupArchive.encode(data, info));

  static Future<DecodedBackup> _decodeFile(String path) =>
      Isolate.run(() => BackupArchive.decode(File(path).readAsBytesSync()));

  @override
  Future<ShareOutcome> share(ExportedBackup file, {ShareAnchor? anchor}) =>
      _files.shareFiles([file.path], mimeType: BackupFormat.mimeType, subject: file.fileName, anchor: anchor);

  @override
  Future<bool> saveToDevice(ExportedBackup file) async => _files.saveFile(
    fileName: file.fileName,
    bytes: await File(file.path).readAsBytes(),
    mimeType: BackupFormat.mimeType,
  );

  @override
  Future<void> discard(ExportedBackup file) => deleteTemporary(file.path);

  @override
  Future<PickedFile?> pick() async {
    try {
      return await _files.pickFile(maxBytes: BackupFormat.maxFileBytes);
    } on FileTooLargeException {
      throw const BackupFileException(BackupFileProblem.tooLarge);
    }
  }

  @override
  Future<ReadBackup> read(String path, {required String fileName}) async {
    final file = File(path);
    final int size;
    try {
      size = await file.length();
    } on FileSystemException catch (e) {
      throw BackupFileException(BackupFileProblem.unreadable, e.message);
    }
    if (size > BackupFormat.maxFileBytes) throw const BackupFileException(BackupFileProblem.tooLarge);
    final DecodedBackup decoded;
    try {
      decoded = await _decodeFile(path);
    } on FileSystemException catch (e) {
      throw BackupFileException(BackupFileProblem.unreadable, e.message);
    }
    return ReadBackup(fileName: fileName, sizeBytes: size, manifest: decoded.manifest, parsed: decoded.parsed);
  }

  @override
  Future<void> deleteTemporary(String path) async {
    final file = File(path);
    if (file.existsSync()) await file.delete();
  }

  @override
  Future<SafetyBackup> writeSafetyBackup(BackupData data, {required SafetyReason reason, required Instant at}) async =>
      _safety.write(await _encode(data, _info(at)), at: at, reason: reason);

  @override
  Future<List<SafetyBackup>> listSafetyBackups() => _safety.list();

  @override
  Future<ShareOutcome> shareSafetyBackup(SafetyBackup backup, {ShareAnchor? anchor}) => _files.shareFiles(
    [backup.path],
    mimeType: backup.isRawDatabase ? _sqliteMimeType : BackupFormat.mimeType,
    subject: backup.fileName,
    anchor: anchor,
  );
}
