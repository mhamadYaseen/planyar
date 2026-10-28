// Recovery screen actions (plan §10.8, S28): the broken file is moved aside,
// never deleted; a backup restores into a fresh database.
import 'dart:io';
import 'dart:typed_data';

import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/database/database_connection.dart';
import 'package:planyar/src/core/database/open_app_database.dart';
import 'package:planyar/src/core/files/safety_backup_store.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_archive.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_dao.dart';
import 'package:planyar/src/features/backup/data/repositories/database_recovery_impl.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_files.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';

import '../../../helpers/fake_file_gateway.dart';
import '../backup_deps.dart';
import '../backup_test_data.dart';

void main() {
  late FakeFileGateway files;
  late DatabaseRecoveryImpl recovery;
  late String dbPath;

  setUp(() async {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    files = FakeFileGateway();
    dbPath = databaseFilePath(await files.documentsDirectory());
    final safety = SafetyBackupStore(files.supportDirectory);
    recovery = DatabaseRecoveryImpl(
      files: files,
      openDatabase: (path) => openAppDatabase(NativeDatabase(File(path)), safety: safety),
      ids: UuidIds(),
    );
  });
  tearDown(() => files.dispose());

  ReadBackup backupOf(BackupData data) {
    final decoded = BackupArchive.decode(
      BackupArchive.encode(
        data,
        ExportInfo(
          appVersion: '1.0.0+1',
          dbSchemaVersion: 1,
          createdAt: Instant.parse('2026-10-20T10:00:00Z'),
          deviceTimeZone: 'Asia/Baghdad',
          platform: 'android',
        ),
      ),
    );
    return ReadBackup(fileName: 'b.zip', sizeBytes: 1, manifest: decoded.manifest, parsed: decoded.parsed);
  }

  test('restore moves the broken file aside and restores the backup into a new database', () async {
    final broken = Uint8List.fromList(List.generate(4096, (i) => i % 251));
    File(dbPath).writeAsBytesSync(broken);
    File('$dbPath-wal').writeAsStringSync('wal');

    final summary = await recovery.replaceDatabaseWith(backupOf(sampleData()));
    expect(summary.of(BackupTable.entries).added, 5);

    // The broken files are kept, byte for byte.
    final aside = Directory('${await files.supportDirectory()}/recovery').listSync().whereType<File>().toList();
    expect(
      aside.map((f) => f.uri.pathSegments.last),
      unorderedEquals([matches(r'^planyar-\d+\.sqlite$'), matches(r'^planyar-\d+\.sqlite-wal$')]),
    );
    expect(aside.firstWhere((f) => f.path.endsWith('.sqlite')).readAsBytesSync(), broken);

    // The new database opens, holds the backup and skips onboarding.
    final db = await openAppDatabase(NativeDatabase(File(dbPath)), safety: SafetyBackupStore(files.supportDirectory));
    addTearDown(db.close);
    expect(await BackupDao(db).readSnapshot(), sampleData());
    expect((await BackupDao(db).setting('onboardingCompleted'))?.value, 'true');
  });

  test('export shares the database file and its companions', () async {
    File(dbPath).writeAsStringSync('db');
    File('$dbPath-wal').writeAsStringSync('wal');
    await recovery.shareDatabaseFile();
    expect(files.shared.single, [dbPath, '$dbPath-wal']);
  });

  test('export without a database file is an error, not a crash', () async {
    await expectLater(recovery.shareDatabaseFile(), throwsStateError);
  });
}
