import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_shadows.dart';
import '../../../models/product.dart';
import '../widgets/product_card.dart';
import '../../../routes/app_router.dart';

class FurnitureCatalogScreen extends StatelessWidget {
  const FurnitureCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        showBackButton: false,
        title: 'Modern Furniture',
        subtitle: 'for your house',
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 24.sp),
            onPressed: () => context.push(AppRouter.cart),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            _buildSearchBar(context),
            SizedBox(height: 32.h),
            _buildCategories(),
            SizedBox(height: 32.h),
            _buildProductGrid(context),
            SizedBox(height: 32.h),
            Text('Featured Deals', style: AppTextStyles.h3),
            SizedBox(height: 16.h),
            _buildFeaturedBanner(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey, size: 20.sp),
                SizedBox(width: 12.w),
                Text('Search furniture...', style: AppTextStyles.bodyMd.copyWith(color: Colors.grey)),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.tune, color: Colors.white, size: 20.sp),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'name': 'All', 'icon': null},
      {'name': 'Chairs', 'icon': Icons.chair_outlined},
      {'name': 'Sofas', 'icon': Icons.weekend_outlined},
    ];
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Row(
              children: [
                if (categories[index]['icon'] != null) ...[
                  Icon(
                    categories[index]['icon'] as IconData,
                    color: Colors.grey,
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                ],
                Text(
                  categories[index]['name'] as String,
                  style: AppTextStyles.labelMd.copyWith(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    final products = [
      const Product(
        id: '1',
        name: 'Minimal Chair',
        description: 'Oak & Cotton',
        price: 110.0,
        imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400',
        category: 'Chairs',
      ),
      const Product(
        id: '2',
        name: 'Sofa in Unique Style',
        description: 'Velvet Navy',
        price: 599.0,
        imageUrl: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
        category: 'Sofas',
      ),
      const Product(
        id: '3',
        name: 'Modern Armchair',
        description: 'Charcoal Wool',
        price: 320.0,
        imageUrl: 'https://images.unsplash.com/photo-1530018607912-eff2df114f11?w=400',
        category: 'Chairs',
      ),
      const Product(
        id: '4',
        name: 'Marble Table',
        description: 'Italian Marble',
        price: 250.0,
        imageUrl: 'https://images.unsplash.com/photo-1507473885765-e6ed657f89ad?w=400',
        category: 'Tables',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onTap: () => context.push('/product/${products[index].id}'),
        );
      },
    );
  }

  Widget _buildFeaturedBanner() {
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        color: const Color(0xFF2F3034),
        borderRadius: BorderRadius.circular(32.r),
      ),
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
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Text(
                    'NEW ARRIVAL',
                    style: TextStyle(color: Colors.white, fontSize: 8.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Sabra Chair 581n',
                  style: AppTextStyles.h3.copyWith(color: Colors.white),
                ),
                Text(
                  'Limited edition collection',
                  style: AppTextStyles.bodySm.copyWith(color: Colors.white70),
                ),
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Text(
                    'View Shop',
                    style: AppTextStyles.labelSm.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            bottom: -20,
            child: Image.network(
              'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400',
              height: 160.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: AppShadows.bottomNav,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home_filled, true, () {}),
            _buildNavItem(Icons.favorite_outline, false, () {}),
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
            ? const BoxDecoration(color: Colors.black, shape: BoxShape.circle)
            : null,
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 24.sp,
        ),
      ),
    );
  }
}
