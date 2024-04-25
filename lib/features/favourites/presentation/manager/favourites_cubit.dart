import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/favourites/data/models/favourites_model.dart';
import 'package:food_recipes/features/favourites/data/repos/favourites_recipe_repo.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this.favouritesRecipeRepo) : super(FavouritesInitial());
  FavouritesRecipeRepo favouritesRecipeRepo;

  static FavouritesCubit get(context) =>
      BlocProvider.of<FavouritesCubit>(context);

  Future<void> addToFavorites(
      FavouritesRecipeModel favouritesRecipeModel) async {
    emit(AddToFavouritesLoading());
    var result =
        await favouritesRecipeRepo.addToFavourites(favouritesRecipeModel);
    result.fold(
      (error) {
        emit(AddToFavouritesFailure(error.error));
      },
      (r) async {
        await getAllFavourites();
        emit(AddToFavouritesSuccess());
      },
    );
  }

  List<FavouritesRecipeModel> allFavouritesRecipe = [];

  Future<void> getAllFavourites() async {
    emit(GetFavouritesLoading());
    var result = await favouritesRecipeRepo.fetchFavourites();
    result.fold((error) {
      emit(GetFavouritesFailure(error.error));
    }, (favouritesRecipeList) {
      allFavouritesRecipe.clear();
      allFavouritesRecipe= favouritesRecipeList;
      emit(GetFavouritesSuccess(favouritesRecipeList));
    });
  }

  bool isFavourites(String idMeal)  {
    final isFavorite =
        allFavouritesRecipe.any((item) => item.idMeal == idMeal);
    return isFavorite;
  }
}
