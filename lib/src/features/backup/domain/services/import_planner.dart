import '../../../../core/time/instant.dart';
import '../../../labels/domain/services/label_rules.dart';
import '../entities/backup_records.dart';
import '../entities/import_plan.dart';
import '../entities/import_report.dart';
import 'backup_format.dart';

/// Decides what an import writes (plan §10.6 stages 5–6, §10.7): resolves
/// references for the chosen mode, diffs against this device and returns
/// the writes plus the counts the preview shows.
///
/// Pure and deterministic, so the use case can run it once for the preview
/// and again inside the write transaction against the state it reads there.
final class ImportPlanner {
  const ImportPlanner();

  ImportPlan plan({
    required ParsedBackup file,
    required BackupData current,
    required ImportMode mode,
    required bool importSettings,
    required Instant now,
    required String Function() newId,
  }) => _Planning(
    file: file,
    // Replace starts from an empty device; merge diffs against it.
    local: mode == ImportMode.replace ? const BackupData() : current,
    current: current,
    mode: mode,
    now: now,
    newId: newId,
  ).run(importSettings: mode == ImportMode.replace || importSettings);
}

final class _Counts {
  int added = 0;
  int overwritten = 0;
  int unchanged = 0;
  int matchedByName = 0;
  int duplicates = 0;
  int replacedByKey = 0;
  int removed = 0;
}

final class _Planning {
  _Planning({
    required this.file,
    required this.local,
    required this.current,
    required this.mode,
    required this.now,
    required this.newId,
  }) : issues = [...file.issues],
       repairs = [...file.repairs];

  final ParsedBackup file;
  final BackupData local;
  final BackupData current;
  final ImportMode mode;
  final Instant now;
  final String Function() newId;

  final List<RecordIssue> issues;
  final List<RecordRepair> repairs;
  final _counts = {for (final t in BackupTable.values) t: _Counts()};
  var _localNewer = 0;

  final _categoryWrites = <CategoryRecord>[];
  final _labelWrites = <LabelRecord>[];
  final _seriesWrites = <TaskSeriesRecord>[];
  final _taskWrites = <TaskRecord>[];
  final _reminderWrites = <TaskReminderRecord>[];
  final _routineWrites = <RoutineRecord>[];
  final _exceptionWrites = <RoutineExceptionRecord>[];
  final _entryWrites = <EntryRecord>[];
  final _deleteEntryIds = <String>[];
  final _duplicateEntryIds = <String>{};
  final _deleteExceptionIds = <String>[];

  // IDs that exist once the import is done, per table.
  late final Set<String> _categories;
  late final Set<String> _labels;
  late final Set<String> _series;
  late final Set<String> _tasks;
  late final Set<String> _routines;
  late Map<String, String> _categoryAlias;
  late Map<String, String> _labelAlias;
  String? _placeholderId;

  static String _key(String name) => LabelRules.nameKeyOf(name);

  ImportPlan run({required bool importSettings}) {
    _planCategories();
    _planLabels();
    _planTaskSeries();
    _planTasks();
    _planTaskReminders();
    _planRoutines();
    _planRoutineExceptions();
    _planEntries();
    if (mode == ImportMode.replace) _diffReplaceWithDevice();

    final invalidByTable = <BackupTable, int>{};
    for (final issue in issues) {
      invalidByTable[issue.table] = (invalidByTable[issue.table] ?? 0) + 1;
    }
    final summary = ImportSummary(
      mode: mode,
      tables: {
        for (final MapEntry(key: table, value: c) in _counts.entries)
          table: TableSummary(
            added: c.added,
            overwritten: c.overwritten,
            unchanged: c.unchanged,
            invalid: invalidByTable[table] ?? 0,
            matchedByName: c.matchedByName,
            duplicates: c.duplicates,
            replacedByKey: c.replacedByKey,
            removed: c.removed,
          ),
      },
      localNewer: _localNewer,
      settingsImported: importSettings,
      issues: issues,
      repairs: _repairsOfWrittenRecords(),
    );
    return ImportPlan(
      summary: summary,
      replaceAll: mode == ImportMode.replace,
      upserts: BackupData(
        categories: _categoryWrites,
        labels: _labelWrites,
        taskSeries: _seriesWrites,
        tasks: _taskWrites,
        taskReminders: _reminderWrites,
        routines: _routineWrites,
        routineExceptions: _exceptionWrites,
        entries: _entryWrites,
      ),
      deleteEntryIds: _deleteEntryIds,
      deleteRoutineExceptionIds: _deleteExceptionIds,
      settings: importSettings ? file.data.settings : null,
    );
  }

  /// Replace writes everything after deleting everything, but the preview
  /// still compares with this device (§10.6 stage 6): which records are new,
  /// changed or the same, which local ones aren't in the file (they go),
  /// and which local edits are newer than the backup's.
  void _diffReplaceWithDevice() {
    void diff<T extends Object>(
      BackupTable table,
      List<T> written,
      List<T> onDevice,
      String Function(T) idOf,
      Instant Function(T) updatedAtOf,
    ) {
      final counts = _counts[table]!
        ..added = 0
        ..overwritten = 0
        ..unchanged = 0;
      final local = {for (final r in onDevice) idOf(r): r};
      final writtenIds = <String>{};
      for (final r in written) {
        writtenIds.add(idOf(r));
        final l = local[idOf(r)];
        if (l == null) {
          counts.added++;
        } else if (l == r) {
          counts.unchanged++;
        } else {
          counts.overwritten++;
          if (updatedAtOf(l) > updatedAtOf(r)) _localNewer++;
        }
      }
      counts.removed = local.keys.where((id) => !writtenIds.contains(id)).length;
    }

    diff(BackupTable.categories, _categoryWrites, current.categories, (r) => r.id, (r) => r.updatedAt);
    diff(BackupTable.labels, _labelWrites, current.labels, (r) => r.id, (r) => r.updatedAt);
    diff(BackupTable.taskSeries, _seriesWrites, current.taskSeries, (r) => r.id, (r) => r.updatedAt);
    diff(BackupTable.tasks, _taskWrites, current.tasks, (r) => r.id, (r) => r.updatedAt);
    diff(BackupTable.taskReminders, _reminderWrites, current.taskReminders, (r) => r.id, (r) => r.updatedAt);
    diff(BackupTable.routines, _routineWrites, current.routines, (r) => r.id, (r) => r.updatedAt);
    diff(BackupTable.routineExceptions, _exceptionWrites, current.routineExceptions, (r) => r.id, (r) => r.updatedAt);
    diff(BackupTable.entries, _entryWrites, current.entries, (r) => r.id, (r) => r.updatedAt);
  }

  /// Repairs of records that are left out (invalid, rejected, duplicates)
  /// aren't made, so they aren't listed; matched-by-name records are listed
  /// under the ID they're written with.
  List<RecordRepair> _repairsOfWrittenRecords() {
    final leftOut = {
      for (final i in issues)
        // A duplicate ID's issue names the record that was kept, too.
        if (i.id != null && i.reason != IssueReason.duplicateId) (i.table, i.id!),
      for (final id in _duplicateEntryIds) (BackupTable.entries, id),
    };
    return [
      for (final r in repairs)
        if (!leftOut.contains((r.table, r.id)))
          switch (r.table) {
            BackupTable.labels => r.copyWith(id: _labelAlias[r.id] ?? r.id),
            BackupTable.categories => r.copyWith(id: _categoryAlias[r.id] ?? r.id),
            _ => r,
          },
    ];
  }

  // --- named records: categories and labels ----------------------------------

  void _planCategories() {
    final result = _mergeNamed<CategoryRecord>(
      BackupTable.categories,
      imported: file.data.categories,
      local: local.categories,
      idOf: (r) => r.id,
      nameOf: (r) => r.name,
      updatedAtOf: (r) => r.updatedAt,
      // D-25: keep this device's ID, name and creation time; take the rest.
      adopt: (l, r) => l.copyWith(colorKey: r.colorKey, sortOrder: r.sortOrder, updatedAt: r.updatedAt),
      write: _categoryWrites.add,
    );
    _categoryAlias = result.alias;
    _categories = result.ids;
  }

  void _planLabels() {
    final imported = [
      for (final l in file.data.labels)
        l.copyWith(
          categoryId: _optional(_categoryRef(l.categoryId), l.categoryId, BackupTable.labels, l.id, 'categoryId'),
        ),
    ];
    final result = _mergeNamed<LabelRecord>(
      BackupTable.labels,
      imported: imported,
      local: local.labels,
      idOf: (r) => r.id,
      nameOf: (r) => r.name,
      updatedAtOf: (r) => r.updatedAt,
      adopt: (l, r) => l.copyWith(
        colorKey: r.colorKey,
        iconKey: r.iconKey,
        categoryId: r.categoryId,
        isArchived: r.isArchived,
        sortOrder: r.sortOrder,
        updatedAt: r.updatedAt,
      ),
      write: _labelWrites.add,
    );
    _labelAlias = result.alias;
    _labels = result.ids;
  }

  /// Merges records whose names must stay unique (§10.7, D-25):
  ///
  /// * same ID → overwrite;
  /// * new ID, same name as a local record the file doesn't also change →
  ///   matched by name: references move to the local ID, which takes the
  ///   imported fields ([adopt]);
  /// * same ID but renamed to a name another local record keeps → left out
  ///   ([IssueReason.nameUsedOnDevice]); its local version stays.
  ///
  /// Leaving one out fixes its local name, which can clash with another
  /// imported rename, so this repeats until nothing changes.
  ({Map<String, String> alias, Set<String> ids}) _mergeNamed<T extends Object>(
    BackupTable table, {
    required List<T> imported,
    required List<T> local,
    required String Function(T) idOf,
    required String Function(T) nameOf,
    required Instant Function(T) updatedAtOf,
    required T Function(T local, T imported) adopt,
    required void Function(T) write,
  }) {
    final localById = {for (final l in local) idOf(l): l};
    final importedIds = {for (final r in imported) idOf(r)};
    final rejected = <String>{};
    var alias = <String, String>{};
    for (var changed = true; changed;) {
      changed = false;
      alias = {};
      final fixedNames = {
        for (final l in local)
          if (!importedIds.contains(idOf(l)) || rejected.contains(idOf(l))) _key(nameOf(l)): idOf(l),
      };
      for (final r in imported) {
        final id = idOf(r);
        if (rejected.contains(id)) continue;
        final owner = fixedNames[_key(nameOf(r))];
        if (owner == null || owner == id) continue;
        if (localById.containsKey(id)) {
          rejected.add(id);
          changed = true;
        } else {
          alias[id] = owner;
        }
      }
    }

    final counts = _counts[table]!;
    for (final r in imported) {
      final id = idOf(r);
      if (rejected.contains(id)) {
        issues.add(RecordIssue(table: table, id: id, reason: IssueReason.nameUsedOnDevice, field: 'name'));
      } else if (alias[id] case final owner?) {
        counts.matchedByName++;
        _mergeOne(table, adopt(localById[owner]!, r), localById[owner], updatedAtOf, write);
      } else {
        _mergeOne(table, r, localById[id], updatedAtOf, write);
      }
    }
    return (
      alias: alias,
      ids: {...localById.keys, ...importedIds.where((id) => !rejected.contains(id) && !alias.containsKey(id))},
    );
  }

  // --- tasks -----------------------------------------------------------------

  void _planTaskSeries() {
    _mergeAll(
      BackupTable.taskSeries,
      file.data.taskSeries,
      local.taskSeries,
      (r) => r.id,
      (r) => r.updatedAt,
      _seriesWrites.add,
    );
    _series = {...local.taskSeries.map((r) => r.id), ...file.data.taskSeries.map((r) => r.id)};
  }

  void _planTasks() {
    final imported = [
      for (final t in file.data.tasks)
        t.copyWith(
          seriesId: _optional(_known(t.seriesId, _series), t.seriesId, BackupTable.tasks, t.id, 'seriesId'),
          categoryId: _optional(_categoryRef(t.categoryId), t.categoryId, BackupTable.tasks, t.id, 'categoryId'),
        ),
    ];
    _mergeAll(BackupTable.tasks, imported, local.tasks, (r) => r.id, (r) => r.updatedAt, _taskWrites.add);
    _tasks = {...local.tasks.map((r) => r.id), ...imported.map((r) => r.id)};

    // One unfinished task per series: the imported one stays in the
    // series, a local one is detached into a standalone task (§10.7).
    final importedIds = {for (final t in imported) t.id};
    final openImported = {
      for (final t in imported)
        if (t.isOpen && t.seriesId != null) t.seriesId!,
    };
    for (final t in local.tasks) {
      if (!importedIds.contains(t.id) && t.isOpen && openImported.contains(t.seriesId)) {
        _taskWrites.add(t.copyWith(seriesId: null));
        _counts[BackupTable.tasks]!.overwritten++;
        repairs.add(
          RecordRepair(table: BackupTable.tasks, id: t.id, kind: RepairKind.detachedFromSeries, field: 'seriesId'),
        );
      }
    }
  }

  void _planTaskReminders() {
    final imported = <TaskReminderRecord>[];
    for (final r in file.data.taskReminders) {
      if (_tasks.contains(r.taskId)) {
        imported.add(r);
      } else {
        _drop(BackupTable.taskReminders, r.id, 'taskId');
      }
    }
    _mergeAll(
      BackupTable.taskReminders,
      imported,
      local.taskReminders,
      (r) => r.id,
      (r) => r.updatedAt,
      _reminderWrites.add,
    );
  }

  // --- routines ----------------------------------------------------------------

  void _planRoutines() {
    final imported = [
      for (final r in file.data.routines) r.copyWith(labelId: _labelRef(r.labelId, BackupTable.routines, r.id)),
    ];
    _mergeAll(BackupTable.routines, imported, local.routines, (r) => r.id, (r) => r.updatedAt, _routineWrites.add);
    _routines = {...local.routines.map((r) => r.id), ...imported.map((r) => r.id)};
  }

  void _planRoutineExceptions() {
    final imported = <RoutineExceptionRecord>[];
    for (final x in file.data.routineExceptions) {
      if (!_routines.contains(x.routineId)) {
        _drop(BackupTable.routineExceptions, x.id, 'routineId');
        continue;
      }
      final labelId = x.labelId == null ? null : _labelAlias[x.labelId] ?? x.labelId;
      imported.add(
        x.copyWith(
          labelId: _optional(_known(labelId, _labels), labelId, BackupTable.routineExceptions, x.id, 'labelId'),
        ),
      );
    }
    // Same routine and date as a different local exception → imported wins.
    final importedIds = {for (final x in imported) x.id};
    final localByKey = {
      for (final x in local.routineExceptions)
        if (!importedIds.contains(x.id)) '${x.routineId}|${x.occurrenceDate}': x,
    };
    for (final x in imported) {
      if (localByKey['${x.routineId}|${x.occurrenceDate}'] case final replaced?) {
        _deleteExceptionIds.add(replaced.id);
        _counts[BackupTable.routineExceptions]!.replacedByKey++;
        if (replaced.updatedAt > x.updatedAt) _localNewer++;
      }
    }
    _mergeAll(
      BackupTable.routineExceptions,
      imported,
      local.routineExceptions,
      (r) => r.id,
      (r) => r.updatedAt,
      _exceptionWrites.add,
    );
  }

  // --- entries -------------------------------------------------------------------

  void _planEntries() {
    final counts = _counts[BackupTable.entries]!;
    final candidates = <EntryRecord>[];
    for (final e in file.data.entries) {
      if (e.source == 'routine' && !_routines.contains(e.routineId)) {
        _drop(BackupTable.entries, e.id, 'routineId');
        continue;
      }
      candidates.add(
        e.copyWith(
          labelId: _labelRef(e.labelId, BackupTable.entries, e.id),
          categoryOverrideId: _optional(
            _categoryRef(e.categoryOverrideId),
            e.categoryOverrideId,
            BackupTable.entries,
            e.id,
            'categoryOverrideId',
          ),
          taskId: _optional(_known(e.taskId, _tasks), e.taskId, BackupTable.entries, e.id, 'taskId'),
        ),
      );
    }

    final importedIds = {for (final e in candidates) e.id};
    final localById = {for (final e in local.entries) e.id: e};
    final otherLocal = [
      for (final e in local.entries)
        if (!importedIds.contains(e.id)) e,
    ];

    // A routine occurrence for the same routine and date replaces the local
    // one; local actual entries logged from it are re-pointed (§10.7).
    final localOccurrence = {
      for (final e in otherLocal)
        if (e.source == 'routine') '${e.routineId}|${e.occurrenceDate}': e.id,
    };
    final repoint = <String, String>{};
    for (final e in candidates) {
      if (e.source != 'routine') continue;
      if (localOccurrence['${e.routineId}|${e.occurrenceDate}'] case final localId?) {
        repoint[localId] = e.id;
        _deleteEntryIds.add(localId);
        counts.replacedByKey++;
      }
    }

    // A new entry that exactly matches a local one is skipped (D-27).
    // A record, so a missing note and the text "null" stay different.
    (String, String, int, int?, String?) fingerprint(EntryRecord e) =>
        (e.kind, e.labelId, e.start.utcMs, e.end?.utcMs, e.note);
    final localByFingerprint = {
      for (final e in otherLocal)
        if (e.source != 'routine') fingerprint(e): e.id,
    };
    final duplicateOf = <String, String>{};
    final kept = <EntryRecord>[];
    for (final e in candidates) {
      final match = e.source == 'routine' || localById.containsKey(e.id) ? null : localByFingerprint[fingerprint(e)];
      if (match != null) {
        duplicateOf[e.id] = match;
        _duplicateEntryIds.add(e.id);
        counts.duplicates++;
      } else {
        kept.add(e);
      }
    }

    // Plans that actual entries were logged from must exist afterwards: a
    // skipped duplicate becomes its local twin, a replaced occurrence its
    // replacement; anything else missing is cleared.
    final exists = {
      ...kept.map((e) => e.id),
      for (final e in otherLocal)
        if (!repoint.containsKey(e.id)) e.id,
    };
    final resolved = [
      for (final e in kept)
        if (e.plannedEntryId case final plan?)
          e.copyWith(
            plannedEntryId: _optional(
              _known(duplicateOf[plan] ?? repoint[plan] ?? plan, exists),
              plan,
              BackupTable.entries,
              e.id,
              'plannedEntryId',
            ),
          )
        else
          e,
    ];
    _mergeAll(BackupTable.entries, resolved, local.entries, (r) => r.id, (r) => r.updatedAt, _entryWrites.add);
    for (final e in otherLocal) {
      if (repoint[e.plannedEntryId] case final newPlan?) {
        _entryWrites.add(e.copyWith(plannedEntryId: newPlan));
        counts.overwritten++;
      }
    }
  }

  // --- helpers ---------------------------------------------------------------

  void _mergeAll<T extends Object>(
    BackupTable table,
    List<T> imported,
    List<T> local,
    String Function(T) idOf,
    Instant Function(T) updatedAtOf,
    void Function(T) write,
  ) {
    final localById = {for (final l in local) idOf(l): l};
    for (final r in imported) {
      _mergeOne(table, r, localById[idOf(r)], updatedAtOf, write);
    }
  }

  /// Same ID → overwrite (imported wins, even if the local copy is newer);
  /// identical → skip; otherwise insert.
  void _mergeOne<T extends Object>(
    BackupTable table,
    T record,
    T? local,
    Instant Function(T) updatedAtOf,
    void Function(T) write,
  ) {
    final counts = _counts[table]!;
    if (local == null) {
      counts.added++;
      write(record);
    } else if (local == record) {
      counts.unchanged++;
    } else {
      counts.overwritten++;
      if (updatedAtOf(local) > updatedAtOf(record)) _localNewer++;
      write(record);
    }
  }

  String? _categoryRef(String? id) => _known(id == null ? null : _categoryAlias[id] ?? id, _categories);

  /// [id] if it exists after the import, else null.
  static String? _known(String? id, Set<String> ids) => id != null && ids.contains(id) ? id : null;

  /// [resolved] for an optional reference whose file value was [original].
  /// When it didn't resolve, the reference is cleared and listed.
  String? _optional(String? resolved, String? original, BackupTable table, String id, String field) {
    if (resolved == null && original != null) {
      repairs.add(RecordRepair(table: table, id: id, kind: RepairKind.referenceCleared, field: field));
    }
    return resolved;
  }

  /// A required label reference: moved to the matched label, or to the
  /// archived placeholder when it's missing (never dropped, §10.6).
  String _labelRef(String id, BackupTable table, String recordId) {
    final target = _labelAlias[id] ?? id;
    if (_labels.contains(target)) return target;
    repairs.add(RecordRepair(table: table, id: recordId, kind: RepairKind.placeholderLabel, field: 'labelId'));
    return _placeholderId ??= _placeholder();
  }

  String _placeholder() {
    final key = _key(BackupFormat.placeholderLabelName);
    for (final l in _labelWrites) {
      if (_key(l.name) == key) return l.id;
    }
    final written = {for (final l in _labelWrites) l.id};
    for (final l in local.labels) {
      if (!written.contains(l.id) && _key(l.name) == key) return l.id;
    }
    for (final l in file.data.labels) {
      if (_labels.contains(l.id) && _key(l.name) == key) return l.id;
    }
    final label = LabelRecord(
      id: newId(),
      name: BackupFormat.placeholderLabelName,
      colorKey: BackupFormat.fallbackColorKey,
      isArchived: true,
      createdAt: now,
      updatedAt: now,
    );
    _labelWrites.add(label);
    _labels.add(label.id);
    _counts[BackupTable.labels]!.added++;
    return label.id;
  }

  /// Leaves a record out for a missing required reference.
  void _drop(BackupTable table, String id, String field) =>
      issues.add(RecordIssue(table: table, id: id, reason: IssueReason.missingReference, field: field));
}
