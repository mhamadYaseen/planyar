import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/instant.dart';
import 'entry.dart';

part 'entry_draft.freezed.dart';

/// The user-editable fields of a new entry. The repository adds the ID,
/// time-zone info and timestamps.
@freezed
abstract class EntryDraft with _$EntryDraft {
  const factory EntryDraft({
    required EntryKind kind,
    required String labelId,
    required Instant start,
    Instant? end,
    String? note,
    String? categoryOverrideId,
    String? taskId,
  }) = _EntryDraft;
}
