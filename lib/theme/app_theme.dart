import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
class AppTheme {
  static ThemeData get lightTheme => ThemeData(useMaterial3: true, brightness: Brightness.light, primaryColor: AppColors.primary, scaffoldBackgroundColor: AppColors.background, textTheme: TextTheme(headlineLarge: AppTextStyles.headlineXl, headlineMedium: AppTextStyles.headlineLg, headlineSmall: AppTextStyles.headlineMd, bodyLarge: AppTextStyles.bodyLg, bodyMedium: AppTextStyles.bodyMd, labelMedium: AppTextStyles.labelMd));
  static ThemeData get darkTheme => ThemeData(useMaterial3: true, brightness: Brightness.dark, primaryColor: AppColors.primary, scaffoldBackgroundColor: AppColors.backgroundDark);
}
