import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
import 'font_service.dart';

/// App theme configuration for Clubland
class AppTheme {
  /// Light theme configuration
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: FontService.getTextTheme(),
    fontFamily: FontService.getFontFamily(),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.lightColorScheme.surface,
      foregroundColor: AppColors.lightColorScheme.onSurface,
      titleTextStyle: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.lightColorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.lightColorScheme.onSurface),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      surfaceTintColor: AppColors.lightColorScheme.surface,
      shadowColor: AppColors.lightColorScheme.shadow.withValues(alpha: 0.1),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.lightColorScheme.primary,
        foregroundColor: AppColors.lightColorScheme.onPrimary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.lightColorScheme.primary,
        minimumSize: const Size(double.infinity, 56),
        side: BorderSide(color: AppColors.lightColorScheme.outline, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.lightColorScheme.primary,
        minimumSize: const Size.fromHeight(48),
        textStyle: AppTextStyles.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightColorScheme.surfaceContainerHighest.withValues(
        alpha: 0.3,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.lightColorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.lightColorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.lightColorScheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.lightColorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.lightColorScheme.error,
          width: 2,
        ),
      ),
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightColorScheme.onSurfaceVariant,
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightColorScheme.onSurfaceVariant.withValues(
          alpha: 0.6,
        ),
      ),
      errorStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.lightColorScheme.error,
      ),
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: AppColors.lightColorScheme.onSurface,
      size: 24,
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 4,
      backgroundColor: AppColors.lightColorScheme.primary,
      foregroundColor: AppColors.lightColorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 8,
      backgroundColor: AppColors.lightColorScheme.surface,
      selectedItemColor: AppColors.lightColorScheme.primary,
      unselectedItemColor: AppColors.lightColorScheme.onSurfaceVariant,
      selectedLabelStyle: AppTextStyles.labelSmall.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppTextStyles.labelSmall,
      type: BottomNavigationBarType.fixed,
    ),

    // Tab Bar Theme
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.lightColorScheme.primary,
      unselectedLabelColor: AppColors.lightColorScheme.onSurfaceVariant,
      labelStyle: AppTextStyles.labelLarge.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppTextStyles.labelLarge,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AppColors.lightColorScheme.primary,
          width: 3,
        ),
      ),
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightColorScheme.surfaceContainerHighest,
      labelStyle: AppTextStyles.labelMedium,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.lightColorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.lightColorScheme.onSurface,
      ),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightColorScheme.onSurfaceVariant,
      ),
    ),

    // Switch Theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightColorScheme.onPrimary;
        }
        return AppColors.lightColorScheme.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightColorScheme.primary;
        }
        return AppColors.lightColorScheme.surfaceContainerHighest;
      }),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.lightColorScheme.primary,
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColors.lightColorScheme.outline.withValues(alpha: 0.2),
      thickness: 1,
      space: 1,
    ),
  );

  /// Dark theme configuration
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: FontService.getTextTheme(brightness: Brightness.dark),
    fontFamily: FontService.getFontFamily(),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.darkColorScheme.surface,
      foregroundColor: AppColors.darkColorScheme.onSurface,
      titleTextStyle: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.darkColorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.darkColorScheme.onSurface),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppColors.darkColorScheme.surface,
      shadowColor: AppColors.darkColorScheme.shadow.withValues(alpha: 0.3),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.darkColorScheme.primary,
        foregroundColor: AppColors.darkColorScheme.onPrimary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkColorScheme.primary,
        minimumSize: const Size(double.infinity, 56),
        side: BorderSide(color: AppColors.darkColorScheme.outline, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkColorScheme.primary,
        minimumSize: const Size.fromHeight(48),
        textStyle: AppTextStyles.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkColorScheme.surfaceContainerHighest.withValues(
        alpha: 0.3,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.darkColorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.darkColorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.darkColorScheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.darkColorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.darkColorScheme.error,
          width: 2,
        ),
      ),
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkColorScheme.onSurfaceVariant,
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkColorScheme.onSurfaceVariant.withValues(
          alpha: 0.6,
        ),
      ),
      errorStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.darkColorScheme.error,
      ),
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: AppColors.darkColorScheme.onSurface,
      size: 24,
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 4,
      backgroundColor: AppColors.darkColorScheme.primary,
      foregroundColor: AppColors.darkColorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 8,
      backgroundColor: AppColors.darkColorScheme.surface,
      selectedItemColor: AppColors.darkColorScheme.primary,
      unselectedItemColor: AppColors.darkColorScheme.onSurfaceVariant,
      selectedLabelStyle: AppTextStyles.labelSmall.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppTextStyles.labelSmall,
      type: BottomNavigationBarType.fixed,
    ),

    // Tab Bar Theme
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.darkColorScheme.primary,
      unselectedLabelColor: AppColors.darkColorScheme.onSurfaceVariant,
      labelStyle: AppTextStyles.labelLarge.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppTextStyles.labelLarge,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AppColors.darkColorScheme.primary,
          width: 3,
        ),
      ),
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.darkColorScheme.surfaceContainerHighest,
      labelStyle: AppTextStyles.labelMedium,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkColorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.darkColorScheme.onSurface,
      ),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkColorScheme.onSurfaceVariant,
      ),
    ),

    // Switch Theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.darkColorScheme.onPrimary;
        }
        return AppColors.darkColorScheme.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.darkColorScheme.primary;
        }
        return AppColors.darkColorScheme.surfaceContainerHighest;
      }),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.darkColorScheme.primary,
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColors.darkColorScheme.outline.withValues(alpha: 0.2),
      thickness: 1,
      space: 1,
    ),
  );
}
