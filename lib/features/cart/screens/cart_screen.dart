import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    return Scaffold(
      appBar: const AppAppBar(title: 'My Cart'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(AppSpacing.containerPadding),
              itemCount: cartState.items.length,
              itemBuilder: (context, index) {
                final item = cartState.items[index];
                return ListTile(
                  title: Text(item.product.name),
                  subtitle: Text('\$${item.product.price} x ${item.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => ref.read(cartProvider.notifier).removeFromCart(item.product.id),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppSpacing.containerPadding),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Total'), Text('\$${cartState.total}')]),
                const SizedBox(height: 24),
                AppButton(text: 'Checkout', onPressed: cartState.items.isEmpty ? null : () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
