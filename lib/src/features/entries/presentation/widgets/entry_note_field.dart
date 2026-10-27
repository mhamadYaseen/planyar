import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../domain/services/entry_validator.dart';
import '../bloc/entry_form_bloc.dart';

/// Optional note, up to 2,000 characters (ENT-01).
class EntryNoteField extends StatefulWidget {
  const EntryNoteField({super.key});

  @override
  State<EntryNoteField> createState() => _EntryNoteFieldState();
}

class _EntryNoteFieldState extends State<EntryNoteField> {
  late final _controller = TextEditingController(text: context.read<EntryFormBloc>().state.note);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
    controller: _controller,
    minLines: 2,
    maxLines: 6,
    maxLength: EntryValidator.maxNoteLength,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(labelText: AppLocalizations.of(context).noteLabel),
    onChanged: (text) => context.read<EntryFormBloc>().add(EntryFormEvent.noteChanged(text)),
  );
}

/// Rarely needed per-entry category (CAT-02); defaults to the label's.
class CategoryOverrideField extends StatelessWidget {
  const CategoryOverrideField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<EntryFormBloc, EntryFormState>(
      buildWhen: (a, b) => a.categories != b.categories || a.categoryOverrideId != b.categoryOverrideId,
      builder: (context, state) {
        final known = state.categories.any((c) => c.id == state.categoryOverrideId);
        return DropdownButtonFormField<String?>(
          initialValue: known ? state.categoryOverrideId : null,
          decoration: InputDecoration(labelText: l10n.categoryForEntry),
          items: [
            DropdownMenuItem(value: null, child: Text(l10n.categoryFromLabel)),
            for (final c in state.categories) DropdownMenuItem(value: c.id, child: Text(c.name)),
          ],
          onChanged: (id) => context.read<EntryFormBloc>().add(EntryFormEvent.categoryOverrideChanged(id)),
        );
      },
    );
  }
}
