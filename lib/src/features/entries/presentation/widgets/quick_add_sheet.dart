import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../bloc/entry_form_bloc.dart';
import 'entry_form_fields.dart';
import 'entry_form_outcome.dart';

/// Quick add (S2): label chips visible, no keyboard (J1 AC1).
class QuickAddSheet extends StatelessWidget {
  const QuickAddSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocListener<EntryFormBloc, EntryFormState>(
      listenWhen: (a, b) => a.status != b.status,
      listener: (context, state) {
        final outcome = EntryFormOutcome.fromState(state);
        if (outcome != null) Navigator.of(context).pop(outcome);
      },
      child: BlocBuilder<EntryFormBloc, EntryFormState>(
        buildWhen: (a, b) => a.status != b.status,
        builder: (context, state) {
          if (state.status == EntryFormStatus.loading) {
            return const SizedBox(height: 240, child: Center(child: CircularProgressIndicator()));
          }
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16 + MediaQuery.viewInsetsOf(context).bottom),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  const KindToggle(),
                  const LabelSection(),
                  const Column(children: [StartRow(), EndSection()]),
                  const FormMessages(),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton.icon(
                      icon: const Icon(Icons.chevron_right),
                      label: Text(l10n.moreOptions),
                      onPressed: () => Navigator.of(context).pop(const ExpandToEditor()),
                    ),
                  ),
                  const SaveButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
