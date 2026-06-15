import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppAppBar(showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome Back', style: AppTextStyles.headlineLg),
              const SizedBox(height: 40),
              const AppTextField(label: 'Email Address', hintText: 'Enter your email'),
              const SizedBox(height: 24),
              const AppTextField(label: 'Password', hintText: 'Enter your password', obscureText: true),
              const SizedBox(height: 32),
              AppButton(text: 'Login', onPressed: () => context.go(AppRouter.home)),
            ],
          ),
        ),
      ),
    );
  }
}
