import 'package:flutter/material.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_spacing.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Help Center'),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        children: const [
          ListTile(title: Text('How to track order?')),
          ListTile(title: Text('Return Policy')),
          ListTile(title: Text('Shipping Info')),
        ],
      ),
    );
  }
}
