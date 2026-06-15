import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/app_error_state.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../controllers/product_controller.dart';
import '../../cart/controllers/cart_controller.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailsProvider(productId));

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: productAsync.when(
        data: (product) => product == null ? const Center(child: Text('Product not found')) : Column(
          children: [
            Expanded(child: CachedNetworkImage(imageUrl: product.imageUrl, fit: BoxFit.cover)),
            Padding(
              padding: EdgeInsets.all(AppSpacing.containerPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: AppTextStyles.headlineLg),
                  Text('\$${product.price}', style: AppTextStyles.headlineMd),
                  SizedBox(height: 24.h),
                  AppButton(
                    text: 'Add to Cart',
                    onPressed: () {
                      ref.read(cartProvider.notifier).addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () => const AppLoader(),
        error: (err, stack) => AppErrorState(onRetry: () => ref.refresh(productDetailsProvider(productId))),
      ),
    );
  }
}
