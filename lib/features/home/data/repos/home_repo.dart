import 'package:dartz/dartz.dart';
import 'package:food_recipes/core/failure/failures.dart';
import 'package:food_recipes/features/home/data/models/area_catogeries_model.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,AreaCategoryModel>> fetchAreaCategory();
  Future<Either<Failure,RecipesModel>> fetchAreaCategoryRecipes(String areaName);
  Future<Either<Failure,RecipesModel>> fetchNewRecipes();
  Future<Either<String,List<String>>> fetchBanners();

}