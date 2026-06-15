import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart' hide AppSpacing;

class LoyaltyRewardsScreen extends StatelessWidget {
  const LoyaltyRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Loyalty & Rewards'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          children: [
            _buildPointsCard(),
            SizedBox(height: 32.h),
            _buildTierProgress(),
            SizedBox(height: 40.h),
            _buildRewardsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsCard() {
    return AppCard(
      color: AppColors.primary,
      borderRadius: AppRadius.md,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Text('Available Points', style: AppTextStyles.bodyMd.copyWith(color: Colors.white70)),
          SizedBox(height: 12.h),
          Text('2,450', style: AppTextStyles.headlineXl.copyWith(color: Colors.white, fontSize: 40.sp)),
          SizedBox(height: 32.h),
          const Divider(color: Colors.white24),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPointsStat('Orders', '12'),
              _buildPointsStat('Reviews', '5'),
              _buildPointsStat('Years', '2'),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildPointsStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.headlineMd.copyWith(color: Colors.white)),
        SizedBox(height: 4.h),
        Text(label, style: AppTextStyles.labelMd.copyWith(color: Colors.white54)),
      ],
    );
  }

  Widget _buildTierProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Gold Tier', style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.w700)),
            Text('Platinum at 5,000', style: AppTextStyles.labelMd),
          ],
        ),
        SizedBox(height: 16.h),
        Stack(
          children: [
            Container(
              height: 12.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.49,
              child: Container(
                height: 12.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.primary, Colors.grey]),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRewardsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available Rewards', style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.w700)),
        SizedBox(height: 24.h),
        _buildRewardItem('10% Off Coupon', 'Redeem for 1,000 points', Icons.local_offer_rounded),
        _buildRewardItem('Free Shipping', 'Redeem for 500 points', Icons.local_shipping_rounded),
        _buildRewardItem('\$20 Gift Card', 'Redeem for 2,500 points', Icons.card_giftcard_rounded),
      ],
    );
  }

  Widget _buildRewardItem(String title, String subtitle, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: AppCard(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadius.sm)),
              child: Icon(icon, color: AppColors.primary),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodyMd.copyWith(fontWeight: FontWeight.bold, color: AppColors.onSurface)),
                  Text(subtitle, style: AppTextStyles.labelMd),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Redeem', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
