import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/di/injection.dart';
import 'bloc/entry_actions_bloc.dart';
import 'bloc/entry_form_bloc.dart';
import 'pages/entry_editor_page.dart';
import 'widgets/entry_form_outcome.dart';
import 'widgets/quick_add_sheet.dart';

/// Opens quick add (new entries) or the full editor (existing ones) and
/// returns what happened, for the caller's Undo snackbar. Quick add and the
/// editor share one Bloc, so "Note, category" keeps the draft.
Future<UndoableAction?> openEntryForm(BuildContext context, EntryFormRequest request) async {
  var current = request;
  while (true) {
    if (!context.mounted) return null;
    final bloc = sl<EntryFormBloc>()..add(EntryFormEvent.started(current));
    try {
      EntryFormOutcome? outcome;
      if (!context.mounted) return null;
      if (current is EditEntry) {
        outcome = await _pushEditor(context, bloc);
      } else {
        outcome = await showModalBottomSheet<EntryFormOutcome>(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (_) => BlocProvider.value(value: bloc, child: const QuickAddSheet()),
        );
        if (outcome is ExpandToEditor && context.mounted) outcome = await _pushEditor(context, bloc);
      }
      switch (outcome) {
        case EntryFormDone(:final action):
          return action;
        case DuplicateRequested(:final entryId, :final onDate):
          current = DuplicateEntry(entryId, onDate: onDate);
        default:
          return null;
      }
    } finally {
      await bloc.close();
    }
  }
}

Future<EntryFormOutcome?> _pushEditor(BuildContext context, EntryFormBloc bloc) => Navigator.of(context).push(
  MaterialPageRoute<EntryFormOutcome>(
    builder: (_) => BlocProvider.value(value: bloc, child: const EntryEditorPage()),
  ),
);
