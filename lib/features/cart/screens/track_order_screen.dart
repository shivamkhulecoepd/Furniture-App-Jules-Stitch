import 'package:flutter/material.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart' hide AppSpacing;

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Track Order'),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          children: [
            _buildStep('Order Placed', 'Your order has been received', true),
            _buildStep('Processing', 'Your order is being prepared', true),
            _buildStep('On the way', 'Your order is with the courier', false),
            _buildStep('Delivered', 'Order arrived at destination', false),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String title, String subtitle, bool isCompleted) {
    return Row(
      children: [
        Column(children: [
          Icon(isCompleted ? Icons.check_circle : Icons.radio_button_unchecked, color: isCompleted ? AppColors.success : Colors.grey),
          Container(width: 2, height: 40, color: Colors.grey[300]),
        ]),
        const SizedBox(width: 16),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ]),
      ],
    );
  }
}
