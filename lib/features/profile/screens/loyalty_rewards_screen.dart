import 'package:flutter/material.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_colors.dart';

class LoyaltyRewardsScreen extends StatelessWidget {
  const LoyaltyRewardsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Loyalty & Rewards'),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Text('Points Balance', style: AppTextStyles.bodyMd.copyWith(color: Colors.white70)),
                  Text('2,450', style: AppTextStyles.headlineXl.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
