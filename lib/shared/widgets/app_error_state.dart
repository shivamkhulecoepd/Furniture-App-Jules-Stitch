import 'package:flutter/material.dart';
class AppErrorState extends StatelessWidget {
  final VoidCallback onRetry;
  const AppErrorState({super.key, required this.onRetry});
  @override
  Widget build(BuildContext context) => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('An error occurred'), ElevatedButton(onPressed: onRetry, child: const Text('Retry'))]));
}
