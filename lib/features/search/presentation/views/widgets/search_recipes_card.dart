import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/features/search/data/models/search_recipes_model.dart';

class SearchRecipeCard extends StatelessWidget {
  final Meal meal;

  const SearchRecipeCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.foodRecipesDetailsView,
            arguments: meal.idMeal);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              meal.strMealThumb,
              fit: BoxFit.fill,
            ),
            Positioned(
              left: 10.w,
              right: 10.w,
              bottom: 20.h,
              child: Text(
                meal.strMeal,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
