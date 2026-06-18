import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_text_styles.dart';

class AppErrorState extends StatelessWidget {
  final String title;
  final String message;
  final String? errorCode;
  final String? errorDetail;
  final VoidCallback onRetry;
  final VoidCallback? onSecondaryAction;
  final String secondaryActionTitle;

  const AppErrorState({
    super.key,
    this.title = 'Payment Failed',
    this.message = 'We couldn’t process your transaction. Please verify your details.',
    this.errorCode = 'ERR_3902',
    this.errorDetail = 'Card Authorization Timeout',
    required this.onRetry,
    this.onSecondaryAction,
    this.secondaryActionTitle = 'Change Payment',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        margin: EdgeInsets.all(24.w),
        padding: EdgeInsets.all(32.w),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2F3034) : Colors.white,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(color: Colors.red[50], shape: BoxShape.circle),
              child: Icon(Icons.warning_amber_rounded, color: Colors.red[400], size: 32.sp),
            ),
            SizedBox(height: 24.h),
            Text(title, style: AppTextStyles.h3),
            SizedBox(height: 8.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMd.copyWith(color: Colors.grey, height: 1.5),
            ),
            if (errorCode != null) ...[
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: isDark ? Colors.black26 : Colors.grey[100],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ERROR CODE', style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
                        Text(errorDetail!, style: AppTextStyles.bodySm),
                      ],
                    ),
                    Text(errorCode!, style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
                  ],
                ),
              ),
            ],
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
                ),
                child: const Text('Try Again', style: TextStyle(color: Colors.white)),
              ),
            ),
            if (onSecondaryAction != null) ...[
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onSecondaryAction,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
                  ),
                  child: Text(secondaryActionTitle, style: const TextStyle(color: Colors.black)),
                ),
              ),
            ],
            SizedBox(height: 16.h),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel Transaction', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
