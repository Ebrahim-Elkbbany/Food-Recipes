part of 'search_recipe_cubit.dart';

@immutable
abstract class SearchRecipeState {}

class SearchRecipeInitial extends SearchRecipeState {}
class SearchRecipeLoading extends SearchRecipeState {}
class SearchRecipeSuccess extends SearchRecipeState {
  final List<Meal> meals;

  SearchRecipeSuccess(this.meals);

}
class SearchRecipeFailure extends SearchRecipeState {
  final String errorMessage;

  SearchRecipeFailure(this.errorMessage);
}
