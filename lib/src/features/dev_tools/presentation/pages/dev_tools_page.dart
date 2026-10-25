import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../bloc/dev_tools_bloc.dart';
import '../widgets/notification_spike_card.dart';

/// Dev-flavor-only tools (plan §8.12). Phase 0 holds the notification spike;
/// seed data and the clock override come later.
class DevToolsPage extends StatelessWidget {
  const DevToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<DevToolsBloc>()..add(const DevToolsEvent.started()),
      child: BlocListener<DevToolsBloc, DevToolsState>(
        listenWhen: (previous, current) =>
            current.actionFailure != null && previous.actionFailure != current.actionFailure,
        listener: (context, state) =>
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(l10n.somethingWentWrong(state.actionFailure!.message)))),
        child: Scaffold(
          appBar: AppBar(title: Text(l10n.devToolsTitle)),
          body: ListView(padding: const EdgeInsetsDirectional.all(16), children: const [NotificationSpikeCard()]),
        ),
      ),
    );
  }
}
