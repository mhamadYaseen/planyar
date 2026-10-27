import 'package:material_ui/material_ui.dart';

import '../../config/localization/l10n/generated/app_localizations.dart';

/// "Saved" / "Deleted" with Undo — 5 s, or 10 s with a screen reader
/// (plan §6.11, §12.7).
void showUndoSnackBar(BuildContext context, {required String message, required VoidCallback onUndo}) {
  final accessible = MediaQuery.accessibleNavigationOf(context);
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: accessible ? 10 : 5),
        persist: false,
        action: SnackBarAction(label: AppLocalizations.of(context).undo, onPressed: onUndo),
      ),
    );
}

void showErrorSnackBar(BuildContext context, [String? message]) => ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(SnackBar(content: Text(message ?? AppLocalizations.of(context).errorGeneric)));
