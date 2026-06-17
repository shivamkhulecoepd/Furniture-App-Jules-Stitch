


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_bottom_nav.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppAppBar(
        title: 'Modern Furniture',
        leading: IconButton(
          icon: Icon(Icons.menu, color: isDark ? Colors.white : Colors.black),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Text(
                  'Order History',
                  style: AppTextStyles.h1.copyWith(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Manage and track your previous purchases',
                  style: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatBox('Total Orders', '24', isDark),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _buildStatBox('Ongoing Delivery', '1', isDark),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                _buildOrderCard(
                  context: context,
                  isDark: isDark,
                  orderId: '#MF-82910',
                  date: 'October 12, 2023',
                  status: 'Delivered',
                  statusColor: const Color(0xFFE0E0E0),
                  productName: 'Nordic Velvet Armchair',
                  productDetails: 'Color: Carbon • Qty: 1',
                  price: '450.00',
                  imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=200',
                  itemCount: 1,
                  actionText: 'Reorder',
                ),
                SizedBox(height: 16.h),
                _buildOrderCard(
                  context: context,
                  isDark: isDark,
                  orderId: '#MF-82745',
                  date: 'September 28, 2023',
                  status: 'Cancelled',
                  statusColor: const Color(0xFFFFEBEE),
                  statusTextColor: const Color(0xFFD32F2F),
                  productName: 'Modul Oak Study Desk',
                  productDetails: 'Size: Large • Qty: 1',
                  price: '890.00',
                  imageUrl: 'https://images.unsplash.com/photo-1530018607912-eff2df114f11?w=200',
                  itemCount: 1,
                  actionText: 'Details',
                  isSecondaryAction: true,
                ),
                SizedBox(height: 16.h),
                _buildOrderCard(
                  context: context,
                  isDark: isDark,
                  orderId: '#MF-81200',
                  date: 'August 05, 2023',
                  status: 'Delivered',
                  statusColor: const Color(0xFFE0E0E0),
                  productName: 'Lighting Collection & More',
                  productDetails: 'Bundle • Qty: 3',
                  price: '1,240.00',
                  imageUrl: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=200',
                  itemCount: 3,
                  actionText: 'Reorder',
                  extraItems: 2,
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

  Widget _buildStatBox(String title, String value, bool isDark) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(color: isDark ? Colors.white10 : const Color(0xFFF0F0F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.labelSm.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: AppTextStyles.h2.copyWith(fontSize: 24.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required BuildContext context,
    required bool isDark,
    required String orderId,
    required String date,
    required String status,
    required Color statusColor,
    Color? statusTextColor,
    required String productName,
    required String productDetails,
    required String price,
    required String imageUrl,
    required int itemCount,
    required String actionText,
    bool isSecondaryAction = false,
    int extraItems = 0,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(color: isDark ? Colors.white10 : const Color(0xFFF0F0F0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: $orderId',
                    style: AppTextStyles.bodySm.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    date,
                    style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white10 : statusColor,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.labelSm.copyWith(
                    color: isDark ? Colors.white70 : (statusTextColor ?? Colors.black54),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          const Divider(height: 1),
          SizedBox(height: 20.h),
          Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.network(
                      imageUrl,
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (extraItems > 0)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Text(
                          '+$extraItems',
                          style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      productDetails,
                      style: AppTextStyles.bodySm.copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '\$$price',
                      style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          const Divider(height: 1),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.inventory_2_outlined, size: 16.sp, color: Colors.grey),
                  SizedBox(width: 8.w),
                  Text(
                    '$itemCount Item${itemCount > 1 ? "s" : ""} Total',
                    style: AppTextStyles.bodySm.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              if (isSecondaryAction)
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
                    side: const BorderSide(color: Colors.black12),
                  ),
                  child: Text(
                    actionText,
                    style: AppTextStyles.labelMd.copyWith(color: isDark ? Colors.white : Colors.black),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.white : Colors.black,
                    foregroundColor: isDark ? Colors.black : Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
                  ),
                  child: Text(
                    actionText,
                    style: AppTextStyles.labelMd,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
