import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Payment Methods'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(AppSpacing.containerPadding),
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) => _buildPaymentItem(index == 0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.containerPadding),
            child: AppButton(
              text: 'Add New Card',
              variant: AppButtonVariant.outline,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(bool isDefault) {
    return AppCard(
      border: isDefault ? Border.all(color: AppColors.primary, width: 2) : null,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, shape: BoxShape.circle),
            child: Icon(Icons.credit_card_rounded, color: AppColors.primary, size: 22.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Visa **** 1234', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w700)),
                Text('Expires 12/26', style: AppTextStyles.bodyMd),
              ],
            ),
          ),
          if (isDefault) Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 20.sp),
        ],
      ),
    );
  }
}
