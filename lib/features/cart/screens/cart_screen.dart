import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'My Cart'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(AppSpacing.containerPadding),
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(height: 24.h),
              itemBuilder: (context, index) => _buildCartItem(),
            ),
          ),
          _buildSummary(context),
        ],
      ),
    );
  }

  Widget _buildCartItem() {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(AppRadius.md),
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=2864&auto=format&fit=crop'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sabra Chair', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w700)),
                  Icon(Icons.delete_outline_rounded, color: Colors.red[400], size: 20.sp),
                ],
              ),
              SizedBox(height: 4.h),
              Text('Grey • Solid Wood', style: AppTextStyles.bodyMd),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$240.00', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w700, color: AppColors.primary)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.remove_rounded, size: 16.sp),
                        SizedBox(width: 12.w),
                        Text('1', style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold, color: AppColors.onSurface)),
                        SizedBox(width: 12.w),
                        Icon(Icons.add_rounded, size: 16.sp),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummary(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.containerPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5)),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadius.lg),
          topRight: Radius.circular(AppRadius.lg),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSummaryRow('Subtotal', '\$480.00'),
            SizedBox(height: 12.h),
            _buildSummaryRow('Delivery', '\$20.00'),
            SizedBox(height: 16.h),
            const Divider(),
            SizedBox(height: 16.h),
            _buildSummaryRow('Total', '\$500.00', isTotal: true),
            SizedBox(height: 24.h),
            AppButton(
              text: 'Checkout',
              onPressed: () => context.push(AppRouter.checkout),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal ? AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.w700) : AppTextStyles.bodyMd,
        ),
        Text(
          value,
          style: isTotal ? AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.w700, color: AppColors.primary) : AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
