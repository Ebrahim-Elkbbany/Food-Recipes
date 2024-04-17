import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/theming/font_weight_helper.dart';
import 'package:food_recipes/core/widgets/custom_cached_network_image.dart';
import 'package:food_recipes/features/details/data/models/food_recipe_details_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FoodRecipeDetailsFirstSec extends StatelessWidget {
  const FoodRecipeDetailsFirstSec({
    super.key,
    required this.isLightTheme,
    required this.mealDetails,
  });

  final bool isLightTheme;
  final Meal mealDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mealDetails.strYoutube.isNotEmpty)
          YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(
                  mealDetails.strYoutube.isNotEmpty
                      ? mealDetails.strYoutube
                      : "")!,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
              ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor: AppColors.kPrimaryColor,
            progressColors: ProgressBarColors(
              playedColor: AppColors.kPrimaryColor,
              handleColor: AppColors.kPrimaryColor,
            ),
          ),
        if (mealDetails.strYoutube.isEmpty)
          CustomCachedNetworkImage(imageUrl: mealDetails.strMealThumb, width: double.infinity, height: 210.h),
        verticalSpacer(25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      mealDetails.strMeal,
                      maxLines: 3,
                      style: FontStyles.font18Black18SemiBold.copyWith(
                        fontWeight: FontWeightHelper.semiBold,
                        color: isLightTheme
                            ? AppColors.kBlackColor
                            : AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.bookmark, color: AppColors.kPrimaryColor),
                ],
              ),
              verticalSpacer(5),
              Text(
                '(${mealDetails.strCategory} - ${mealDetails.strArea})',
                style: FontStyles.font14Black12Regular.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isLightTheme
                      ? AppColors.kBlackColor
                      : AppColors.kWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
