import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_text_styles.dart';

enum AppButtonVariant { filled, outline, ghost }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    ButtonStyle style;
    TextStyle textStyle;

    switch (variant) {
      case AppButtonVariant.filled:
        style = ElevatedButton.styleFrom(
          backgroundColor: isDark ? Colors.white : Colors.black,
          foregroundColor: isDark ? Colors.black : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 24.w),
        );
        textStyle = AppTextStyles.button.copyWith(color: isDark ? Colors.black : Colors.white);
        break;
      case AppButtonVariant.outline:
        style = OutlinedButton.styleFrom(
          side: BorderSide(color: isDark ? Colors.white24 : Colors.black12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 24.w),
        );
        textStyle = AppTextStyles.button.copyWith(color: isDark ? Colors.white : Colors.black);
        break;
      case AppButtonVariant.ghost:
        style = TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 24.w),
        );
        textStyle = AppTextStyles.button.copyWith(color: isDark ? Colors.white : Colors.black);
        break;
    }

    Widget content = isLoading
        ? SizedBox(
            height: 20.h,
            width: 20.h,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                variant == AppButtonVariant.filled ? (isDark ? Colors.black : Colors.white) : (isDark ? Colors.white : Colors.black),
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20.sp),
                SizedBox(width: 8.w),
              ],
              Text(text, style: textStyle),
            ],
          );

    return SizedBox(
      width: double.infinity,
      child: variant == AppButtonVariant.outline
          ? OutlinedButton(onPressed: isLoading ? null : onPressed, style: style, child: content)
          : variant == AppButtonVariant.ghost
              ? TextButton(onPressed: isLoading ? null : onPressed, style: style, child: content)
              : ElevatedButton(onPressed: isLoading ? null : onPressed, style: style, child: content),
    );
  }
}
