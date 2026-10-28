import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';

enum BackupNoteTone { info, warning, error, success }

/// A tinted line of guidance with an icon: warnings in burnt orange, errors
/// in the error color (never gold, plan §12.2).
class BackupNote extends StatelessWidget {
  const BackupNote({required this.text, this.tone = BackupNoteTone.info, this.icon, super.key});

  final String text;
  final BackupNoteTone tone;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = PlanyarColors.of(context);
    final (background, foreground, defaultIcon) = switch (tone) {
      BackupNoteTone.info => (scheme.surfaceContainerHighest, scheme.onSurfaceVariant, Icons.info_outline),
      BackupNoteTone.warning => (colors.warningContainer, colors.onWarningContainer, Icons.warning_amber_rounded),
      BackupNoteTone.error => (scheme.errorContainer, scheme.onErrorContainer, Icons.error_outline),
      BackupNoteTone.success => (colors.successContainer, scheme.onSurface, Icons.check_circle_outline),
    };
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExcludeSemantics(child: Icon(icon ?? defaultIcon, size: 20, color: foreground)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: foreground)),
          ),
        ],
      ),
    );
  }
}

/// A section title inside a settings-style list.
class BackupSectionTitle extends StatelessWidget {
  const BackupSectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 8),
    child: Semantics(
      header: true,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    ),
  );
}
