import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/app_error_state.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../widgets/product_card.dart';
import '../controllers/product_controller.dart';
import '../../../routes/app_router.dart';

class FurnitureCatalogScreen extends ConsumerWidget {
  const FurnitureCatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppAppBar(
        showBackButton: false,
        leading: const Icon(Icons.menu, color: AppColors.primary),
        title: 'Elevate',
        actions: [
          IconButton(icon: const Icon(Icons.shopping_bag_outlined), onPressed: () => context.push(AppRouter.cart)),
        ],
      ),
      body: productsAsync.when(
        data: (products) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildCategories(),
              SizedBox(height: 32.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
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
        loading: () => const AppLoader(),
        error: (err, stack) => AppErrorState(onRetry: () => ref.refresh(productsProvider)),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = ['All', 'Chairs', 'Sofas', 'Tables'];
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) => Chip(label: Text(categories[index])),
      ),
    );
  }
}
