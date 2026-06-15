import 'package:flutter/material.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Settings'),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        children: [
          ListTile(title: Text('Push Notifications', style: AppTextStyles.bodyMd), trailing: Switch(value: true, onChanged: (v) {})),
          ListTile(title: Text('Dark Mode', style: AppTextStyles.bodyMd), trailing: Switch(value: false, onChanged: (v) {})),
        ],
      ),
    );
  }
}
