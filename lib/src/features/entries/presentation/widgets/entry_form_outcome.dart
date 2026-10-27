import '../../../../core/time/local_date.dart';
import '../bloc/entry_actions_bloc.dart';
import '../bloc/entry_form_bloc.dart';

/// What a closed quick add / editor reports back to the page.
sealed class EntryFormOutcome {
  const EntryFormOutcome();

  /// Saved or deleted → an undoable action for the snackbar.
  static EntryFormOutcome? fromState(EntryFormState state) {
    final result = state.result;
    if (result == null) return null;
    final original = state.original;
    return switch (state.status) {
      EntryFormStatus.saved when original == null => EntryFormDone(UndoableAction.created(result)),
      EntryFormStatus.saved => EntryFormDone(UndoableAction.edited(before: original!, after: result)),
      EntryFormStatus.deleted => EntryFormDone(UndoableAction.deleted(result)),
      _ => null,
    };
  }
}

final class EntryFormDone extends EntryFormOutcome {
  const EntryFormDone(this.action);

  final UndoableAction action;
}

/// "Note, category" in quick add: continue in the full editor.
final class ExpandToEditor extends EntryFormOutcome {
  const ExpandToEditor();
}

/// "Duplicate" in the editor (ENT-12).
final class DuplicateRequested extends EntryFormOutcome {
  const DuplicateRequested(this.entryId, this.onDate);

  final String entryId;
  final LocalDate onDate;
}
