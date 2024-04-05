import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_recipes/core/api_service/api_end_points.dart';
import 'package:food_recipes/core/api_service/api_service.dart';
import 'package:food_recipes/core/failure/failures.dart';
import 'package:food_recipes/features/home/data/models/area_catogeries_model.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';
import 'package:food_recipes/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;
  final FirebaseStorage firebaseStorage;
  HomeRepoImpl(this.apiService,this.firebaseStorage);

  @override
  Future<Either<Failure, AreaCategoryModel>> fetchAreaCategory() async {
    try {
      var response =
          await apiService.get(urlEndPoint: ApiEndPoints.areaCategory);
      AreaCategoryModel areaCategoryModel =
          AreaCategoryModel.fromJson(response);
      return Right(areaCategoryModel);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      } else {
        return Left(
          ServerFailure(error.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, RecipesModel>> fetchAreaCategoryRecipes(String areaName)async {
    try {
      var response = await apiService.get(urlEndPoint: ApiEndPoints.recipeByCategory,queryParameters: {
        "a" : areaName
      });
      RecipesModel areaCategoryRecipesModel =
      RecipesModel.fromJson(response);
      return Right(areaCategoryRecipesModel);
    }  catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      } else {
        return Left(
          ServerFailure(error.toString()),
        );
      }
    }

  }

  @override
  Future<Either<Failure, RecipesModel>> fetchNewRecipes()async {
    try {
      var response = await apiService.get(urlEndPoint: ApiEndPoints.recipeByCategory,queryParameters: {
        "c" : 'beef'
      });
      RecipesModel recipesModel =
      RecipesModel.fromJson(response);
      return Right(recipesModel);
    }  catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      } else {
        return Left(
          ServerFailure(error.toString()),
        );
      }
    }
  }

  @override
  Future<Either<String, List<String>>> fetchBanners()async {
    try {
      Reference  reference = firebaseStorage.ref().child('banners');
      ListResult result =await reference.listAll();
      List<String> imageUrls = [];
      for (Reference ref in result.items) {
        String downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }
      return Right(imageUrls);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
