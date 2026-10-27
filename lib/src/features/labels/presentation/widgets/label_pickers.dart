import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/label_icons.dart';
import '../../../../app/theme/label_palette.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/dashed_border.dart';
import '../../domain/entities/label_color_keys.dart';
import '../../domain/services/label_rules.dart';

String? nameProblemText(AppLocalizations l10n, NameProblem? problem) => switch (problem) {
  NameProblem.empty => l10n.nameEmpty,
  NameProblem.tooLong => l10n.nameTooLong,
  NameProblem.duplicate => l10n.nameTaken,
  null => null,
};

/// The 16 palette swatches (LBL-02); 48 dp targets, a check on the selected one.
class ColorKeyPicker extends StatelessWidget {
  const ColorKeyPicker({required this.selected, required this.onPicked, this.allowNone = false, super.key});

  final String? selected;
  final ValueChanged<String?> onPicked;
  final bool allowNone;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final l10n = AppLocalizations.of(context);
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        if (allowNone)
          _Swatch(
            semantics: l10n.noColor,
            selected: selected == null,
            onTap: () => onPicked(null),
            child: const Icon(Icons.block),
          ),
        for (final key in labelColorKeys)
          _Swatch(
            semantics: key,
            selected: key == selected,
            color: LabelPalette.tonesForKey(key, brightness).accent,
            onTap: () => onPicked(key),
          ),
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({required this.semantics, required this.selected, required this.onTap, this.color, this.child});

  final String semantics;
  final bool selected;
  final VoidCallback onTap;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      label: semantics,
      selected: selected,
      button: true,
      excludeSemantics: true,
      child: InkResponse(
        onTap: onTap,
        radius: 24,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Center(
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: selected ? scheme.onSurface : scheme.outlineVariant, width: selected ? 3 : 1),
              ),
              child: selected && child == null ? Icon(Icons.check, color: scheme.surface, size: 18) : child,
            ),
          ),
        ),
      ),
    );
  }
}

/// The curated icons, plus "no icon".
class LabelIconPicker extends StatelessWidget {
  const LabelIconPicker({required this.selected, required this.onPicked, super.key});

  final String? selected;
  final ValueChanged<String?> onPicked;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    Widget option(String? key, IconData icon, String semantics) => Semantics(
      label: semantics,
      selected: key == selected,
      button: true,
      excludeSemantics: true,
      child: IconButton(
        isSelected: key == selected,
        style: IconButton.styleFrom(
          backgroundColor: key == selected ? scheme.secondaryContainer : null,
          foregroundColor: key == selected ? scheme.onSecondaryContainer : scheme.onSurfaceVariant,
        ),
        icon: Icon(icon),
        onPressed: () => onPicked(key),
      ),
    );
    return Wrap(
      children: [
        option(null, Icons.block, l10n.noIcon),
        for (final MapEntry(:key, value: icon) in LabelIcons.all.entries) option(key, icon, key),
      ],
    );
  }
}

/// How the label looks on the timeline: a planned and an actual block (S6).
class LabelPreview extends StatelessWidget {
  const LabelPreview({required this.name, required this.colorKey, required this.iconKey, super.key});

  final String name;
  final String? colorKey;
  final String? iconKey;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tones = LabelPalette.tonesForKey(colorKey, Theme.of(context).brightness);
    final icon = LabelIcons.of(iconKey);
    Widget content(Color color, String kind) => Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        spacing: 6,
        children: [
          if (icon != null) Icon(icon, size: 16, color: color),
          Expanded(
            child: Text(
              '$kind · $name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: CustomPaint(
            foregroundPainter: DashedBorderPainter(color: tones.accent),
            child: DecoratedBox(
              decoration: BoxDecoration(color: tones.plannedFill, borderRadius: BorderRadius.circular(8)),
              child: content(tones.accent, l10n.kindPlanned),
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: tones.actualFill,
              borderRadius: BorderRadius.circular(8),
              border: BorderDirectional(start: BorderSide(color: tones.accent, width: 3)),
            ),
            child: content(tones.onBlock, l10n.kindActual),
          ),
        ),
      ],
    );
  }
}
