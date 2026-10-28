import '../files/safety_backup.dart';
import '../files/safety_backup_store.dart';
import '../time/instant.dart';
import 'app_database.dart';

/// Copies the database file into the safety folder before a schema
/// migration (plan §10.8, BAK-04). `VACUUM INTO` writes a consistent copy at
/// the old schema version; drift doesn't wrap migrations in a transaction,
/// so it can run there.
final class MigrationSafetyCopy {
  const MigrationSafetyCopy(this._store);

  final SafetyBackupStore _store;

  Future<void> call(AppDatabase db, int from, int to) async {
    final path = await _store.pathFor(Instant.now(), SafetyReason.migration);
    await db.customStatement('VACUUM INTO ?', [path]);
    await _store.prune();
  }
}
