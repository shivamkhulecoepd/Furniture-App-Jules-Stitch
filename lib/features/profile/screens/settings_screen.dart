import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const AppAppBar(title: 'Settings'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Preferences'),
            _buildSettingToggle(isDark, 'Push Notifications', true),
            _buildSettingToggle(isDark, 'Dark Mode', isDark),
            _buildSettingToggle(isDark, 'Face ID / Biometrics', true),
            SizedBox(height: 32.h),
            _buildSectionHeader('Support'),
            _buildSettingItem(isDark, 'Help Center', Icons.help_outline, () => context.push(AppRouter.helpCenter)),
            _buildSettingItem(isDark, 'Contact Us', Icons.mail_outline, () {}),
            _buildSettingItem(isDark, 'Terms of Service', Icons.description, () => context.push(AppRouter.privacy)),
            _buildSettingItem(isDark, 'Privacy Policy', Icons.privacy_tip, () => context.push(AppRouter.privacy)),
            SizedBox(height: 32.h),
            _buildSectionHeader('Account'),
            _buildSettingItem(isDark, 'Delete Account', Icons.delete_outline, () {}, color: Colors.red),
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
        style: AppTextStyles.labelSm.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSettingToggle(bool isDark, String title, bool value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppTextStyles.labelMd),
      trailing: Switch.adaptive(
        value: value,
        onChanged: (v) {},
        activeColor: Colors.black,
      ),
    );
  }

  Widget _buildSettingItem(bool isDark, String title, IconData icon, VoidCallback onTap, {Color? color}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color ?? (isDark ? Colors.white : Colors.black), size: 22.sp),
      title: Text(title, style: AppTextStyles.labelMd.copyWith(color: color)),
      trailing: Icon(Icons.chevron_right_rounded, size: 20.sp, color: Colors.grey),
    );
  }
}
