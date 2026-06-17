import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../routes/app_router.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState
    extends State<OtpVerificationScreen> {
  static const int otpLength = 4;

  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      otpLength,
      (_) => TextEditingController(),
    );

    _focusNodes = List.generate(
      otpLength,
      (_) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  String get otp =>
      _controllers.map((controller) => controller.text).join();

  void _onOtpChanged(String value, int index) {
    // Handle paste operation
    if (value.length > 1) {
      final chars = value.split('');

      for (int i = 0; i < otpLength; i++) {
        if (i < chars.length) {
          _controllers[i].text = chars[i];
        }
      }

      FocusScope.of(context).unfocus();
      setState(() {});
      return;
    }

    // Move to next field
    if (value.isNotEmpty) {
      if (index < otpLength - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }

    setState(() {});
  }

  void _onBackspace(int index) {
    if (_controllers[index].text.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();

      _controllers[index - 1].clear();

      setState(() {});
    }
  }

  void _verifyOtp() {
    if (otp.length != otpLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter complete OTP'),
        ),
      );
      return;
    }

    context.go(AppRouter.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.containerPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),

              Text(
                'Verification Code',
                style: AppTextStyles.headlineLg.copyWith(
                  fontSize: 28.sp,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                'We have sent a verification code to your email address.',
                style: AppTextStyles.bodyMd,
              ),

              SizedBox(height: 48.h),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: List.generate(
                  otpLength,
                  (index) => _buildOtpBox(index),
                ),
              ),

              SizedBox(height: 32.h),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.onSurface,
                      ),
                      children: [
                        const TextSpan(
                          text: "Didn't receive code?  ",
                        ),
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            decoration:
                                TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(),

              AppButton(
                text: 'Verify',
                onPressed: _verifyOtp,
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 70.w,
      height: 70.w,
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace) {
            _onBackspace(index);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius:
                BorderRadius.circular(AppRadius.def),
            border: Border.all(
              color: _focusNodes[index].hasFocus
                  ? AppColors.primary
                  : const Color(0xFFEEEEEE),
              width: _focusNodes[index].hasFocus ? 2 : 1,
            ),
          ),
          child: Center(
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxLength: 1,
              style: AppTextStyles.headlineMd.copyWith(
                fontSize: 24.sp,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
              onChanged: (value) =>
                  _onOtpChanged(value, index),
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import '../../../shared/widgets/app_button.dart';
// import '../../../shared/widgets/app_app_bar.dart';
// import '../../../theme/app_text_styles.dart';
// import '../../../theme/app_spacing.dart';
// import '../../../theme/app_colors.dart';
// import '../../../routes/app_router.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   const OtpVerificationScreen({super.key});

//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const AppAppBar(showBackButton: true),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 24.h),
//               Text('Verification Code', style: AppTextStyles.headlineLg.copyWith(fontSize: 28.sp)),
//               SizedBox(height: 8.h),
//               Text(
//                 'We have sent a verification code to your email address.',
//                 style: AppTextStyles.bodyMd,
//               ),
//               SizedBox(height: 48.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(4, (index) => _buildOtpBox()),
//               ),
//               SizedBox(height: 32.h),
//               Center(
//                 child: TextButton(
//                   onPressed: () {},
//                   child: RichText(
//                     text: TextSpan(
//                       style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurface),
//                       children: [
//                         const TextSpan(text: "Didn't receive code? "),
//                         TextSpan(
//                           text: 'Resend',
//                           style: TextStyle(
//                             color: AppColors.primary,
//                             fontWeight: FontWeight.w700,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               AppButton(
//                 text: 'Verify',
//                 onPressed: () => context.go(AppRouter.home),
//               ),
//               SizedBox(height: 24.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOtpBox() {
//     return Container(
//       width: 76.w,
//       height: 76.h,
//       decoration: BoxDecoration(
//         color: AppColors.surfaceContainerLow,
//         borderRadius: BorderRadius.circular(AppRadius.def),
//         border: Border.all(color: const Color(0xFFEEEEEE)),
//       ),
//       child: Center(
//         child: TextField(
//           textAlign: TextAlign.center,
//           keyboardType: TextInputType.number,
//           maxLength: 1,
//           style: AppTextStyles.headlineMd.copyWith(fontSize: 24.sp),
//           decoration: const InputDecoration(
//             counterText: '',
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//     );
//   }
// }
