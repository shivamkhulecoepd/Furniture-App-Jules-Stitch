import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app_jules_stitch/features/catalog/screens/furniture_catalog_screen.dart';
import 'package:furniture_app_jules_stitch/features/catalog/screens/search_screen.dart';
import 'package:furniture_app_jules_stitch/features/profile/screens/notifications_screen.dart';
import 'package:furniture_app_jules_stitch/features/profile/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_router.dart';

class AppBottomNav extends StatefulWidget {
  final int currentIndex;

  const AppBottomNav({super.key, required this.currentIndex});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {

  final List<Widget> _pages = [
    const FurnitureCatalogScreen(), // Home
    const SearchScreen(), // Categories
    const NotificationsScreen(), // Cart
    const ProfileScreen(), // Profile
  ];
  
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
            _buildNavItem(
              context,
              CupertinoIcons.home,
              CupertinoIcons.home,
              widget.currentIndex == 0,
              0,
              AppRouter.home,
            ),
            _buildNavItem(
              context,
              CupertinoIcons.heart,
              CupertinoIcons.heart,
              widget.currentIndex == 1,
              1,
              AppRouter.cart,
            ),
            _buildNavItem(
              context,
              CupertinoIcons.bell,
              CupertinoIcons.bell,
              widget.currentIndex == 2,
              2,
              AppRouter.notifications,
            ),
            _buildNavItem(
              context,
              CupertinoIcons.person,
              CupertinoIcons.person,
              widget.currentIndex == 3,
              3,
              AppRouter.profile,
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildNavItem(
  //   BuildContext context,
  //   IconData icon,
  //   IconData activeIcon,
  //   bool isSelected,
  //   int index,
  //   String route,
  // ) {
  //   final isDark = Theme.of(context).brightness == Brightness.dark;

  //   // Custom label for the specific style in notifications.png
  //   String label = '';
  //   if (index == 0) label = 'Home';
  //   if (index == 1) label = 'Saved';
  //   if (index == 2) label = 'Inbox';
  //   if (index == 3) label = 'Profile';

  //   return GestureDetector(
  //     onTap: () {
  //       if (!isSelected) {
  //         context.go(route);
  //       }
  //     },
  //     child: isSelected
  //       ? Container(
  //           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  //           decoration: BoxDecoration(
  //             color: isDark ? Colors.white : Colors.black,
  //             borderRadius: BorderRadius.circular(100.r),
  //           ),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Icon(
  //                 activeIcon,
  //                 color: isDark ? Colors.black : Colors.white,
  //                 size: 24.sp,
  //               ),
  //               SizedBox(width: 8.w),
  //               Text(
  //                 label,
  //                 style: TextStyle(
  //                   color: isDark ? Colors.black : Colors.white,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 14.sp,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       : Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Icon(
  //               icon,
  //               color: isDark ? Colors.white54 : Colors.black54,
  //               size: 24.sp,
  //             ),
  //             SizedBox(height: 4.h),
  //             Text(
  //               label,
  //               style: TextStyle(
  //                 color: isDark ? Colors.white54 : Colors.black54,
  //                 fontSize: 12.sp,
  //               ),
  //             ),
  //           ],
  //         ),
  //   );
  // }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    IconData activeIcon,
    bool isSelected,
    int index,
    String route,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.go(route);
        }
      },
      child: isSelected
          ? Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: isDark ? Colors.white : Colors.black,
                shape: BoxShape.circle,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    activeIcon,
                    color: isDark ? Colors.black : Colors.white,
                    size: 24.sp,
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
              ],
            ),
    );
  }
}
