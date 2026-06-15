import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final notifications = [
      {
        'title': 'New Collection is here!',
        'message': 'Check out our latest minimalist furniture designs for your dream home.',
        'time': '2h ago',
        'type': 'promotion',
        'isUnread': true,
      },
      {
        'title': 'Order Shipped!',
        'message': 'Your order #TRX-8829 is on its way to your delivery address.',
        'time': '5h ago',
        'type': 'order',
        'isUnread': true,
      },
      {
        'title': 'Flash Sale Ending Soon',
        'message': 'Only 2 hours left to get 30% off on all lounge chairs. Don\'t miss out!',
        'time': 'Yesterday',
        'type': 'promotion',
        'isUnread': false,
      },
      {
        'title': 'Payment Successful',
        'message': 'Thank you for your purchase. We have received your payment for order #TRX-8829.',
        'time': '2 days ago',
        'type': 'order',
        'isUnread': false,
      },
    ];

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppAppBar(
        title: 'Notifications',
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all read',
              style: AppTextStyles.labelSm.copyWith(color: AppColors.primary),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: notifications.isEmpty
          ? _buildEmptyState(isDark)
          : ListView.separated(
              padding: EdgeInsets.all(AppSpacing.lg.w),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationItem(isDark, notification);
              },
            ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: isDark ? Colors.white10 : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.notifications_off_outlined, size: 48.sp, color: Colors.grey),
          ),
          SizedBox(height: 24.h),
          Text('No Notifications', style: AppTextStyles.h3),
          SizedBox(height: 8.h),
          Text(
            'We\'ll let you know when something\nimportant happens.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(bool isDark, Map<String, dynamic> notification) {
    final bool isUnread = notification['isUnread'] as bool;
    final String type = notification['type'] as String;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isUnread
            ? (isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF4F3F8))
            : (isDark ? AppColors.cardDark : AppColors.cardLight),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isUnread ? Colors.black12 : Colors.transparent,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: type == 'order' ? Colors.blue[50] : Colors.orange[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              type == 'order' ? Icons.shopping_bag_outlined : Icons.local_offer_outlined,
              size: 20.sp,
              color: type == 'order' ? Colors.blue[400] : Colors.orange[400],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification['title'] as String,
                      style: AppTextStyles.labelMd.copyWith(
                        fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    Text(
                      notification['time'] as String,
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  notification['message'] as String,
                  style: AppTextStyles.bodySm.copyWith(
                    color: isDark ? Colors.white70 : Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
