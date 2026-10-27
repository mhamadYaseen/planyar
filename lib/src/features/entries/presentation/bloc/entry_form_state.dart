part of 'entry_form_bloc.dart';

enum EntryFormStatus { loading, ready, saving, saved, deleted, failed }

@freezed
abstract class EntryFormState with _$EntryFormState {
  const factory EntryFormState({
    @Default(EntryFormStatus.loading) EntryFormStatus status,

    /// The entry being edited; null when creating.
    Entry? original,
    @Default(EntryKind.actual) EntryKind kind,

    /// True once the user picked a kind; stops the automatic switch.
    @Default(false) bool kindTouched,
    String? labelId,
    Instant? start,

    /// Null = "No end yet".
    Instant? end,

    /// True once the user set the end; stops planned-duration defaults.
    @Default(false) bool endTouched,

    /// The end before "No end yet" was chosen, to bring it back.
    Instant? endBeforeOpen,
    @Default('') String note,
    String? categoryOverrideId,

    /// Every label (archived too, for names) and the quick-chip order.
    @Default(<String, Label>{}) Map<String, Label> labels,
    @Default(<Label>[]) List<Label> quickLabels,

    /// For the per-entry category override (CAT-02, under "More").
    @Default(<Category>[]) List<Category> categories,

    /// Same-kind entries this one would overlap — a warning, never a block.
    @Default(<Entry>[]) List<Entry> overlaps,
    @Default(EntryCheck()) EntryCheck check,

    /// The saved or deleted entry, for the caller's Undo snackbar.
    Entry? result,
    Failure? failure,
  }) = _EntryFormState;

  const EntryFormState._();

  bool get isEditing => original != null;

  bool get isOpenEnded => end == null;

  bool get canSave => status == EntryFormStatus.ready && labelId != null && start != null && check.canSave;
}
