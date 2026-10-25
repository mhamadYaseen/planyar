import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Material 3 light and dark themes built from the Warm Focus tokens
/// (plan §12). Platform fonts (D-31); tonal surfaces instead of shadows.
abstract final class AppTheme {
  static const _cardRadius = 16.0;

  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.gold,
    onPrimary: AppColors.ink,
    primaryContainer: AppColors.paleYellow,
    onPrimaryContainer: AppColors.ink,
    secondary: AppColors.goldInkLight,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.paleYellow,
    onSecondaryContainer: AppColors.ink,
    tertiary: AppColors.goldInkLight,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.paleYellow,
    onTertiaryContainer: AppColors.ink,
    error: AppColors.errorLight,
    onError: AppColors.white,
    errorContainer: AppColors.errorContainerLight,
    onErrorContainer: AppColors.onErrorContainerLight,
    surface: AppColors.ivory,
    onSurface: AppColors.ink,
    onSurfaceVariant: AppColors.inkSecondary,
    surfaceDim: Color(0xFFE8E3D7),
    surfaceBright: Color(0xFFFFFDF8),
    surfaceContainerLowest: AppColors.white,
    surfaceContainerLow: AppColors.white,
    surfaceContainer: Color(0xFFF4F0E6),
    surfaceContainerHigh: Color(0xFFEFEADF),
    surfaceContainerHighest: Color(0xFFE9E4D8),
    outline: AppColors.outlineLight,
    outlineVariant: AppColors.outlineVariantLight,
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF33302A),
    onInverseSurface: AppColors.paper,
    inversePrimary: AppColors.gold,
    surfaceTint: Color(0x00000000),
  );

  static const darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.gold,
    onPrimary: AppColors.charcoal,
    primaryContainer: AppColors.goldContainerDark,
    onPrimaryContainer: AppColors.paleYellow,
    secondary: AppColors.gold,
    onSecondary: AppColors.charcoal,
    secondaryContainer: AppColors.goldContainerDark,
    onSecondaryContainer: AppColors.paleYellow,
    tertiary: AppColors.gold,
    onTertiary: AppColors.charcoal,
    tertiaryContainer: AppColors.goldContainerDark,
    onTertiaryContainer: AppColors.paleYellow,
    error: AppColors.errorDark,
    onError: AppColors.onErrorDark,
    errorContainer: AppColors.errorContainerDark,
    onErrorContainer: AppColors.errorContainerLight,
    surface: AppColors.charcoal,
    onSurface: AppColors.paper,
    onSurfaceVariant: AppColors.paperSecondary,
    surfaceDim: AppColors.charcoal,
    surfaceBright: Color(0xFF3F3B33),
    surfaceContainerLowest: Color(0xFF1A1814),
    surfaceContainerLow: AppColors.charcoalCard,
    surfaceContainer: Color(0xFF322F27),
    surfaceContainerHigh: Color(0xFF3A362E),
    surfaceContainerHighest: Color(0xFF433F36),
    outline: AppColors.outlineDark,
    outlineVariant: AppColors.outlineVariantDark,
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: AppColors.paper,
    onInverseSurface: AppColors.ink,
    inversePrimary: AppColors.goldInkLight,
    surfaceTint: Color(0x00000000),
  );

  static ThemeData get light => _build(lightScheme, PlanyarColors.light);
  static ThemeData get dark => _build(darkScheme, PlanyarColors.dark);

  static ThemeData _build(ColorScheme scheme, PlanyarColors extra) {
    final goldInk = extra.goldInk;
    final cardShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(_cardRadius));

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      extensions: [extra],
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: cardShape.copyWith(side: BorderSide(color: scheme.outlineVariant)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(_cardRadius))),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: cardShape,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        indicatorColor: scheme.secondaryContainer,
        elevation: 0,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        indicatorColor: scheme.secondaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 1,
        focusElevation: 1,
        hoverElevation: 2,
        highlightElevation: 1,
      ),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: goldInk)),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: goldInk,
          side: BorderSide(color: scheme.outline),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: scheme.onSurfaceVariant)),
      chipTheme: ChipThemeData(
        shape: const StadiumBorder(),
        selectedColor: scheme.secondaryContainer,
        side: BorderSide(color: scheme.outlineVariant),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? goldInk : null),
        checkColor: WidgetStatePropertyAll(scheme.brightness == Brightness.light ? AppColors.white : scheme.onPrimary),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? goldInk : scheme.onSurfaceVariant,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: goldInk),
      tabBarTheme: TabBarThemeData(labelColor: goldInk, indicatorColor: goldInk),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: goldInk,
        selectionColor: scheme.primary.withValues(alpha: 0.35),
        selectionHandleColor: goldInk,
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: WidgetStateTextStyle.resolveWith(
          (states) => TextStyle(color: states.contains(WidgetState.error) ? scheme.error : goldInk),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: goldInk, width: 2),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      datePickerTheme: DatePickerThemeData(
        todayForegroundColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? scheme.onPrimary : goldInk,
        ),
        todayBorder: BorderSide(color: goldInk),
      ),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant, space: 1),
    );
  }
}
