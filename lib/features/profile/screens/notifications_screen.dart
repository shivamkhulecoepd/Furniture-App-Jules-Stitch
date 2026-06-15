import 'package:flutter/material.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_spacing.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Notifications'),
      body: ListView.builder(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: Text('Notification $index'),
          subtitle: const Text('This is a sample notification message.'),
        ),
      ),
    );
  }
}
