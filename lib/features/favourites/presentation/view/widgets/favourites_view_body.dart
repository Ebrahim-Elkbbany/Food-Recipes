import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/di/dependency_injection.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/features/favourites/data/repos/favourites_recipe_repo.dart';
import 'package:food_recipes/features/favourites/presentation/manager/favourites_cubit.dart';
import 'package:food_recipes/features/favourites/presentation/view/widgets/favourites_recipe_card.dart';
import 'package:food_recipes/features/favourites/presentation/view/widgets/shimmer_list_view.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit.get(context).isLightTheme;

    return BlocProvider(
      create: (context) => FavouritesCubit(getIt.get<FavouritesRecipeRepo>())
        ..getAllFavourites(),
      child: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          var cubit = FavouritesCubit.get(context);
          if (state is GetFavouritesLoading) {
            return const ShimmerListView();
          } else if (state is GetFavouritesFailure) {
            return Center(
              child: SizedBox(
                height: 60.h,
                width: double.infinity,
                child: Center(
                  child: Text(
                    state.errorMessage,
                    style: FontStyles.font16WhiteSemiBold.copyWith(
                      color: isLightTheme
                          ? AppColors.kBlackColor
                          : AppColors.kWhiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          } else if (state is GetFavouritesSuccess ||
              state is AddToFavouritesSuccess) {
            if (cubit.allFavouritesRecipe.isNotEmpty ||
                cubit.allFavouritesRecipe != null) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                itemBuilder: (context, index) {
                  return FavouritesRecipeCard(
                      favouritesRecipeModel: cubit.allFavouritesRecipe[index]);
                },
                separatorBuilder: (context, index) => verticalSpacer(20),
                itemCount: cubit.allFavouritesRecipe.length,
              );
            } else {
              return Center(
                child: Text(
                  'No favorite recipes yet',
                  style: FontStyles.font16WhiteSemiBold.copyWith(
                    color: isLightTheme
                        ? AppColors.kBlackColor
                        : AppColors.kWhiteColor,
                  ),
                ),
              );
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
