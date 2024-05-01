import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/features/favourites/presentation/manager/favourites_cubit.dart';
import '../../../data/models/favourites_model.dart';

class FavouritesRecipeCard extends StatelessWidget {
  final FavouritesRecipeModel favouritesRecipeModel;

  const FavouritesRecipeCard({super.key, required this.favouritesRecipeModel});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.foodRecipesDetailsView,
            arguments: favouritesRecipeModel.idMeal);
      },
      child: Container(
        height: 220.h,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              favouritesRecipeModel.strMealThumb,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Positioned(
              left: 10.w,
              bottom: 20.h,
              right: 10.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width /2,
                    child: Text(
                      favouritesRecipeModel.strMeal,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: FontStyles.font16WhiteSemiBold.copyWith(
                        color:  AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FavouritesCubit.get(context).addToFavorites(FavouritesRecipeModel(
                        strMeal:  favouritesRecipeModel.strMeal,
                        strMealThumb: favouritesRecipeModel.strMealThumb,
                        idMeal: favouritesRecipeModel.idMeal,
                      ));

                    },
                    child: Icon(
                      FavouritesCubit.get(context).isFavourites(favouritesRecipeModel.idMeal)
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                      color: AppColors.kPrimaryColor,
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
