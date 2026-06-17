import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../models/product.dart';
import '../widgets/product_card.dart';
import 'filter_sort_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  const CategoryScreen({super.key, required this.categoryName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final products = [
      const Product(
        id: '1',
        name: 'Sabra Chair',
        description: 'Modern minimalist chair',
        price: 240.0,
        imageUrl:
            'https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=2864&auto=format&fit=crop',
        category: 'Chairs',
      ),
      const Product(
        id: '5',
        name: 'Nordic Lounge',
        description: 'Classic nordic design',
        price: 310.0,
        imageUrl:
            'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?q=80&w=3870&auto=format&fit=crop',
        category: 'Chairs',
      ),
      const Product(
        id: '6',
        name: 'Eames Replica',
        description: 'Mid-century modern',
        price: 180.0,
        imageUrl:
            'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?q=80&w=3870&auto=format&fit=crop',
        category: 'Chairs',
      ),
      const Product(
        id: '7',
        name: 'Woven Stool',
        description: 'Natural texture',
        price: 95.0,
        imageUrl:
            'https://images.unsplash.com/photo-1503602642458-232111445657?q=80&w=3870&auto=format&fit=crop',
        category: 'Chairs',
      ),
    ];

    return Scaffold(
      appBar: AppAppBar(
        title: widget.categoryName,
        actions: [
          IconButton(
            icon: Icon(
              Icons.tune_rounded,
              color: AppColors.primary,
              size: 24.sp,
            ),
            onPressed: () => _showFilterSheet(context),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding),
        child: Column(
          children: [
            _buildSortInfo(),
            SizedBox(height: 24.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.52,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 24.h,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onTap: () => context.push('/product/${products[index].id}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '24 Items found',
          style: AppTextStyles.bodyMd.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.onSurface,
          ),
        ),
        Row(
          children: [
            Text('Sort by: ', style: AppTextStyles.bodyMd),
            Text(
              'Popular',
              style: AppTextStyles.bodyMd.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20.sp,
              color: AppColors.primary,
            ),
          ],
        ),
      ],
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
