import 'dart:io';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/database_connection.dart';
import '../../../../core/files/file_gateway.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/utils/id_generator.dart';
import '../../../settings/domain/entities/setting_keys.dart';
import '../../domain/entities/backup_files.dart';
import '../../domain/entities/import_plan.dart';
import '../../domain/repositories/recovery_repository.dart';
import '../../domain/services/import_planner.dart';
import '../datasource/backup_dao.dart';

/// The Recovery screen's file work (plan §10.8, S28). A broken database file
/// is moved to `<support>/recovery/` and never deleted; Android Auto Backup
/// skips that folder.
final class DatabaseRecoveryImpl implements RecoveryRepository {
  DatabaseRecoveryImpl({required this._files, required this._openDatabase, required this._ids});

  final FileGateway _files;

  /// Opens (creating) a database at a path — the app's normal opener, so the
  /// new file gets the current schema and the same checks.
  final Future<AppDatabase> Function(String path) _openDatabase;
  final IdGenerator _ids;

  static const _companions = ['', '-wal', '-shm', '-journal'];

  Future<String> _path() async => databaseFilePath(await _files.documentsDirectory());

  @override
  Future<ShareOutcome> shareDatabaseFile({ShareAnchor? anchor}) async {
    final path = await _path();
    final existing = [
      for (final suffix in _companions)
        if (File('$path$suffix').existsSync()) '$path$suffix',
    ];
    if (existing.isEmpty) throw StateError('No database file at $path');
    return _files.shareFiles(existing, mimeType: 'application/vnd.sqlite3', subject: databaseFileName, anchor: anchor);
  }

  @override
  Future<ImportSummary> replaceDatabaseWith(ReadBackup backup) async {
    final path = await _path();
    final aside = await Directory('${await _files.supportDirectory()}/recovery').create(recursive: true);
    final stamp = Instant.now().utcMs;
    for (final suffix in _companions) {
      final file = File('$path$suffix');
      if (file.existsSync()) await _move(file, '${aside.path}/planyar-$stamp.sqlite$suffix');
    }
    final db = await _openDatabase(path);
    try {
      final dao = BackupDao(db);
      final plan = await dao.applyImport(
        (current) => const ImportPlanner().plan(
          file: backup.parsed,
          current: current,
          mode: ImportMode.replace,
          importSettings: true,
          now: Instant.now(),
          newId: _ids.newId,
        ),
      );
      // The app was set up before; don't send the user through onboarding.
      await dao.putDeviceSetting(SettingKeys.onboardingCompleted, true);
      return plan.summary;
    } finally {
      await db.close();
    }
  }

  /// Rename when possible; copy and delete across file systems.
  static Future<void> _move(File file, String target) async {
    try {
      await file.rename(target);
    } on FileSystemException {
      await file.copy(target);
      await file.delete();
    }
  }
}
