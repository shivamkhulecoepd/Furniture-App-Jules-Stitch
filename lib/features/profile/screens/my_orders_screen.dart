import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_shadows.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        appBar: AppAppBar(
          title: 'My Orders',
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            indicatorWeight: 3,
            labelStyle: AppTextStyles.labelMd,
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrdersList(isDark, 'active'),
            _buildOrdersList(isDark, 'completed'),
            _buildOrdersList(isDark, 'cancelled'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList(bool isDark, String status) {
    return ListView.separated(
      padding: EdgeInsets.all(AppSpacing.lg.w),
      itemCount: status == 'active' ? 2 : 5,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) => _buildOrderCard(isDark, status),
    );
  }

  Widget _buildOrderCard(bool isDark, String status) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=200',
                  width: 80.w,
                  height: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sabra Lounge Chair', style: AppTextStyles.labelMd),
                    SizedBox(height: 4.h),
                    Text('Qty: 1 • Color: Obsidian', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
                    SizedBox(height: 8.h),
                    Text('\$240.00', style: AppTextStyles.labelMd.copyWith(color: Colors.black)),
                  ],
                ),
              ),
              if (status == 'active')
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8.r)),
                  child: Text('In Transit', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order #TRX-8829', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
              if (status == 'active')
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  ),
                  child: Text('Track Order', style: AppTextStyles.labelSm.copyWith(color: Colors.white)),
                )
              else
                TextButton(
                  onPressed: () {},
                  child: Text('View Details', style: AppTextStyles.labelSm.copyWith(color: Colors.black)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
