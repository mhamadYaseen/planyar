import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// Opens the on-device SQLite file (plan §8.5). The dev and prod flavors have
/// different application IDs, so each gets its own data directory and file.
QueryExecutor openDatabaseConnection() => driftDatabase(name: 'planyar');
