import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_router.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(context, Icons.home_outlined, Icons.home, currentIndex == 0, 0, AppRouter.home),
            _buildNavItem(context, Icons.favorite_outline, Icons.favorite, currentIndex == 1, 1, AppRouter.cart),
            _buildNavItem(context, Icons.notifications_none, Icons.notifications, currentIndex == 2, 2, AppRouter.notifications),
            _buildNavItem(context, Icons.person_outline, Icons.person, currentIndex == 3, 3, AppRouter.profile),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    IconData activeIcon,
    bool isSelected,
    int index,
    String route,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Custom label for the specific style in notifications.png
    String label = '';
    if (index == 0) label = 'Home';
    if (index == 1) label = 'Saved';
    if (index == 2) label = 'Inbox';
    if (index == 3) label = 'Profile';

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.go(route);
        }
      },
      child: isSelected
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isDark ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  activeIcon,
                  color: isDark ? Colors.black : Colors.white,
                  size: 24.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  label,
                  style: TextStyle(
                    color: isDark ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isDark ? Colors.white54 : Colors.black54,
                size: 24.sp,
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  color: isDark ? Colors.white54 : Colors.black54,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
    );
  }
}
