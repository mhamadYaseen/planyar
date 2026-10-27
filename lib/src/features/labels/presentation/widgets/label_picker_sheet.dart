import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/routes/route_names.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/undo_snack_bar.dart';
import '../../domain/entities/label.dart';
import '../../domain/services/label_rules.dart';
import '../bloc/label_picker_bloc.dart';
import 'label_visuals.dart';

/// Opens the label picker (S4) and returns the chosen, created or restored label.
Future<Label?> showLabelPicker(BuildContext context) => showModalBottomSheet<Label>(
  context: context,
  useRootNavigator: true,
  isScrollControlled: true,
  useSafeArea: true,
  builder: (_) => BlocProvider(
    create: (_) => sl<LabelPickerBloc>()..add(const LabelPickerEvent.started()),
    child: const LabelPickerSheet(),
  ),
);

class LabelPickerSheet extends StatelessWidget {
  const LabelPickerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<LabelPickerBloc>();
    return BlocConsumer<LabelPickerBloc, LabelPickerState>(
      listenWhen: (a, b) => a.picked != b.picked || a.failure != b.failure,
      listener: (context, state) {
        if (state.picked != null) {
          Navigator.of(context).pop(state.picked);
        } else if (state.failure != null) {
          showErrorSnackBar(context);
        }
      },
      builder: (context, state) {
        final hasQuery = LabelRules.cleanName(state.query).isNotEmpty;
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: TextField(
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(prefixIcon: const Icon(Icons.search), hintText: l10n.searchLabels),
                    onChanged: (q) => bloc.add(LabelPickerEvent.queryChanged(q)),
                    onSubmitted: (_) {
                      if (state.createOption is CreateNewLabel) bloc.add(const LabelPickerEvent.createPressed());
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      switch (state.createOption) {
                        CreateNewLabel(:final name) => ListTile(
                          leading: const Icon(Icons.add_circle_outline),
                          title: Text(l10n.createLabelNamed(name)),
                          onTap: () => bloc.add(const LabelPickerEvent.createPressed()),
                        ),
                        RestoreArchivedLabel(:final label) => ListTile(
                          leading: const Icon(Icons.unarchive_outlined),
                          title: Text(l10n.restoreLabelNamed(label.name)),
                          onTap: () => bloc.add(LabelPickerEvent.restorePressed(label)),
                        ),
                        _ => const SizedBox.shrink(),
                      },
                      if (!hasQuery && state.quickChips.isNotEmpty) ...[
                        _Heading(l10n.recentLabels),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              for (final label in state.quickChips)
                                LabelChip(
                                  label: label,
                                  selected: false,
                                  onSelected: () => Navigator.of(context).pop(label),
                                ),
                            ],
                          ),
                        ),
                        _Heading(l10n.allLabels),
                      ],
                      if (!state.loading && state.labels.isEmpty && !hasQuery)
                        Padding(padding: const EdgeInsetsDirectional.all(16), child: Text(l10n.noLabelsYet)),
                      for (final label in state.results)
                        ListTile(
                          leading: LabelAvatar(label: label),
                          title: Text(label.name),
                          onTap: () => Navigator.of(context).pop(label),
                        ),
                      ListTile(
                        leading: const Icon(Icons.tune),
                        title: Text(l10n.manageLabels),
                        onTap: () {
                          Navigator.of(context).pop();
                          context.pushNamed(RouteNames.labels);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
    child: Text(text, style: Theme.of(context).textTheme.labelLarge),
  );
}
