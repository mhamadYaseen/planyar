import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../domain/entities/backup_actions.dart';
import '../bloc/backup_bloc.dart';
import 'backup_note.dart';
import 'backup_texts.dart';

/// Days after which "last export" turns into a warning (NTF-05 uses 30).
const _staleAfterDays = 30;

/// "Last full export", Export all data, Save to device (BAK-01, BAK-05).
class ExportSection extends StatelessWidget {
  const ExportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final state = context.watch<BackupBloc>().state;
    final math = TimeScope.of(context).math;
    final last = state.status.lastExportAt;
    final days = last == null ? null : math.dateOf(Instant.now()).epochDay - math.dateOf(last).epochDay;
    final exporting = state.busy == BackupTask.exporting;
    final busy = state.busy != null;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BackupNote(
            text: days == null
                ? l10n.backupNeverExported
                : l10n.backupLastExport(l10n.backupDaysAgo(days < 0 ? 0 : days)),
            tone: days == null || days > _staleAfterDays ? BackupNoteTone.warning : BackupNoteTone.success,
            icon: days == null || days > _staleAfterDays ? Icons.history : Icons.cloud_done_outlined,
          ),
          const SizedBox(height: 16),
          Text(l10n.backupExportIntro, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Builder(
            builder: (button) => FilledButton.icon(
              onPressed: busy
                  ? null
                  : () => context.read<BackupBloc>().add(
                      BackupEvent.exportPressed(ExportDestination.share, anchor: shareAnchorOf(button)),
                    ),
              icon: exporting
                  ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.ios_share),
              label: Text(exporting ? l10n.backupExporting : l10n.backupExportButton),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: busy
                ? null
                : () => context.read<BackupBloc>().add(const BackupEvent.exportPressed(ExportDestination.device)),
            icon: const Icon(Icons.save_alt),
            label: Text(l10n.backupSaveButton),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.backupPlainNote,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

/// Import a backup… (BAK-03).
class ImportSection extends StatelessWidget {
  const ImportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final busy = context.select((BackupBloc b) => b.state.busy != null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BackupSectionTitle(l10n.backupRestoreSection),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton.icon(
                onPressed: busy ? null : () => context.read<BackupBloc>().add(const BackupEvent.importPressed()),
                icon: const Icon(Icons.file_open_outlined),
                label: Text(l10n.backupImportButton),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.backupImportHint,
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
