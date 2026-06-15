import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                padding: EdgeInsets.all(32.w),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF4F3F8),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 80.sp,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Success!',
                style: AppTextStyles.h1.copyWith(fontSize: 36.sp),
              ),
              SizedBox(height: 12.h),
              Text(
                'Your order has been placed successfully.\nWe will notify you once it ships.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMd.copyWith(color: Colors.grey, height: 1.6),
              ),
              SizedBox(height: 48.h),
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.cardDark : AppColors.cardLight,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Order ID', '#TRX-8829-102', isDark),
                    SizedBox(height: 16.h),
                    _buildDetailRow('Total Amount', r'\$560.50', isDark),
                    SizedBox(height: 16.h),
                    _buildDetailRow('Estimated Delivery', 'Oct 27, 2024', isDark),
                  ],
                ),
              ),
              const Spacer(),
              AppButton(
                text: 'Track My Order',
                onPressed: () => context.push(AppRouter.trackOrder),
              ),
              SizedBox(height: 16.h),
              AppButton(
                text: 'Back to Shop',
                variant: AppButtonVariant.outline,
                onPressed: () => context.go(AppRouter.catalog),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
        Text(
          value,
          style: AppTextStyles.labelMd.copyWith(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
