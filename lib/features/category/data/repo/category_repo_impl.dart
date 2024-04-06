import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_recipes/core/api_service/api_end_points.dart';
import 'package:food_recipes/core/api_service/api_service.dart';
import 'package:food_recipes/core/failure/failures.dart';
import 'package:food_recipes/features/category/data/models/all_categories_model.dart';
import 'package:food_recipes/features/category/data/repo/category_repo.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';

class CategoryRepoImpl extends CategoryRepo {
  ApiService apiService;

  CategoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AllCategoriesModel>> fetchAllCategories() async {
    try {
      var response =
          await apiService.get(urlEndPoint: ApiEndPoints.allCategories);
      AllCategoriesModel allCategoriesModel =
          AllCategoriesModel.fromJson(response);
      return Right(allCategoriesModel);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return Left(
          ServerFailure(
            error.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, RecipesModel>> fetchCategoryRecipes(String categoryName) async {
    try {
      var response = await apiService.get(
        urlEndPoint: ApiEndPoints.recipeByCategory,
        queryParameters: {
          'c': categoryName,
        }
      );
      RecipesModel recipesModel = RecipesModel.fromJson(response);
      return Right(recipesModel);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return Left(
          ServerFailure(
            error.toString(),
          ),
        );
      }
    }
  }
}
