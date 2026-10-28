// Opening the database safely (plan §7.7, §10.8, BAK-04): a raw safety copy
// before any migration, and a clear failure (→ Recovery screen) instead of a
// crash or a deleted file.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/database/database_connection.dart';
import 'package:planyar/src/core/database/migration_safety_copy.dart';
import 'package:planyar/src/core/database/open_app_database.dart';
import 'package:planyar/src/core/files/safety_backup.dart';
import 'package:planyar/src/core/files/safety_backup_store.dart';
import 'package:planyar/src/core/time/instant.dart';

/// Pretends the app moved on to schema v2 with an empty migration step.
class _NextVersionDatabase extends AppDatabase {
  _NextVersionDatabase(super.executor, {super.beforeMigration});

  final steps = <(int, int)>[];

  @override
  int get schemaVersion => AppDatabase.currentSchemaVersion + 1;

  @override
  Future<void> upgrade(Migrator m, int from, int to) async => steps.add((from, to));
}

void main() {
  late Directory dir;
  late SafetyBackupStore store;

  setUp(() {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    dir = Directory.systemTemp.createTempSync('planyar_db_');
    store = SafetyBackupStore(() async => dir.path);
  });
  tearDown(() => dir.deleteSync(recursive: true));

  Future<File> createV1Database() async {
    final file = File('${dir.path}/planyar.sqlite');
    final db = AppDatabase(NativeDatabase(file));
    await db.customStatement(
      "INSERT INTO categories (id, name, name_key, created_at, updated_at) VALUES ('c1', 'Work', 'work', 0, 0)",
    );
    await db.close();
    return file;
  }

  test('a migration first copies the old database into the safety folder', () async {
    final file = await createV1Database();
    final db = _NextVersionDatabase(
      NativeDatabase(file),
      beforeMigration: (db, from, to) async {
        final path = await store.pathFor(Instant.fromUtcMs(1793100000000), SafetyReason.migration);
        await db.customStatement('VACUUM INTO ?', [path]);
      },
    );
    await db.customSelect('SELECT 1').get();
    expect(db.steps, [(1, 2)]);
    await db.close();

    final copy = (await store.list()).single;
    expect(copy.reason, SafetyReason.migration);
    expect(copy.isRawDatabase, isTrue);
    // Opening the copy migrates it again: it was still at schema v1.
    final reopened = _NextVersionDatabase(NativeDatabase(File(copy.path)));
    final name = await reopened
        .customSelect('SELECT name FROM categories')
        .map((r) => r.read<String>('name'))
        .getSingle();
    expect(reopened.steps, [(1, 2)], reason: 'the copy keeps the old schema version');
    expect(name, 'Work');
    await reopened.close();
  });

  test('the production hook (MigrationSafetyCopy) writes a copy and prunes to five', () async {
    for (var i = 0; i < 6; i++) {
      await File(await store.pathFor(Instant.fromUtcMs(1000 + i), SafetyReason.import)).writeAsString('old');
    }
    final file = await createV1Database();
    final db = _NextVersionDatabase(NativeDatabase(file), beforeMigration: MigrationSafetyCopy(store).call);
    await db.customSelect('SELECT 1').get();
    await db.close();
    final kept = await store.list();
    expect(kept, hasLength(SafetyBackupStore.keep));
    expect(kept.first.reason, SafetyReason.migration);
  });

  test('if the safety copy fails, nothing is migrated and opening fails', () async {
    final file = await createV1Database();
    final db = _NextVersionDatabase(
      NativeDatabase(file),
      beforeMigration: (_, _, _) async => throw StateError('disk full'),
    );
    await expectLater(db.customSelect('SELECT 1').get(), throwsA(anything));
    expect(db.steps, isEmpty);
    await db.close();
  });

  test('a file that is not a database: DatabaseOpenException, and the file is kept', () async {
    final file = File('${dir.path}/planyar.sqlite')..writeAsStringSync('this is not sqlite' * 100);
    await expectLater(openAppDatabase(NativeDatabase(file), safety: store), throwsA(isA<DatabaseOpenException>()));
    expect(file.readAsStringSync(), startsWith('this is not sqlite'));
  });

  test('a database from a newer app version: DatabaseOpenException', () async {
    final file = await createV1Database();
    await expectLater(
      openAppDatabase(NativeDatabase(file, setup: (raw) => raw.userVersion = 99), safety: store),
      throwsA(isA<DatabaseOpenException>()),
    );
  });

  test('a healthy database opens and passes the quick check', () async {
    final db = await openAppDatabase(NativeDatabase(await createV1Database()), safety: store);
    expect(await db.customSelect('SELECT count(*) AS n FROM categories').map((r) => r.read<int>('n')).getSingle(), 1);
    await db.close();
  });
}
