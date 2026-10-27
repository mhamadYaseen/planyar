import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';

/// Builds an [Entry] for tests. Times are ISO strings with a zone.
Entry makeEntry(
  String id, {
  EntryKind kind = EntryKind.actual,
  String labelId = 'lbl-work',
  required String start,
  String? end,
  String? note,
}) {
  final created = Instant.parse('2026-10-01T00:00:00Z');
  return Entry(
    id: id,
    kind: kind,
    labelId: labelId,
    start: Instant.parse(start),
    end: end == null ? null : Instant.parse(end),
    note: note,
    tzId: 'Asia/Baghdad',
    utcOffsetMin: 180,
    createdAt: created,
    updatedAt: created,
  );
}
