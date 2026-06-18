import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const AppAppBar(title: 'Help Center'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            _buildSearchBar(isDark),
            SizedBox(height: 32.h),
            Text('Quick Support', style: AppTextStyles.h3),
            SizedBox(height: 16.h),
            _buildSupportGrid(isDark),
            SizedBox(height: 32.h),
            Text('Frequently Asked Questions', style: AppTextStyles.h3),
            SizedBox(height: 16.h),
            _buildFaqItem(isDark, 'How do I track my order?', 'You can track your order by going to the My Orders section in your profile and clicking on the Track Order button.'),
            _buildFaqItem(isDark, 'What is the return policy?', 'We offer a 30-day return policy for most items. Items must be in their original condition and packaging.'),
            _buildFaqItem(isDark, 'Do you ship internationally?', 'Yes, we ship to over 50 countries worldwide. Shipping fees and delivery times vary by location.'),
            _buildFaqItem(isDark, 'How can I change my delivery address?', 'You can change your delivery address before the order is shipped. Contact our support team immediately.'),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.grey[100],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for help...',
          hintStyle: AppTextStyles.bodyMd.copyWith(color: Colors.grey),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.grey, size: 22.sp),
        ),
      ),
    );
  }

  Widget _buildSupportGrid(bool isDark) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16.h,
      crossAxisSpacing: 16.w,
      childAspectRatio: 1.2,
      children: [
        _buildSupportCard(isDark, 'Live Chat', Icons.chat_outlined, Colors.blue),
        _buildSupportCard(isDark, 'Email Support', Icons.email_outlined, Colors.orange),
        _buildSupportCard(isDark, 'Phone Call', Icons.phone_outlined, Colors.green),
        _buildSupportCard(isDark, 'Community', Icons.groups_outlined, Colors.purple),
      ],
    );
  }

  Widget _buildSupportCard(bool isDark, String title, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32.sp, color: color),
          SizedBox(height: 12.h),
          Text(title, style: AppTextStyles.labelMd),
        ],
      ),
    );
  }

  Widget _buildFaqItem(bool isDark, String question, String answer) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ExpansionTile(
        title: Text(question, style: AppTextStyles.labelMd),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            child: Text(answer, style: AppTextStyles.bodyMd.copyWith(color: Colors.grey[600], height: 1.5)),
          ),
        ],
      ),
    );
  }
}
