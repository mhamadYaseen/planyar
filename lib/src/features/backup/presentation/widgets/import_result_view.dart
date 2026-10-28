import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../domain/entities/backup_files.dart';
import 'backup_note.dart';
import 'backup_texts.dart';
import 'import_counts_view.dart';
import 'import_issue_list.dart';

/// S24: what was imported, what was left out and why, and the safety backup.
class ImportResultView extends StatelessWidget {
  const ImportResultView({required this.result, super.key});

  final ImportResult result;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final summary = result.summary;
    final skipped = summary.tables.values.fold(0, (sum, t) => sum + t.unchanged + t.duplicates);
    return ListView(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
      children: [
        Icon(Icons.check_circle_outline, size: 56, color: theme.colorScheme.primary),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Text(
            l10n.importDoneSummary(summary.writtenCount, skipped, summary.invalidCount),
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 8),
        ImportCountsView(summary: summary),
        if (!result.integrityOk)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: BackupNote(text: l10n.importIntegrityWarning, tone: BackupNoteTone.warning),
          ),
        if (result.safetyBackup case final safety?)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: BackupNote(
              text: l10n.importDoneSafety(
                '${l10n.safetyReason(safety.reason)}, ${dayAndTimeOf(context, safety.createdAt)}',
              ),
              icon: Icons.shield_outlined,
            ),
          ),
        if (summary.issues.isNotEmpty)
          ExpansionTile(
            title: Text(l10n.importInvalidTitle(summary.invalidCount)),
            children: [
              ImportIssueList(lines: [for (final i in summary.issues) l10n.issue(i)]),
            ],
          ),
        const SizedBox(height: 16),
        Center(
          child: FilledButton(onPressed: () => context.pop(true), child: Text(l10n.done)),
        ),
      ],
    );
  }
}
