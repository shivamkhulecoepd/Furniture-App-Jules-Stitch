import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text('Welcome Back', style: AppTextStyles.headlineLg.copyWith(fontSize: 28.sp)),
              SizedBox(height: 8.h),
              Text(
                'Please enter your details to sign in',
                style: AppTextStyles.bodyMd,
              ),
              SizedBox(height: 48.h),
              const AppTextField(
                label: 'Email Address',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              AppTextField(
                label: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, size: 20.sp, color: Colors.grey),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push(AppRouter.forgotPassword),
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              AppButton(
                text: 'Login',
                onPressed: () => context.go(AppRouter.home),
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text('OR', style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 32.h),
              AppButton(
                text: 'Continue with Google',
                variant: AppButtonVariant.outline,
                icon: Icons.g_mobiledata,
                onPressed: () {},
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: AppTextStyles.bodyMd),
                  GestureDetector(
                    onTap: () => context.push(AppRouter.register),
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
