import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_recipes/core/api_service/api_service.dart';
import 'package:food_recipes/features/auth/data/repos/login_repo_implemetation.dart';
import 'package:food_recipes/features/auth/data/repos/sign_up_repo_implementation.dart';
import 'package:food_recipes/features/category/data/repo/category_repo_impl.dart';
import 'package:food_recipes/features/details/data/repo/details_repo_impl.dart';
import 'package:food_recipes/features/favourites/data/repos/favourites_recipe_repo.dart';
import 'package:food_recipes/features/favourites/data/repos/favourites_recipe_repo_imp.dart';
import 'package:food_recipes/features/home/data/repos/home_repo_impl.dart';
import 'package:food_recipes/features/search/data/repo/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<SignupRepoImpl>(
    SignupRepoImpl(FirebaseAuth.instance),
  );
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(FirebaseAuth.instance),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
      FirebaseStorage.instance,
    ),
  );

  getIt.registerSingleton<CategoryRepoImpl>(
    CategoryRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<FavouritesRecipeRepo>(
      FavouritesRecipeRepoImp(),
  );
}
