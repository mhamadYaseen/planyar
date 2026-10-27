import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../../day_view/domain/usecases/day_usecases.dart';
import '../../../labels/presentation/widgets/label_visuals.dart';
import '../bloc/entry_actions_bloc.dart';
import '../bloc/entry_form_bloc.dart';
import '../bloc/to_finish_bloc.dart';
import '../entry_actions_ui.dart';
import '../widgets/end_entry_sheet.dart';

/// To finish (S11): open entries, oldest first, with End now, +30m/+1h/+2h,
/// Set end… and delete with Undo (ENT-05, J2 AC3).
class ToFinishPage extends StatelessWidget {
  const ToFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ToFinishBloc>()..add(const ToFinishEvent.started())),
        BlocProvider(create: (_) => sl<EntryActionsBloc>()),
      ],
      child: EntryActionsListener(
        child: Scaffold(
          appBar: AppBar(title: Text(l10n.toFinishTitle)),
          body: BlocBuilder<ToFinishBloc, DataState<DayEntries>>(
            builder: (context, state) => switch (state) {
              DataSuccess(:final data) when data.entries.isEmpty => EmptyView(
                icon: Icons.task_alt_outlined,
                message: l10n.toFinishEmpty,
              ),
              DataSuccess(:final data) => ListView.builder(
                padding: const EdgeInsetsDirectional.all(12),
                itemCount: data.entries.length,
                itemBuilder: (context, i) => _OpenEntryCard(data: data, index: i),
              ),
              DataError() => Center(child: Text(l10n.errorGeneric)),
              _ => const Center(child: CircularProgressIndicator()),
            },
          ),
        ),
      ),
    );
  }
}

class _OpenEntryCard extends StatelessWidget {
  const _OpenEntryCard({required this.data, required this.index});

  final DayEntries data;
  final int index;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    final entry = data.entries[index];
    final label = data.labels[entry.labelId];
    final elapsed = Instant.now().difference(entry.start);
    final actions = context.read<EntryActionsBloc>();
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 12),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: LabelAvatar(label: label),
              title: Text(label?.name ?? l10n.unknownLabel),
              subtitle: Text(
                l10n.startedAgo(
                  time.dayAndTime(entry.start),
                  time.duration(elapsed.isNegative ? Duration.zero : elapsed),
                ),
              ),
              trailing: IconButton(
                tooltip: l10n.delete,
                icon: const Icon(Icons.delete_outline),
                onPressed: () => actions.add(EntryActionsEvent.deleteRequested(entry)),
              ),
              onTap: () => openEntryFormWithUndo(context, EditEntry(entry.id)),
            ),
            EndEntryOptions(entry: entry, onEnd: (end) => actions.add(EntryActionsEvent.endSet(entry, end))),
          ],
        ),
      ),
    );
  }
}
