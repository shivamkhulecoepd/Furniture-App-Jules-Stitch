import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_shadows.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const AppAppBar(title: 'Payment Methods'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w, vertical: 16.h),
              children: [
                _buildPaymentCard(
                  isDark,
                  type: 'Visa',
                  number: '**** **** **** 4291',
                  expiry: '12/26',
                  holder: 'Alexander Graham',
                  isDefault: true,
                  gradient: const [Color(0xFF1A1A1A), Color(0xFF4A4A4A)],
                ),
                SizedBox(height: 16.h),
                _buildPaymentCard(
                  isDark,
                  type: 'Mastercard',
                  number: '**** **** **** 8832',
                  expiry: '09/25',
                  holder: 'Alexander Graham',
                  gradient: const [Color(0xFF6366f1), Color(0xFFa855f7)],
                ),
                SizedBox(height: 24.h),
                _buildOtherMethod(isDark, 'PayPal', Icons.account_balance_wallet_outlined),
                _buildOtherMethod(isDark, 'Apple Pay', Icons.apple),
                _buildOtherMethod(isDark, 'Google Pay', Icons.android),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.lg.w),
            child: _buildAddButton(),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(
    bool isDark, {
    required String type,
    required String number,
    required String expiry,
    required String holder,
    bool isDefault = false,
    required List<Color> gradient,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(type, style: AppTextStyles.h4.copyWith(color: Colors.white)),
              if (isDefault)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text('DEFAULT', style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          SizedBox(height: 32.h),
          Text(number, style: AppTextStyles.h3.copyWith(color: Colors.white, letterSpacing: 2)),
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CARD HOLDER', style: TextStyle(color: Colors.white70, fontSize: 10.sp)),
                  Text(holder, style: AppTextStyles.labelMd.copyWith(color: Colors.white)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('EXPIRES', style: TextStyle(color: Colors.white70, fontSize: 10.sp)),
                  Text(expiry, style: AppTextStyles.labelMd.copyWith(color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOtherMethod(bool isDark, String title, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24.sp, color: isDark ? Colors.white : Colors.black),
          SizedBox(width: 16.w),
          Text(title, style: AppTextStyles.labelMd),
          const Spacer(),
          Icon(Icons.chevron_right, size: 20.sp, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add New Payment Method', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
          elevation: 0,
        ),
      ),
    );
  }
}
