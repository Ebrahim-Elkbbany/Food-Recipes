import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';

class CustomTextFieldName extends StatelessWidget {
  const CustomTextFieldName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: FontStyles.font16WhiteSemiBold.copyWith(
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
