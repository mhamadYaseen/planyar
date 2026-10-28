import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart' show protected;

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
  /// [beforeMigration] runs before any schema upgrade, while the file is
  /// still at the old version — the app copies it to the safety folder there
  /// (BAK-04). If it throws, nothing is migrated and startup shows the
  /// Recovery screen.
  AppDatabase(super.executor, {this.beforeMigration});

  final Future<void> Function(AppDatabase db, int from, int to)? beforeMigration;

  /// Bump with every schema change (see CLAUDE.md "Schema changes").
  static const currentSchemaVersion = 1;

  @override
  int get schemaVersion => currentSchemaVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      await beforeMigration?.call(this, from, to);
      await upgrade(m, from, to);
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA journal_mode = WAL');
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  /// The schema migration steps. No released schema before v1, so this fails
  /// loudly: startup shows the Recovery screen instead of running on a
  /// half-migrated database. Tests override it.
  @protected
  Future<void> upgrade(Migrator m, int from, int to) async =>
      throw StateError('No migration from schema v$from to v$to');
}
