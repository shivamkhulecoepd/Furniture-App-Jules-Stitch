import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_text_styles.dart';
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const AppButton({super.key, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity, height: 56.h, child: ElevatedButton(onPressed: onPressed, child: Text(text, style: AppTextStyles.button)));
}
