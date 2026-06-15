import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app_jules_stitch/theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/app_spacing.dart';

enum AppButtonVariant { primary, secondary, outline, text }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width ?? double.infinity,
      height: 56.h,
      child: _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (variant) {
      case AppButtonVariant.primary:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDark ? Colors.white : AppColors.primary,
            foregroundColor: isDark ? AppColors.primary : Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full)),
          ),
          child: _buildContent(isDark ? AppColors.primary : Colors.white),
        );
      case AppButtonVariant.secondary:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDark ? AppColors.surfaceContainerDark : AppColors.surfaceContainerLow,
            foregroundColor: isDark ? Colors.white : AppColors.onSurface,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full)),
          ),
          child: _buildContent(isDark ? Colors.white : AppColors.onSurface),
        );
      case AppButtonVariant.outline:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: isDark ? AppColors.outlineVariant : AppColors.outline),
            foregroundColor: isDark ? Colors.white : AppColors.onSurface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full)),
          ),
          child: _buildContent(isDark ? Colors.white : AppColors.onSurface),
        );
      case AppButtonVariant.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: isDark ? Colors.white : AppColors.primary,
          ),
          child: _buildContent(isDark ? Colors.white : AppColors.primary),
        );
    }
  }

  Widget _buildContent(Color textColor) {
    if (isLoading) {
      return SizedBox(
        height: 20.h,
        width: 20.h,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20.sp),
          SizedBox(width: 8.w),
        ],
        Text(
          text,
          style: AppTextStyles.button.copyWith(color: textColor),
        ),
      ],
    );
  }
}
