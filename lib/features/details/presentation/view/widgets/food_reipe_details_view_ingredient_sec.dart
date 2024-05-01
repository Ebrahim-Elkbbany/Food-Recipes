import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/widgets/custom_list_tile_item.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';

class DetailsViewIngredientSec extends StatelessWidget {
  const DetailsViewIngredientSec(
      {super.key,
      required this.ingredient,
      required this.measure, required this.isDownIngredient, this.onPressed});

  final List<String> ingredient;
  final List<String> measure;
  final  bool  isDownIngredient;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit.get(context).isLightTheme;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ingredient',
                style: FontStyles.font16WhiteSemiBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isLightTheme
                      ? AppColors.kBlackColor
                      : AppColors.kWhiteColor,
                ),
              ),
              const Spacer(),
              IconButton(onPressed: onPressed, icon:  Icon(
                isDownIngredient
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: AppColors.kPrimaryColor.withOpacity(.75),
                size: 20.w,
              ),)
            ],
          ),
          if (isDownIngredient)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 15.h),
              itemBuilder: (context, index) =>  CustomListTile(
                image: 'https://www.themealdb.com/images/ingredients/${ingredient[index]}-Small.png',
                ingredient: ingredient[index],
                measure: measure[index],
              ),
              itemCount: ingredient.length,
              separatorBuilder: (context, index) => verticalSpacer(10),
            ),
        ],
      ),
    );
  }
}
