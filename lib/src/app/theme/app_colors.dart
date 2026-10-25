import 'package:material_ui/material_ui.dart';

/// "Warm Focus" color tokens (plan §12.2, D-42). The exact values ship;
/// `test/app/theme/app_theme_test.dart` checks their contrast.
///
/// Rule of thumb: **gold fills** large controls (filled buttons, FAB,
/// selected dates and chips); **gold ink** colours small marks on surfaces
/// (text, icons, checkboxes, progress, focus). Gold is never a large
/// background, and text on gold is always dark — white on gold fails.
abstract final class AppColors {
  // Shared
  static const gold = Color(0xFFD99A22);
  static const paleYellow = Color(0xFFF3D77A);

  // Light
  static const ivory = Color(0xFFFAF7EF);
  static const white = Color(0xFFFFFFFF);
  static const ink = Color(0xFF292720);
  static const inkSecondary = Color(0xFF706B5F);
  static const goldInkLight = Color(0xFF8A5D00);
  static const outlineLight = Color(0xFF8C8576);
  static const outlineVariantLight = Color(0xFFDDD7CA);
  static const warningLight = Color(0xFFA8470F);
  static const warningContainerLight = Color(0xFFFCE6D8);
  static const onWarningContainerLight = Color(0xFF4A1C00);
  static const errorLight = Color(0xFFB3261E);
  static const errorContainerLight = Color(0xFFF9DEDC);
  static const onErrorContainerLight = Color(0xFF410E0B);
  static const successLight = Color(0xFF3B6E37);
  static const successContainerLight = Color(0xFFDDEDD5);

  // Dark
  static const charcoal = Color(0xFF211F1A);
  static const charcoalCard = Color(0xFF2D2A23);
  static const paper = Color(0xFFF3F0E8);
  static const paperSecondary = Color(0xFFBDB7A9);
  static const goldContainerDark = Color(0xFF5A4310);
  static const outlineDark = Color(0xFF9A9384);
  static const outlineVariantDark = Color(0xFF4A463D);
  static const warningDark = Color(0xFFFFB083);
  static const warningContainerDark = Color(0xFF5C2A0E);
  static const onWarningContainerDark = Color(0xFFFFDBC8);
  static const errorDark = Color(0xFFF2B8B5);
  static const onErrorDark = Color(0xFF601410);
  static const errorContainerDark = Color(0xFF8C1D18);
  static const successDark = Color(0xFFA5D49C);
  static const successContainerDark = Color(0xFF29452A);
}

/// App-specific colors that `ColorScheme` has no slot for.
@immutable
final class PlanyarColors extends ThemeExtension<PlanyarColors> {
  const PlanyarColors({
    required this.goldInk,
    required this.warning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.success,
    required this.successContainer,
  });

  static const light = PlanyarColors(
    goldInk: AppColors.goldInkLight,
    warning: AppColors.warningLight,
    warningContainer: AppColors.warningContainerLight,
    onWarningContainer: AppColors.onWarningContainerLight,
    success: AppColors.successLight,
    successContainer: AppColors.successContainerLight,
  );

  static const dark = PlanyarColors(
    goldInk: AppColors.gold,
    warning: AppColors.warningDark,
    warningContainer: AppColors.warningContainerDark,
    onWarningContainer: AppColors.onWarningContainerDark,
    success: AppColors.successDark,
    successContainer: AppColors.successContainerDark,
  );

  /// Gold for text and icons on surfaces (darker in light mode for contrast).
  final Color goldInk;

  /// Burnt orange for overlaps and long-entry notes — never color alone.
  final Color warning;
  final Color warningContainer;
  final Color onWarningContainer;

  /// Completed tasks.
  final Color success;
  final Color successContainer;

  static PlanyarColors of(BuildContext context) => Theme.of(context).extension<PlanyarColors>()!;

  @override
  PlanyarColors copyWith({
    Color? goldInk,
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? success,
    Color? successContainer,
  }) => PlanyarColors(
    goldInk: goldInk ?? this.goldInk,
    warning: warning ?? this.warning,
    warningContainer: warningContainer ?? this.warningContainer,
    onWarningContainer: onWarningContainer ?? this.onWarningContainer,
    success: success ?? this.success,
    successContainer: successContainer ?? this.successContainer,
  );

  @override
  PlanyarColors lerp(PlanyarColors? other, double t) {
    if (other == null) return this;
    return PlanyarColors(
      goldInk: Color.lerp(goldInk, other.goldInk, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
    );
  }
}
