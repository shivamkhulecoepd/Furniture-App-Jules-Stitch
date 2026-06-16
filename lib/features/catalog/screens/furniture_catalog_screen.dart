import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../routes/app_router.dart';
import '../widgets/product_card.dart';
import '../../../models/product.dart';
import 'filter_sort_screen.dart';
import '../../../shared/widgets/app_bottom_nav.dart';

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
            SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, isDark),
                  SizedBox(height: 24.h),
                  _buildFeaturedBanner(context),
                  SizedBox(height: 32.h),
                  _buildCategories(context, isDark),
                  SizedBox(height: 32.h),
                  Text('Popular Furniture', style: AppTextStyles.h2),
                  SizedBox(height: 16.h),
                  _buildProductGrid(context),
                  SizedBox(height: 100.h), // Space for bottom nav
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: const AppBottomNav(currentIndex: 0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery to', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
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
              'https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=1000&auto=format&fit=crop',
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
        imageUrl: 'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?q=80&w=1000&auto=format&fit=crop',
        category: 'Chairs',
      ),
      const Product(
        id: '2',
        name: 'Sleepover Arm',
        description: 'Comfortable armchair',
        price: 160.0,
        imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=1000&auto=format&fit=crop',
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

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterSortScreen(),
    );
  }
}
