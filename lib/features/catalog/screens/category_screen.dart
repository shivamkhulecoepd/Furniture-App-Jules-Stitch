import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../models/product.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
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
        id: '5',
        name: 'Nordic Lounge',
        description: 'Classic nordic design',
        price: 310.0,
        imageUrl: 'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?q=80&w=3870&auto=format&fit=crop',
        category: 'Chairs',
      ),
      const Product(
        id: '6',
        name: 'Eames Replica',
        description: 'Mid-century modern',
        price: 180.0,
        imageUrl: 'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?q=80&w=3870&auto=format&fit=crop',
        category: 'Chairs',
      ),
      const Product(
        id: '7',
        name: 'Woven Stool',
        description: 'Natural texture',
        price: 95.0,
        imageUrl: 'https://images.unsplash.com/photo-1503602642458-232111445657?q=80&w=3870&auto=format&fit=crop',
        category: 'Chairs',
      ),
    ];

    return Scaffold(
      appBar: AppAppBar(
        title: categoryName,
        actions: [
          IconButton(
            icon: Icon(Icons.tune_rounded, color: AppColors.primary, size: 24.sp),
            onPressed: () => _showFilterSheet(context),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
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
          style: AppTextStyles.bodyMd.copyWith(fontWeight: FontWeight.w600, color: AppColors.onSurface),
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
            Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp, color: AppColors.primary),
          ],
        ),
      ],
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      builder: (context) => const FilterSheet(),
    );
  }
}

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.containerPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filter & Sort', style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.bold)),
              Text(
                'Reset All',
                style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Text('Sort By', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 16.h),
          _buildChoiceChips(['Popular', 'Newest', 'Price: Low to High', 'Price: High to Low']),
          SizedBox(height: 32.h),
          Text('Price Range', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.bold)),
          RangeSlider(
            values: const RangeValues(100, 1000),
            min: 0,
            max: 2000,
            activeColor: AppColors.primary,
            onChanged: (v) {},
          ),
          SizedBox(height: 32.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full)),
              ),
              child: const Text('Apply Filter', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildChoiceChips(List<String> labels) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: labels.map((label) => ChoiceChip(
        label: Text(label),
        selected: label == 'Popular',
        onSelected: (v) {},
        backgroundColor: Colors.white,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(color: label == 'Popular' ? Colors.white : AppColors.onSurface),
        shape: StadiumBorder(side: BorderSide(color: label == 'Popular' ? AppColors.primary : const Color(0xFFEEEEEE))),
      )).toList(),
    );
  }
}
