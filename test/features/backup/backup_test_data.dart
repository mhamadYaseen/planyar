import 'dart:convert';

import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_writer.dart';

/// A valid lower-case UUID per number: `00000000-0000-7000-8000-00000000000a`.
String uuid(int n) => '00000000-0000-7000-8000-${n.toRadixString(16).padLeft(12, '0')}';

/// Fresh UUIDs from 0x1000 on (planner placeholder labels).
String Function() uuidSequence([int from = 0x1000]) {
  var next = from;
  return () => uuid(next++);
}

final t0 = Instant.parse('2026-10-01T08:00:00Z');
final t1 = Instant.parse('2026-10-20T08:00:00Z');

CategoryRecord category(int n, String name, {String? color = 'indigo', Instant? updated}) =>
    CategoryRecord(id: uuid(n), name: name, colorKey: color, createdAt: t0, updatedAt: updated ?? t0);

LabelRecord label(
  int n,
  String name, {
  String color = 'teal',
  String? icon,
  int? category,
  bool archived = false,
  Instant? updated,
}) => LabelRecord(
  id: uuid(n),
  name: name,
  colorKey: color,
  iconKey: icon,
  categoryId: category == null ? null : uuid(category),
  isArchived: archived,
  createdAt: t0,
  updatedAt: updated ?? t0,
);

EntryRecord entry(
  int n, {
  required int label,
  String kind = 'actual',
  String start = '2026-10-25T06:00:00Z',
  String? end = '2026-10-25T07:00:00Z',
  String? note,
  String source = 'manual',
  int? routine,
  String? occurrence,
  int? plannedEntry,
  int? task,
  int? categoryOverride,
  Instant? updated,
}) => EntryRecord(
  id: uuid(n),
  kind: kind,
  labelId: uuid(label),
  categoryOverrideId: categoryOverride == null ? null : uuid(categoryOverride),
  start: Instant.parse(start),
  end: end == null ? null : Instant.parse(end),
  tzId: 'Asia/Baghdad',
  utcOffsetMin: 180,
  note: note,
  taskId: task == null ? null : uuid(task),
  source: source,
  routineId: routine == null ? null : uuid(routine),
  occurrenceDate: occurrence == null ? null : LocalDate.parse(occurrence),
  plannedEntryId: plannedEntry == null ? null : uuid(plannedEntry),
  createdAt: t0,
  updatedAt: updated ?? t0,
);

/// A routine occurrence (planned, source routine).
EntryRecord occurrence(int n, {required int routine, required String date, int label = 20, Instant? updated}) => entry(
  n,
  label: label,
  kind: 'planned',
  source: 'routine',
  routine: routine,
  occurrence: date,
  start: '${date}T20:00:00Z',
  end: '${LocalDate.parse(date).addDays(1).toIso()}T04:00:00Z',
  updated: updated,
);

RoutineRecord routine(int n, {int label = 20, Instant? updated}) => RoutineRecord(
  id: uuid(n),
  labelId: uuid(label),
  startMinute: 23 * 60,
  endMinute: 7 * 60,
  startsOn: LocalDate(2026, 10, 1),
  reminderOffsetMin: 15,
  createdAt: t0,
  updatedAt: updated ?? t0,
);

TaskSeriesRecord series(int n) => TaskSeriesRecord(
  id: uuid(n),
  freq: 'monthly',
  interval: 1,
  mode: 'schedule',
  anchorDate: LocalDate(2026, 10, 1),
  createdAt: t0,
  updatedAt: t0,
);

TaskRecord task(int n, {int? series, String status = 'not_started', int? category, Instant? updated}) => TaskRecord(
  id: uuid(n),
  seriesId: series == null ? null : uuid(series),
  title: 'Task $n',
  startDate: LocalDate(2026, 10, 1),
  deadlineDate: LocalDate(2026, 10, 31),
  deadlineMinute: 17 * 60,
  status: status,
  categoryId: category == null ? null : uuid(category),
  estimateMin: 120,
  completedAt: status == 'completed' ? t1 : null,
  createdAt: t0,
  updatedAt: updated ?? t0,
);

TaskReminderRecord reminder(int n, {required int task}) => TaskReminderRecord(
  id: uuid(n),
  taskId: uuid(task),
  type: 'before_deadline',
  offsetDays: 2,
  minuteOfDay: 9 * 60,
  createdAt: t0,
  updatedAt: t0,
);

/// One of everything, references all resolving inside the data.
BackupData sampleData() => BackupData(
  categories: [category(1, 'Learning'), category(2, 'Health', color: null)],
  labels: [
    label(10, 'Study', category: 1, icon: 'study'),
    label(11, 'Exercise', category: 2, color: 'green'),
    label(20, 'Sleep', color: 'indigo', icon: 'sleep'),
    label(21, 'Old', archived: true, color: 'gray'),
  ],
  taskSeries: [series(30)],
  tasks: [
    task(31, series: 30),
    task(32, status: 'completed', category: 1),
  ],
  taskReminders: [reminder(33, task: 31)],
  routines: [routine(40)],
  routineExceptions: [
    RoutineExceptionRecord(
      id: uuid(41),
      routineId: uuid(40),
      occurrenceDate: LocalDate(2026, 10, 24),
      type: 'modify',
      startOffsetMin: 23 * 60 + 30,
      endOffsetMin: 31 * 60,
      note: 'Late night',
      createdAt: t0,
      updatedAt: t0,
    ),
  ],
  entries: [
    entry(50, label: 10, note: 'Chapter 3', task: 31),
    entry(51, label: 11, kind: 'planned', start: '2026-10-25T15:00:00Z', end: '2026-10-25T16:00:00Z'),
    occurrence(52, routine: 40, date: '2026-10-25'),
    entry(
      53,
      label: 20,
      source: 'from_plan',
      plannedEntry: 52,
      start: '2026-10-25T20:10:00Z',
      end: '2026-10-26T03:50:00Z',
    ),
    entry(54, label: 10, start: '2026-10-26T10:00:00Z', end: null, categoryOverride: 2),
  ],
  settings: {'themeMode': 'dark', 'firstDayOfWeek': 5},
);

/// `data.json` as plain, mutable JSON (like `jsonDecode` gives).
Map<String, Object?> dataJson(BackupData data) =>
    jsonDecode(jsonEncode(BackupJsonWriter.data(data))) as Map<String, Object?>;

/// The [index]th record of [table] in [json], for mutation.
Map<String, Object?> record(Map<String, Object?> json, String table, [int index = 0]) =>
    (json[table]! as List<Object?>)[index]! as Map<String, Object?>;
