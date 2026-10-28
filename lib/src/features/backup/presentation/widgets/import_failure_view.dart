import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';

/// A file that can't be imported, or an import that failed (nothing changed).
class ImportFailureView extends StatelessWidget {
  const ImportFailureView({required this.message, this.detail, super.key});

  final String message;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
            if (detail case final detail?) ...[
              const SizedBox(height: 8),
              Text(detail, textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
            ],
            const SizedBox(height: 24),
            OutlinedButton(onPressed: () => context.pop(), child: Text(l10n.back)),
          ],
        ),
      ),
    );
  }
}
