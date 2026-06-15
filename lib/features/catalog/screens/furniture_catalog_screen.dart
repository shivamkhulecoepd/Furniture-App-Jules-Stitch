import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart' hide AppSpacing;
import '../../../models/product.dart';
import '../widgets/product_card.dart';
import '../../../routes/app_router.dart';

class FurnitureCatalogScreen extends StatelessWidget {
  const FurnitureCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showBackButton: false,
        leading: Icon(Icons.grid_view_rounded, color: AppColors.primary, size: 24.sp),
        title: 'Elevate',
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_rounded, color: AppColors.primary, size: 24.sp),
            onPressed: () => context.push(AppRouter.notifications),
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: AppColors.primary, size: 24.sp),
            onPressed: () => context.push(AppRouter.cart),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _buildSearchBar(context),
            SizedBox(height: 32.h),
            _buildCategories(),
            SizedBox(height: 32.h),
            _buildSectionHeader('New Arrivals', () {}),
            SizedBox(height: 16.h),
            _buildProductGrid(context),
            SizedBox(height: 48.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.search),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(AppRadius.def),
        ),
        child: Row(
          children: [
            Icon(Icons.search_rounded, color: Colors.grey, size: 22.sp),
            SizedBox(width: 12.w),
            Text(
              'Search furniture...',
              style: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
            ),
            const Spacer(),
            Icon(Icons.tune_rounded, color: AppColors.primary, size: 22.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = ['All', 'Chairs', 'Sofas', 'Tables', 'Beds', 'Lamps'];
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.full),
              border: isSelected ? null : Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: AppTextStyles.labelMd.copyWith(
                  color: isSelected ? Colors.white : AppColors.onSurface,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.headlineMd.copyWith(fontSize: 22.sp)),
        TextButton(
          onPressed: onSeeAll,
          child: Text(
            'See All',
            style: AppTextStyles.labelMd.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
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
        imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=2864&auto=format&fit=crop',
        category: 'Chairs',
      ),
      const Product(
        id: '2',
        name: 'Velvet Sofa',
        description: 'Luxury comfort',
        price: 850.0,
        imageUrl: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?q=80&w=3870&auto=format&fit=crop',
        category: 'Sofas',
      ),
      const Product(
        id: '3',
        name: 'Wooden Table',
        description: 'Handcrafted oak',
        price: 420.0,
        imageUrl: 'https://images.unsplash.com/photo-1530018607912-eff2df114f11?q=80&w=3870&auto=format&fit=crop',
        category: 'Tables',
      ),
      const Product(
        id: '4',
        name: 'Minimal Lamp',
        description: 'Soft lighting',
        price: 85.0,
        imageUrl: 'https://images.unsplash.com/photo-1507473885765-e6ed657f89ad?q=80&w=3870&auto=format&fit=crop',
        category: 'Lamps',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
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
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: const Color(0xFFEEEEEE), width: 1)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home_rounded, true, () {}),
            _buildNavItem(Icons.favorite_outline_rounded, false, () => context.push(AppRouter.cart)),
            _buildNavItem(Icons.shopping_bag_outlined, false, () => context.push(AppRouter.cart)),
            _buildNavItem(Icons.person_outline_rounded, false, () => context.push(AppRouter.profile)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant.withOpacity(0.5),
            size: 26.sp,
          ),
          if (isSelected) ...[
            SizedBox(height: 6.h),
            Container(
              width: 5.w,
              height: 5.w,
              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            ),
          ],
        ],
      ),
    );
  }
}
