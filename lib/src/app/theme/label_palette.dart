import 'package:material_ui/material_ui.dart';

/// The 16 label hues (plan §12.2, LBL-02). Labels store the **key**, never a
/// raw color, so each theme can render accessible tones.
enum LabelColor {
  gray(Color(0xFF8A877F)),
  brown(Color(0xFF8B5E3C)),
  red(Color(0xFFC0392B)),
  rose(Color(0xFFD05A6E)),
  orange(Color(0xFFE07B2E)),
  amber(Color(0xFFE0A21B)),
  yellow(Color(0xFFD9C02A)),
  lime(Color(0xFF9BB33A)),
  green(Color(0xFF4E9A5B)),
  teal(Color(0xFF2E8C85)),
  cyan(Color(0xFF2A9BB5)),
  sky(Color(0xFF4A9FDC)),
  blue(Color(0xFF3F6FD1)),
  indigo(Color(0xFF5C5BC4)),
  violet(Color(0xFF8E5CC4)),
  pink(Color(0xFFD25FA6));

  const LabelColor(this.seed);

  /// Seed for the tonal palette; not drawn directly.
  final Color seed;

  /// The stored key, e.g. `"teal"`.
  String get key => name;

  /// Unknown keys (e.g. from a newer backup) fall back to gray (plan §10.6).
  static LabelColor fromKey(String? key) => values.firstWhere((c) => c.name == key, orElse: () => LabelColor.gray);
}

/// The tones used to draw one label in one theme.
@immutable
final class LabelTones {
  const LabelTones({required this.accent, required this.actualFill, required this.onBlock, required this.plannedFill});

  /// Strong left edge of actual blocks, planned outline, text on planned
  /// blocks, chart marks. Tone 40 light / 80 dark.
  final Color accent;

  /// Actual block fill. Tone 90 light / 30 dark.
  final Color actualFill;

  /// Text and icons on an actual block. Tone 10 light / 90 dark.
  final Color onBlock;

  /// Very light planned block tint (light) / tone ~20 (dark).
  final Color plannedFill;
}

/// Derives [LabelTones] per hue with `ColorScheme.fromSeed` (tonal-spot
/// variant: moderate chroma, so labels sit calmly beside the warm neutrals).
abstract final class LabelPalette {
  static final _cache = <(LabelColor, Brightness), LabelTones>{};

  static LabelTones tones(LabelColor color, Brightness brightness) =>
      _cache.putIfAbsent((color, brightness), () => _derive(color, brightness));

  static LabelTones tonesForKey(String? key, Brightness brightness) => tones(LabelColor.fromKey(key), brightness);

  static LabelTones _derive(LabelColor color, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: color.seed,
      brightness: brightness,
      dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
    );
    final isLight = brightness == Brightness.light;
    return LabelTones(
      accent: scheme.primary,
      actualFill: scheme.primaryContainer,
      onBlock: scheme.onPrimaryContainer,
      plannedFill: isLight
          ? Color.alphaBlend(scheme.primaryContainer.withValues(alpha: 0.35), const Color(0xFFFFFFFF))
          : Color.alphaBlend(scheme.primaryContainer.withValues(alpha: 0.45), const Color(0xFF2D2A23)),
    );
  }
}
