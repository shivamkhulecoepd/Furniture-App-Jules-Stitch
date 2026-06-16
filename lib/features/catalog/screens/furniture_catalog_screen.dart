import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../models/product.dart';
import '../widgets/product_card.dart';
import '../../../routes/app_router.dart';

class FurnitureCatalogScreen extends StatelessWidget {
  const FurnitureCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    _buildSubHeadline(),
                    SizedBox(height: 24.h),
                    _buildSearchBar(context),
                    SizedBox(height: 24.h),
                    _buildCategories(),
                    SizedBox(height: 32.h),
                    _buildProductGrid(context),
                    SizedBox(height: 48.h),
                    Text('Featured Deals', style: AppTextStyles.h3),
                    SizedBox(height: 16.h),
                    _buildFeaturedBanner(),
                    SizedBox(height: 48.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: AppColors.primary, size: 28.sp),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              SizedBox(width: 16.w),
              Text(
                'Modern Furniture',
                style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: AppColors.primary, size: 28.sp),
            onPressed: () => context.push(AppRouter.cart),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildSubHeadline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Modern Furniture',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
        Text(
          'for your house',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.normal,
            height: 1.1,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(32.r), // Match HTML rounded-lg = 2rem = 32px
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Icon(Icons.search, color: AppColors.onSurfaceVariant, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search furniture...',
                hintStyle: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                border: InputBorder.none,
              ),
              style: AppTextStyles.bodyLg,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: IconButton(
                icon: Icon(Icons.tune, color: AppColors.onPrimary, size: 20.sp),
                onPressed: () => context.push(AppRouter.category),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'name': 'All', 'icon': null},
      {'name': 'Chairs', 'icon': Icons.chair_outlined},
      {'name': 'Sofas', 'icon': Icons.weekend_outlined},
      {'name': 'Tables', 'icon': Icons.table_bar_outlined},
      {'name': 'Lamps', 'icon': Icons.light_outlined},
    ];
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        clipBehavior: Clip.none,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (categories[index]['icon'] != null) ...[
                  Icon(
                    categories[index]['icon'] as IconData,
                    color: isSelected ? AppColors.onPrimary.withValues(alpha: 0.8) : AppColors.onSurfaceVariant,
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                ],
                Text(
                  categories[index]['name'] as String,
                  style: AppTextStyles.labelMd.copyWith(
                    color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
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
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA3brSW9TCTCs55zAHqJC64w3K1fDYwzu0gW_Jd5ujN0nO3YvshBu2io2c3GMHFDfej1C9rBzNCvWfIN4TJCRrzbFPNQpHwm2GgvmvXrE_OGrh44W_vB6eliEIhANttGIaeFRiq-xAA_NNd8h5iXNP1Y6uoUCOeCL3VRfLo19X5YDHyF_7oI8zYRfb3HEWrQwdapFTfgTCk5dFjNfpjR4e3vsRkM6qso07G9oZHGPjS9ugqQtrKu0ORRL8XHNXggDnditM-r8-7Vvc',
        category: 'Chairs',
      ),
      const Product(
        id: '2',
        name: 'Sofa in Unique Style',
        description: 'Velvet Navy',
        price: 599.0,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAURdF3SlZdEKZZPzdkkP_cwi75KXWXiWo_-a8mX0lkTe8_3Uc-H9w8J9pBrx0FuyRssJwhy26jU0qssm_v_HrDniUprAMVFqdKEptIDdsrMng2qpTA78QBL2X6tZEzHYpxhBWsu1arF2LesbO75eki7Cnb_tm-eHkEP69hBb11hN15oRrgZ3_wK5ITpjdH1iwYeT7ahdFhxqEg-nMiyUbjiFnsykKLuNXihkotGJPmpsHrOyyWtP9feFxstbk3hXblw1hd869ZEgc',
        category: 'Sofas',
      ),
      const Product(
        id: '3',
        name: 'Modern Armchair',
        description: 'Charcoal Wool',
        price: 320.0,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBbSAAhmlcaqHyrQ07A6EI-jHR-UaAh0fQCloz474oKHZCczsyO9xzw8XVysZED-vi31zszSQSkMGrqa57zhdxWIagydYX6YH_k7w0qKDrb-hKzkMQBlDNDdIivE8HuyrhTSUgatzirR62-6O8ya-UwOOpFbSuJsGWdI5vFIqgUnbxVinDArAp-xQ3nwlmCx23IMxEidaL5naZu8lmmSLz4srgfRSat38db_4BpR8dg2s02mYRtBWGNvqxfw4oJqBrL1lz4JS14MI8',
        category: 'Chairs',
      ),
      const Product(
        id: '4',
        name: 'Marble Table',
        description: 'Italian Marble',
        price: 250.0,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAiV-n22WfhRBgk5c1vwVvMs7YRgynykPcOuzeevNY16dP7KynWxd3upCBd24CSJtKdNzBqZn1r8NbqLxy6zFvdYulY1x_SMgfNHJJzy6VIOCEN8A3HXK0bJMSJ1Znd0dGRPYmo47MFt-2ftv_4jcLVzi0ZtdR1wmmBPzxPvge6GhJhLw6vKcIWo3wTuzKXs9BcEUH2hrYbDDpPNq4m7pxNAFZbqHdp74RLP1UnHdBWCu1BS_Z-K23BqaOHGJAoe-WszHTtS2Ceyec',
        category: 'Tables',
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

  Widget _buildFeaturedBanner() {
    return Container(
      width: double.infinity,
      height: 192.h,
      decoration: BoxDecoration(
        color: AppColors.inverseSurface,
        borderRadius: BorderRadius.circular(32.r), // Match HTML rounded-lg = 32px
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
                  onPressed: () {},
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
}
