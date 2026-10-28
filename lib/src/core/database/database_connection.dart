import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// The database file name. The dev and prod flavors have different
/// application IDs, so each has its own data directory and file.
const databaseFileName = 'planyar.sqlite';

/// `<documents>/planyar.sqlite` — the location drift_flutter uses by
/// default, made explicit so the recovery screen can find the file.
String databaseFilePath(String documentsDirectory) => '$documentsDirectory/$databaseFileName';

/// Opens the on-device SQLite file (plan §8.5) at [path].
QueryExecutor openDatabaseConnection(Future<String> Function() path) => driftDatabase(
  name: 'planyar',
  native: DriftNativeOptions(databasePath: path),
);

/// The database couldn't be opened, migrated or passed its integrity check.
/// Startup shows the Recovery screen (S28) instead of the app; the file is
/// never deleted (plan §10.8).
final class DatabaseOpenException implements Exception {
  const DatabaseOpenException(this.cause, [this.stackTrace]);

  final Object cause;
  final StackTrace? stackTrace;

  @override
  String toString() => 'DatabaseOpenException: $cause';
}
