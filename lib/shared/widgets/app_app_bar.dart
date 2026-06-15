import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;
  const AppAppBar({super.key, this.title, this.leading, this.actions, this.showBackButton = true});
  @override
  Widget build(BuildContext context) => AppBar(title: title != null ? Text(title!, style: AppTextStyles.headlineMd) : null, leading: leading ?? (showBackButton ? const BackButton() : null), actions: actions, backgroundColor: Colors.transparent, elevation: 0, centerTitle: true);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
