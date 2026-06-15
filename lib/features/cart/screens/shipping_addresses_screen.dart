import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart' hide AppSpacing;

class ShippingAddressesScreen extends StatelessWidget {
  const ShippingAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Shipping Addresses'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(AppSpacing.containerPadding),
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) => _buildAddressItem(index == 0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.containerPadding),
            child: AppButton(
              text: 'Add New Address',
              variant: AppButtonVariant.outline,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildAddressItem(bool isDefault) {
    return AppCard(
      border: isDefault ? Border.all(color: AppColors.primary, width: 2) : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, shape: BoxShape.circle),
            child: Icon(Icons.location_on_rounded, color: AppColors.primary, size: 22.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(isDefault ? 'Home' : 'Office', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w700)),
                    if (isDefault) Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 20.sp),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  '123 Furniture St, Design District\nNew York, NY 10001',
                  style: AppTextStyles.bodyMd.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
