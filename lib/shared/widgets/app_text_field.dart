import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
class AppTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  const AppTextField({super.key, required this.label, this.hintText, this.obscureText = false});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label.toUpperCase(), style: AppTextStyles.labelMd), const SizedBox(height: 8), TextFormField(obscureText: obscureText, decoration: InputDecoration(hintText: hintText, filled: true, fillColor: AppColors.surfaceContainerLow, border: OutlineInputBorder(borderSide: BorderSide.none)))]);
}
