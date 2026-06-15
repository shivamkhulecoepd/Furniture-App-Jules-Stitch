import 'package:flutter/material.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../theme/app_spacing.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Edit Profile'),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: Column(
          children: [
            const AppTextField(label: 'Full Name', hintText: 'Jane Doe'),
            const SizedBox(height: 24),
            const AppTextField(label: 'Email', hintText: 'jane.doe@example.com'),
            const Spacer(),
            AppButton(text: 'Save Changes', onPressed: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
