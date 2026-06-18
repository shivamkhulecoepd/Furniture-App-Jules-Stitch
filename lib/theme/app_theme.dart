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
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceContainerHighest: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        error: AppColors.error,
        onError: AppColors.onError,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        inverseSurface: AppColors.inverseSurface,
        onInverseSurface: AppColors.inverseOnSurface,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineXl,
        headlineMedium: AppTextStyles.headlineLg,
        headlineSmall: AppTextStyles.headlineMd,
        titleLarge: AppTextStyles.headlineSmall,
        bodyLarge: AppTextStyles.bodyLg,
        bodyMedium: AppTextStyles.bodyMd,
        bodySmall: AppTextStyles.bodySm,
        labelLarge: AppTextStyles.labelLg,
        labelMedium: AppTextStyles.labelMd,
        labelSmall: AppTextStyles.labelSm,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.onSurface),
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
        surface: AppColors.surfaceDark,
        onSurface: AppColors.onSurfaceDark,
        error: AppColors.error,
        onError: AppColors.onError,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineXl.copyWith(color: AppColors.onSurfaceDark),
        headlineMedium: AppTextStyles.headlineLg.copyWith(color: AppColors.onSurfaceDark),
        headlineSmall: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurfaceDark),
        titleLarge: AppTextStyles.headlineSmall.copyWith(color: AppColors.onSurfaceDark),
        bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceDark),
        bodyMedium: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceDark.withValues(alpha: 0.7)),
        bodySmall: AppTextStyles.bodySm.copyWith(color: AppColors.onSurfaceDark.withValues(alpha: 0.5)),
        labelLarge: AppTextStyles.labelLg.copyWith(color: AppColors.onSurfaceDark),
        labelMedium: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceDark.withValues(alpha: 0.5)),
        labelSmall: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceDark.withValues(alpha: 0.4)),
      ),
    );
  }
}
