import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String _selectedCategory = 'Feedback';
  final List<String> _categories = ['Feedback', 'Complaint', 'App Issue', 'General Inquiry', 'Partnership'];
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const AppAppBar(title: 'Contact Us'),
      body: _isSubmitted ? _buildSuccessState(isDark) : _buildForm(isDark),
    );
  }

  Widget _buildForm(bool isDark) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.lg.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How can we help you today?',
            style: AppTextStyles.h2,
          ),
          SizedBox(height: 8.h),
          Text(
            'Please select a category and provide details below.',
            style: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 32.h),
          Text(
            'SELECT CATEGORY',
            style: AppTextStyles.labelSm.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          _buildCategorySelector(isDark),
          SizedBox(height: 24.h),
          const AppTextField(
            label: 'SUBJECT',
            hint: 'What is this about?',
          ),
          SizedBox(height: 24.h),
          const AppTextField(
            label: 'MESSAGE',
            hint: 'Describe your concern or feedback in detail...',
            maxLines: 6,
          ),
          SizedBox(height: 48.h),
          AppButton(
            text: 'Send Message',
            onPressed: () => setState(() => _isSubmitted = true),
          ),
          SizedBox(height: 24.h),
          _buildContactInfo(isDark),
        ],
      ),
    );
  }

  Widget _buildCategorySelector(bool isDark) {
    return SizedBox(
      height: 44.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          final isSelected = _selectedCategory == cat;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = cat),
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : (isDark ? AppColors.surfaceDark : Colors.grey[100]),
                borderRadius: BorderRadius.circular(100.r),
                border: isSelected ? null : Border.all(color: Colors.grey[200]!),
              ),
              child: Text(
                cat,
                style: AppTextStyles.labelSm.copyWith(
                  color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactInfo(bool isDark) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.grey[50],
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          _buildInfoRow(Icons.mail_outline, 'support@modernfurniture.com'),
          SizedBox(height: 16.h),
          _buildInfoRow(Icons.phone_outlined, '+1 (555) 012-3456'),
          SizedBox(height: 16.h),
          _buildInfoRow(Icons.location_on_outlined, 'San Francisco, California, US'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: Colors.grey),
        SizedBox(width: 16.w),
        Text(text, style: AppTextStyles.bodyMd),
      ],
    );
  }

  Widget _buildSuccessState(bool isDark) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: Icon(Icons.check_rounded, color: Colors.white, size: 64.sp),
            ),
            SizedBox(height: 32.h),
            Text('Message Sent!', style: AppTextStyles.h2),
            SizedBox(height: 12.h),
            Text(
              'Thank you for reaching out. Our team will get back to you within 24 hours.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMd.copyWith(color: Colors.grey, height: 1.5),
            ),
            SizedBox(height: 48.h),
            AppButton(
              text: 'Back to Settings',
              variant: AppButtonVariant.outline,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
