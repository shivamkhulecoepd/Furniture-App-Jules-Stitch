import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';

class FilterSortScreen extends StatefulWidget {
  const FilterSortScreen({super.key});

  @override
  State<FilterSortScreen> createState() => _FilterSortScreenState();
}

class _FilterSortScreenState extends State<FilterSortScreen> {
  RangeValues _priceRange = const RangeValues(100, 800);
  String _selectedSort = 'Recommended';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2.r)),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filter & Sort', style: AppTextStyles.h2),
              TextButton(onPressed: () {}, child: Text('Reset', style: AppTextStyles.labelMd.copyWith(color: Colors.red))),
            ],
          ),
          SizedBox(height: 32.h),
          Text('Sort By', style: AppTextStyles.h4),
          SizedBox(height: 16.h),
          _buildSortOptions(isDark),
          SizedBox(height: 32.h),
          Text('Price Range', style: AppTextStyles.h4),
          SizedBox(height: 16.h),
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: 2000,
            activeColor: Colors.black,
            inactiveColor: Colors.grey[200],
            onChanged: (val) => setState(() => _priceRange = val),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${_priceRange.start.round()}', style: AppTextStyles.labelMd),
              Text('\$${_priceRange.end.round()}', style: AppTextStyles.labelMd),
            ],
          ),
          SizedBox(height: 32.h),
          Text('Category', style: AppTextStyles.h4),
          SizedBox(height: 16.h),
          _buildCategories(isDark),
          const Spacer(),
          _buildApplyButton(),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildSortOptions(bool isDark) {
    final options = ['Recommended', 'Newest', 'Price: Low to High', 'Price: High to Low'];
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: options.map((opt) {
        final isSelected = _selectedSort == opt;
        return GestureDetector(
          onTap: () => setState(() => _selectedSort = opt),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Text(
              opt,
              style: AppTextStyles.labelSm.copyWith(color: isSelected ? Colors.white : Colors.black),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategories(bool isDark) {
    final categories = ['All', 'Chairs', 'Sofas', 'Tables', 'Storage', 'Decor'];
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: categories.map((cat) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Text(cat, style: AppTextStyles.labelSm),
        );
      }).toList(),
    );
  }

  Widget _buildApplyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
        ),
        child: Text('Apply Filters', style: AppTextStyles.labelLg.copyWith(color: Colors.white)),
      ),
    );
  }
}
