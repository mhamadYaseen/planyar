import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../bloc/recovery_bloc.dart';
import '../widgets/backup_texts.dart';

/// Recovery screen (S28): shown instead of the app when the database can't
/// be opened, migrated or fails its integrity check. Nothing is ever deleted
/// here (plan §10.8).
class RecoveryPage extends StatelessWidget {
  const RecoveryPage({required this.details, required this.onRetry, super.key});

  /// The error, for "Technical details".
  final String details;

  /// Starts the app again (also after a successful restore).
  final VoidCallback onRetry;

  Future<void> _confirm(BuildContext context, RecoveryState state) async {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<RecoveryBloc>();
    final records = state.pending!.parsed.data.counts.values.fold(0, (sum, n) => sum + n);
    final sure = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(l10n.recoveryConfirmTitle),
        content: Text(l10n.recoveryConfirmBody(records)),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialog).pop(false), child: Text(l10n.cancel)),
          FilledButton(onPressed: () => Navigator.of(dialog).pop(true), child: Text(l10n.recoveryRestore)),
        ],
      ),
    );
    bloc.add(sure == true ? const RecoveryEvent.restoreConfirmed() : const RecoveryEvent.restoreCancelled());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<RecoveryBloc, RecoveryState>(
          listenWhen: (a, b) => b.pending != null && a.pending != b.pending,
          listener: _confirm,
        ),
        BlocListener<RecoveryBloc, RecoveryState>(
          listenWhen: (a, b) => b.failure != null && a.failure != b.failure,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(l10n.fileProblemOf(state.failure!) ?? l10n.recoveryActionFailed)));
            context.read<RecoveryBloc>().add(const RecoveryEvent.failureShown());
          },
        ),
        BlocListener<RecoveryBloc, RecoveryState>(
          listenWhen: (a, b) => !a.restored && b.restored,
          listener: (_, _) => onRetry(),
        ),
      ],
      child: BlocBuilder<RecoveryBloc, RecoveryState>(
        builder: (context, state) {
          final bloc = context.read<RecoveryBloc>();
          final latest = state.latestSafetyBackup;
          final enabled = !state.busy && !state.restored;
          return Scaffold(
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsetsDirectional.all(24),
                children: [
                  Icon(Icons.healing_outlined, size: 48, color: theme.colorScheme.error),
                  const SizedBox(height: 16),
                  Semantics(header: true, child: Text(l10n.startupFailureTitle, style: theme.textTheme.headlineSmall)),
                  const SizedBox(height: 12),
                  Text(l10n.recoveryBody, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  if (state.busy || state.restored) ...[
                    const LinearProgressIndicator(),
                    const SizedBox(height: 8),
                    Text(l10n.recoveryWorking, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                  ],
                  FilledButton.icon(
                    onPressed: enabled ? onRetry : null,
                    icon: const Icon(Icons.refresh),
                    label: Text(l10n.recoveryRetry),
                  ),
                  if (latest != null) ...[
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: enabled ? () => bloc.add(const RecoveryEvent.restoreLatestPressed()) : null,
                      icon: const Icon(Icons.restore),
                      label: Text(l10n.recoveryRestoreLatest),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 4),
                      child: Text(
                        l10n.recoveryRestoreLatestHint(dayAndTimeOf(context, latest.createdAt)),
                        style: theme.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: enabled ? () => bloc.add(const RecoveryEvent.importPressed()) : null,
                    icon: const Icon(Icons.file_open_outlined),
                    label: Text(l10n.recoveryImport),
                  ),
                  const SizedBox(height: 12),
                  Builder(
                    builder: (button) => OutlinedButton.icon(
                      onPressed: enabled
                          ? () => bloc.add(RecoveryEvent.exportPressed(anchor: shareAnchorOf(button)))
                          : null,
                      icon: const Icon(Icons.ios_share),
                      label: Text(l10n.recoveryExportDatabase),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 4),
                    child: Text(
                      l10n.recoveryExportDatabaseHint,
                      style: theme.textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ExpansionTile(
                    title: Text(l10n.recoveryDetails),
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.all(8),
                        child: SelectableText(details, style: theme.textTheme.bodySmall),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
