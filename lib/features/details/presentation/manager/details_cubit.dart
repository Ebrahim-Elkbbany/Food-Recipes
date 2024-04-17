
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/details/data/repo/details_repo_impl.dart';
import '../../data/models/food_recipe_details_model.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepoImpl) : super(DetailsInitial());
  DetailsRepoImpl detailsRepoImpl;

  static DetailsCubit get(context) => BlocProvider.of(context);

  Meal ?meal ;
  bool isDownIngredient = true;
  bool isDownInstructions = false;
  List<String> ingredients = [];
  List<String> measures = [];
  Future getFoodRecipeDetailsModel({required String id}) async {
    emit(DetailsLoading());
    var result = await detailsRepoImpl.fetchFoodRecipeDetails(id);
    result.fold((error) {
      emit(DetailsFailure(error.errorMessage));
    }, (data) {
      meal= data.meals[0];
      for (var meal in data.meals) {
        _addNonNullOrEmpty(meal.strIngredient1, ingredients);
        _addNonNullOrEmpty(meal.strIngredient2, ingredients);
        _addNonNullOrEmpty(meal.strIngredient3, ingredients);
        _addNonNullOrEmpty(meal.strIngredient4, ingredients);
        _addNonNullOrEmpty(meal.strIngredient5, ingredients);
        _addNonNullOrEmpty(meal.strIngredient6, ingredients);
        _addNonNullOrEmpty(meal.strIngredient7, ingredients);
        _addNonNullOrEmpty(meal.strIngredient8, ingredients);
        _addNonNullOrEmpty(meal.strIngredient9, ingredients);
        _addNonNullOrEmpty(meal.strIngredient10, ingredients);
        _addNonNullOrEmpty(meal.strIngredient11, ingredients);
        _addNonNullOrEmpty(meal.strIngredient12, ingredients);
        _addNonNullOrEmpty(meal.strIngredient13, ingredients);
        _addNonNullOrEmpty(meal.strIngredient14, ingredients);
        _addNonNullOrEmpty(meal.strIngredient15, ingredients);
        _addNonNullOrEmpty(meal.strIngredient16, ingredients);
        _addNonNullOrEmpty(meal.strIngredient17, ingredients);
        _addNonNullOrEmpty(meal.strIngredient18, ingredients);
        _addNonNullOrEmpty(meal.strIngredient19, ingredients);
        _addNonNullOrEmpty(meal.strIngredient20, ingredients);

        _addNonNullOrEmpty(meal.strMeasure1, measures);
        _addNonNullOrEmpty(meal.strMeasure2, measures);
        _addNonNullOrEmpty(meal.strMeasure3, measures);
        _addNonNullOrEmpty(meal.strMeasure4, measures);
        _addNonNullOrEmpty(meal.strMeasure5, measures);
        _addNonNullOrEmpty(meal.strMeasure6, measures);
        _addNonNullOrEmpty(meal.strMeasure7, measures);
        _addNonNullOrEmpty(meal.strMeasure8, measures);
        _addNonNullOrEmpty(meal.strMeasure9, measures);
        _addNonNullOrEmpty(meal.strMeasure10, measures);
        _addNonNullOrEmpty(meal.strMeasure11, measures);
        _addNonNullOrEmpty(meal.strMeasure12, measures);
        _addNonNullOrEmpty(meal.strMeasure13, measures);
        _addNonNullOrEmpty(meal.strMeasure14, measures);
        _addNonNullOrEmpty(meal.strMeasure15, measures);
        _addNonNullOrEmpty(meal.strMeasure16, measures);
        _addNonNullOrEmpty(meal.strMeasure17, measures);
        _addNonNullOrEmpty(meal.strMeasure18, measures);
        _addNonNullOrEmpty(meal.strMeasure19, measures);
        _addNonNullOrEmpty(meal.strMeasure20, measures);
      }
      emit(DetailsSuccess());
  }
    );


}

  void chaneDownIngredient(){
    isDownIngredient = !isDownIngredient;
    emit(IsDownIngredient());
  }
  void chaneDownInstructions(){
    isDownInstructions = !isDownInstructions;
    emit(IsDownInstructions());
  }
  void _addNonNullOrEmpty(String? value, List<String> list) {
    if (value != null && value.isNotEmpty) {
      list.add(value);
    }
  }
}
