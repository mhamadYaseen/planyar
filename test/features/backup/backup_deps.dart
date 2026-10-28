import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/files/safety_backup_store.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/core/utils/id_generator.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_dao.dart';
import 'package:planyar/src/features/backup/data/repositories/backup_files_repository_impl.dart';
import 'package:planyar/src/features/backup/data/repositories/backup_repository_impl.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_plan.dart';
import 'package:planyar/src/features/backup/domain/entities/import_report.dart';
import 'package:planyar/src/features/backup/domain/services/import_planner.dart';
import 'package:planyar/src/features/backup/domain/usecases/backup_usecases.dart';

import '../../helpers/fake_file_gateway.dart';
import '../../helpers/fake_notification_gateway.dart';
import '../../helpers/test_database.dart';
import 'backup_test_data.dart';

/// UUIDs from a counter (the backup reader only accepts UUIDs).
class UuidIds implements IdGenerator {
  UuidIds([int from = 0x5000]) : _next = uuidSequence(from);

  final String Function() _next;

  @override
  String newId() => _next();
}

/// The real backup stack over an in-memory database (Asia/Baghdad) and a
/// [FakeFileGateway]. Call `initializeTimeZones()` in `setUpAll` first.
class BackupDeps {
  BackupDeps._(this.db, this.zones);

  static Future<BackupDeps> create({AppDatabase? db}) async =>
      BackupDeps._(db ?? newTestDatabase(), await baghdadTimeZones());

  final AppDatabase db;
  final TimeZoneService zones;
  final files = FakeFileGateway();
  final notifications = FakeNotificationGateway();
  final ids = UuidIds();

  late final dao = BackupDao(db);
  late final backups = BackupRepositoryImpl(dao);
  late final safety = SafetyBackupStore(files.supportDirectory);
  late final backupFiles = BackupFilesRepositoryImpl(
    files: files,
    safety: safety,
    timeZones: zones,
    appVersion: '1.0.0+1',
    dbSchemaVersion: db.schemaVersion,
    platform: 'android',
  );

  late final export = ExportBackup(backups, backupFiles);
  late final pick = PickBackupFile(backupFiles);
  late final prepare = PrepareImport(backups, backupFiles, ids);
  late final run = RunImport(backups, backupFiles, ids);
  late final erase = EraseAllData(backups, backupFiles, notifications);

  /// Writes [data] (records and portable settings) as if it were imported.
  Future<void> seed(BackupData data) => backups.applyImport(
    (_) => const ImportPlanner().plan(
      file: ParsedBackup(data: data),
      current: const BackupData(),
      mode: ImportMode.replace,
      importSettings: true,
      now: Instant.parse('2026-10-27T12:00:00Z'),
      newId: ids.newId,
    ),
  );

  Future<void> close() async {
    await db.close();
    files.dispose();
  }
}
