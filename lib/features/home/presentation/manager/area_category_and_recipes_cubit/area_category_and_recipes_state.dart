part of 'area_category_and_recipes_cubit.dart';

@immutable
abstract class AreaCategoryAndRecipesState {}

class AreaCategoryAndRecipesInitial extends AreaCategoryAndRecipesState {}
class ChangeTabBarState extends AreaCategoryAndRecipesState {}
class AreaCategoryLoading extends AreaCategoryAndRecipesState {}
class AreaCategorySuccess extends AreaCategoryAndRecipesState {}
class AreaCategoryFailure extends AreaCategoryAndRecipesState {
  final String errorMessage;
  AreaCategoryFailure(this.errorMessage);
}

class AreaCategoryRecipesLoading extends AreaCategoryAndRecipesState {}
class AreaCategoryRecipesSuccess extends AreaCategoryAndRecipesState {}
class AreaCategoryRecipesFailure extends AreaCategoryAndRecipesState {
  final String errorMessage;
  AreaCategoryRecipesFailure(this.errorMessage);
}
