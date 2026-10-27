// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labels_dao.dart';

// ignore_for_file: type=lint
mixin _$LabelsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $LabelsTable get labels => attachedDatabase.labels;
  $TaskSeriesTable get taskSeries => attachedDatabase.taskSeries;
  $TasksTable get tasks => attachedDatabase.tasks;
  $RoutinesTable get routines => attachedDatabase.routines;
  $EntriesTable get entries => attachedDatabase.entries;
  $RoutineExceptionsTable get routineExceptions =>
      attachedDatabase.routineExceptions;
  LabelsDaoManager get managers => LabelsDaoManager(this);
}

class LabelsDaoManager {
  final _$LabelsDaoMixin _db;
  LabelsDaoManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$LabelsTableTableManager get labels =>
      $$LabelsTableTableManager(_db.attachedDatabase, _db.labels);
  $$TaskSeriesTableTableManager get taskSeries =>
      $$TaskSeriesTableTableManager(_db.attachedDatabase, _db.taskSeries);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db.attachedDatabase, _db.tasks);
  $$RoutinesTableTableManager get routines =>
      $$RoutinesTableTableManager(_db.attachedDatabase, _db.routines);
  $$EntriesTableTableManager get entries =>
      $$EntriesTableTableManager(_db.attachedDatabase, _db.entries);
  $$RoutineExceptionsTableTableManager get routineExceptions =>
      $$RoutineExceptionsTableTableManager(
        _db.attachedDatabase,
        _db.routineExceptions,
      );
}
