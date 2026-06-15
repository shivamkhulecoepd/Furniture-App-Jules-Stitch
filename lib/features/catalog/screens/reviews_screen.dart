import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/app_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';
import '../../../theme/app_shadows.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const AppAppBar(
        title: 'Customer Reviews',
        subtitle: 'Verified Feedback & Ratings',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildRatingOverview(isDark),
              SizedBox(height: 16.h),
              _buildRatingDistribution(isDark),
              SizedBox(height: 24.h),
              _buildFilterActions(isDark),
              SizedBox(height: 24.h),
              _buildReviewCard(
                isDark,
                name: 'Elena Moretti',
                date: 'October 12, 2023',
                rating: 5,
                title: 'Exceeded my expectations',
                content:
                    'The sculptural quality of this chair is even better in person. The wood finish is incredibly smooth and the joinery is flawless. It’s definitely more of an art piece that you can actually sit on. Delivery was surprisingly fast.',
                images: [
                  'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=200',
                  'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?w=200',
                ],
                helpfulCount: 24,
                notHelpfulCount: 2,
                hasVerification: true,
              ),
              SizedBox(height: 16.h),
              _buildReviewCard(
                isDark,
                name: 'Marcus Thorne',
                date: 'September 28, 2023',
                rating: 4,
                title: 'Beautiful but firm',
                content:
                    'Absolutely stunning design that ties the room together. Note that the seat is quite firm, which I personally like for posture, but if you’re looking for a sink-in lounge experience, this might not be it. Quality is 10/10.',
                helpfulCount: 11,
                notHelpfulCount: 0,
                hasVerification: true,
              ),
              SizedBox(height: 24.h),
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                    side: BorderSide(color: isDark ? AppColors.surfaceDark : AppColors.outlineVariant),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
                  ),
                  child: Text(
                    'Load More Reviews',
                    style: AppTextStyles.labelMd.copyWith(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(isDark),
    );
  }

  Widget _buildRatingOverview(bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        children: [
          Text('4.8', style: AppTextStyles.h1.copyWith(fontSize: 48.sp)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(
                index < 4 ? Icons.star_rounded : Icons.star_half_rounded,
                color: isDark ? Colors.white : Colors.black,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Based on 1,248 reviews',
            style: AppTextStyles.bodySm.copyWith(color: AppColors.textSecondaryLight),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingDistribution(bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        children: [
          _buildDistributionRow(isDark, '5', 0.85, '85%'),
          SizedBox(height: 12.h),
          _buildDistributionRow(isDark, '4', 0.10, '10%'),
          SizedBox(height: 12.h),
          _buildDistributionRow(isDark, '3', 0.03, '3%'),
          SizedBox(height: 12.h),
          _buildDistributionRow(isDark, '2', 0.01, '1%'),
          SizedBox(height: 12.h),
          _buildDistributionRow(isDark, '1', 0.01, '1%'),
        ],
      ),
    );
  }

  Widget _buildDistributionRow(bool isDark, String label, double value, String percentage) {
    return Row(
      children: [
        Text(label, style: AppTextStyles.bodyMd.copyWith(color: isDark ? Colors.white : Colors.black)),
        SizedBox(width: 16.w),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(isDark ? Colors.white : Colors.black),
              minHeight: 6.h,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Text(percentage, style: AppTextStyles.bodySm.copyWith(color: isDark ? Colors.white70 : Colors.black), textAlign: TextAlign.right),
      ],
    );
  }

  Widget _buildFilterActions(bool isDark) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isDark ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Text('Most Relevant', style: AppTextStyles.labelSm.copyWith(color: isDark ? Colors.black : Colors.white)),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Text('Recent', style: AppTextStyles.labelSm.copyWith(color: isDark ? Colors.white : Colors.black)),
        ),
        const Spacer(),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.edit_outlined, size: 18.sp, color: isDark ? Colors.white : Colors.black),
          label: Text('Write a Review', style: AppTextStyles.labelSm.copyWith(color: isDark ? Colors.white : Colors.black)),
        ),
      ],
    );
  }

  Widget _buildReviewCard(
    bool isDark, {
    required String name,
    required String date,
    required int rating,
    required String title,
    required String content,
    List<String>? images,
    required int helpfulCount,
    required int notHelpfulCount,
    bool hasVerification = false,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=$name'),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: AppTextStyles.labelMd.copyWith(color: isDark ? Colors.white : Colors.black)),
                        if (hasVerification) ...[
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: isDark ? Colors.white10 : Colors.grey[100],
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.verified, size: 10.sp, color: isDark ? Colors.white70 : Colors.black54),
                                SizedBox(width: 2.w),
                                Text('Verified', style: TextStyle(fontSize: 8.sp, color: isDark ? Colors.white70 : Colors.black54)),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                    Text(date, style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: isDark ? Colors.white : Colors.black,
                    size: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(title, style: AppTextStyles.h4.copyWith(color: isDark ? Colors.white : Colors.black)),
          SizedBox(height: 8.h),
          Text(content, style: AppTextStyles.bodyMd.copyWith(color: isDark ? Colors.white70 : Colors.black87, height: 1.5)),
          if (images != null && images.isNotEmpty) ...[
            SizedBox(height: 16.h),
            SizedBox(
              height: 80.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (context, index) => SizedBox(width: 12.w),
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(images[index], width: 80.w, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
          SizedBox(height: 16.h),
          Divider(color: isDark ? Colors.white10 : Colors.grey[200]),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text('Was this review helpful?', style: AppTextStyles.bodySm.copyWith(color: Colors.grey)),
              const Spacer(),
              _buildHelpfulIcon(isDark, Icons.thumb_up_alt_outlined, helpfulCount),
              SizedBox(width: 16.w),
              _buildHelpfulIcon(isDark, Icons.thumb_down_alt_outlined, notHelpfulCount),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpfulIcon(bool isDark, IconData icon, int count) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: isDark ? Colors.white70 : Colors.black54),
        SizedBox(width: 4.w),
        Text(count.toString(), style: AppTextStyles.bodySm.copyWith(color: isDark ? Colors.white70 : Colors.black54)),
      ],
    );
  }

  Widget _buildBottomNav(bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        border: Border(top: BorderSide(color: isDark ? Colors.white10 : Colors.grey[200]!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home_outlined, color: Colors.grey),
          Icon(Icons.favorite_outline, color: Colors.grey),
          Icon(Icons.notifications_none, color: Colors.grey),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(color: isDark ? Colors.white : Colors.black, shape: BoxShape.circle),
            child: Icon(Icons.person_outline, color: isDark ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}
