import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_recipes/core/api_service/api_end_points.dart';
import 'package:food_recipes/core/api_service/api_service.dart';
import 'package:food_recipes/core/failure/failures.dart';
import 'package:food_recipes/features/search/data/models/search_recipes_model.dart';
import 'package:food_recipes/features/search/data/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SearchRecipesModel>> fetchSearchRecipes(String recipeName) async {
    try{
      var response = await apiService.get(
          urlEndPoint: ApiEndPoints.searchRecipes,
          queryParameters: {
            's': recipeName
          }
      );
      SearchRecipesModel searchRecipesModel = SearchRecipesModel.fromJson(response);
      return Right(searchRecipesModel);
    }catch(error){
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      } else {
        return Left(
          ServerFailure(error.toString()),
        );
      }
    }
  }
}
