import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/utils/data_state.dart';
import '../bloc/dev_tools_bloc.dart';

/// Fills the database for performance checks (dev flavor only).
class SampleDataCard extends StatelessWidget {
  const SampleDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final seed = context.select((DevToolsBloc b) => b.state.seed);
    return Card(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(l10n.devSampleDataSection, style: Theme.of(context).textTheme.titleMedium),
            switch (seed) {
              DataLoading() => const LinearProgressIndicator(),
              DataSuccess(:final data) => Text(l10n.devSeeded(data)),
              DataError(:final failure) => Text(l10n.somethingWentWrong(failure.message)),
              _ => const SizedBox.shrink(),
            },
            OutlinedButton(
              onPressed: seed is DataLoading
                  ? null
                  : () => context.read<DevToolsBloc>().add(const DevToolsEvent.seedPressed()),
              child: Text(l10n.devSeedButton),
            ),
          ],
        ),
      ),
    );
  }
}
