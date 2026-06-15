import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: AppTextStyles.headlineLg),
              const SizedBox(height: 40),
              const AppTextField(label: 'Full Name', hintText: 'Enter your name'),
              const SizedBox(height: 24),
              const AppTextField(label: 'Email Address', hintText: 'Enter your email'),
              const SizedBox(height: 24),
              const AppTextField(label: 'Password', hintText: 'Create a password', obscureText: true),
              const SizedBox(height: 32),
              AppButton(text: 'Sign Up', onPressed: () => context.push(AppRouter.otpVerification)),
            ],
          ),
        ),
      ),
    );
  }
}
