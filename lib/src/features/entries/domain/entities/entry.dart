import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';

part 'entry.freezed.dart';

/// Planned or actual (glossary).
enum EntryKind {
  planned('planned'),
  actual('actual');

  const EntryKind(this.wire);

  /// The value stored in the database and backups.
  final String wire;

  static EntryKind fromWire(String value) =>
      values.firstWhere((k) => k.wire == value, orElse: () => throw ArgumentError.value(value, 'kind'));
}

/// Where an entry came from (plan §7.3).
enum EntrySource {
  manual('manual'),

  /// A routine occurrence (Phase 3).
  routine('routine'),

  /// An actual entry created with "Log as actual" (Phase 3).
  fromPlan('from_plan');

  const EntrySource(this.wire);

  final String wire;

  static EntrySource fromWire(String value) =>
      values.firstWhere((s) => s.wire == value, orElse: () => throw ArgumentError.value(value, 'source'));
}

/// One block of time with a label (plan §3.1, §7.3).
@freezed
abstract class Entry with _$Entry {
  const factory Entry({
    required String id,
    required EntryKind kind,
    required String labelId,
    required Instant start,

    /// Null = open entry (§6.9).
    Instant? end,
    String? categoryOverrideId,
    String? note,
    String? taskId,

    /// IANA zone and offset at save time — informational (§6.1).
    required String tzId,
    required int utcOffsetMin,
    @Default(EntrySource.manual) EntrySource source,
    String? routineId,
    LocalDate? occurrenceDate,
    String? plannedEntryId,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _Entry;

  const Entry._();

  bool get isOpen => end == null;

  /// The closed interval, or null for an open entry.
  InstantRange? get range => end == null ? null : InstantRange(start, end!);

  Duration? get duration => end?.difference(start);
}
