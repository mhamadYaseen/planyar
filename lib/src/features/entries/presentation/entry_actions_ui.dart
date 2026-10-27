import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../core/widgets/undo_snack_bar.dart';
import '../domain/entities/entry.dart';
import 'bloc/entry_actions_bloc.dart';
import 'bloc/entry_form_bloc.dart';
import 'entry_form_launcher.dart';
import 'widgets/end_entry_sheet.dart';

/// Shared page-level entry actions. Pages using these provide an
/// [EntryActionsBloc] above them.

/// Opens quick add / the editor and shows "Saved" / "Deleted" with Undo.
Future<void> openEntryFormWithUndo(BuildContext context, EntryFormRequest request) async {
  final action = await openEntryForm(context, request);
  if (action != null && context.mounted) showEntryActionSnackBar(context, action);
}

/// End options for an open entry (J2 AC3).
Future<void> chooseEntryEnd(BuildContext context, Entry entry) async {
  final end = await showEndEntrySheet(context, entry);
  if (end != null && context.mounted) context.read<EntryActionsBloc>().add(EntryActionsEvent.endSet(entry, end));
}

void showEntryActionSnackBar(BuildContext context, UndoableAction action) {
  final l10n = AppLocalizations.of(context);
  final actions = context.read<EntryActionsBloc>();
  final message = switch (action) {
    EntryCreated() => l10n.saved,
    EntryEdited(:final before, :final after) when before.isOpen && !after.isOpen => l10n.entryEnded,
    EntryEdited() => l10n.saved,
    EntryDeletedAction() => l10n.entryDeleted,
  };
  showUndoSnackBar(context, message: message, onUndo: () => actions.add(EntryActionsEvent.undoRequested(action)));
}

/// Snackbars for actions the Bloc ran itself (end, delete) and failures.
class EntryActionsListener extends StatelessWidget {
  const EntryActionsListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => BlocListener<EntryActionsBloc, EntryActionsState>(
    listenWhen: (a, b) => a.sequence != b.sequence || (b.failure != null && a.failure != b.failure),
    listener: (context, state) {
      if (state.failure != null) {
        showErrorSnackBar(context);
      } else if (state.lastAction case final action?) {
        showEntryActionSnackBar(context, action);
      }
    },
    child: child,
  );
}
