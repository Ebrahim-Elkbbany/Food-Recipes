import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.image,
    required this.ingredient,
    required this.measure,
  });

  final String ingredient;
  final String image;
  final String measure;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit.get(context).isLightTheme;
    return Container(
      height: 76.h,
      decoration: BoxDecoration(
        color: isLightTheme
            ? AppColors.kWhiteColorD9.withOpacity(0.5)
            : AppColors.kBlack18Color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: double.infinity,
      child: ListTile(
        title: Text(
          ingredient,
          style: FontStyles.font16WhiteSemiBold.copyWith(
            fontWeight: FontWeight.w600,
            color: isLightTheme ? AppColors.kBlackColor : AppColors.kWhiteColor,
          ),
        ),
        leading: CachedNetworkImage(
          imageUrl: image,
          width: 52.h,
          height: 52.h,
        ),
        trailing: Text(measure,
            textAlign: TextAlign.right,
            style: FontStyles.font14Black12Regular.copyWith(
              color: AppColors.kGrayColorA9,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}
