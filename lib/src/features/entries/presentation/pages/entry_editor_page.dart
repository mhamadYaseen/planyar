import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/time_scope.dart';
import '../bloc/entry_form_bloc.dart';
import '../widgets/entry_form_fields.dart';
import '../widgets/entry_form_outcome.dart';
import '../widgets/entry_note_field.dart';

/// The full entry editor (S3): everything in quick add plus note, category
/// override, duplicate and delete.
class EntryEditorPage extends StatelessWidget {
  const EntryEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<EntryFormBloc>();
    return BlocListener<EntryFormBloc, EntryFormState>(
      listenWhen: (a, b) => a.status != b.status,
      listener: (context, state) {
        final outcome = EntryFormOutcome.fromState(state);
        if (outcome != null) Navigator.of(context).pop(outcome);
      },
      child: BlocBuilder<EntryFormBloc, EntryFormState>(
        buildWhen: (a, b) => a.status != b.status || a.isEditing != b.isEditing,
        builder: (context, state) {
          final editing = state.original;
          return Scaffold(
            appBar: AppBar(
              title: Text(state.isEditing ? l10n.editEntryTitle : l10n.newEntryTitle),
              actions: [
                if (editing != null) ...[
                  IconButton(
                    tooltip: l10n.duplicate,
                    icon: const Icon(Icons.content_copy_outlined),
                    onPressed: () =>
                        Navigator.of(context)
                            .pop(DuplicateRequested(editing.id, TimeScope.of(context).dateOf(editing.start))),
                  ),
                  IconButton(
                    tooltip: l10n.delete,
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => bloc.add(const EntryFormEvent.deletePressed()),
                  ),
                ],
              ],
            ),
            body: switch (state.status) {
              EntryFormStatus.loading => const Center(child: CircularProgressIndicator()),
              EntryFormStatus.failed => Center(child: Text(l10n.entryNotFound)),
              _ => SafeArea(
                child: ListView(
                  padding: const EdgeInsetsDirectional.all(16),
                  children: const [
                    KindToggle(),
                    SizedBox(height: 16),
                    LabelSection(),
                    SizedBox(height: 16),
                    StartRow(),
                    EndSection(),
                    SizedBox(height: 16),
                    FormMessages(),
                    SizedBox(height: 16),
                    EntryNoteField(),
                    SizedBox(height: 16),
                    CategoryOverrideField(),
                  ],
                ),
              ),
            },
            // Always reachable, however long the form gets.
            bottomNavigationBar: state.status == EntryFormStatus.ready || state.status == EntryFormStatus.saving
                ? const SafeArea(
                    child: Padding(padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8), child: SaveButton()),
                  )
                : null,
          );
        },
      ),
    );
  }
}
