import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _allRead = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      // appBar: const AppAppBar(
      //   title: 'Modern Furniture',
      //   showCart: true,
      //   centerTitle: false,
      //   showBackButton: true,
      // ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isDark
            ? AppColors.backgroundDark
            : AppColors.backgroundLight,
            surfaceTintColor: Colors.transparent,
        title: Text(
          'Notifications',
          style: AppTextStyles.h3.copyWith(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _allRead = true;
              });
            },
            child: Text(
              'All read',
              style: AppTextStyles.labelMd.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('ORDER STATUS'),
            SizedBox(height: 12.h),
            _buildNotificationGroup(isDark, [
              NotificationItem(
                icon: Icons.local_shipping_outlined,
                iconColor: isDark ? Colors.white : Colors.black,
                iconBg: isDark ? Colors.white10 : const Color(0xFFF0F0F0),
                title: 'Order Out for Delivery',
                time: '2m ago',
                message:
                    'Your Nordic Oak Coffee Table is on the way! Our courier is expected to...',
                isUnread: !_allRead,
              ),
              NotificationItem(
                icon: Icons.inventory_2_outlined,
                iconColor: isDark ? Colors.white : Colors.black,
                iconBg: isDark ? Colors.white10 : const Color(0xFFF0F0F0),
                title: 'Payment Confirmed',
                time: '4h ago',
                message:
                    'Payment for Order #MF-8829 was successful. We are now preparing...',
                isUnread: false,
              ),
            ]),
            SizedBox(height: 32.h),
            _buildSectionHeader('PROMOTIONS'),
            SizedBox(height: 12.h),
            _buildNotificationGroup(isDark, [
              NotificationItem(
                icon: Icons.local_offer_outlined,
                iconColor: isDark ? Colors.white : Colors.black,
                iconBg: isDark ? Colors.white10 : const Color(0xFFF0F0F0),
                title: 'Flash Sale: 20% Off',
                time: '6h ago',
                message:
                    'Exclusive weekend offer! Get 20% off all Minimalist Collection seating...',
                isUnread: !_allRead,
                bannerImage:
                    'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?q=80&w=1000&auto=format&fit=crop',
                bannerText: 'Shop the Modern Collection',
              ),
            ]),
            SizedBox(height: 32.h),
            _buildSectionHeader('ACCOUNT SECURITY'),
            SizedBox(height: 12.h),
            _buildNotificationGroup(isDark, [
              NotificationItem(
                icon: Icons.shield_outlined,
                iconColor: const Color(0xFFD32F2F),
                iconBg: const Color(0xFFFFEBEE),
                title: 'New Login Detected',
                time: '1d ago',
                message:
                    'A new login was detected on a Chrome browser from London, UK. I...',
                isUnread: !_allRead,
              ),
            ]),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.labelMd.copyWith(
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurfaceVariant,
        fontSize: 12.sp,
      ),
    );
  }

  Widget _buildNotificationGroup(bool isDark, List<NotificationItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFEEEEEE),
        ),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              _buildNotificationTile(isDark, item),
              if (index < items.length - 1)
                Divider(
                  height: 1,
                  indent: 20.w,
                  endIndent: 20.w,
                  color: isDark ? Colors.white10 : const Color(0xFFEEEEEE),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNotificationTile(bool isDark, NotificationItem item) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: item.iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(item.icon, color: item.iconColor, size: 24.sp),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: AppTextStyles.labelLg.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          item.time,
                          style: AppTextStyles.labelSm.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            item.message,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodySm.copyWith(
                              color: AppColors.onSurfaceVariant,
                              height: 1.4,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        if (item.isUnread) ...[
                          SizedBox(width: 8.w),
                          Container(
                            width: 8.w,
                            height: 8.w,
                            margin: EdgeInsets.only(top: 6.h),
                            decoration: BoxDecoration(
                              color: isDark ? Colors.white : Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (item.bannerImage != null) ...[
            SizedBox(height: 16.h),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.network(
                    item.bannerImage!,
                    height: 160.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16.h,
                  left: 16.w,
                  child: Text(
                    item.bannerText ?? '',
                    style: AppTextStyles.labelMd.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      shadows: [
                        const Shadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class NotificationItem {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String time;
  final String message;
  final bool isUnread;
  final String? bannerImage;
  final String? bannerText;

  NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.time,
    required this.message,
    required this.isUnread,
    this.bannerImage,
    this.bannerText,
  });
}
