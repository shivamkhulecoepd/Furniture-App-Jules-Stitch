import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../models/product.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showResults = false;

  final List<String> _recentSearches = [
    'Minimalist Chair',
    'Modern Sofa',
    'Wooden Table',
    'Lounge Chair',
  ];

  final List<Product> _searchResults = [
    const Product(
      id: '1',
      name: 'Minimal Chair',
      description: 'Oak & Cotton',
      price: 110.0,
      imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400',
      category: 'Chairs',
    ),
    const Product(
      id: '3',
      name: 'Modern Armchair',
      description: 'Charcoal Wool',
      price: 320.0,
      imageUrl: 'https://images.unsplash.com/photo-1530018607912-eff2df114f11?w=400',
      category: 'Chairs',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppAppBar(
        title: 'Search',
        actions: [
          IconButton(
            icon: Icon(Icons.tune_rounded, color: isDark ? Colors.white : Colors.black),
            onPressed: () {},
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.lg.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    setState(() => _showResults = true);
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search furniture...',
                  hintStyle: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20.sp),
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.close, size: 18.sp),
                          onPressed: () {
                            _controller.clear();
                            setState(() => _showResults = false);
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!_showResults) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Searches', style: AppTextStyles.labelLg),
                        TextButton(
                          onPressed: () {},
                          child: Text('Clear All', style: AppTextStyles.labelSm.copyWith(color: Colors.grey)),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: _recentSearches.map((tag) => _buildSearchTag(tag, isDark)).toList(),
                    ),
                    SizedBox(height: 40.h),
                    Text('Recommended for you', style: AppTextStyles.labelLg),
                    SizedBox(height: 16.h),
                    _buildRecommendationGrid(context),
                  ] else ...[
                    Text('Search Results', style: AppTextStyles.labelLg),
                    SizedBox(height: 16.h),
                    _buildResultsGrid(context),
                  ],
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTag(String text, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.grey[100],
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: AppTextStyles.bodyMd),
          SizedBox(width: 8.w),
          Icon(Icons.close, size: 14.sp, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildRecommendationGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _searchResults.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: _searchResults[index],
          onTap: () => context.push('/product/${_searchResults[index].id}'),
        );
      },
    );
  }

  Widget _buildResultsGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _searchResults.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: _searchResults[index],
          onTap: () => context.push('/product/${_searchResults[index].id}'),
        );
      },
    );
  }
}
