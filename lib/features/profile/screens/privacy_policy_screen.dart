import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const AppAppBar(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.md.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Last Updated: October 2023', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
            SizedBox(height: 24.h),
            _buildSection('1. Introduction', 'We value your privacy and are committed to protecting your personal data. This privacy policy will inform you as to how we look after your personal data when you visit our application.'),
            _buildSection('2. Data Collection', 'We may collect, use, store and transfer different kinds of personal data about you which we have grouped together as follows:\n• Identity Data: name, username.\n• Contact Data: email address, telephone numbers.\n• Technical Data: IP address, browser type, device information.'),
            _buildSection('3. How We Use Your Data', 'We will only use your personal data when the law allows us to. Most commonly, we will use your personal data in the following circumstances:\n• To register you as a new customer.\n• To process and deliver your order.\n• To manage our relationship with you.'),
            _buildSection('4. Data Security', 'We have put in place appropriate security measures to prevent your personal data from being accidentally lost, used or accessed in an unauthorized way.'),
            _buildSection('5. Your Rights', 'Under certain circumstances, you have rights under data protection laws in relation to your personal data, including the right to request access, correction, or erasure of your personal data.'),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h4),
        SizedBox(height: 12.h),
        Text(content, style: AppTextStyles.bodyMd.copyWith(height: 1.6, color: Colors.grey[800])),
        SizedBox(height: 24.h),
      ],
    );
  }
}
