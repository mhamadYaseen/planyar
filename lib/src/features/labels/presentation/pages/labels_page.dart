import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/routes/route_names.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/label.dart';
import '../bloc/labels_bloc.dart';
import '../widgets/label_visuals.dart';

/// Labels & categories (S5): grouped by category, archived section, counts.
class LabelsPage extends StatelessWidget {
  const LabelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<LabelsBloc>()..add(const LabelsEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.labelsAndCategories),
          actions: [
            IconButton(
              tooltip: l10n.newCategory,
              icon: const Icon(Icons.create_new_folder_outlined),
              onPressed: () => context.pushNamed(RouteNames.categoryNew),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.pushNamed(RouteNames.labelNew),
          icon: const Icon(Icons.add),
          label: Text(l10n.newLabel),
        ),
        body: BlocBuilder<LabelsBloc, DataState<LabelsOverview>>(
          builder: (context, state) => switch (state) {
            DataSuccess(:final data) => ListView(
              padding: const EdgeInsetsDirectional.only(bottom: 96),
              children: [
                for (final group in data.groups)
                  if (group.category != null || group.labels.isNotEmpty) ...[
                    _GroupHeader(category: group.category),
                    for (final label in group.labels) _LabelTile(label: label, count: data.entryCounts[label.id] ?? 0),
                  ],
                if (data.archived.isNotEmpty)
                  ExpansionTile(
                    title: Text('${l10n.archivedLabels} (${data.archived.length})'),
                    children: [
                      for (final label in data.archived)
                        _LabelTile(label: label, count: data.entryCounts[label.id] ?? 0),
                    ],
                  ),
              ],
            ),
            DataError() => Center(child: Text(l10n.errorGeneric)),
            _ => const Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.category});

  final Category? category;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = category;
    return ListTile(
      dense: true,
      leading: c?.colorKey == null ? null : LabelColorDot(colorKey: c!.colorKey),
      title: Text(c?.name ?? l10n.uncategorized, style: Theme.of(context).textTheme.titleSmall),
      trailing: c == null
          ? null
          : IconButton(
              tooltip: l10n.editCategory,
              icon: const Icon(Icons.edit_outlined),
              onPressed: () => context.pushNamed(RouteNames.categoryEdit, pathParameters: {'id': c.id}),
            ),
    );
  }
}

class _LabelTile extends StatelessWidget {
  const _LabelTile({required this.label, required this.count});

  final Label label;
  final int count;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: LabelAvatar(label: label),
    title: Text(label.name),
    subtitle: Text(AppLocalizations.of(context).entryCount(count)),
    trailing: const Icon(Icons.chevron_right),
    onTap: () => context.pushNamed(RouteNames.labelEdit, pathParameters: {'id': label.id}),
  );
}
