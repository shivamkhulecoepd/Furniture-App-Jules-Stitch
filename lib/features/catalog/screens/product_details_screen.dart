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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: BackButton(color: AppColors.primary),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.favorite_border_rounded, color: AppColors.primary),
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
              padding: EdgeInsets.all(AppSpacing.containerPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sabra Chair', style: AppTextStyles.headlineLg.copyWith(fontSize: 26.sp)),
                          SizedBox(height: 4.h),
                          Text('Chairs', style: AppTextStyles.bodyMd),
                        ],
                      ),
                      Text(
                        '\$240.00',
                        style: AppTextStyles.headlineMd.copyWith(
                          color: AppColors.primary,
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  _buildRatingRow(),
                  SizedBox(height: 32.h),
                  Text('Description', style: AppTextStyles.headlineSmall.copyWith(fontSize: 18.sp)),
                  SizedBox(height: 12.h),
                  Text(
                    'The Sabra Chair features a minimalist silhouette with ergonomic support. Crafted with premium materials to ensure both style and durability for your living space.',
                    style: AppTextStyles.bodyMd.copyWith(height: 1.6),
                  ),
                  SizedBox(height: 32.h),
                  _buildColorSelector(),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomBar(context),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 480.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppRadius.xl),
          bottomRight: Radius.circular(AppRadius.xl),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppRadius.xl),
          bottomRight: Radius.circular(AppRadius.xl),
        ),
        child: CachedNetworkImage(
          imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=2864&auto=format&fit=crop',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: Row(
            children: [
              Icon(Icons.star_rounded, color: Colors.amber, size: 18.sp),
              SizedBox(width: 4.w),
              Text('4.8', style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold, color: AppColors.onSurface)),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Text('(128 Reviews)', style: AppTextStyles.labelMd),
        const Spacer(),
        Text(
          'Read All',
          style: AppTextStyles.labelMd.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget _buildColorSelector() {
    final colors = [AppColors.primary, Colors.brown[300]!, Colors.blueGrey[200]!];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available Colors', style: AppTextStyles.headlineSmall.copyWith(fontSize: 18.sp)),
        SizedBox(height: 16.h),
        Row(
          children: List.generate(colors.length, (index) {
            final isSelected = index == 0;
            return Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
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

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.containerPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFEEEEEE)),
                borderRadius: BorderRadius.circular(AppRadius.def),
              ),
              child: Row(
                children: [
                  Icon(Icons.remove_rounded, size: 22.sp),
                  SizedBox(width: 16.w),
                  Text('1', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(width: 16.w),
                  Icon(Icons.add_rounded, size: 22.sp),
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
