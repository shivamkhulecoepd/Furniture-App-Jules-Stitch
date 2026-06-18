import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: Icon(Icons.chair_outlined, color: Colors.white, size: 32.sp),
              ),
              SizedBox(height: 32.h),
              Text(
                'Create Account',
                style: AppTextStyles.h2.copyWith(fontSize: 32.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                'Join Modern Furniture for an curated\ninterior experience.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 40.h),
              const AppTextField(
                label: 'Full Name',
                hint: 'Enter your full name',
                suffixIcon: Icon(Icons.person_outline, color: Colors.grey, size: 20),
              ),
              SizedBox(height: 20.h),
              const AppTextField(
                label: 'Email Address',
                hint: 'name@example.com',
                suffixIcon: Icon(Icons.mail_outline, color: Colors.grey, size: 20),
              ),
              SizedBox(height: 20.h),
              const AppTextField(
                label: 'Password',
                hint: 'Min. 8 characters',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey, size: 20),
              ),
              SizedBox(height: 20.h),
              const AppTextField(
                label: 'Confirm Password',
                hint: 'Repeat your password',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey, size: 20),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.bodySm.copyWith(color: Colors.grey[600]),
                        children: [
                          const TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: AppTextStyles.labelSm.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              AppButton(
                text: 'Sign Up',
                onPressed: () => context.go(AppRouter.catalog),
              ),
              SizedBox(height: 24.h),
              Text(
                'OR CONTINUE WITH',
                style: AppTextStyles.labelSm.copyWith(color: Colors.grey[400], letterSpacing: 1),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(Icons.apple),
                  SizedBox(width: 24.w),
                  _buildSocialIcon(Icons.public),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: AppTextStyles.bodySm),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Text(
                      'Login',
                      style: AppTextStyles.labelSm.copyWith(fontWeight: FontWeight.bold),
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

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 120.w,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3F8),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Icon(icon, color: Colors.black, size: 24.sp),
    );
  }
}
