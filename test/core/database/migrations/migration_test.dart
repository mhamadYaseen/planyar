// Migration tests (plan §7.7). Schema snapshots live in drift_schemas/ and
// the helpers in generated/ come from:
//   dart run drift_dev make-migrations
//   dart run drift_dev schema generate drift_schemas/app_database/ test/core/database/migrations/generated/
// When v2 arrives, make-migrations adds step tests (v1 → v2 with sample
// data) next to this file. Every released version must keep a test here.

import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/database/app_database.dart';

import 'generated/schema.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() => verifier = SchemaVerifier(GeneratedHelper()));

  test('a fresh database matches the committed v1 snapshot', () async {
    final schema = await verifier.schemaAt(1);
    final db = AppDatabase(schema.newConnection());
    await verifier.migrateAndValidate(db, 1);
    await db.close();
  });

  test('opening a database from a newer app version fails instead of downgrading', () async {
    final schema = await verifier.schemaAt(1);
    schema.rawDatabase.execute('PRAGMA user_version = 99');
    final db = AppDatabase(schema.newConnection());
    await expectLater(db.customSelect('SELECT 1').get(), throwsA(anything));
    await db.close();
  });
}
