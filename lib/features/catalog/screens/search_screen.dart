import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_colors.dart';
import '../../../models/product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _selectedCategory = 'All';

  final List<String> _categories = ['All', 'Sofa', 'Chair', 'Table', 'Bed', 'Lamp'];

  // Mock data for search results
  final List<Product> _products = [
    const Product(
      id: '1',
      name: 'Modern Velvet Sofa',
      description: 'Velvet • Qty: 1',
      price: 540.0,
      imageUrl: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
      category: 'Sofa',
    ),
    const Product(
      id: '2',
      name: 'Nordic Armchair',
      description: 'Oak • Qty: 1',
      price: 320.0,
      imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400',
      category: 'Chair',
    ),
    const Product(
      id: '3',
      name: 'Minimalist Table',
      description: 'Wood • Qty: 1',
      price: 450.0,
      imageUrl: 'https://images.unsplash.com/photo-1530018607912-eff2df114f11?w=400',
      category: 'Table',
    ),
    const Product(
      id: '4',
      name: 'Bedside Lamp',
      description: 'Metal • Qty: 1',
      price: 85.0,
      imageUrl: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=400',
      category: 'Lamp',
    ),
    const Product(
      id: '5',
      name: 'King Size Bed',
      description: 'Fabric • Qty: 1',
      price: 1200.0,
      imageUrl: 'https://images.unsplash.com/photo-1505693419173-42b9256a0ecc?w=400',
      category: 'Bed',
    ),
    const Product(
      id: '6',
      name: 'Office Chair',
      description: 'Ergonomic • Qty: 1',
      price: 280.0,
      imageUrl: 'https://images.unsplash.com/photo-1505843490538-5133c6c7d0e1?w=400',
      category: 'Chair',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 20.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.cardDark : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: isDark ? Colors.white10 : Colors.black12),
                          ),
                          child: Icon(Icons.arrow_back, size: 20.sp, color: isDark ? Colors.white : Colors.black),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.cardDark : Colors.white,
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(color: isDark ? Colors.white10 : Colors.black12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey, size: 20.sp),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    hintText: 'Search furniture',
                                    hintStyle: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.cardDark : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: isDark ? Colors.white10 : Colors.black12),
                        ),
                        child: Icon(Icons.tune, size: 20.sp, color: isDark ? Colors.white : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: _categories.map((cat) => _buildCategoryChip(cat, isDark)).toList(),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildAsymmetricGrid(context, isDark),
                    SizedBox(height: 120.h),
                  ]),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const AppBottomNav(currentIndex: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category, bool isDark) {
    final isSelected = _selectedCategory == category;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = category),
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? (isDark ? Colors.white : Colors.black) : (isDark ? AppColors.cardDark : Colors.white),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? (isDark ? Colors.white : Colors.black) : (isDark ? Colors.white10 : Colors.black12),
          ),
        ),
        child: Text(
          category,
          style: AppTextStyles.labelMd.copyWith(
            color: isSelected ? (isDark ? Colors.black : Colors.white) : (isDark ? Colors.white70 : Colors.black54),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildAsymmetricGrid(BuildContext context, bool isDark) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: _buildBentoItem(_products[0], 280.h, isDark),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildBentoItem(_products[1], 132.h, isDark),
                  SizedBox(height: 16.h),
                  _buildBentoItem(_products[2], 132.h, isDark),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildBentoItem(_products[3], 132.h, isDark),
                  SizedBox(height: 16.h),
                  _buildBentoItem(_products[4], 132.h, isDark),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 3,
              child: _buildBentoItem(_products[5], 280.h, isDark),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBentoItem(Product product, double height, bool isDark) {
    return GestureDetector(
      onTap: () => context.push('/product/${product.id}'),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.labelMd.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(0)}',
                        style: AppTextStyles.labelSm.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.favorite_border, size: 16.sp, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
