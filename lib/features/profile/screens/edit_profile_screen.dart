import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Edit Profile'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.containerPadding),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundColor: AppColors.surfaceContainerLow,
                      backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=3744&auto=format&fit=crop'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48.h),
              const AppTextField(
                label: 'Full Name',
                hintText: 'Jane Doe',
              ),
              SizedBox(height: 24.h),
              const AppTextField(
                label: 'Email Address',
                hintText: 'jane.doe@example.com',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              const AppTextField(
                label: 'Phone Number',
                hintText: '+1 234 567 890',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 48.h),
              AppButton(
                text: 'Save Changes',
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
