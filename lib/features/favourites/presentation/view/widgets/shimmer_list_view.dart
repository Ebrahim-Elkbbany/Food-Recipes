import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,

      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),

        itemBuilder: (context, index) => Container(
          width: double.infinity,
          height: 220.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        separatorBuilder: (context, index) => verticalSpacer(20),
        itemCount: 6,
      ),
    );
  }
}
