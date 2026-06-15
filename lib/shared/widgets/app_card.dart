import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_shadows.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Border? border;
  const AppCard({super.key, required this.child, this.color, this.border});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: color ?? Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: AppShadows.soft, border: border), child: child);
}
