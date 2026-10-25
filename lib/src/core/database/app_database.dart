import 'package:drift/drift.dart';

import '../time/instant.dart';
import '../time/local_date.dart';
import 'converters.dart';
import 'tables/categories_labels.dart';
import 'tables/entries.dart';
import 'tables/routines.dart';
import 'tables/settings_notifications.dart';
import 'tables/tasks.dart';

part 'app_database.g.dart';

/// The single on-device database (plan §7, §8.5).
///
/// Schema changes: bump [schemaVersion], run
/// `dart run drift_dev make-migrations`, write the step in [migration], and
/// commit the new snapshot under `drift_schemas/` plus the generated tests.
@DriftDatabase(
  tables: [
    Categories,
    Labels,
    Entries,
    Routines,
    RoutineExceptions,
    TaskSeries,
    Tasks,
    TaskReminders,
    Settings,
    ScheduledNotifications,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      // No released schema before v1. Fail loudly so startup shows the
      // recovery screen instead of running on a half-migrated database.
      throw StateError('No migration from schema v$from to v$to');
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA journal_mode = WAL');
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
