import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/routes/route_names.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../domain/entities/backup_actions.dart';
import '../bloc/backup_bloc.dart';
import '../widgets/backup_texts.dart';
import '../widgets/export_section.dart';
import '../widgets/import_history_section.dart';
import '../widgets/safety_backups_section.dart';

/// Backup & restore (S22): export (BAK-01, BAK-05), import (BAK-03) and the
/// safety backups (BAK-04).
class BackupPage extends StatelessWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (_) => sl<BackupBloc>()..add(const BackupEvent.started()), child: const _BackupView());
}

class _BackupView extends StatelessWidget {
  const _BackupView();

  Future<void> _openImport(BuildContext context, ImportSource source) async {
    final bloc = context.read<BackupBloc>()..add(const BackupEvent.importOpened());
    await context.pushNamed(RouteNames.backupImport, extra: source);
    // An import saves a safety backup first; show it.
    bloc.add(const BackupEvent.safetyBackupsRefreshed());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<BackupBloc, BackupState>(
          listenWhen: (a, b) => b.notice != null && a.notice != b.notice,
          listener: (context, state) {
            final text = switch (state.notice!) {
              ExportedNotice(:final fileName, destination: ExportDestination.share) => l10n.backupShared(fileName),
              ExportedNotice(:final fileName, destination: ExportDestination.device) => l10n.backupSavedToDevice(
                fileName,
              ),
              FailedNotice(:final failure) => l10n.fileProblemOf(failure) ?? l10n.backupExportFailed,
            };
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(text)));
            context.read<BackupBloc>().add(const BackupEvent.noticeShown());
          },
        ),
        BlocListener<BackupBloc, BackupState>(
          listenWhen: (a, b) => b.pendingImport != null && a.pendingImport != b.pendingImport,
          listener: (context, state) => _openImport(context, state.pendingImport!),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.backupTitle)),
        body: const SafeArea(
          top: false,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ExportSection()),
              SliverToBoxAdapter(child: ImportSection()),
              SafetyBackupsSection(),
              ImportHistorySection(),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
    );
  }
}
