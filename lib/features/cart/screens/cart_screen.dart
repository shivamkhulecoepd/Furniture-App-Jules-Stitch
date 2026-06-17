import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_shadows.dart';
import '../../../routes/app_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppAppBar(
        title: 'Cart',
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_outline_rounded,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                left: AppSpacing.md.w,
                right: AppSpacing.md.w,
                top: AppSpacing.md.h,
                bottom: MediaQuery.of(context).padding.bottom + AppSpacing.md.h,
              ),
              children: [
                _buildCartItem(
                  isDark,
                  name: 'Minimal Chair',
                  color: 'Dark Gray Color',
                  price: 110.0,
                  imageUrl:
                      'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=200',
                  quantity: 1,
                ),
                _buildCartItem(
                  isDark,
                  name: 'Sleepover Arm',
                  color: 'Navy Blue',
                  price: 160.0,
                  imageUrl:
                      'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=200',
                  quantity: 1,
                ),
                _buildCartItem(
                  isDark,
                  name: 'Boogy Wool',
                  color: 'Cream White',
                  price: 220.5,
                  imageUrl:
                      'https://images.unsplash.com/photo-1530018607912-eff2df114f11?w=200',
                  quantity: 2,
                ),
                _buildCartItem(
                  isDark,
                  name: 'Minimal Chair',
                  color: 'Dark Gray Color',
                  price: 110.0,
                  imageUrl:
                      'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=200',
                  quantity: 1,
                ),
                _buildCartItem(
                  isDark,
                  name: 'Sleepover Arm',
                  color: 'Navy Blue',
                  price: 160.0,
                  imageUrl:
                      'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=200',
                  quantity: 1,
                ),
                _buildCartItem(
                  isDark,
                  name: 'Boogy Wool',
                  color: 'Cream White',
                  price: 220.5,
                  imageUrl:
                      'https://images.unsplash.com/photo-1530018607912-eff2df114f11?w=200',
                  quantity: 2,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildOrderInfo(context, isDark),
    );
  }

  Widget _buildCartItem(
    bool isDark, {
    required String name,
    required String color,
    required double price,
    required String imageUrl,
    required int quantity,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 8.w, top: 10.h, bottom: 10.h),
      margin: EdgeInsets.only(bottom: AppSpacing.md.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: AppShadows.soft,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
              imageUrl,
              width: 90.w,
              height: 90.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 90.w,
                height: 90.w,
                color: Colors.grey[300],
                child: Icon(
                  Icons.broken_image_rounded,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.labelMd),
                Text(
                  color,
                  style: AppTextStyles.bodySm.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 8.h),
                Text(
                  '\$${price.toStringAsFixed(1)}',
                  style: AppTextStyles.labelLg,
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_rounded, size: 20.sp, color: Colors.grey),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(quantity.toString(), style: AppTextStyles.labelMd),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_rounded,
                  size: 20.sp,
                  color: Colors.grey,
                ),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderInfo(BuildContext context, bool isDark) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: 14.h,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Order Information', style: AppTextStyles.labelLg),
          SizedBox(height: 14.h),
          _buildInfoRow('Subtotal', '\$560.5'),
          SizedBox(height: 10.h),
          _buildInfoRow('Shipping cost', '\$70'),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppTextStyles.h2),
              Text('\$630.5', style: AppTextStyles.h2),
            ],
          ),
          SizedBox(height: 22.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.push(AppRouter.checkout),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 18.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.r),
                ),
              ),
              child: Text(
                'Confirm order',
                style: AppTextStyles.labelLg.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodyMd.copyWith(color: Colors.grey)),
        Text(value, style: AppTextStyles.labelMd),
      ],
    );
  }
}
