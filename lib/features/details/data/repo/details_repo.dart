import 'package:dartz/dartz.dart';
import 'package:food_recipes/core/failure/failures.dart';
import 'package:food_recipes/features/details/data/models/food_recipe_details_model.dart';

abstract class  DetailRepo {
  Future<Either<Failure,FoodRecipeDetailsModel>> fetchFoodRecipeDetails(String id);
}