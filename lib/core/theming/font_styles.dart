import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_weight_helper.dart';

class FontStyles {
  static TextStyle font50WhiteSemiBold = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 50.sp,
    height: 1.09,
    color: Colors.white,
  );
  static TextStyle font20WhiteSemiBold = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 50.sp,
    height: 1.09,
    color: Colors.white,
  );
  static TextStyle font16WhiteD9Regular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 16.sp,
    color: AppColors.kWhiteColorD9,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14Black12Regular =TextStyle(
    color: AppColors.kBlack12Color,
  fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font20Black12Regular = TextStyle(
    color: AppColors.kBlack12Color,
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font18Black18SemiBold = TextStyle(
    color: AppColors.kBlack18Color,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font11kSecondaryColorRegular = TextStyle(
    color: AppColors.kSecondaryColor,
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font13Black12Regular = TextStyle(
    color: AppColors.kBlack12Color,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font30BlackSemiBold =TextStyle(
    color: Colors.black,
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font13WhiteD9Regular =TextStyle(
    color: AppColors.kWhiteColorD9,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font11WhiteD9Medium =TextStyle(
    color: AppColors.kWhiteColorD9,
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.medium,
  );
}
