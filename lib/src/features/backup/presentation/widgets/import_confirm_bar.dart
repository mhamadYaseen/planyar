import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../domain/entities/import_plan.dart';
import '../bloc/import_bloc.dart';

/// The pinned Merge / Replace button. Replace asks once more (§10.6 stage
/// 7); with invalid records it stays off until "Import without them" is
/// ticked (J17 AC2).
class ImportConfirmBar extends StatelessWidget {
  const ImportConfirmBar({super.key});

  Future<void> _confirm(BuildContext context, ImportState state) async {
    final bloc = context.read<ImportBloc>();
    if (state.mode == ImportMode.replace) {
      final removed = state.summary?.removedCount ?? 0;
      final l10n = AppLocalizations.of(context);
      final scheme = Theme.of(context).colorScheme;
      final sure = await showDialog<bool>(
        context: context,
        builder: (dialog) => AlertDialog(
          title: Text(l10n.importReplaceConfirmTitle),
          content: Text(l10n.importReplaceConfirmBody(removed)),
          actions: [
            TextButton(onPressed: () => Navigator.of(dialog).pop(false), child: Text(l10n.cancel)),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: scheme.error, foregroundColor: scheme.onError),
              onPressed: () => Navigator.of(dialog).pop(true),
              child: Text(l10n.importReplaceButton),
            ),
          ],
        ),
      );
      if (sure != true) return;
    }
    bloc.add(const ImportEvent.confirmed());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = context.watch<ImportBloc>().state;
    final summary = state.summary;
    final merge = state.mode == ImportMode.merge;
    // Merging a file that's already here changes nothing; don't pretend.
    final nothingToDo = merge && summary != null && summary.writtenCount == 0 && !state.importSettings;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
        child: FilledButton.icon(
          onPressed: state.canImport && !nothingToDo ? () => _confirm(context, state) : null,
          icon: Icon(merge ? Icons.merge_type : Icons.swap_horiz),
          label: Text(merge ? l10n.importMergeButton : l10n.importReplaceButton),
        ),
      ),
    );
  }
}
