import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Profile', showBackButton: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=3744&auto=format&fit=crop')),
            SizedBox(height: 16.h),
            Text('Jane Doe', style: AppTextStyles.headlineSmall),
            SizedBox(height: 32.h),
            _buildMenuItem(context, Icons.person_outline, 'Edit Profile', AppRouter.editProfile),
            _buildMenuItem(context, Icons.notifications_none_outlined, 'Notifications', AppRouter.notifications),
            _buildMenuItem(context, Icons.help_outline, 'Help Center', AppRouter.helpCenter),
            _buildMenuItem(context, Icons.settings_outlined, 'Settings', AppRouter.settings),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: AppTextStyles.bodyMd),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push(route),
    );
  }
}
