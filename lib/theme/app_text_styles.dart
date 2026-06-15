import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTextStyles {
  static TextStyle get headlineXl => GoogleFonts.plusJakartaSans(fontSize: 32.sp, fontWeight: FontWeight.w700);
  static TextStyle get headlineLg => GoogleFonts.plusJakartaSans(fontSize: 24.sp, fontWeight: FontWeight.w600);
  static TextStyle get headlineMd => GoogleFonts.plusJakartaSans(fontSize: 20.sp, fontWeight: FontWeight.w600);
  static TextStyle get headlineSmall => GoogleFonts.plusJakartaSans(fontSize: 18.sp, fontWeight: FontWeight.w600);
  static TextStyle get bodyLg => GoogleFonts.plusJakartaSans(fontSize: 16.sp, fontWeight: FontWeight.w400);
  static TextStyle get bodyMd => GoogleFonts.plusJakartaSans(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static TextStyle get labelMd => GoogleFonts.plusJakartaSans(fontSize: 12.sp, fontWeight: FontWeight.w500);
  static TextStyle get button => GoogleFonts.plusJakartaSans(fontSize: 15.sp, fontWeight: FontWeight.w600);
}
