import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_bottom_nav.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppAppBar(
        title: 'Profile',
        showBackButton: false,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: isDark ? Colors.white : Colors.black),
            onPressed: () => context.push(AppRouter.settings),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(AppSpacing.lg.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                _buildProfileHeader(isDark),
                SizedBox(height: 32.h),
                _buildLoyaltyCard(context, isDark),
                SizedBox(height: 32.h),
                _buildMenuSection(context, isDark),
                SizedBox(height: 48.h),
                AppButton(
                  text: 'Logout',
                  variant: AppButtonVariant.outline,
                  onPressed: () => context.go(AppRouter.login),
                ),
                SizedBox(height: 120.h),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const AppBottomNav(currentIndex: 3),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(bool isDark) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 54.r,
              backgroundColor: isDark ? AppColors.surfaceDark : Colors.grey[200],
              backgroundImage: const NetworkImage('https://i.pravatar.cc/300?u=Jane'),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18.sp),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text('Jane Doe', style: AppTextStyles.h2),
        SizedBox(height: 4.h),
        Text('jane.doe@example.com', style: AppTextStyles.bodyMd.copyWith(color: Colors.grey)),
      ],
    );
  }

  Widget _buildLoyaltyCard(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.loyalty),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.stars_rounded, color: Colors.amber, size: 32.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gold Member', style: AppTextStyles.labelLg.copyWith(color: Colors.white)),
                  Text('2,450 Points • 12 Orders', style: AppTextStyles.bodySm.copyWith(color: Colors.white70)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildMenuItem(isDark, Icons.person_outline_rounded, 'Edit Profile', () => context.push(AppRouter.editProfile)),
        _buildMenuItem(isDark, Icons.shopping_bag_outlined, 'My Orders', () => context.push(AppRouter.myOrders)),
        _buildMenuItem(isDark, Icons.location_on_outlined, 'Shipping Addresses', () => context.push(AppRouter.addresses)),
        _buildMenuItem(isDark, Icons.payment_outlined, 'Payment Methods', () => context.push(AppRouter.payments)),
        _buildMenuItem(isDark, Icons.notifications_none_rounded, 'Notifications', () => context.push(AppRouter.notifications)),
        _buildMenuItem(isDark, Icons.help_outline_rounded, 'Help Center', () => context.push(AppRouter.helpCenter)),
      ],
    );
  }

  Widget _buildMenuItem(bool isDark, IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        leading: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : Colors.grey[100],
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: isDark ? Colors.white : Colors.black, size: 22.sp),
        ),
        title: Text(title, style: AppTextStyles.labelMd),
        trailing: Icon(Icons.chevron_right_rounded, size: 20.sp, color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      ),
    );
  }
}
