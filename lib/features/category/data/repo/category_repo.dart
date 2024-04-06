import 'package:dartz/dartz.dart';
import 'package:food_recipes/core/failure/failures.dart';
import 'package:food_recipes/features/category/data/models/all_categories_model.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';

abstract class CategoryRepo{
  Future<Either<Failure,AllCategoriesModel>> fetchAllCategories();
  Future<Either<Failure,RecipesModel>> fetchCategoryRecipes(String categoryName);

}