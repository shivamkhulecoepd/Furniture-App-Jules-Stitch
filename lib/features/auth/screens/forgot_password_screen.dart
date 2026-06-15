import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(showBackButton: true),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forgot Password', style: AppTextStyles.headlineLg),
            const SizedBox(height: 40),
            const AppTextField(label: 'Email Address', hintText: 'Enter your email'),
            const Spacer(),
            AppButton(text: 'Send Code', onPressed: () => context.push(AppRouter.otpVerification)),
          ],
        ),
      ),
    );
  }
}
