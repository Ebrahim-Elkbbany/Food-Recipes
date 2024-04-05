part of 'new_recipes_cubit.dart';

@immutable
abstract class NewRecipesState {}

class NewRecipesInitial extends NewRecipesState {}

class NewRecipesLoading extends NewRecipesState {}
class NewRecipesSuccess extends NewRecipesState {}
class NewRecipesFailure extends NewRecipesState {
  final String errorMessage;
  NewRecipesFailure(this.errorMessage);
}
