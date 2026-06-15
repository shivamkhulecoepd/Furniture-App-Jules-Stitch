import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart' hide AppSpacing;
import '../../../routes/app_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              Text('Create Account', style: AppTextStyles.headlineLg.copyWith(fontSize: 28.sp)),
              SizedBox(height: 8.h),
              Text(
                'Join us to start designing your dream home',
                style: AppTextStyles.bodyMd,
              ),
              SizedBox(height: 48.h),
              const AppTextField(
                label: 'Full Name',
                hintText: 'Enter your name',
              ),
              SizedBox(height: 24.h),
              const AppTextField(
                label: 'Email Address',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              AppTextField(
                label: 'Password',
                hintText: 'Create a password',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, size: 20.sp, color: Colors.grey),
              ),
              SizedBox(height: 12.h),
              Text(
                'By signing up, you agree to our Terms & Conditions',
                style: AppTextStyles.labelMd.copyWith(fontSize: 11.sp),
              ),
              SizedBox(height: 40.h),
              AppButton(
                text: 'Sign Up',
                onPressed: () => context.push(AppRouter.otpVerification),
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: AppTextStyles.bodyMd),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Text(
                      'Login',
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
