import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_shadows.dart';

class ShippingAddressesScreen extends StatelessWidget {
  const ShippingAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppAppBar(
        title: 'Saved Addresses',
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md.w,
                vertical: 16.h,
              ),
              children: [
                _buildAddressCard(
                  isDark,
                  name: 'Alexander Graham',
                  address:
                      '4829 West Side Avenue\nSuite 302, Green District\nSan Francisco, CA 94105',
                  phone: '+1 (555) 012-3456',
                  isDefault: true,
                ),
                SizedBox(height: 16.h),
                _buildAddressCard(
                  isDark,
                  name: 'Office - Design Studio',
                  address:
                      '901 Mission Street\nThe Hub, 4th Floor\nSan Francisco, CA 94103',
                  phone: '+1 (555) 987-6543',
                ),
                SizedBox(height: 16.h),
                _buildAddressCard(
                  isDark,
                  name: 'Vacation Home',
                  address:
                      '120 High Ridge Road\nAspen Heights\nAspen, CO 81611',
                  phone: '+1 (555) 222-3333',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSpacing.md.w),
        child: _buildAddButton(),
      ),
    );
  }

  Widget _buildAddressCard(
    bool isDark, {
    required String name,
    required String address,
    required String phone,
    bool isDefault = false,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: AppTextStyles.labelLg),
              if (isDefault)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    'DEFAULT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            address,
            style: AppTextStyles.bodyMd.copyWith(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Icon(Icons.phone_outlined, size: 16.sp, color: Colors.grey),
              SizedBox(width: 8.w),
              Text(
                phone,
                style: AppTextStyles.bodySm.copyWith(color: Colors.grey),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  size: 20.sp,
                  color: Colors.grey[700],
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              SizedBox(width: 16.w),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outline,
                  size: 20.sp,
                  color: Colors.red[300],
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add New Address',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
