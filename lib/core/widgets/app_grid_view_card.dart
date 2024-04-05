import 'package:flutter/material.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/widgets/custom_cached_network_image.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';
import 'package:food_recipes/features/onboarding/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/theming/font_weight_helper.dart';

class AppGridViewCard extends StatelessWidget {
  const AppGridViewCard({super.key, required this.recipesMeal});

  final RecipesMeal recipesMeal;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit.get(context).isLightTheme;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 176.h,
          width: 150.w,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
            color: isLightTheme
                ? AppColors.kWhiteColorD9.withOpacity(0.5)
                : AppColors.kBlack18Color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              verticalSpacer(65),
              Text(
                recipesMeal.strMeal,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: FontStyles.font16WhiteSemiBold.copyWith(
                  color: isLightTheme ? AppColors.kBlackColor : null,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: FontStyles.font11WhiteD9Medium.copyWith(
                            color: AppColors.kGrayColorA9,
                            fontWeight: FontWeightHelper.regular),
                      ),
                      Text(
                        '${recipesMeal.idMeal.substring(4) == '0' ? '3' : recipesMeal.idMeal.substring(4)}0 Mins',
                        style: FontStyles.font11WhiteD9Medium.copyWith(
                          color: isLightTheme ? AppColors.kBlackColor : null,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.bookmark_outline,
                    color: AppColors.kPrimaryColor,
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomCachedNetworkImage(
              imageUrl: recipesMeal.strMealThumb,
              width: 110.w,
              height: 110.h,
            ),
          ),
        ),
      ],
    );
  }
}
