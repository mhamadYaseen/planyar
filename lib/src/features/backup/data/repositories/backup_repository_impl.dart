import 'dart:convert';

import '../../../../core/time/instant.dart';
import '../../../settings/domain/entities/setting_keys.dart';
import '../../domain/entities/backup_files.dart';
import '../../domain/entities/backup_records.dart';
import '../../domain/entities/import_plan.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasource/backup_dao.dart';

final class BackupRepositoryImpl implements BackupRepository {
  BackupRepositoryImpl(this._dao);

  final BackupDao _dao;

  static const _logLength = 5;

  @override
  Future<BackupData> readSnapshot() => _dao.readSnapshot();

  @override
  Future<bool> hasRecords() => _dao.hasRecords();

  @override
  Future<ImportPlan> applyImport(ImportPlan Function(BackupData current) planFor) => _dao.applyImport(planFor);

  @override
  Future<bool> quickCheck() => _dao.quickCheck();

  @override
  Future<void> eraseAll() => _dao.eraseAll();

  @override
  Stream<BackupStatus> watchStatus() =>
      _dao.watchSettings([SettingKeys.lastExportAt, SettingKeys.importLog]).map((rows) {
        final values = {for (final row in rows) row.key: _decode(row.value)};
        final lastExport = values[SettingKeys.lastExportAt];
        final log = values[SettingKeys.importLog];
        return BackupStatus(
          lastExportAt: lastExport is int ? Instant.fromUtcMs(lastExport) : null,
          importLog: [
            if (log is List<Object?>)
              for (final item in log) ?_logEntry(item),
          ],
        );
      }).distinct();

  @override
  Future<void> recordExport(Instant at) => _dao.putDeviceSetting(SettingKeys.lastExportAt, at.utcMs);

  @override
  Future<void> recordImport(ImportLogEntry entry) => _dao.transaction(() async {
    final stored = await _dao.setting(SettingKeys.importLog);
    final old = stored == null ? null : _decode(stored.value);
    final log = [_logJson(entry), if (old is List<Object?>) ...old.take(_logLength - 1)];
    await _dao.putDeviceSetting(SettingKeys.importLog, log);
  });

  static Object? _decode(String json) {
    try {
      return jsonDecode(json);
    } on FormatException {
      return null;
    }
  }

  static Map<String, Object?> _logJson(ImportLogEntry e) => {
    'atUtc': e.at.utcMs,
    'mode': e.mode.name,
    'fileName': e.fileName,
    'written': e.written,
    'skipped': e.skipped,
    'invalid': e.invalid,
    'safetyBackup': e.safetyBackupName,
  };

  /// Null for anything malformed (the log is informational).
  static ImportLogEntry? _logEntry(Object? json) {
    if (json is! Map<String, Object?>) return null;
    final mode = ImportMode.values.where((m) => m.name == json['mode']).firstOrNull;
    if (json
        case {
          'atUtc': final int at,
          'fileName': final String fileName,
          'written': final int written,
          'skipped': final int skipped,
          'invalid': final int invalid,
        }
        when mode != null) {
      final safety = json['safetyBackup'];
      return ImportLogEntry(
        at: Instant.fromUtcMs(at),
        mode: mode,
        fileName: fileName,
        written: written,
        skipped: skipped,
        invalid: invalid,
        safetyBackupName: safety is String ? safety : null,
      );
    }
    return null;
  }
}
