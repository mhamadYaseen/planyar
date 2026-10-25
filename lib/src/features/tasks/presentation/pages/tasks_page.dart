import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../../core/widgets/settings_button.dart';

/// Long-term tasks (S13) — built in Phase 5.
class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tabTasks), actions: const [SettingsButton()]),
      body: SafeArea(
        child: EmptyView(icon: Icons.task_alt_outlined, message: l10n.tasksEmpty),
      ),
    );
  }
}
