import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: Image.network(
                  'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=600',
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'Welcome Back',
                style: AppTextStyles.h2.copyWith(fontSize: 32.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                'Access your curated collection',
                style: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 40.h),
              const AppTextField(
                label: 'EMAIL ADDRESS',
                hint: 'name@example.com',
                suffixIcon: Icon(
                  Icons.mail_outline,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              SizedBox(height: 24.h),
              Stack(
                children: [
                  const AppTextField(
                    label: 'PASSWORD',
                    hint: 'Enter your password',
                    obscureText: true,
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () => context.push(AppRouter.forgotPassword),
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.labelSm.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              AppButton(
                text: 'Login',
                onPressed: () => context.go(AppRouter.otp),
              ),
              SizedBox(height: 24.h),
              _buildDivider(),
              SizedBox(height: 24.h),
              _buildSocialButton(),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: AppTextStyles.bodySm),
                  GestureDetector(
                    onTap: () => context.push(AppRouter.register),
                    child: Text(
                      'Register',
                      style: AppTextStyles.labelSm.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              Text(
                '© 2024 Modern Furniture Inc. All rights reserved.',
                style: AppTextStyles.labelSm.copyWith(
                  color: Colors.grey[400],
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'OR',
            style: AppTextStyles.labelSm.copyWith(color: Colors.grey),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3F8),
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        spacing: 8.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/google_logo.png',
            width: 24.w,
            height: 24.h,
          ),
          Text(
            'Continue with Google',
            style: AppTextStyles.bodyMd.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
