import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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

  List<String> get _categories {
    return ['All', ..._products.map((e) => e.category).toSet()];
  }

  // Mock data for search results
  final List<Product> _products = [
    const Product(
      id: '1',
      name: 'Modern Velvet Sofa',
      description: 'Velvet • Qty: 1',
      price: 540.0,
      isFavorite: true,
      imageUrl:
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?auto=format&fit=crop&w=800&q=80',
      category: 'Sofa',
    ),

    const Product(
      id: '2',
      name: 'Nordic Armchair',
      description: 'Oak • Qty: 1',
      price: 320.0,
      isFavorite: false,
      imageUrl:
          'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?auto=format&fit=crop&w=800&q=80',
      category: 'Chair',
    ),

    const Product(
      id: '3',
      name: 'Minimalist Table',
      description: 'Wood • Qty: 1',
      price: 450.0,
      isFavorite: true,
      imageUrl:
          'https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?auto=format&fit=crop&w=800&q=80',
      category: 'Table',
    ),

    const Product(
      id: '4',
      name: 'Bedside Lamp',
      description: 'Metal • Qty: 1',
      price: 85.0,
      isFavorite: false,
      imageUrl:
          'https://images.unsplash.com/photo-1519710164239-da123dc03ef4?auto=format&fit=crop&w=800&q=80',
      category: 'Lamp',
    ),

    const Product(
      id: '5',
      name: 'King Size Bed',
      description: 'Fabric • Qty: 1',
      price: 1200.0,
      isFavorite: true,
      imageUrl:
          'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=1200&q=80',
      category: 'Bed',
    ),

    const Product(
      id: '6',
      name: 'Office Chair',
      description: 'Ergonomic • Qty: 1',
      price: 280.0,
      isFavorite: false,
      imageUrl:
          'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?auto=format&fit=crop&w=800&q=80',
      category: 'Chair',
    ),

    const Product(
      id: '7',
      name: 'Luxury Sectional Sofa',
      description: 'Premium Fabric • Qty: 1',
      price: 1450.0,
      isFavorite: true,
      imageUrl:
          'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?auto=format&fit=crop&w=800&q=80',
      category: 'Sofa',
    ),

    const Product(
      id: '8',
      name: 'Round Dining Table',
      description: 'Walnut Wood • Qty: 1',
      price: 620.0,
      isFavorite: true,
      imageUrl:
          'https://images.unsplash.com/photo-1617104551722-3b2d51366400?auto=format&fit=crop&w=800&q=80',
      category: 'Dining',
    ),

    const Product(
      id: '9',
      name: 'Bookshelf Pro',
      description: '5 Shelves • Qty: 1',
      price: 350.0,
      isFavorite: false,
      imageUrl:
          'https://images.unsplash.com/photo-1505843513577-22bb7d21e455?auto=format&fit=crop&w=800&q=80',
      category: 'Storage',
    ),

    const Product(
      id: '10',
      name: 'Executive Desk',
      description: 'Solid Oak • Qty: 1',
      price: 780.0,
      isFavorite: true,
      imageUrl:
          'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?auto=format&fit=crop&w=800&q=80',
      category: 'Desk',
    ),

    const Product(
      id: '11',
      name: 'Accent Chair',
      description: 'Leather • Qty: 1',
      price: 390.0,
      isFavorite: false,
      imageUrl:
          'https://images.unsplash.com/photo-1519947486511-46149fa0a254?auto=format&fit=crop&w=800&q=80',
      category: 'Chair',
    ),

    const Product(
      id: '12',
      name: 'Floor Lamp',
      description: 'LED • Qty: 1',
      price: 120.0,
      isFavorite: true,
      imageUrl:
          'https://images.unsplash.com/photo-1540932239986-30128078f3c5?auto=format&fit=crop&w=800&q=80',
      category: 'Lamp',
    ),

    const Product(
      id: '13',
      name: 'TV Console',
      description: 'Walnut Finish • Qty: 1',
      price: 540.0,
      isFavorite: false,
      imageUrl:
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?auto=format&fit=crop&w=800&q=80',
      category: 'Storage',
    ),

    const Product(
      id: '14',
      name: 'Queen Size Bed',
      description: 'Premium Upholstery • Qty: 1',
      price: 980.0,
      isFavorite: true,
      imageUrl:
          'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?auto=format&fit=crop&w=800&q=80',
      category: 'Bed',
    ),

    const Product(
      id: '15',
      name: 'Nest Coffee Table',
      description: 'Modern Design • Qty: 1',
      price: 290.0,
      isFavorite: false,
      imageUrl:
          'https://images.unsplash.com/photo-1577140917170-285929fb55b7?auto=format&fit=crop&w=800&q=80',
      category: 'Table',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final filteredProducts = _selectedCategory == 'All'
        ? _products
        : _products.where((e) => e.category == _selectedCategory).toList();

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 6.h,
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
                        border: Border.all(
                          color: isDark ? Colors.white10 : Colors.black12,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.sp,
                        color: isDark ? Colors.white : Colors.black,
                      ),
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
                        border: Border.all(
                          color: isDark ? Colors.white10 : Colors.black12,
                        ),
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
                                hintStyle: AppTextStyles.bodyMd.copyWith(
                                  color: Colors.grey,
                                ),
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
                      border: Border.all(
                        color: isDark ? Colors.white10 : Colors.black12,
                      ),
                    ),
                    child: Icon(
                      Icons.tune,
                      size: 20.sp,
                      color: isDark ? Colors.white : Colors.black,
                    ),
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
                  children: _categories
                      .map((cat) => _buildCategoryChip(cat, isDark))
                      .toList(),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildAsymmetricGrid(context, isDark, filteredProducts),
                SizedBox(height: 120.h),
              ]),
            ),
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
          color: isSelected
              ? (isDark ? Colors.white : Colors.black)
              : (isDark ? AppColors.cardDark : Colors.white),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? (isDark ? Colors.white : Colors.black)
                : (isDark ? Colors.white10 : Colors.black12),
          ),
        ),
        child: Text(
          category,
          style: AppTextStyles.labelMd.copyWith(
            color: isSelected
                ? (isDark ? Colors.black : Colors.white)
                : (isDark ? Colors.white70 : Colors.black54),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Widget _buildAsymmetricGrid(BuildContext context, bool isDark) {
  //   return Column(
  //     children: [
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Expanded(
  //             flex: 3,
  //             child: _buildBentoItem(_products[0], 280.h, isDark),
  //           ),
  //           SizedBox(width: 16.w),
  //           Expanded(
  //             flex: 2,
  //             child: Column(
  //               children: [
  //                 _buildBentoItem(_products[1], 132.h, isDark),
  //                 SizedBox(height: 16.h),
  //                 _buildBentoItem(_products[2], 132.h, isDark),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(height: 16.h),
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Expanded(
  //             flex: 2,
  //             child: Column(
  //               children: [
  //                 _buildBentoItem(_products[3], 132.h, isDark),
  //                 SizedBox(height: 16.h),
  //                 _buildBentoItem(_products[4], 132.h, isDark),
  //               ],
  //             ),
  //           ),
  //           SizedBox(width: 16.w),
  //           Expanded(
  //             flex: 3,
  //             child: _buildBentoItem(_products[5], 280.h, isDark),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _buildAsymmetricGrid(
    BuildContext context,
    bool isDark,
    List<Product> products,
  ) {
    final List<Widget> rows = [];

    for (int i = 0; i < _products.length; i += 6) {
      final chunk = _products.skip(i).take(6).toList();

      if (chunk.length >= 6) {
        rows.add(
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildBentoItem(chunk[0], 280.h, isDark),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        _buildBentoItem(chunk[1], 132.h, isDark),
                        SizedBox(height: 16.h),
                        _buildBentoItem(chunk[2], 132.h, isDark),
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
                        _buildBentoItem(chunk[3], 132.h, isDark),
                        SizedBox(height: 16.h),
                        _buildBentoItem(chunk[4], 132.h, isDark),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    flex: 3,
                    child: _buildBentoItem(chunk[5], 280.h, isDark),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
            ],
          ),
        );
      } else {
        rows.add(
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chunk.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, index) {
              return _buildBentoItem(chunk[index], 250.h, isDark);
            },
          ),
        );
      }
    }

    return Column(children: rows);
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
                      Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 16.sp,
                        color: Colors.grey,
                      ),
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
