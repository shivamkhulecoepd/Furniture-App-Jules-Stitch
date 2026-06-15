import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_shadows.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppAppBar(
        title: 'Track Order',
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, color: isDark ? Colors.white : Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildOrderSummaryCard(isDark),
              SizedBox(height: 24.h),
              _buildMapSection(isDark),
              SizedBox(height: 32.h),
              Text('ORDER TIMELINE', style: AppTextStyles.labelSm.copyWith(color: Colors.grey)),
              SizedBox(height: 16.h),
              _buildTimeline(isDark),
              SizedBox(height: 32.h),
              _buildAddressCard(isDark),
              SizedBox(height: 40.h),
              _buildContactButton(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummaryCard(bool isDark) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order ID', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
                  Text('#TRX-8829-102', style: AppTextStyles.h3),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text('In Transit', style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(),
          SizedBox(height: 16.h),
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.grey[100],
                backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1592078615290-033ee584e267?w=200'),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Eames Lounge Chair', style: AppTextStyles.labelMd),
                    Text('Qty: 1 • Color: Obsidian', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection(bool isDark) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(24.r),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1524661135-423995f22d0b?w=800'),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(Icons.location_on, color: Colors.black, size: 40.sp),
          ),
          Positioned(
            bottom: 16.h,
            left: 16.w,
            right: 16.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.local_shipping_outlined, size: 20.sp, color: Colors.black),
                  SizedBox(width: 12.w),
                  Text('Courier is 2.4 miles away', style: AppTextStyles.labelSm),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(bool isDark) {
    return Column(
      children: [
        _buildTimelineItem(
          'Order Placed',
          'Oct 24, 10:30 AM',
          isCompleted: true,
          isLast: false,
        ),
        _buildTimelineItem(
          'Processing',
          'Oct 24, 11:45 AM',
          isCompleted: true,
          isLast: false,
        ),
        _buildTimelineItem(
          'Shipped',
          'Oct 25, 09:15 AM',
          isCompleted: true,
          isLast: false,
        ),
        _buildTimelineItem(
          'In Transit',
          'Expected by Oct 27',
          description: 'Package has arrived at the local sorting facility.',
          isActive: true,
          isLast: false,
        ),
        _buildTimelineItem(
          'Delivered',
          'Pending',
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildTimelineItem(
    String title,
    String time, {
    String? description,
    bool isCompleted = false,
    bool isActive = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? Colors.black : Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: isCompleted
                    ? Icon(Icons.check, size: 14.sp, color: Colors.white)
                    : isActive
                        ? Center(
                            child: Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                            ),
                          )
                        : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: Colors.grey[300],
                  ),
                ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.labelMd),
                  Text(time, style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
                  if (description != null) ...[
                    SizedBox(height: 8.h),
                    Text(description, style: AppTextStyles.bodySm.copyWith(color: Colors.grey[600], height: 1.4)),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(bool isDark) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.grey[50],
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 20.sp, color: Colors.black),
              SizedBox(width: 8.w),
              Text('Shipping Address', style: AppTextStyles.labelMd),
            ],
          ),
          SizedBox(height: 12.h),
          Text('Jameson Montgomery', style: AppTextStyles.bodyMd),
          Text(
            '1200 Arlington Skyline Blvd, Suite 402\nArlington, VA 22201',
            style: AppTextStyles.bodySm.copyWith(color: Colors.grey, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.phone_outlined, color: Colors.white),
        label: const Text('Contact Courier', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
        ),
      ),
    );
  }
}
