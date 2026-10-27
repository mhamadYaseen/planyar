import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/label_icons.dart';
import '../../../../app/theme/label_palette.dart';
import '../../domain/entities/label.dart';

/// A small filled circle in the label's accent tone.
class LabelColorDot extends StatelessWidget {
  const LabelColorDot({required this.colorKey, this.size = 12, super.key});

  final String? colorKey;
  final double size;

  @override
  Widget build(BuildContext context) {
    final tones = LabelPalette.tonesForKey(colorKey, Theme.of(context).brightness);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: tones.accent, shape: BoxShape.circle),
    );
  }
}

/// The label's icon on its tone, or a color dot when it has no icon.
class LabelAvatar extends StatelessWidget {
  const LabelAvatar({required this.label, this.size = 32, super.key});

  final Label? label;
  final double size;

  @override
  Widget build(BuildContext context) {
    final tones = LabelPalette.tonesForKey(label?.colorKey, Theme.of(context).brightness);
    final icon = LabelIcons.of(label?.iconKey);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: tones.actualFill, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: icon == null
          ? LabelColorDot(colorKey: label?.colorKey, size: size * 0.4)
          : Icon(icon, size: size * 0.55, color: tones.onBlock),
    );
  }
}

/// A selectable label chip (quick add, picker). Selection is shown by the
/// chip style and a check mark, not color alone.
class LabelChip extends StatelessWidget {
  const LabelChip({required this.label, required this.selected, required this.onSelected, super.key});

  final Label label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final icon = LabelIcons.of(label.iconKey);
    final tones = LabelPalette.tonesForKey(label.colorKey, Theme.of(context).brightness);
    return ChoiceChip(
      selected: selected,
      onSelected: (_) => onSelected(),
      avatar: icon == null ? LabelColorDot(colorKey: label.colorKey) : Icon(icon, color: tones.accent, size: 18),
      label: Text(label.name),
      showCheckmark: true,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }
}
