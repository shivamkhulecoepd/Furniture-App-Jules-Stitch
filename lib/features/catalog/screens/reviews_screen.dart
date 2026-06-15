import 'package:flutter/material.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Reviews'),
      body: ListView.separated(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        itemCount: 5,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => ListTile(
          title: Row(children: List.generate(5, (i) => Icon(Icons.star, size: 16, color: i < 4 ? Colors.amber : Colors.grey))),
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 8),
            Text('Very comfortable and stylish!', style: AppTextStyles.bodyMd),
            const SizedBox(height: 4),
            const Text('Jane D. - 2 days ago', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ]),
        ),
      ),
    );
  }
}
