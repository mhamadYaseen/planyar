import 'package:drift/drift.dart';

import '../files/safety_backup_store.dart';
import 'app_database.dart';
import 'database_connection.dart';
import 'migration_safety_copy.dart';

/// Opens the database, runs any migration (after a safety copy) and checks
/// its integrity. Throws [DatabaseOpenException]; the file is left as it is.
Future<AppDatabase> openAppDatabase(QueryExecutor executor, {required SafetyBackupStore safety}) async {
  final db = AppDatabase(executor, beforeMigration: MigrationSafetyCopy(safety).call);
  try {
    await db.customSelect('SELECT 1').get();
    final check = await db.customSelect('PRAGMA quick_check').get();
    final result = check.isEmpty ? null : check.first.data.values.first;
    if (check.length != 1 || result != 'ok') throw StateError('quick_check: ${check.map((r) => r.data).join('; ')}');
    return db;
  } on Object catch (error, stack) {
    try {
      await db.close();
    } on Object {
      // Closing a database that never opened can fail too; nothing to do.
    }
    throw DatabaseOpenException(error, stack);
  }
}
