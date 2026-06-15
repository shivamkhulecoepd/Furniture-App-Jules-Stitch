import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Settings'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Preferences'),
            _buildSettingToggle('Push Notifications', true),
            _buildSettingToggle('Dark Mode', false),
            _buildSettingToggle('Face ID / Biometrics', true),
            SizedBox(height: 32.h),
            _buildSectionHeader('Support'),
            _buildSettingItem('Help Center', Icons.help_outline),
            _buildSettingItem('Contact Us', Icons.mail_outline),
            _buildSettingItem('Terms of Service', Icons.description),
            _buildSettingItem('Privacy Policy', Icons.privacy_tip),
            SizedBox(height: 32.h),
            _buildSectionHeader('Account'),
            _buildSettingItem('Delete Account', Icons.delete_outline, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Text(
        title.toUpperCase(),
        style: AppTextStyles.labelMd.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSettingToggle(String title, bool value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppTextStyles.bodyMd.copyWith(fontWeight: FontWeight.w600, color: AppColors.onSurface)),
      trailing: Switch.adaptive(
        value: value,
        onChanged: (v) {},
        activeColor: AppColors.primary,
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, {Color? color}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color ?? AppColors.primary, size: 22.sp),
      title: Text(title, style: AppTextStyles.bodyMd.copyWith(fontWeight: FontWeight.w600, color: color ?? AppColors.onSurface)),
      trailing: Icon(Icons.chevron_right_rounded, size: 20.sp, color: Colors.grey),
      onTap: () {},
    );
  }
}
