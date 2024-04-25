part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}
class AddToFavouritesLoading extends FavouritesState {}
class AddToFavouritesSuccess extends FavouritesState {}
class AddToFavouritesFailure extends FavouritesState {
  final String errorMessage;
  AddToFavouritesFailure(this.errorMessage);
}

class GetFavouritesLoading extends FavouritesState {}
class GetFavouritesSuccess extends FavouritesState {
  final List<FavouritesRecipeModel>  favouritesRecipe;
  GetFavouritesSuccess(this.favouritesRecipe);
}
class GetFavouritesFailure extends FavouritesState {
  final String errorMessage;
  GetFavouritesFailure(this.errorMessage);
}

class IsFavouriteState extends FavouritesState {}

