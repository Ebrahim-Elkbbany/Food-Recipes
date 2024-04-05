import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/theming/font_weight_helper.dart';
import 'package:food_recipes/core/widgets/custom_error_widget.dart';
import 'package:food_recipes/core/widgets/custom_shimmer_for_loading.dart';
import 'package:food_recipes/core/widgets/custom_text_button.dart';
import 'package:food_recipes/core/widgets/app_grid_view_card.dart';
import 'package:food_recipes/features/home/presentation/manager/new_recipes_cubit/new_recipes_cubit.dart';
import 'package:food_recipes/features/onboarding/presentation/manager/theme_cubit/theme_cubit.dart';

class HomeViewNewRecipesSec extends StatelessWidget {
  const HomeViewNewRecipesSec({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit.get(context).isLightTheme;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'New Recipes',
              style: FontStyles.font18Black18SemiBold.copyWith(
                color: isLightTheme
                    ? AppColors.kBlackColor
                    : AppColors.kWhiteColor,
              ),
            ),
            const Spacer(),
            CustomTextButton(
              text: 'See All',
              onPressed: () {
                context.pushNamed(Routes.newRecipesView);
              },
              textStyle: FontStyles.font11kSecondaryColorRegular.copyWith(
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            horizontalSpacer(20)
          ],
        ),
        BlocBuilder<NewRecipesCubit, NewRecipesState>(
          builder: (context, state) {
            var cubit = NewRecipesCubit.get(context);
            return state is NewRecipesFailure
                ? CustomErrorWidget(width: 250.w,height: 200,errorMessage: state.errorMessage)
                : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              padding: EdgeInsets.only(top: 20.h, right: 20.w),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                childAspectRatio: 115 / 150,
              ),
              itemBuilder: (context, index) => state is NewRecipesSuccess
                  ? GridViewCard(recipesMeal: cubit.newRecipesList[index])
                  : CustomShimmerForLoading(
                height: 176.h,
                width: 150.w,
                radius: 12,
              ),
            );
          },
        ),
      ],
    );
  }
}
