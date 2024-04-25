import 'package:dartz/dartz.dart';
import 'package:food_recipes/core/failure/firebase_failure.dart';
import 'package:food_recipes/features/favourites/data/models/favourites_model.dart';

abstract class FavouritesRecipeRepo{
  Future<Either<FirebaseDataFailure,List<FavouritesRecipeModel>>> fetchFavourites();
  Future<Either<FirebaseDataFailure,void>> addToFavourites(FavouritesRecipeModel favouritesRecipeModel);
}