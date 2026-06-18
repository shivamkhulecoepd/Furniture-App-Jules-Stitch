import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get headlineXl => GoogleFonts.plusJakartaSans(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    height: 40/32,
    letterSpacing: -0.02 * 32,
    color: AppColors.onSurface,
  );

  static TextStyle get headlineLg => GoogleFonts.plusJakartaSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    height: 32/24,
    letterSpacing: -0.01 * 24,
    color: AppColors.onSurface,
  );

  static TextStyle get headlineLgMobile => GoogleFonts.plusJakartaSans(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    height: 28/22,
    color: AppColors.onSurface,
  );

  static TextStyle get headlineMd => GoogleFonts.plusJakartaSans(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: 28/20,
    color: AppColors.onSurface,
  );

  static TextStyle get headlineSmall => GoogleFonts.plusJakartaSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.onSurface,
  );

  static TextStyle get bodyLg => GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 24/16,
    color: AppColors.onSurface,
  );

  static TextStyle get bodyMd => GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 20/14,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle get bodySm => GoogleFonts.plusJakartaSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle get labelMd => GoogleFonts.plusJakartaSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 16/12,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle get labelSm => labelMd.copyWith(fontSize: 11.sp);

  static TextStyle get button => GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  // Material 3 Aliases
  static TextStyle get h1 => headlineXl;
  static TextStyle get h2 => headlineLg;
  static TextStyle get h3 => headlineMd;
  static TextStyle get h4 => headlineSmall;
  static TextStyle get labelLg => bodyLg.copyWith(fontWeight: FontWeight.w600);
}
