// Contrast checks for the Warm Focus palette (plan §12.2, §12.7):
// ≥ 4.5:1 for text, ≥ 3:1 for outlines, icons and chart marks.

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/src/app/theme/app_colors.dart';
import 'package:planyar/src/app/theme/app_theme.dart';
import 'package:planyar/src/app/theme/label_palette.dart';

import '../../helpers/contrast.dart';

const text = 4.5;
const graphic = 3.0;

void main() {
  void expectContrast(Color fg, Color bg, double minimum, String what) {
    final ratio = contrastRatio(fg, bg);
    expect(ratio, greaterThanOrEqualTo(minimum), reason: '$what: ${ratio.toStringAsFixed(2)}:1');
  }

  for (final (name, scheme, extra) in [
    ('light', AppTheme.lightScheme, PlanyarColors.light),
    ('dark', AppTheme.darkScheme, PlanyarColors.dark),
  ]) {
    group('$name theme', () {
      final background = scheme.surface;
      final card = scheme.surfaceContainerLow;

      test('body and secondary text on background and cards', () {
        for (final (surface, label) in [(background, 'background'), (card, 'card')]) {
          expectContrast(scheme.onSurface, surface, text, 'main text on $label');
          expectContrast(scheme.onSurfaceVariant, surface, text, 'secondary text on $label');
        }
      });

      test('text on gold and on the soft highlight', () {
        expectContrast(scheme.onPrimary, scheme.primary, text, 'on gold');
        expectContrast(scheme.onPrimaryContainer, scheme.primaryContainer, text, 'on highlight');
        expectContrast(scheme.onSecondaryContainer, scheme.secondaryContainer, text, 'on nav indicator');
        expectContrast(scheme.onSecondary, scheme.secondary, text, 'on secondary');
      });

      test('gold ink reads as text on background, cards and the highlight', () {
        expectContrast(extra.goldInk, background, text, 'gold ink on background');
        expectContrast(extra.goldInk, card, text, 'gold ink on card');
      });

      test('outlines are visible', () {
        expectContrast(scheme.outline, background, graphic, 'outline on background');
        expectContrast(scheme.outline, card, graphic, 'outline on card');
      });

      test('warning, error and success read as text', () {
        expectContrast(extra.warning, background, text, 'warning on background');
        expectContrast(extra.warning, card, text, 'warning on card');
        expectContrast(extra.onWarningContainer, extra.warningContainer, text, 'on warning container');
        expectContrast(scheme.error, background, text, 'error on background');
        expectContrast(scheme.onError, scheme.error, text, 'on error');
        expectContrast(scheme.onErrorContainer, scheme.errorContainer, text, 'on error container');
        expectContrast(extra.success, background, text, 'success on background');
      });

      test('snackbars and inverse surfaces', () {
        expectContrast(scheme.onInverseSurface, scheme.inverseSurface, text, 'snackbar text');
        expectContrast(scheme.inversePrimary, scheme.inverseSurface, text, 'snackbar action');
      });

      test('every label hue is readable (plan §12.2 tone table)', () {
        final brightness = scheme.brightness;
        for (final color in LabelColor.values) {
          final tones = LabelPalette.tones(color, brightness);
          expectContrast(tones.onBlock, tones.actualFill, text, '${color.key}: text on actual block');
          expectContrast(tones.accent, tones.plannedFill, text, '${color.key}: text on planned block');
          expectContrast(tones.accent, card, graphic, '${color.key}: edge/outline on card');
          expectContrast(tones.accent, tones.actualFill, graphic, '${color.key}: edge on actual block');
        }
      });
    });
  }

  test('the documented palette values ship unchanged', () {
    expect(AppTheme.lightScheme.primary, const Color(0xFFD99A22));
    expect(AppTheme.lightScheme.primaryContainer, const Color(0xFFF3D77A));
    expect(AppTheme.lightScheme.surface, const Color(0xFFFAF7EF));
    expect(AppTheme.lightScheme.surfaceContainerLow, const Color(0xFFFFFFFF));
    expect(AppTheme.lightScheme.onSurface, const Color(0xFF292720));
    expect(AppTheme.lightScheme.onSurfaceVariant, const Color(0xFF706B5F));
    expect(AppTheme.darkScheme.surface, const Color(0xFF211F1A));
    expect(AppTheme.darkScheme.surfaceContainerLow, const Color(0xFF2D2A23));
    expect(AppTheme.darkScheme.onSurface, const Color(0xFFF3F0E8));
    expect(AppTheme.darkScheme.onSurfaceVariant, const Color(0xFFBDB7A9));
  });

  test('unknown label color keys fall back to gray', () {
    expect(LabelColor.fromKey('teal'), LabelColor.teal);
    expect(LabelColor.fromKey('chartreuse'), LabelColor.gray);
    expect(LabelColor.fromKey(null), LabelColor.gray);
  });

  test('themes build and carry the Planyar extension', () {
    expect(AppTheme.light.extension<PlanyarColors>(), PlanyarColors.light);
    expect(AppTheme.dark.extension<PlanyarColors>(), PlanyarColors.dark);
    expect(AppTheme.light.colorScheme.brightness, Brightness.light);
    expect(AppTheme.dark.colorScheme.brightness, Brightness.dark);
  });
}
