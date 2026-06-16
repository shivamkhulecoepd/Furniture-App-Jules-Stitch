import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';
import '../../../models/product.dart';
import '../widgets/product_card.dart';
import 'filter_sort_screen.dart';

class FurnitureCatalogScreen extends StatelessWidget {
  const FurnitureCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                _buildHeader(context, isDark),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),
                        _buildFeaturedBanner(context),
                        SizedBox(height: 32.h),
                        _buildCategories(context, isDark),
                        SizedBox(height: 32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Popular Products', style: AppTextStyles.h2),
                            GestureDetector(
                              onTap: () => context.push('/category/All'),
                              child: Text(
                                'View All',
                                style: AppTextStyles.labelMd.copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        _buildProductGrid(context),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomNav(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : Colors.grey[100],
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(Icons.menu_rounded, color: isDark ? Colors.white : Colors.black, size: 24.sp),
          ),
          const Spacer(),
          Column(
            children: [
              Text('Location', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
              Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.primary, size: 14.sp),
                  SizedBox(width: 4.w),
                  Text('San Francisco, CA', style: AppTextStyles.labelMd),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 18.sp),
                ],
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => context.push(AppRouter.cart),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : Colors.grey[100],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Badge(
                label: const Text('3'),
                backgroundColor: AppColors.primary,
                child: Icon(Icons.shopping_bag_outlined, color: isDark ? Colors.white : Colors.black, size: 24.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 192.h,
      decoration: BoxDecoration(
        color: AppColors.inverseSurface,
        borderRadius: BorderRadius.circular(32.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryFixed,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Text(
                    'NEW ARRIVAL',
                    style: TextStyle(
                      color: AppColors.onPrimaryFixed,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Sabra Chair 581n',
                  style: AppTextStyles.h3.copyWith(color: AppColors.onPrimary, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Limited edition collection',
                  style: AppTextStyles.bodyMd.copyWith(color: AppColors.onPrimary.withValues(alpha: 0.7)),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () => context.push('/category/Chairs'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                    elevation: 0,
                  ),
                  child: Text('View Shop', style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Positioned(
            right: -20.w,
            bottom: -20.h,
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAjhWE26nnqHFtIH6EXSPD70JmZCYiF5kSiGo7Fv5AbM3duJ2Mx8JNrLR7m5lzBlEZuGoB99bZQBtLB6m_k-FueJeHZWXl_DbSQE4J9XLaRlFSUGnq_N-KkTJLc6nSMhyKR-uAxiU5huT1NMvEN5DzIGApYwwxbpn8yeTEV4v8Ik7xbT00lNENqRMzViEPzPKiE79nWxJIkpuUADZSpPhLFTQnW7fAjnHIIoYAXkGclOolkeX3DvBJoPycLDObfo309mhJMvUs1kAw',
              height: 220.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context, bool isDark) {
    final categories = [
      {'name': 'All', 'icon': Icons.grid_view_rounded},
      {'name': 'Chairs', 'icon': Icons.chair_rounded},
      {'name': 'Sofa', 'icon': Icons.weekend_rounded},
      {'name': 'Table', 'icon': Icons.table_restaurant_rounded},
      {'name': 'Bed', 'icon': Icons.bed_rounded},
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories', style: AppTextStyles.h2),
            GestureDetector(
              onTap: () => _showFilterSheet(context),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.tune_rounded, size: 20.sp),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isAll = index == 0;
              return GestureDetector(
                onTap: () => context.push('/category/${cat['name']}'),
                child: Container(
                  width: 72.w,
                  margin: EdgeInsets.only(right: 16.w),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: isAll ? Colors.black : (isDark ? AppColors.surfaceDark : Colors.grey[100]),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          cat['icon'] as IconData,
                          color: isAll ? Colors.white : (isDark ? Colors.white70 : Colors.black54),
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        cat['name'] as String,
                        style: AppTextStyles.labelSm.copyWith(
                          color: isAll ? Colors.black : Colors.grey,
                          fontWeight: isAll ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    final products = [
      const Product(
        id: '1',
        name: 'Sabra Chair',
        description: 'Modern minimalist chair',
        price: 240.0,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAjhWE26nnqHFtIH6EXSPD70JmZCYiF5kSiGo7Fv5AbM3duJ2Mx8JNrLR7m5lzBlEZuGoB99bZQBtLB6m_k-FueJeHZWXl_DbSQE4J9XLaRlFSUGnq_N-KkTJLc6nSMhyKR-uAxiU5huT1NMvEN5DzIGApYwwxbpn8yeTEV4v8Ik7xbT00lNENqRMzViEPzPKiE79nWxJIkpuUADZSpPhLFTQnW7fAjnHIIoYAXkGclOolkeX3DvBJoPycLDObfo309mhJMvUs1kAw',
        category: 'Chairs',
      ),
      const Product(
        id: '2',
        name: 'Sleepover Arm',
        description: 'Comfortable armchair',
        price: 160.0,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC7zC2N952t7qT-m64BAnl6_2_7f9_A8i7K0jS10383792038475920384759203847592038475920384759203847592038475920',
        category: 'Chairs',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.62,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 24.h,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onTap: () => context.push('/product/${products[index].id}'),
        );
      },
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
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
            _buildNavItem(Icons.home, true, () {}),
            _buildNavItem(Icons.favorite_outline, false, () => context.push(AppRouter.cart)), // Favorites mock as Cart for now
            _buildNavItem(Icons.notifications_none, false, () => context.push(AppRouter.notifications)),
            _buildNavItem(Icons.person_outline, false, () => context.push(AppRouter.profile)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: isSelected
            ? BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)
            : null,
        child: Icon(
          icon,
          color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
          size: 24.sp,
        ),
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterSortScreen(),
    );
  }
}
