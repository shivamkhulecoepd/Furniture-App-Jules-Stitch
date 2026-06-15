import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_shadows.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final List<BoxShadow>? shadow;
  final Color? color;
  final Border? border;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.shadow,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: padding ?? EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color ?? (isDark ? AppColors.surfaceContainerDark : Colors.white),
        borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.md),
        boxShadow: shadow ?? (isDark ? [] : AppShadows.soft),
        border: border ?? (isDark ? null : Border.all(color: const Color(0xFFEEEEEE), width: 1)),
      ),
      child: child,
    );
  }
}
