import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_colors.dart';

class App extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const App({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context,
                  CupertinoIcons.home,
                  CupertinoIcons.home,
                  currentIndex == 0,
                  0,
                  navigationShell,
                ),
                _buildNavItem(
                  context,
                  CupertinoIcons.search,
                  CupertinoIcons.search,
                  currentIndex == 1,
                  1,
                  navigationShell,
                ),
                _buildNavItem(
                  context,
                  CupertinoIcons.bell,
                  CupertinoIcons.bell_fill,
                  currentIndex == 2,
                  2,
                  navigationShell,
                ),
                _buildNavItem(
                  context,
                  CupertinoIcons.person,
                  CupertinoIcons.person_fill,
                  currentIndex == 3,
                  3,
                  navigationShell,
                ),
              ],
            ),
          ),
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
    StatefulNavigationShell navigationShell,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          navigationShell.goBranch(index);
        }
      },
      child: isSelected
          ? Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: isDark ? Colors.white : Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                activeIcon,
                color: isDark ? Colors.black : Colors.white,
                size: 24.sp,
              ),
            )
          : Icon(
              icon,
              color: isDark ? Colors.white54 : Colors.black54,
              size: 24.sp,
            ),
    );
  }
}
