part of 'entry_form_bloc.dart';

/// How the form was opened.
sealed class EntryFormRequest {
  const EntryFormRequest();
}

/// FAB on a date, or "Log time" with a label preselected.
final class NewEntryOnDate extends EntryFormRequest {
  const NewEntryOnDate(this.date, {this.labelId});

  final LocalDate date;
  final String? labelId;
}

/// Tap on an empty timeline gap (ENT-11).
final class NewEntryInGap extends EntryFormRequest {
  const NewEntryInGap(this.gap);

  final InstantRange gap;
}

final class EditEntry extends EntryFormRequest {
  const EditEntry(this.entryId);

  final String entryId;
}

/// "Duplicate" (ENT-12): same label, kind rule, wall times and duration on
/// [onDate].
final class DuplicateEntry extends EntryFormRequest {
  const DuplicateEntry(this.entryId, {required this.onDate});

  final String entryId;
  final LocalDate onDate;
}

@freezed
sealed class EntryFormEvent with _$EntryFormEvent {
  const factory EntryFormEvent.started(EntryFormRequest request) = _Started;
  const factory EntryFormEvent.kindChanged(EntryKind kind) = _KindChanged;
  const factory EntryFormEvent.labelSelected(String labelId) = _LabelSelected;
  const factory EntryFormEvent.startDateSet(LocalDate date) = _StartDateSet;
  const factory EntryFormEvent.startTimeSet(WallTime time) = _StartTimeSet;

  /// The −15 / +15 chips.
  const factory EntryFormEvent.startNudged(int minutes) = _StartNudged;
  const factory EntryFormEvent.endDateSet(LocalDate date) = _EndDateSet;
  const factory EntryFormEvent.endTimeSet(WallTime time) = _EndTimeSet;
  const factory EntryFormEvent.endNudged(int minutes) = _EndNudged;

  /// The 30m / 1h / 2h chips: end = start + duration.
  const factory EntryFormEvent.durationPicked(Duration duration) = _DurationPicked;
  const factory EntryFormEvent.endNowPressed() = _EndNowPressed;

  /// "No end yet" (ENT-05).
  const factory EntryFormEvent.openEndToggled({required bool open}) = _OpenEndToggled;
  const factory EntryFormEvent.noteChanged(String note) = _NoteChanged;
  const factory EntryFormEvent.categoryOverrideChanged(String? categoryId) = _CategoryOverrideChanged;
  const factory EntryFormEvent.savePressed() = _SavePressed;
  const factory EntryFormEvent.deletePressed() = _DeletePressed;

  /// Internal: debounced re-check after a time or kind change.
  const factory EntryFormEvent.overlapCheckRequested() = _OverlapCheckRequested;
}
