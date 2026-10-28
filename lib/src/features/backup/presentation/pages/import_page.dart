import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/backup_actions.dart';
import '../bloc/import_bloc.dart';
import '../widgets/backup_texts.dart';
import '../widgets/import_confirm_bar.dart';
import '../widgets/import_failure_view.dart';
import '../widgets/import_preview_view.dart';
import '../widgets/import_result_view.dart';

/// Import preview (S23) → result (S24) for one file (BAK-03, plan §10.6).
class ImportPage extends StatelessWidget {
  const ImportPage({required this.source, super.key});

  final ImportSource source;

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (_) => sl<ImportBloc>()..add(ImportEvent.started(source)), child: const _ImportView());
}

class _ImportView extends StatelessWidget {
  const _ImportView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = context.watch<ImportBloc>().state;
    final running = state.result is DataLoading;
    return PopScope(
      // Leaving can't stop a running import; stay until it's done.
      canPop: !running,
      child: Scaffold(
        appBar: AppBar(
          title: Text(state.result is DataSuccess ? l10n.importDoneTitle : l10n.importTitle),
          automaticallyImplyLeading: !running,
        ),
        body: SafeArea(
          top: false,
          child: switch ((state.preview, state.result)) {
            (_, DataSuccess(:final data)) => ImportResultView(result: data),
            (_, DataError(:final failure)) => ImportFailureView(
              message: failure is PlatformFailure ? l10n.importSafetyFailed : l10n.importFailed,
            ),
            (_, DataLoading()) => _Busy(text: l10n.importRunning),
            (DataSuccess(:final data), _) => ImportPreviewView(preview: data),
            (DataError(:final failure), _) => ImportFailureView(
              message: l10n.fileProblemOf(failure) ?? l10n.backupProblemUnreadable,
              detail: l10n.backupNothingChanged,
            ),
            _ => _Busy(text: l10n.importReading),
          },
        ),
        bottomNavigationBar: state.preview is DataSuccess && state.result is DataInitial
            ? const ImportConfirmBar()
            : null,
      ),
    );
  }
}

class _Busy extends StatelessWidget {
  const _Busy({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(text, style: Theme.of(context).textTheme.bodyLarge),
      ],
    ),
  );
}
