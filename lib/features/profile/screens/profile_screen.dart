import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'Profile',
        showBackButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.primary),
            onPressed: () => context.push(AppRouter.settings),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            _buildProfileHeader(),
            SizedBox(height: 40.h),
            _buildLoyaltyCard(context),
            SizedBox(height: 40.h),
            _buildMenuSection(context),
            SizedBox(height: 48.h),
            AppButton(
              text: 'Logout',
              variant: AppButtonVariant.outline,
              onPressed: () => context.go(AppRouter.login),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 54.r,
              backgroundColor: AppColors.surfaceContainerLow,
              backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=3744&auto=format&fit=crop'),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18.sp),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text('Jane Doe', style: AppTextStyles.headlineSmall.copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
        SizedBox(height: 4.h),
        Text('jane.doe@example.com', style: AppTextStyles.bodyMd),
      ],
    );
  }

  Widget _buildLoyaltyCard(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.loyaltyRewards),
      child: AppCard(
        color: AppColors.primary,
        borderRadius: AppRadius.md,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.stars_rounded, color: Colors.amber, size: 32.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gold Member', style: AppTextStyles.bodyLg.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                  Text('2,450 Points • 12 Orders', style: AppTextStyles.labelMd.copyWith(color: Colors.white.withOpacity(0.7))),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(Icons.person_outline_rounded, 'Edit Profile', () => context.push(AppRouter.editProfile)),
        _buildMenuItem(Icons.shopping_bag_outlined, 'My Orders', () => {}),
        _buildMenuItem(Icons.location_on_outlined, 'Shipping Addresses', () => context.push(AppRouter.shippingAddresses)),
        _buildMenuItem(Icons.payment_outlined, 'Payment Methods', () => context.push(AppRouter.paymentMethods)),
        _buildMenuItem(Icons.notifications_none_rounded, 'Notifications', () => context.push(AppRouter.notifications)),
        _buildMenuItem(Icons.help_outline_rounded, 'Help Center', () => context.push(AppRouter.helpCenter)),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Icon(icon, color: AppColors.primary, size: 22.sp),
        ),
        title: Text(title, style: AppTextStyles.bodyMd.copyWith(fontWeight: FontWeight.w600, color: AppColors.onSurface)),
        trailing: Icon(Icons.chevron_right_rounded, size: 20.sp, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
