import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/files/safety_backup.dart';
import '../../../../core/utils/data_state.dart';
import '../bloc/backup_bloc.dart';
import 'backup_note.dart';
import 'backup_texts.dart';

/// The last five safety backups, each restorable or shareable (BAK-04).
class SafetyBackupsSection extends StatelessWidget {
  const SafetyBackupsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final backups = context.select((BackupBloc b) => b.state.safetyBackups);
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(child: BackupSectionTitle(l10n.backupSafetySection)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
            child: Text(
              l10n.backupSafetyIntro,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
        ),
        switch (backups) {
          DataSuccess(:final data) when data.isEmpty => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
              child: Text(l10n.backupSafetyNone, style: theme.textTheme.bodyMedium),
            ),
          ),
          DataSuccess(:final data) => SliverList.list(children: [for (final b in data) _SafetyTile(backup: b)]),
          DataError() => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              child: BackupNote(text: l10n.errorGeneric, tone: BackupNoteTone.error),
            ),
          ),
          _ => const SliverToBoxAdapter(child: LinearProgressIndicator()),
        },
      ],
    );
  }
}

enum _SafetyAction { restore, share }

class _SafetyTile extends StatelessWidget {
  const _SafetyTile({required this.backup});

  final SafetyBackup backup;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<BackupBloc>();
    return ListTile(
      leading: Icon(switch (backup.reason) {
        SafetyReason.import => Icons.restore_page_outlined,
        SafetyReason.erase => Icons.delete_sweep_outlined,
        SafetyReason.migration => Icons.storage_outlined,
      }),
      title: Text(l10n.safetyReason(backup.reason)),
      subtitle: Text(dayAndTimeOf(context, backup.createdAt)),
      trailing: Builder(
        builder: (anchor) => PopupMenuButton<_SafetyAction>(
          tooltip: l10n.safetyActions,
          onSelected: (action) => switch (action) {
            _SafetyAction.restore => bloc.add(BackupEvent.restorePressed(backup)),
            _SafetyAction.share => bloc.add(BackupEvent.safetySharePressed(backup, anchor: shareAnchorOf(anchor))),
          },
          itemBuilder: (_) => [
            // A raw database copy can be shared but not imported.
            if (!backup.isRawDatabase)
              PopupMenuItem(
                value: _SafetyAction.restore,
                child: ListTile(leading: const Icon(Icons.restore), title: Text(l10n.safetyRestore)),
              ),
            PopupMenuItem(
              value: _SafetyAction.share,
              child: ListTile(leading: const Icon(Icons.ios_share), title: Text(l10n.safetyShare)),
            ),
          ],
        ),
      ),
    );
  }
}
