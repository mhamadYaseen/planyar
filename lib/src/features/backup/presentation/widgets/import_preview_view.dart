import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../domain/entities/backup_files.dart';
import '../../domain/entities/import_plan.dart';
import '../bloc/import_bloc.dart';
import 'backup_note.dart';
import 'backup_texts.dart';
import 'import_counts_view.dart';
import 'import_issue_list.dart';

/// S23: the file, Replace or Merge, what each will do, and the records that
/// can't be imported (plan §10.6 stages 6–7).
class ImportPreviewView extends StatelessWidget {
  const ImportPreviewView({required this.preview, super.key});

  final ImportPreview preview;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = context.watch<ImportBloc>().state;
    final bloc = context.read<ImportBloc>();
    final summary = state.summary!;
    final merge = state.mode == ImportMode.merge;
    final hasSettings = preview.backup.parsed.data.settings.isNotEmpty;
    final notes = <BackupNote>[
      if (!merge && summary.removedCount > 0)
        BackupNote(text: l10n.importReplaceRemoves(summary.removedCount), tone: BackupNoteTone.warning),
      if (summary.localNewer > 0)
        BackupNote(text: l10n.importLocalNewer(summary.localNewer), tone: BackupNoteTone.warning),
      if (merge && summary.matchedByNameCount > 0)
        BackupNote(text: l10n.importMatchedByName(summary.matchedByNameCount)),
      if (merge && summary.duplicateCount > 0) BackupNote(text: l10n.importDuplicates(summary.duplicateCount)),
      if (merge && summary.writtenCount == 0) BackupNote(text: l10n.importNothingNew),
    ];
    return ListView(
      padding: const EdgeInsetsDirectional.only(bottom: 24),
      children: [
        _FileCard(backup: preview.backup),
        BackupSectionTitle(l10n.importModeTitle),
        if (state.replaceOnly)
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: BackupNote(text: l10n.importRestoreHint),
          )
        else
          RadioGroup<ImportMode>(
            groupValue: state.mode,
            onChanged: (mode) {
              if (mode != null) bloc.add(ImportEvent.modeChanged(mode));
            },
            child: Column(
              children: [
                RadioListTile<ImportMode>(
                  value: ImportMode.merge,
                  title: Text(l10n.importModeMerge),
                  subtitle: Text(l10n.importModeMergeHint),
                ),
                RadioListTile<ImportMode>(
                  value: ImportMode.replace,
                  title: Text(l10n.importModeReplace),
                  subtitle: Text(l10n.importModeReplaceHint),
                ),
              ],
            ),
          ),
        BackupSectionTitle(l10n.importWhatHappens),
        ImportCountsView(summary: summary),
        for (final note in notes) Padding(padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0), child: note),
        if (hasSettings && merge)
          CheckboxListTile(
            value: state.importSettings,
            onChanged: (value) => bloc.add(ImportEvent.importSettingsChanged(value ?? false)),
            title: Text(l10n.importAlsoSettings),
            subtitle: Text(l10n.importAlsoSettingsHint),
          )
        else if (hasSettings)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: BackupNote(text: l10n.importReplaceSettings, icon: Icons.tune),
          ),
        if (summary.issues.isNotEmpty) ...[
          const SizedBox(height: 8),
          ExpansionTile(
            leading: Icon(Icons.block, color: Theme.of(context).colorScheme.error),
            title: Text(l10n.importInvalidTitle(summary.invalidCount)),
            children: [
              ImportIssueList(lines: [for (final i in summary.issues) l10n.issue(i)]),
            ],
          ),
          CheckboxListTile(
            value: state.skipInvalid,
            onChanged: (value) => bloc.add(ImportEvent.skipInvalidChanged(value ?? false)),
            title: Text(l10n.importSkipInvalid),
          ),
        ],
        if (summary.repairs.isNotEmpty)
          ExpansionTile(
            leading: const Icon(Icons.build_outlined),
            title: Text(l10n.importRepairsTitle(summary.repairs.length)),
            children: [
              ImportIssueList(lines: [for (final r in summary.repairs) l10n.repair(r)]),
            ],
          ),
        if (preview.localRecordCount > 0)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: BackupNote(text: l10n.importSafetyNote, icon: Icons.shield_outlined),
          ),
      ],
    );
  }
}

class _FileCard extends StatelessWidget {
  const _FileCard({required this.backup});

  final ReadBackup backup;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final manifest = backup.manifest;
    final records = backup.parsed.data.counts.values.fold(0, (sum, n) => sum + n) + backup.parsed.issues.length;
    final created = manifest.createdAt;
    final secondary = theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant);
    return Card(
      margin: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExcludeSemantics(child: Icon(Icons.inventory_2_outlined)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(backup.fileName, style: theme.textTheme.titleMedium),
                  if (created != null) Text(l10n.importFileCreated(dayAndTimeOf(context, created)), style: secondary),
                  Text(
                    l10n.importFileOrigin(
                      l10n.platformName(manifest.platform),
                      manifest.appVersion.isEmpty ? '?' : manifest.appVersion,
                      manifest.deviceTimeZone.isEmpty ? '?' : manifest.deviceTimeZone,
                    ),
                    style: secondary,
                  ),
                  Text(l10n.importFileSize(fileSizeText(backup.sizeBytes), records), style: secondary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
