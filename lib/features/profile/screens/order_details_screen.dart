import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_shadows.dart';
import '../../../routes/app_router.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const AppAppBar(title: 'Order Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildOrderHeader(isDark),
              SizedBox(height: 24.h),
              Text('ITEMS', style: AppTextStyles.labelSm.copyWith(color: Colors.grey, letterSpacing: 1.2)),
              SizedBox(height: 12.h),
              _buildOrderItem(
                isDark,
                name: 'Sabra Lounge Chair',
                color: 'Obsidian Black',
                price: 240.0,
                imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=200',
              ),
              SizedBox(height: 12.h),
              _buildOrderItem(
                isDark,
                name: 'Minimalist Stool',
                color: 'Oak Wood',
                price: 85.0,
                imageUrl: 'https://images.unsplash.com/photo-1503602642458-232111445657?w=200',
              ),
              SizedBox(height: 32.h),
              _buildSectionHeader('SHIPPING ADDRESS'),
              SizedBox(height: 12.h),
              _buildInfoCard(
                isDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alexander Graham', style: AppTextStyles.labelMd),
                    SizedBox(height: 4.h),
                    Text(
                      '4829 West Side Avenue\nSuite 302, Green District\nSan Francisco, CA 94105',
                      style: AppTextStyles.bodySm.copyWith(color: Colors.grey, height: 1.5),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              _buildSectionHeader('PAYMENT METHOD'),
              SizedBox(height: 12.h),
              _buildInfoCard(
                isDark,
                child: Row(
                  children: [
                    Icon(Icons.credit_card_rounded, size: 24.sp),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Visa **** 4291', style: AppTextStyles.labelMd),
                        Text('Alexander Graham', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              _buildSectionHeader('ORDER SUMMARY'),
              SizedBox(height: 12.h),
              _buildSummaryCard(isDark),
              SizedBox(height: 40.h),
              _buildActionButtons(context, isDark),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderHeader(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: $orderId', style: AppTextStyles.h3),
            Text('Placed on Oct 24, 2024', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            'DELIVERED',
            style: TextStyle(color: Colors.green, fontSize: 10.sp, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.labelSm.copyWith(color: Colors.grey, letterSpacing: 1.2, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildOrderItem(
    bool isDark, {
    required String name,
    required String color,
    required double price,
    required String imageUrl,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: AppShadows.soft,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(imageUrl, width: 64.w, height: 64.w, fit: BoxFit.cover),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.labelMd),
                Text(color, style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          Text('\$${price.toStringAsFixed(2)}', style: AppTextStyles.labelMd),
        ],
      ),
    );
  }

  Widget _buildInfoCard(bool isDark, {required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: AppShadows.soft,
      ),
      child: child,
    );
  }

  Widget _buildSummaryCard(bool isDark) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.grey[50],
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Column(
        children: [
          _buildSummaryRow('Subtotal', '\$325.00'),
          SizedBox(height: 12.h),
          _buildSummaryRow('Shipping', '\$25.00'),
          SizedBox(height: 12.h),
          _buildSummaryRow('Tax', '\$0.00'),
          SizedBox(height: 16.h),
          const Divider(),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppTextStyles.h2),
              Text('\$350.00', style: AppTextStyles.h2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodyMd.copyWith(color: Colors.grey)),
        Text(value, style: AppTextStyles.labelMd),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isDark) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 18.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
            ),
            child: Text('Reorder', style: AppTextStyles.labelLg.copyWith(color: Colors.white)),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => context.push(AppRouter.helpCenter),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 18.h),
              side: const BorderSide(color: Colors.black12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
            ),
            child: Text('Need Help?', style: AppTextStyles.labelLg.copyWith(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
