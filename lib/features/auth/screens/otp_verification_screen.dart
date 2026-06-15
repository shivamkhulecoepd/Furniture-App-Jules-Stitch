import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verification Code', style: AppTextStyles.headlineLg),
              SizedBox(height: 8.h),
              Text('Enter the code sent to your email.', style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
              SizedBox(height: 40.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: List.generate(4, (index) => _buildOtpBox())),
              const Spacer(),
              AppButton(text: 'Verify', onPressed: () => context.go(AppRouter.home)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox() {
    return Container(
      width: 70.w,
      height: 70.h,
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadius.md)),
      child: const Center(child: TextField(textAlign: TextAlign.center, keyboardType: TextInputType.number, decoration: InputDecoration(border: InputBorder.none))),
    );
  }
}
