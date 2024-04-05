import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/widgets/custom_error_widget.dart';
import 'package:food_recipes/core/widgets/custom_shimmer_for_loading.dart';
import 'package:food_recipes/features/home/presentation/manager/area_category_and_recipes_cubit/area_category_and_recipes_cubit.dart';
import 'package:food_recipes/core/widgets/app_grid_view_card.dart';
import 'package:food_recipes/features/home/presentation/views/widgets/tab_bar_container.dart';
import 'package:food_recipes/features/onboarding/presentation/manager/theme_cubit/theme_cubit.dart';

class HomeViewTabBarListViewSec extends StatelessWidget {
  const HomeViewTabBarListViewSec({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit.get(context).isLightTheme;
    return BlocBuilder<AreaCategoryAndRecipesCubit,
        AreaCategoryAndRecipesState>(
      builder: (context, state) {
        var cubit = AreaCategoryAndRecipesCubit.get(context);
        if (state is AreaCategoryFailure) {
          return CustomErrorWidget(
            height: 200.h,
            width: 250.w,
            errorMessage: state.errorMessage,
          );
        } else {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                height: 50.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      cubit.tabBarAreaList.isNotEmpty
                          ? TabBarContainer(
                              onTap: () {
                                cubit.changeTabBar(index);
                              },
                              name: cubit.tabBarAreaList[index].strArea,
                              color: cubit.tabBarIndex == index
                                  ? AppColors.kPrimaryColor
                                  : isLightTheme
                                      ? Colors.white
                                      : Colors.black,
                              fontColor: cubit.tabBarIndex == index
                                  ? AppColors.kWhiteColor
                                  : AppColors.kPrimaryColor,
                            )
                          : CustomShimmerForLoading(
                              height: 30.h,
                              width: 96.w,
                              radius: 12,
                            ),
                  separatorBuilder: (context, index) => horizontalSpacer(10),
                  itemCount: cubit.tabBarAreaList.isNotEmpty
                      ? cubit.tabBarAreaList.length
                      : 5,
                ),
              ),
              if (state is AreaCategoryRecipesFailure)
                CustomErrorWidget(
                  height: 200.h,
                  width: 250.w,
                  errorMessage: state.errorMessage,
                )
              else
                SizedBox(
                  height: 250.h,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    itemBuilder: (context, index) => state
                            is AreaCategoryRecipesSuccess
                        ? AppGridViewCard(
                            recipesMeal: cubit.areaCategoryRecipesList[index],
                          )
                        : CustomShimmerForLoading(
                            height: 176.h,
                            width: 150.w,
                            radius: 12,
                          ),
                    itemCount: cubit.areaCategoryRecipesList.isEmpty
                        ? 5
                        : cubit.areaCategoryRecipesList.length,
                    separatorBuilder: (context, index) => horizontalSpacer(16),
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
