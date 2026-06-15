import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
        onError: AppColors.onError,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineXl,
        headlineMedium: AppTextStyles.headlineLg,
        headlineSmall: AppTextStyles.headlineMd,
        bodyLarge: AppTextStyles.bodyLg,
        bodyMedium: AppTextStyles.bodyMd,
        labelMedium: AppTextStyles.labelMd,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.outlineVariant,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: Colors.white,
        onPrimary: AppColors.primary,
        surface: AppColors.surfaceContainerDark,
        onSurface: AppColors.onSurfaceDark,
        error: AppColors.error,
        onError: AppColors.onError,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineXl.copyWith(color: AppColors.onSurfaceDark),
        headlineMedium: AppTextStyles.headlineLg.copyWith(color: AppColors.onSurfaceDark),
        headlineSmall: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurfaceDark),
        bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceDark),
        bodyMedium: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceDark.withOpacity(0.7)),
        labelMedium: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceDark.withOpacity(0.5)),
      ),
    );
  }
}
