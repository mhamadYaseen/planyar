import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../../../labels/domain/entities/label_color_keys.dart';
import '../../../labels/domain/entities/label_icon_keys.dart';
import '../../../labels/domain/services/label_rules.dart';
import '../../../settings/domain/entities/setting_keys.dart';
import '../entities/backup_manifest.dart';
import '../entities/backup_records.dart';
import '../entities/import_report.dart';
import 'backup_format.dart';

/// Reads `data.json` into records (plan §10.6 stages 4–5, the parts that
/// don't depend on the import mode). Every file is untrusted:
///
/// * a broken top-level structure throws [BackupFileException] (`damaged`);
/// * a bad record is left out with a [RecordIssue], the rest continue;
/// * safe problems are fixed and listed as [RecordRepair]s;
/// * duplicate IDs, names and routine dates inside the file are resolved,
///   so the result can always be inserted into an empty database once its
///   references are resolved (`ImportPlanner`).
final class BackupJsonReader {
  const BackupJsonReader();

  ParsedBackup read(Object? json) {
    if (json is! Map<String, Object?>) {
      throw const BackupFileException(BackupFileProblem.damaged, 'data.json is not an object');
    }
    final log = _Log();
    List<_Indexed<T>> table<T extends Object>(BackupTable t, T Function(_Fields) parse) =>
        _uniqueIds(_parseAll(json, t, log, parse), t, log);

    // Stage 4 per record, then stage 5 inside the file: one record per ID;
    // names unique (a later duplicate folds into the first); one occurrence
    // or exception per routine and date; one unfinished task per series.
    final categories = _foldDuplicateNames(
      table(BackupTable.categories, _category),
      BackupTable.categories,
      log,
      (r) => r.name,
    );
    final labels = _foldDuplicateNames(table(BackupTable.labels, _label), BackupTable.labels, log, (r) => r.name);
    final taskSeries = table(BackupTable.taskSeries, _taskSeries);
    final tasks = table(BackupTable.tasks, _task);
    final taskReminders = table(BackupTable.taskReminders, _taskReminder);
    final routines = table(BackupTable.routines, _routine);
    final exceptions = _uniqueBy(
      table(BackupTable.routineExceptions, _routineException),
      BackupTable.routineExceptions,
      log,
      (x) => '${x.routineId}|${x.occurrenceDate}',
    );
    final entries = _uniqueBy(
      table(BackupTable.entries, _entry),
      BackupTable.entries,
      log,
      (e) => e.source == 'routine' ? '${e.routineId}|${e.occurrenceDate}' : null,
    );
    final settings = _settings(json['settings']);

    String? category(String? id) => id == null ? null : categories.alias[id] ?? id;
    String label(String id) => labels.alias[id] ?? id;
    String? entry(String? id) => id == null ? null : entries.alias[id] ?? id;

    final data = BackupData(
      categories: _records(categories.kept),
      labels: [for (final l in _records(labels.kept)) l.copyWith(categoryId: category(l.categoryId))],
      taskSeries: _records(taskSeries),
      tasks: _onePerSeries([for (final t in _records(tasks)) t.copyWith(categoryId: category(t.categoryId))], log),
      taskReminders: _records(taskReminders),
      routines: [for (final r in _records(routines)) r.copyWith(labelId: label(r.labelId))],
      routineExceptions: [
        for (final x in _records(exceptions.kept)) x.copyWith(labelId: x.labelId == null ? null : label(x.labelId!)),
      ],
      entries: [
        for (final e in _records(entries.kept))
          e.copyWith(
            labelId: label(e.labelId),
            categoryOverrideId: category(e.categoryOverrideId),
            plannedEntryId: entry(e.plannedEntryId),
          ),
      ],
      settings: settings,
    );
    return ParsedBackup(data: data, issues: log.issues, repairs: log.repairs);
  }

  // --- tables -------------------------------------------------------------

  static CategoryRecord _category(_Fields f) => CategoryRecord(
    id: f.id('id'),
    name: f.name('name'),
    colorKey: f.colorKey('colorKey', optional: true),
    sortOrder: f.integer('sortOrder', fallback: 0),
    createdAt: f.instant('createdAtUtc'),
    updatedAt: f.instant('updatedAtUtc'),
  );

  static LabelRecord _label(_Fields f) => LabelRecord(
    id: f.id('id'),
    name: f.name('name'),
    colorKey: f.colorKey('colorKey')!,
    iconKey: f.iconKey('iconKey'),
    categoryId: f.optionalId('categoryId'),
    isArchived: f.boolean('isArchived', fallback: false),
    sortOrder: f.integer('sortOrder', fallback: 0),
    createdAt: f.instant('createdAtUtc'),
    updatedAt: f.instant('updatedAtUtc'),
  );

  static EntryRecord _entry(_Fields f) {
    final id = f.id('id');
    final kind = f.oneOf('kind', BackupFormat.entryKinds);
    final start = f.minuteInstant('startUtc');
    final end = f.optionalMinuteInstant('endUtc');
    if (end != null && !end.isAfter(start)) throw const _Invalid(IssueReason.endNotAfterStart, 'endUtc');
    if (end != null && end.difference(start) > BackupFormat.maxEntryDuration) {
      throw const _Invalid(IssueReason.longerThan7Days, 'endUtc');
    }
    final source = f.oneOf('source', BackupFormat.entrySources);
    final routineId = f.optionalId('routineId');
    final occurrenceDate = f.optionalDate('occurrenceDate');
    final plannedEntryId = f.optionalId('plannedEntryId');
    final isOccurrence = routineId != null && occurrenceDate != null && kind == 'planned';
    if ((source == 'routine') != isOccurrence) throw const _Invalid(IssueReason.badValue, 'source');
    if (source != 'routine' && (routineId != null || occurrenceDate != null)) {
      throw const _Invalid(IssueReason.badValue, 'routineId');
    }
    if (source == 'from_plan' && kind != 'actual') throw const _Invalid(IssueReason.badValue, 'source');
    if (plannedEntryId != null && (kind != 'actual' || source != 'from_plan' || plannedEntryId == id)) {
      throw const _Invalid(IssueReason.badValue, 'plannedEntryId');
    }
    return EntryRecord(
      id: id,
      kind: kind,
      labelId: f.id('labelId'),
      categoryOverrideId: f.optionalId('categoryOverrideId'),
      start: start,
      end: end,
      tzId: f.text('tzId', max: BackupFormat.maxZoneIdLength),
      utcOffsetMin: f.integer('utcOffsetMin', min: -18 * 60, max: 18 * 60),
      note: f.optionalText('note', max: BackupFormat.maxNoteLength),
      taskId: f.optionalId('taskId'),
      source: source,
      routineId: routineId,
      occurrenceDate: occurrenceDate,
      plannedEntryId: plannedEntryId,
      createdAt: f.instant('createdAtUtc'),
      updatedAt: f.instant('updatedAtUtc'),
    );
  }

  static RoutineRecord _routine(_Fields f) {
    final startMinute = f.integer('startMinute', min: 0, max: 1439);
    final endMinute = f.integer('endMinute', min: 0, max: 1439);
    if (startMinute == endMinute) throw const _Invalid(IssueReason.badValue, 'endMinute');
    final startsOn = f.date('startsOn');
    final endsOn = f.optionalDate('endsOn');
    if (endsOn != null && endsOn < startsOn) throw const _Invalid(IssueReason.badValue, 'endsOn');
    return RoutineRecord(
      id: f.id('id'),
      name: f.optionalText('name', min: 1, max: BackupFormat.maxRoutineNameLength),
      labelId: f.id('labelId'),
      startMinute: startMinute,
      endMinute: endMinute,
      recurrenceFreq: f.oneOf('recurrenceFreq', BackupFormat.routineFreqs, fallback: 'daily'),
      recurrenceInterval: f.integer('recurrenceInterval', min: 1, max: 1000, fallback: 1),
      weekdaysMask: f.optionalInteger('weekdaysMask', min: 1, max: 127),
      startsOn: startsOn,
      endsOn: endsOn,
      isPaused: f.boolean('isPaused', fallback: false),
      isArchived: f.boolean('isArchived', fallback: false),
      note: f.optionalText('note', max: BackupFormat.maxNoteLength),
      reminderOffsetMin: f.optionalInteger('reminderOffsetMin', min: 0, max: 60),
      reminderIgnoreQuiet: f.boolean('reminderIgnoreQuiet', fallback: false),
      createdAt: f.instant('createdAtUtc'),
      updatedAt: f.instant('updatedAtUtc'),
    );
  }

  static RoutineExceptionRecord _routineException(_Fields f) {
    final type = f.oneOf('type', BackupFormat.exceptionTypes);
    final startOffset = f.optionalInteger('startOffsetMin', min: -720, max: 2880);
    final endOffset = f.optionalInteger('endOffsetMin', min: -720, max: 2880);
    if (startOffset != null && endOffset != null && endOffset <= startOffset) {
      throw const _Invalid(IssueReason.endNotAfterStart, 'endOffsetMin');
    }
    final labelId = f.optionalId('labelId');
    final note = f.optionalText('note', max: BackupFormat.maxNoteLength);
    if (type == 'skip' && (startOffset != null || endOffset != null || labelId != null || note != null)) {
      throw const _Invalid(IssueReason.badValue, 'type');
    }
    return RoutineExceptionRecord(
      id: f.id('id'),
      routineId: f.id('routineId'),
      occurrenceDate: f.date('occurrenceDate'),
      type: type,
      startOffsetMin: startOffset,
      endOffsetMin: endOffset,
      labelId: labelId,
      note: note,
      createdAt: f.instant('createdAtUtc'),
      updatedAt: f.instant('updatedAtUtc'),
    );
  }

  static TaskSeriesRecord _taskSeries(_Fields f) {
    final anchor = f.date('anchorDate');
    final endsOn = f.optionalDate('endsOn');
    if (endsOn != null && endsOn < anchor) throw const _Invalid(IssueReason.badValue, 'endsOn');
    return TaskSeriesRecord(
      id: f.id('id'),
      freq: f.oneOf('freq', BackupFormat.seriesFreqs),
      interval: f.integer('interval', min: 1, max: 1000),
      mode: f.oneOf('mode', BackupFormat.seriesModes),
      anchorDate: anchor,
      endsOn: endsOn,
      isActive: f.boolean('isActive', fallback: true),
      createdAt: f.instant('createdAtUtc'),
      updatedAt: f.instant('updatedAtUtc'),
    );
  }

  static TaskRecord _task(_Fields f) {
    final id = f.id('id');
    final startDate = f.date('startDate');
    final deadlineDate = f.optionalDate('deadlineDate');
    if (deadlineDate != null && deadlineDate < startDate) throw const _Invalid(IssueReason.badValue, 'deadlineDate');
    final deadlineMinute = f.optionalInteger('deadlineMinute', min: 0, max: 1439);
    if (deadlineMinute != null && deadlineDate == null) throw const _Invalid(IssueReason.badValue, 'deadlineMinute');
    final status = f.oneOf('status', BackupFormat.taskStatuses);
    final updatedAt = f.instant('updatedAtUtc');
    var completedAt = f.optionalInstant('completedAtUtc');
    if (status == 'completed' && completedAt == null) {
      completedAt = updatedAt;
      f.repair(RepairKind.completedAtSet, 'completedAtUtc');
    } else if (status != 'completed' && completedAt != null) {
      completedAt = null;
      f.repair(RepairKind.completedAtCleared, 'completedAtUtc');
    }
    return TaskRecord(
      id: id,
      seriesId: f.optionalId('seriesId'),
      title: f.text('title', max: BackupFormat.maxTaskTitleLength),
      notes: f.optionalText('notes', max: BackupFormat.maxTaskNotesLength),
      startDate: startDate,
      deadlineDate: deadlineDate,
      deadlineMinute: deadlineMinute,
      status: status,
      priority: f.oneOf('priority', BackupFormat.taskPriorities, fallback: 'normal'),
      categoryId: f.optionalId('categoryId'),
      estimateMin: f.optionalInteger('estimateMin', min: 1, max: 1000000),
      actualAdjustMin: f.integer('actualAdjustMin', min: -1000000, max: 1000000, fallback: 0),
      completedAt: completedAt,
      createdAt: f.instant('createdAtUtc'),
      updatedAt: updatedAt,
    );
  }

  static TaskReminderRecord _taskReminder(_Fields f) {
    final type = f.oneOf('type', BackupFormat.reminderTypes);
    final offsetDays = f.optionalInteger('offsetDays', min: 1, max: 30);
    final minuteOfDay = f.optionalInteger('minuteOfDay', min: 0, max: 1439);
    final customAt = f.optionalInstant('customAtUtc');
    final consistent = switch (type) {
      'custom' => customAt != null && offsetDays == null,
      'before_deadline' => offsetDays != null && minuteOfDay != null && customAt == null,
      _ => minuteOfDay != null && offsetDays == null && customAt == null,
    };
    if (!consistent) throw const _Invalid(IssueReason.badValue, 'type');
    return TaskReminderRecord(
      id: f.id('id'),
      taskId: f.id('taskId'),
      type: type,
      offsetDays: offsetDays,
      minuteOfDay: minuteOfDay,
      customAt: customAt,
      ignoreQuiet: f.boolean('ignoreQuiet', fallback: false),
      createdAt: f.instant('createdAtUtc'),
      updatedAt: f.instant('updatedAtUtc'),
    );
  }

  /// Only the portable keys are taken (whatever else the file holds), and
  /// only values of the right shape — checked directly, never by encoding
  /// them (a deeply nested value would overflow the stack). Their meaning is
  /// checked when the settings are read: an unknown value falls back to the
  /// default there.
  static Map<String, Object?> _settings(Object? raw) {
    if (raw == null) return const {};
    if (raw is! Map<String, Object?>) {
      throw const BackupFileException(BackupFileProblem.damaged, 'settings is not an object');
    }
    return {
      for (final MapEntry(:key, :value) in raw.entries)
        if (_settingValue(value) case final normalized? when SettingKeys.acceptsPortable(key, normalized))
          key: normalized,
    };
  }

  /// `5.0` → 5; strings with lone surrogates are dropped.
  static Object? _settingValue(Object? value) => switch (value) {
    final double d when d.isFinite && d == d.roundToDouble() && d.abs() < 1e9 => d.toInt(),
    final String s when _Fields.hasLoneSurrogate(s) => null,
    _ => value,
  };

  // --- helpers --------------------------------------------------------------

  static List<_Indexed<T>> _parseAll<T>(
    Map<String, Object?> json,
    BackupTable table,
    _Log log,
    T Function(_Fields) parse,
  ) {
    final raw = json[table.name];
    // A missing array is empty: older or partial files may lack one.
    if (raw == null) return [];
    if (raw is! List<Object?>) {
      throw BackupFileException(BackupFileProblem.damaged, '${table.name} is not an array');
    }
    final parsed = <_Indexed<T>>[];
    for (var index = 0; index < raw.length; index++) {
      final item = raw[index];
      if (item is! Map<String, Object?>) {
        log.issues.add(RecordIssue(table: table, index: index, reason: IssueReason.notAnObject));
        continue;
      }
      final fields = _Fields(item, table);
      try {
        final record = parse(fields);
        parsed.add(_Indexed(index, record));
        log.repairs.addAll(fields.repairs);
      } on _Invalid catch (invalid) {
        log.issues.add(
          RecordIssue(table: table, index: index, id: fields.readableId, reason: invalid.reason, field: invalid.field),
        );
      }
    }
    return parsed;
  }

  static String _idOf(Object record) => switch (record) {
    CategoryRecord(:final id) ||
    LabelRecord(:final id) ||
    TaskSeriesRecord(:final id) ||
    TaskRecord(:final id) ||
    TaskReminderRecord(:final id) ||
    RoutineRecord(:final id) ||
    RoutineExceptionRecord(:final id) ||
    EntryRecord(:final id) => id,
    _ => throw ArgumentError.value(record, 'record'),
  };

  /// Keeps the first record for each ID.
  static List<_Indexed<T>> _uniqueIds<T extends Object>(List<_Indexed<T>> records, BackupTable table, _Log log) {
    final seen = <String>{};
    final kept = <_Indexed<T>>[];
    for (final r in records) {
      final id = _idOf(r.record);
      if (seen.add(id)) {
        kept.add(r);
      } else {
        log.issues.add(RecordIssue(table: table, index: r.index, id: id, reason: IssueReason.duplicateId));
      }
    }
    return kept;
  }

  /// Keeps the first record per non-null [keyOf]; later ones are left out
  /// and their IDs aliased to the kept one.
  static _Unique<T> _uniqueBy<T extends Object>(
    List<_Indexed<T>> records,
    BackupTable table,
    _Log log,
    String? Function(T) keyOf, {
    IssueReason reason = IssueReason.duplicateOccurrence,
    String? field,
  }) {
    final firstByKey = <String, String>{};
    final alias = <String, String>{};
    final kept = <_Indexed<T>>[];
    for (final r in records) {
      final key = keyOf(r.record);
      final id = _idOf(r.record);
      final first = key == null ? null : firstByKey[key];
      if (key == null) {
        kept.add(r);
      } else if (first != null) {
        alias[id] = first;
        log.issues.add(RecordIssue(table: table, index: r.index, id: id, reason: reason, field: field));
      } else {
        firstByKey[key] = id;
        kept.add(r);
      }
    }
    return _Unique(kept, alias);
  }

  /// Names are unique ignoring case and spaces: a later duplicate is left
  /// out and references to it move to the first (D-25 within one file).
  static _Unique<T> _foldDuplicateNames<T extends Object>(
    List<_Indexed<T>> records,
    BackupTable table,
    _Log log,
    String Function(T) nameOf,
  ) => _uniqueBy(
    records,
    table,
    log,
    (r) => LabelRules.nameKeyOf(nameOf(r)),
    reason: IssueReason.duplicateName,
    field: 'name',
  );

  /// At most one unfinished task per series (as the database requires);
  /// later ones become standalone tasks.
  static List<TaskRecord> _onePerSeries(List<TaskRecord> tasks, _Log log) {
    final openSeries = <String>{};
    final result = <TaskRecord>[];
    for (final t in tasks) {
      if (t.seriesId == null || !t.isOpen || openSeries.add(t.seriesId!)) {
        result.add(t);
      } else {
        result.add(t.copyWith(seriesId: null));
        log.repairs.add(
          RecordRepair(table: BackupTable.tasks, id: t.id, kind: RepairKind.detachedFromSeries, field: 'seriesId'),
        );
      }
    }
    return result;
  }

  static List<T> _records<T>(List<_Indexed<T>> records) => [for (final r in records) r.record];
}

final class _Log {
  final issues = <RecordIssue>[];
  final repairs = <RecordRepair>[];
}

final class _Unique<T> {
  const _Unique(this.kept, this.alias);

  final List<_Indexed<T>> kept;

  /// Left-out ID → the kept record's ID.
  final Map<String, String> alias;
}

final class _Indexed<T> {
  const _Indexed(this.index, this.record);

  final int index;
  final T record;
}

final class _Invalid implements Exception {
  const _Invalid(this.reason, [this.field]);

  final IssueReason reason;
  final String? field;
}

/// Typed, checked access to one record's JSON fields. A missing or `null`
/// optional field is null; a missing field with a fallback takes it (newer
/// optional fields, §10.4); everything else throws [_Invalid].
final class _Fields {
  _Fields(this._map, this._table);

  final Map<String, Object?> _map;
  final BackupTable _table;
  final repairs = <RecordRepair>[];

  static final _uuid = RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$');
  static final _earliest = Instant.parse('1970-01-01T00:00:00Z');
  static final _latest = Instant.parse('2200-01-01T00:00:00Z');
  static const _int32 = 0x7fffffff;

  /// The record's ID if it's readable, for issue lists.
  String? get readableId => switch (_map['id']) {
    final String id when _uuid.hasMatch(id) => id.toLowerCase(),
    _ => null,
  };

  void repair(RepairKind kind, String field) =>
      repairs.add(RecordRepair(table: _table, id: readableId ?? '', kind: kind, field: field));

  Object _required(String field) => _map[field] ?? (throw _Invalid(IssueReason.missingField, field));

  T _typed<T extends Object>(String field, Object value) {
    if (value is T) return value;
    throw _Invalid(IssueReason.wrongType, field);
  }

  /// A string, refused when it holds a lone UTF-16 surrogate: SQLite would
  /// store U+FFFD instead, so the database wouldn't match the preview (and
  /// two names differing only there would collide).
  String _string(String field, Object value) {
    final text = _typed<String>(field, value);
    if (hasLoneSurrogate(text)) throw _Invalid(IssueReason.badValue, field);
    return text;
  }

  static bool hasLoneSurrogate(String text) {
    for (var i = 0; i < text.length; i++) {
      final unit = text.codeUnitAt(i);
      if (unit >= 0xD800 && unit <= 0xDBFF) {
        if (i + 1 < text.length && (text.codeUnitAt(i + 1) & 0xFC00) == 0xDC00) {
          i++;
        } else {
          return true;
        }
      } else if (unit >= 0xDC00 && unit <= 0xDFFF) {
        return true;
      }
    }
    return false;
  }

  /// IDs are lower-cased so references match whatever case the file uses.
  String id(String field) {
    final value = _string(field, _required(field));
    if (!_uuid.hasMatch(value)) throw _Invalid(IssueReason.badId, field);
    return value.toLowerCase();
  }

  String? optionalId(String field) => _map[field] == null ? null : id(field);

  /// Label and category names: cleaned like the app does (trim, collapse
  /// spaces), then 1–40 characters.
  String name(String field) {
    final clean = LabelRules.cleanName(_string(field, _required(field)));
    if (clean.isEmpty) throw _Invalid(IssueReason.badValue, field);
    if (clean.length > BackupFormat.maxNameLength) throw _Invalid(IssueReason.tooLong, field);
    return clean;
  }

  /// Required text that isn't blank. U+0000 is refused: SQLite's length()
  /// stops there, so length CHECKs (task title 1–120) would fail.
  String text(String field, {required int max}) {
    final value = _string(field, _required(field));
    if (value.trim().isEmpty || value.contains('\u0000')) throw _Invalid(IssueReason.badValue, field);
    if (value.length > max) throw _Invalid(IssueReason.tooLong, field);
    return value;
  }

  /// Optional text. With [min] ≥ 1 (a routine name) U+0000 is refused, as in
  /// [text]; notes keep whatever the app stored.
  String? optionalText(String field, {int min = 0, required int max}) {
    final raw = _map[field];
    if (raw == null) return null;
    final value = _string(field, raw);
    if (value.length < min || (min > 0 && value.contains('\u0000'))) throw _Invalid(IssueReason.badValue, field);
    if (value.length > max) throw _Invalid(IssueReason.tooLong, field);
    return value;
  }

  int integer(String field, {int min = -_int32 - 1, int max = _int32, int? fallback}) {
    final raw = _map[field];
    if (raw == null && fallback != null) return fallback;
    final value = switch (raw ?? _required(field)) {
      final int n => n,
      // `5.0` is accepted as 5; `5.5` isn't.
      final double d when d == d.roundToDouble() && d.isFinite => d.toInt(),
      _ => throw _Invalid(IssueReason.wrongType, field),
    };
    if (value < min || value > max) throw _Invalid(IssueReason.badValue, field);
    return value;
  }

  int? optionalInteger(String field, {int min = -_int32 - 1, int max = _int32}) =>
      _map[field] == null ? null : integer(field, min: min, max: max);

  bool boolean(String field, {required bool fallback}) {
    final raw = _map[field];
    if (raw == null) return fallback;
    return _typed<bool>(field, raw);
  }

  String oneOf(String field, Set<String> allowed, {String? fallback}) {
    final raw = _map[field];
    if (raw == null && fallback != null) return fallback;
    final value = _string(field, raw ?? _required(field));
    if (!allowed.contains(value)) throw _Invalid(IssueReason.badValue, field);
    return value;
  }

  Instant instant(String field) {
    final value = _string(field, _required(field));
    final Instant parsed;
    try {
      parsed = Instant.parse(value);
    } on FormatException {
      throw _Invalid(IssueReason.badTime, field);
    }
    if (parsed < _earliest || parsed >= _latest) throw _Invalid(IssueReason.badTime, field);
    return parsed;
  }

  Instant? optionalInstant(String field) => _map[field] == null ? null : instant(field);

  /// Entry times are whole minutes; seconds are rounded off (and listed).
  Instant minuteInstant(String field) {
    final value = instant(field);
    if (value.isMinuteAligned) return value;
    repair(RepairKind.roundedToMinute, field);
    return (value + const Duration(seconds: 30)).floorToMinute();
  }

  Instant? optionalMinuteInstant(String field) => _map[field] == null ? null : minuteInstant(field);

  LocalDate date(String field) {
    final value = _string(field, _required(field));
    final parsed = LocalDate.tryParse(value);
    if (parsed == null || parsed.year < 1900 || parsed.year >= 2200) throw _Invalid(IssueReason.badDate, field);
    return parsed;
  }

  LocalDate? optionalDate(String field) => _map[field] == null ? null : date(field);

  /// Unknown color → `gray`, listed as a repair. [optional]: null allowed.
  String? colorKey(String field, {bool optional = false}) {
    final raw = _map[field];
    if (raw == null) {
      if (optional) return null;
      throw _Invalid(IssueReason.missingField, field);
    }
    final value = _string(field, raw);
    if (labelColorKeys.contains(value)) return value;
    repair(RepairKind.colorReplaced, field);
    return BackupFormat.fallbackColorKey;
  }

  /// Unknown icon → none, listed as a repair.
  String? iconKey(String field) {
    final raw = _map[field];
    if (raw == null) return null;
    final value = _string(field, raw);
    if (labelIconKeys.contains(value)) return value;
    repair(RepairKind.iconRemoved, field);
    return null;
  }
}
