import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_spacing.dart';
import '../../../routes/app_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.black),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.3, 1.0],
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.85),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding, vertical: 24.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 200.h),
                          Text(
                            'Design Your Dream\nLiving Space',
                            style: AppTextStyles.headlineXl.copyWith(
                              color: Colors.white,
                              fontSize: 36.sp,
                              height: 1.1,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Discover premium furniture and decor that reflects your unique style and personality.',
                            style: AppTextStyles.bodyLg.copyWith(
                              color: Colors.white.withOpacity(0.85),
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 48.h),
                          AppButton(
                            text: 'Get Started',
                            onPressed: () => context.go(AppRouter.login),
                          ),
                          SizedBox(height: 24.h),
                          Center(
                            child: GestureDetector(
                              onTap: () => context.go(AppRouter.login),
                              child: Text(
                                'Already have an account? Login',
                                style: AppTextStyles.bodyMd.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
