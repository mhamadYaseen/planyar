import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/undo_snack_bar.dart';
import '../../domain/entities/label.dart';
import '../bloc/label_editor_bloc.dart';
import '../widgets/label_pickers.dart';

/// Label editor (S6): name, color, icon, category, live preview, archive,
/// delete (only when unused — J20).
class LabelEditorPage extends StatelessWidget {
  const LabelEditorPage({this.labelId, super.key});

  final String? labelId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<LabelEditorBloc>()..add(LabelEditorEvent.started(labelId: labelId)),
    child: const _LabelEditorView(),
  );
}

class _LabelEditorView extends StatelessWidget {
  const _LabelEditorView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<LabelEditorBloc>();
    return BlocConsumer<LabelEditorBloc, LabelEditorState>(
      listenWhen: (a, b) => a.status != b.status || (b.failure != null && a.failure != b.failure),
      listener: (context, state) {
        if (state.status == EditorStatus.saved || state.status == EditorStatus.deleted) {
          Navigator.of(context).pop();
        } else if (state.failure != null) {
          showErrorSnackBar(context);
        }
      },
      builder: (context, state) {
        final original = state.original;
        return Scaffold(
          appBar: AppBar(
            title: Text(state.isNew ? l10n.newLabel : l10n.editLabel),
            actions: [
              TextButton(
                onPressed: state.status == EditorStatus.ready
                    ? () => bloc.add(const LabelEditorEvent.savePressed())
                    : null,
                child: Text(l10n.save),
              ),
            ],
          ),
          body: switch (state.status) {
            EditorStatus.loading => const Center(child: CircularProgressIndicator()),
            EditorStatus.failed => Center(child: Text(l10n.errorGeneric)),
            _ => ListView(
              padding: const EdgeInsetsDirectional.all(16),
              children: [
                TextFormField(
                  initialValue: state.name,
                  autofocus: state.isNew,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    labelText: l10n.nameLabel,
                    errorText: nameProblemText(l10n, state.nameProblem),
                  ),
                  onChanged: (v) => bloc.add(LabelEditorEvent.nameChanged(v)),
                ),
                const SizedBox(height: 16),
                Text(l10n.previewLabel, style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                LabelPreview(
                  name: state.name.trim().isEmpty ? l10n.nameLabel : state.name.trim(),
                  colorKey: state.colorKey ?? original?.colorKey,
                  iconKey: state.iconKey,
                ),
                const SizedBox(height: 16),
                Text(l10n.colorLabel, style: Theme.of(context).textTheme.labelLarge),
                ColorKeyPicker(
                  selected: state.colorKey ?? original?.colorKey,
                  onPicked: (key) {
                    if (key != null) bloc.add(LabelEditorEvent.colorPicked(key));
                  },
                ),
                const SizedBox(height: 16),
                Text(l10n.iconLabel, style: Theme.of(context).textTheme.labelLarge),
                LabelIconPicker(selected: state.iconKey, onPicked: (key) => bloc.add(LabelEditorEvent.iconPicked(key))),
                const SizedBox(height: 16),
                DropdownButtonFormField<String?>(
                  initialValue: state.categories.any((c) => c.id == state.categoryId) ? state.categoryId : null,
                  decoration: InputDecoration(labelText: l10n.categoryLabel),
                  items: [
                    DropdownMenuItem(value: null, child: Text(l10n.uncategorized)),
                    for (final c in state.categories) DropdownMenuItem(value: c.id, child: Text(c.name)),
                  ],
                  onChanged: (id) => bloc.add(LabelEditorEvent.categoryPicked(id)),
                ),
                if (original != null) ...[
                  const SizedBox(height: 24),
                  if (original.isArchived) Text(l10n.labelArchivedNote),
                  Wrap(
                    spacing: 8,
                    children: [
                      OutlinedButton.icon(
                        icon: Icon(original.isArchived ? Icons.unarchive_outlined : Icons.archive_outlined),
                        label: Text(original.isArchived ? l10n.restore : l10n.archive),
                        onPressed: () => bloc.add(const LabelEditorEvent.archiveToggled()),
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.delete_outline),
                        label: Text(l10n.delete),
                        style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
                        onPressed: state.canDelete ? () => _confirmDelete(context, original) : null,
                      ),
                    ],
                  ),
                  if (state.usage case final usage? when usage.isInUse)
                    Text(
                      l10n.labelInUse(
                        usage.routines + usage.routineExceptions == 0
                            ? l10n.usageEntries(usage.entries)
                            : l10n.andJoin(
                                l10n.usageEntries(usage.entries),
                                l10n.usageRoutines(usage.routines + usage.routineExceptions),
                              ),
                      ),
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                ],
              ],
            ),
          },
        );
      },
    );
  }

  Future<void> _confirmDelete(BuildContext context, Label label) async {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<LabelEditorBloc>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(l10n.deleteLabelConfirm(label.name)),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.delete)),
        ],
      ),
    );
    if (ok ?? false) bloc.add(const LabelEditorEvent.deletePressed());
  }
}
