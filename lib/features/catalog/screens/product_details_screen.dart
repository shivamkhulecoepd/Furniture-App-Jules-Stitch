import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CircleAvatar(
            backgroundColor: Colors.white.withValues(alpha: 0.8),
            child: BackButton(color: Colors.black, onPressed: () => context.pop()),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha: 0.8),
              child: IconButton(
                icon: const Icon(Icons.favorite_border_rounded, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroImage(),
            Padding(
              padding: EdgeInsets.all(AppSpacing.md.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sabra Chair', style: AppTextStyles.h2),
                          SizedBox(height: 4.h),
                          Text('Modern Minimalist', style: AppTextStyles.bodyMd.copyWith(color: Colors.grey)),
                        ],
                      ),
                      Text(
                        '\$240.00',
                        style: AppTextStyles.h2.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  _buildRatingRow(context),
                  SizedBox(height: 32.h),
                  Text('Description', style: AppTextStyles.h4),
                  SizedBox(height: 12.h),
                  Text(
                    'The Sabra Chair features a minimalist silhouette with ergonomic support. Crafted with premium materials to ensure both style and durability for your living space.',
                    style: AppTextStyles.bodyMd.copyWith(height: 1.6, color: Colors.black87),
                  ),
                  SizedBox(height: 32.h),
                  _buildColorSelector(isDark),
                  SizedBox(height: 120.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomBar(context, isDark),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 480.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48.r),
          bottomRight: Radius.circular(48.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48.r),
          bottomRight: Radius.circular(48.r),
        ),
        child: CachedNetworkImage(
          imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=2864&auto=format&fit=crop',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRatingRow(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F3F8),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Icon(Icons.star_rounded, color: Colors.amber, size: 18.sp),
              SizedBox(width: 4.w),
              Text('4.8', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Text('(128 Reviews)', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
        const Spacer(),
        GestureDetector(
          onTap: () => context.push(AppRouter.reviews),
          child: Text(
            'Read All',
            style: AppTextStyles.labelSm.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColorSelector(bool isDark) {
    final colors = [Colors.black, Colors.brown[300]!, Colors.blueGrey[200]!];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available Colors', style: AppTextStyles.h4),
        SizedBox(height: 16.h),
        Row(
          children: List.generate(colors.length, (index) {
            final isSelected = index == 0;
            return Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
              ),
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor: colors[index],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context, bool isDark) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              padding: EdgeInsets.all(AppSpacing.sm.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]!),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.remove_rounded, size: 22.sp, color: Colors.black),
                  SizedBox(width: 16.w),
                  Text('1', style: AppTextStyles.labelLg.copyWith(color: Colors.black)),
                  SizedBox(width: 16.w),
                  Icon(Icons.add_rounded, size: 22.sp, color: Colors.black),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: AppButton(
                text: 'Add to Cart',
                onPressed: () => context.push(AppRouter.cart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
