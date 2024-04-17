import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/theming/font_weight_helper.dart';

class FoodRecipeDetailsInstructionsSec extends StatelessWidget {
  const FoodRecipeDetailsInstructionsSec({
    super.key,
    required this.isLightTheme,
    required this.instructions,
    required this.isDownInstructions,
    this.onPressed,
  });

  final bool isLightTheme;
  final String instructions;
  final bool isDownInstructions;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Instructions',
                style: FontStyles.font16WhiteSemiBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isLightTheme
                      ? AppColors.kBlackColor
                      : AppColors.kWhiteColor,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  isDownInstructions
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: AppColors.kPrimaryColor.withOpacity(.75),
                  size: 20.w,
                ),
              ),
            ],
          ),
          verticalSpacer(10),
          if (isDownInstructions)
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                instructions,
                style: FontStyles.font14Black12Regular.copyWith(
                  fontWeight: FontWeightHelper.regular,
                  color: isLightTheme
                      ? AppColors.kBlackColor
                      : AppColors.kWhiteColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
