import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/theming/font_weight_helper.dart';

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({
    super.key,
    required this.name,
    required this.onTap,
    required this.color,
    required this.fontColor,
  });
  final String name;
  final void Function() onTap;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: 96.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          name,
          style: FontStyles.font13Black12Regular.copyWith(
            color: fontColor,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
      ),
    );
  }
}
