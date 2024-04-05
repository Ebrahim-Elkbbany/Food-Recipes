import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/features/onboarding/presentation/manager/theme_cubit/theme_cubit.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit.get(context).isLightTheme;
    return Container(
      height: 180.h,
      width: 180.w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color:
        isLightTheme ? AppColors.kWhiteColorD9.withOpacity(0.5) : AppColors.kBlack18Color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          verticalSpacer(15),
          CachedNetworkImage(
            width: 110.w,
            imageUrl: 'https://www.themealdb.com/images/category/beef.png',
          ),
          verticalSpacer(10),
          Text(
            'Chicken',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: FontStyles.font16WhiteSemiBold.copyWith(
              color: isLightTheme ? AppColors.kBlackColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
