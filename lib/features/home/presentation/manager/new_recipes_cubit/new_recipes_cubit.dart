import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';
import 'package:food_recipes/features/home/data/repos/home_repo_impl.dart';

part 'new_recipes_state.dart';

class NewRecipesCubit extends Cubit<NewRecipesState> {
  NewRecipesCubit(this.homeRepoImpl) : super(NewRecipesInitial());
  final HomeRepoImpl homeRepoImpl;
  static NewRecipesCubit get(context) {
    return BlocProvider.of(context);
  }

  List<RecipesMeal> newRecipesList = [];



  Future getNewRecipes() async {
    emit(NewRecipesLoading());
    var data = await homeRepoImpl.fetchNewRecipes();
    data.fold((error) {
      emit(NewRecipesFailure(error.errorMessage));
    }, (data) {
      newRecipesList =data.meals;
      emit(NewRecipesSuccess());
    });
  }
}
