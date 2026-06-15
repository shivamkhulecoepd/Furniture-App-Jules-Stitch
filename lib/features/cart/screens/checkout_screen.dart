import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Checkout'),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          children: [
            const ListTile(title: Text('Shipping Address'), subtitle: Text('123 Main St, NY')),
            const ListTile(title: Text('Payment Method'), subtitle: Text('Visa **** 1234')),
            const Spacer(),
            AppButton(text: 'Place Order', onPressed: () => context.go(AppRouter.orderSuccess)),
          ],
        ),
      ),
    );
  }
}
