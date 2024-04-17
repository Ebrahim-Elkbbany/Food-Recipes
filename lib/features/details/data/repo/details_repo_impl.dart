import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_recipes/core/api_service/api_end_points.dart';
import 'package:food_recipes/core/api_service/api_service.dart';
import 'package:food_recipes/core/failure/failures.dart';
import 'package:food_recipes/features/details/data/models/food_recipe_details_model.dart';
import 'package:food_recipes/features/details/data/repo/details_repo.dart';

class DetailsRepoImpl extends DetailRepo {
  final ApiService apiService;

  DetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, FoodRecipeDetailsModel>> fetchFoodRecipeDetails(
      String id) async {
    try {
      var response = await apiService.get(
          urlEndPoint: ApiEndPoints.detailsRecipe, queryParameters: {"i": id});
      FoodRecipeDetailsModel foodRecipeDetailsModel =FoodRecipeDetailsModel.fromJson(response);
      return Right(foodRecipeDetailsModel);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return Left(ServerFailure(
          e.toString(),
        ));
      }
    }
  }
}
