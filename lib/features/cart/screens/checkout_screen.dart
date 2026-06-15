import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart' hide AppSpacing;
import '../../../routes/app_router.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Checkout'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Shipping Address', () => context.push(AppRouter.shippingAddresses)),
            SizedBox(height: 16.h),
            _buildAddressCard(),
            SizedBox(height: 32.h),
            _buildSectionHeader('Payment Method', () => context.push(AppRouter.paymentMethods)),
            SizedBox(height: 16.h),
            _buildPaymentCard(),
            SizedBox(height: 40.h),
            Text('Order Summary', style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: 20.h),
            _buildSummaryRow('Subtotal', '\$480.00'),
            SizedBox(height: 12.h),
            _buildSummaryRow('Delivery', '\$20.00'),
            SizedBox(height: 12.h),
            _buildSummaryRow('Tax', '\$0.00'),
            SizedBox(height: 20.h),
            const Divider(),
            SizedBox(height: 20.h),
            _buildSummaryRow('Total', '\$500.00', isTotal: true),
            SizedBox(height: 48.h),
            AppButton(
              text: 'Place Order',
              onPressed: () => context.go(AppRouter.orderSuccess),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onEdit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.w700)),
        GestureDetector(
          onTap: onEdit,
          child: Text(
            'Change',
            style: AppTextStyles.labelMd.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressCard() {
    return AppCard(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, shape: BoxShape.circle),
            child: Icon(Icons.location_on_rounded, color: AppColors.primary, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Home', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.bold)),
                Text(
                  '123 Furniture St, Design District\nNew York, NY 10001',
                  style: AppTextStyles.bodyMd,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard() {
    return AppCard(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, shape: BoxShape.circle),
            child: Icon(Icons.credit_card_rounded, color: AppColors.primary, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Visa **** 1234', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.bold)),
                Text('Expires 12/26', style: AppTextStyles.bodyMd),
              ],
            ),
          ),
          Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 20.sp),
        ],
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
