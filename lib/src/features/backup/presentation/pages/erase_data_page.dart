import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/data_state.dart';
import '../bloc/erase_bloc.dart';
import '../widgets/backup_note.dart';
import '../widgets/backup_texts.dart';

/// Erase all data (SET-06). After it succeeds the app returns to onboarding
/// by itself (the router follows the cleared settings).
class EraseDataPage extends StatelessWidget {
  const EraseDataPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<EraseBloc>(), child: const _EraseView());
}

class _EraseView extends StatelessWidget {
  const _EraseView();

  void _show(BuildContext context, String text) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return MultiBlocListener(
      listeners: [
        BlocListener<EraseBloc, EraseState>(
          listenWhen: (a, b) => a.export != b.export,
          listener: (context, state) => switch (state.export) {
            DataSuccess(:final data) when data.completed => _show(context, l10n.eraseExported(data.fileName)),
            DataError(:final failure) => _show(context, l10n.fileProblemOf(failure) ?? l10n.backupExportFailed),
            _ => null,
          },
        ),
        BlocListener<EraseBloc, EraseState>(
          listenWhen: (a, b) => a.erase != b.erase,
          listener: (context, state) {
            if (state.erase case DataError(:final failure)) {
              _show(context, failure is PlatformFailure ? l10n.eraseSafetyFailed : l10n.eraseFailed);
            }
          },
        ),
      ],
      child: BlocBuilder<EraseBloc, EraseState>(
        builder: (context, state) {
          final bloc = context.read<EraseBloc>();
          final erasing = state.erase is DataLoading;
          return Scaffold(
            appBar: AppBar(title: Text(l10n.eraseTitle)),
            body: ListView(
              padding: const EdgeInsetsDirectional.all(16),
              children: [
                BackupNote(text: l10n.eraseBody, tone: BackupNoteTone.warning, icon: Icons.delete_forever_outlined),
                const SizedBox(height: 16),
                Builder(
                  builder: (button) => OutlinedButton.icon(
                    onPressed: state.export is DataLoading || erasing
                        ? null
                        : () => bloc.add(EraseEvent.exportPressed(anchor: shareAnchorOf(button))),
                    icon: const Icon(Icons.ios_share),
                    label: Text(l10n.eraseExportFirst),
                  ),
                ),
                const SizedBox(height: 8),
                Text(l10n.eraseSafetyNote, style: theme.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
                const SizedBox(height: 24),
                TextField(
                  enabled: !erasing,
                  autocorrect: false,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(labelText: l10n.eraseTypeLabel, border: const OutlineInputBorder()),
                  onChanged: (text) => bloc.add(EraseEvent.textChanged(text)),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  style: FilledButton.styleFrom(backgroundColor: scheme.error, foregroundColor: scheme.onError),
                  onPressed: state.canErase ? () => bloc.add(const EraseEvent.erasePressed()) : null,
                  icon: erasing
                      ? SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: scheme.onError),
                        )
                      : const Icon(Icons.delete_forever),
                  label: Text(erasing ? l10n.eraseRunning : l10n.eraseButton),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
