import 'package:flutter/material.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_spacing.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Search'),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.containerPadding),
        child: const TextField(decoration: InputDecoration(hintText: 'Search furniture...', prefixIcon: Icon(Icons.search))),
      ),
    );
  }
}
