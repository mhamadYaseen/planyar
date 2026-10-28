import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../domain/entities/import_plan.dart';
import '../bloc/backup_bloc.dart';
import 'backup_note.dart';
import 'backup_texts.dart';

/// The last five imports (plan §10.6 stage 11). Hidden until there is one.
class ImportHistorySection extends StatelessWidget {
  const ImportHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final log = context.select((BackupBloc b) => b.state.status.importLog);
    if (log.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(child: BackupSectionTitle(l10n.backupHistorySection)),
        SliverList.list(
          children: [
            for (final entry in log)
              ListTile(
                leading: Icon(entry.mode == ImportMode.merge ? Icons.merge_type : Icons.swap_horiz),
                title: Text(
                  entry.mode == ImportMode.merge
                      ? l10n.importLogMerged(entry.fileName)
                      : l10n.importLogReplaced(entry.fileName),
                ),
                subtitle: Text(
                  l10n.importLogCounts(dayAndTimeOf(context, entry.at), entry.written, entry.skipped, entry.invalid),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
