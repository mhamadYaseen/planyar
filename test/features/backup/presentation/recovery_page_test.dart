// Recovery screen (S28): shown when the database can't be opened; restores
// the latest safety backup into a new database, then starts the app again.
import 'dart:io';

import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/src/app/recovery_app.dart';
import 'package:planyar/src/core/database/database_connection.dart';
import 'package:planyar/src/core/database/open_app_database.dart';
import 'package:planyar/src/core/files/safety_backup.dart';
import 'package:planyar/src/core/files/safety_backup_store.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_archive.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_dao.dart';
import 'package:planyar/src/features/backup/data/repositories/backup_files_repository_impl.dart';
import 'package:planyar/src/features/backup/data/repositories/database_recovery_impl.dart';
import 'package:planyar/src/features/backup/domain/usecases/backup_usecases.dart';
import 'package:planyar/src/features/backup/domain/usecases/recovery_usecases.dart';
import 'package:planyar/src/features/backup/presentation/bloc/recovery_bloc.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../helpers/app_harness.dart';
import '../../../helpers/fake_file_gateway.dart';
import '../backup_deps.dart';
import '../backup_test_data.dart';

void main() {
  late FakeFileGateway files;
  late TimeZoneService zones;
  late String dbPath;

  setUpAll(tzdata.initializeTimeZones);
  setUp(() async {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    files = FakeFileGateway();
    zones = TimeZoneService(() async => 'Asia/Baghdad');
    await zones.refresh();
    dbPath = databaseFilePath(await files.documentsDirectory());
  });
  tearDown(() => files.dispose());

  RecoveryBloc bloc() {
    final safety = SafetyBackupStore(files.supportDirectory);
    final backupFiles = BackupFilesRepositoryImpl(
      files: files,
      safety: safety,
      timeZones: zones,
      appVersion: '1.0.0+1',
      dbSchemaVersion: 1,
      platform: 'android',
    );
    final recovery = DatabaseRecoveryImpl(
      files: files,
      openDatabase: (path) => openAppDatabase(NativeDatabase(File(path)), safety: safety),
      ids: UuidIds(),
    );
    return RecoveryBloc(
      listSafety: ListSafetyBackups(backupFiles),
      pick: PickBackupFile(backupFiles),
      read: ReadBackupFile(backupFiles),
      restore: RestoreDatabase(recovery),
      exportDatabase: ExportDatabaseFile(recovery),
    )..add(const RecoveryEvent.started());
  }

  testWidgets('restore the latest safety backup, then start again', (tester) async {
    usePhoneSize(tester);
    await tester.runAsync(() async {
      File(dbPath).writeAsStringSync('not a database');
      final store = SafetyBackupStore(files.supportDirectory);
      final zip = BackupArchive.encode(
        sampleData(),
        ExportInfo(
          appVersion: '1.0.0+1',
          dbSchemaVersion: 1,
          createdAt: Instant.parse('2026-10-25T10:00:00Z'),
          deviceTimeZone: 'Asia/Baghdad',
          platform: 'android',
        ),
      );
      await store.write(zip, at: Instant.parse('2026-10-25T10:00:00Z'), reason: SafetyReason.import);
    });
    var retried = 0;
    await tester.pumpWidget(
      RecoveryApp(createBloc: bloc, timeZones: zones, details: 'file is not a database', onRetry: () => retried++),
    );
    Future<void> waitFor(Finder finder) async {
      for (var i = 0; i < 200 && finder.evaluate().isEmpty; i++) {
        await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
        await tester.pump(const Duration(milliseconds: 20));
      }
      expect(finder, findsWidgets);
    }

    await waitFor(find.text('Restore the latest safety backup'));
    expect(find.textContaining('Sun 25 Oct'), findsOneWidget);
    await tester.tap(find.text('Restore the latest safety backup'));
    await waitFor(find.text('Restore this backup?'));
    expect(find.textContaining('17 records'), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, 'Restore'));
    for (var i = 0; i < 200 && retried == 0; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
      await tester.pump(const Duration(milliseconds: 20));
    }
    expect(retried, 1, reason: 'the app starts again after a restore');

    // The new database holds the backup; the broken file was kept aside.
    final snapshot = await tester.runAsync(() async {
      final db = await openAppDatabase(NativeDatabase(File(dbPath)), safety: SafetyBackupStore(files.supportDirectory));
      try {
        return await BackupDao(db).readSnapshot();
      } finally {
        await db.close();
      }
    });
    expect(snapshot, sampleData());
    expect(Directory('${files.root.path}/support/recovery').listSync(), isNotEmpty);
  });

  testWidgets('without safety backups it still offers retry, import and export', (tester) async {
    usePhoneSize(tester);
    var retried = 0;
    await tester.pumpWidget(RecoveryApp(createBloc: bloc, timeZones: zones, details: 'boom', onRetry: () => retried++));
    for (var i = 0; i < 20; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
      await tester.pump(const Duration(milliseconds: 20));
    }
    expect(find.text('Restore the latest safety backup'), findsNothing);
    expect(find.text('Import a backup…'), findsOneWidget);
    expect(find.text('Export the database file'), findsOneWidget);
    await tester.tap(find.text('Try again'));
    expect(retried, 1);
  });
}
