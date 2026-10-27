import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/undo_snack_bar.dart';
import '../bloc/category_editor_bloc.dart';
import '../bloc/label_editor_bloc.dart' show EditorStatus;
import '../widgets/label_pickers.dart';

/// Category editor (S7): name, optional color, delete with a destination
/// for its labels, tasks and entry overrides (CAT-04).
class CategoryEditorPage extends StatelessWidget {
  const CategoryEditorPage({this.categoryId, super.key});

  final String? categoryId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<CategoryEditorBloc>()..add(CategoryEditorEvent.started(categoryId: categoryId)),
    child: const _CategoryEditorView(),
  );
}

class _CategoryEditorView extends StatelessWidget {
  const _CategoryEditorView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<CategoryEditorBloc>();
    return BlocConsumer<CategoryEditorBloc, CategoryEditorState>(
      listenWhen: (a, b) => a.status != b.status || (b.failure != null && a.failure != b.failure),
      listener: (context, state) {
        if (state.status == EditorStatus.saved || state.status == EditorStatus.deleted) {
          Navigator.of(context).pop();
        } else if (state.failure != null) {
          showErrorSnackBar(context);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(state.isNew ? l10n.newCategory : l10n.editCategory),
          actions: [
            TextButton(
              onPressed: state.status == EditorStatus.ready
                  ? () => bloc.add(const CategoryEditorEvent.savePressed())
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
                onChanged: (v) => bloc.add(CategoryEditorEvent.nameChanged(v)),
              ),
              const SizedBox(height: 16),
              Text(l10n.colorLabel, style: Theme.of(context).textTheme.labelLarge),
              ColorKeyPicker(
                selected: state.colorKey,
                allowNone: true,
                onPicked: (key) => bloc.add(CategoryEditorEvent.colorPicked(key)),
              ),
              if (state.usage case final usage?) ...[
                const SizedBox(height: 16),
                Text('${l10n.labelsInCategory}: ${usage.labels}'),
              ],
              if (!state.isNew) ...[
                const SizedBox(height: 24),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton.icon(
                    icon: const Icon(Icons.delete_outline),
                    label: Text(l10n.delete),
                    style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
                    onPressed: () => _confirmDelete(context, state),
                  ),
                ),
              ],
            ],
          ),
        },
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, CategoryEditorState state) async {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<CategoryEditorBloc>();
    String? moveTo;
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteCategoryTitle(state.original!.name)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.moveCategoryItemsTo),
            DropdownButtonFormField<String?>(
              initialValue: null,
              items: [
                DropdownMenuItem(value: null, child: Text(l10n.uncategorized)),
                for (final c in state.others) DropdownMenuItem(value: c.id, child: Text(c.name)),
              ],
              onChanged: (id) => moveTo = id,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.delete)),
        ],
      ),
    );
    if (ok ?? false) bloc.add(CategoryEditorEvent.deleteConfirmed(moveTo: moveTo));
  }
}
