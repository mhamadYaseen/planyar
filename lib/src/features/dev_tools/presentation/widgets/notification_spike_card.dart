import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/usecases/notification_spike_usecases.dart';
import '../bloc/dev_tools_bloc.dart';

/// Buttons and status for testing one reminder on a real phone.
class NotificationSpikeCard extends StatelessWidget {
  const NotificationSpikeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final text = TestNotificationText(title: l10n.devTestTitle, body: l10n.devTestBody);
    String yesNo(bool value) => value ? l10n.yes : l10n.no;

    return Card(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: BlocBuilder<DevToolsBloc, DevToolsState>(
          builder: (context, state) {
            final bloc = context.read<DevToolsBloc>();
            final scheduled = state.lastScheduled;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(l10n.devNotificationsSection, style: theme.textTheme.titleMedium),
                switch (state.status) {
                  DataSuccess(:final data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        l10n.devPermissionStatus(
                          yesNo(data.permissions.notificationsAllowed),
                          yesNo(data.permissions.exactAlarmsAllowed),
                        ),
                      ),
                      Text(l10n.devTimeZone(data.timeZoneId)),
                      Text(l10n.devPendingCount(data.pendingCount)),
                    ],
                  ),
                  DataError(:final failure) => Text(
                    l10n.somethingWentWrong(failure.message),
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                  _ => const LinearProgressIndicator(),
                },
                if (scheduled != null) Text(l10n.devScheduledAt(scheduled.localTime.toString())),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    OutlinedButton(
                      onPressed: () => bloc.add(const DevToolsEvent.permissionRequested()),
                      child: Text(l10n.devRequestPermission),
                    ),
                    OutlinedButton(
                      onPressed: () => bloc.add(DevToolsEvent.showNowPressed(text)),
                      child: Text(l10n.devShowNow),
                    ),
                    FilledButton(
                      onPressed: () => bloc.add(DevToolsEvent.schedulePressed(text)),
                      child: Text(l10n.devScheduleInOneMinute),
                    ),
                    TextButton(
                      onPressed: () => bloc.add(const DevToolsEvent.cancelAllPressed()),
                      child: Text(l10n.devCancelAll),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
