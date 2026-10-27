import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/entry.dart';

/// Row ⇄ entity (plan §7.5).
extension EntryRowMapper on EntryRow {
  Entry toEntity() => Entry(
    id: id,
    kind: EntryKind.fromWire(kind),
    labelId: labelId,
    start: startUtc,
    end: endUtc,
    categoryOverrideId: categoryOverrideId,
    note: note,
    taskId: taskId,
    tzId: tzId,
    utcOffsetMin: utcOffsetMin,
    source: EntrySource.fromWire(source),
    routineId: routineId,
    occurrenceDate: occurrenceDate,
    plannedEntryId: plannedEntryId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension EntryEntityMapper on Entry {
  EntriesCompanion toCompanion() => EntriesCompanion(
    id: Value(id),
    kind: Value(kind.wire),
    labelId: Value(labelId),
    categoryOverrideId: Value(categoryOverrideId),
    startUtc: Value(start),
    endUtc: Value(end),
    tzId: Value(tzId),
    utcOffsetMin: Value(utcOffsetMin),
    note: Value(note),
    taskId: Value(taskId),
    source: Value(source.wire),
    routineId: Value(routineId),
    occurrenceDate: Value(occurrenceDate),
    plannedEntryId: Value(plannedEntryId),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
  );
}
