import 'package:dartz/dartz.dart';
import 'package:food_recipes/core/failure/failures.dart';
import 'package:food_recipes/features/search/data/models/search_recipes_model.dart';

abstract class SearchRepo {
   Future<Either<Failure,SearchRecipesModel>> fetchSearchRecipes(String recipeName);
}