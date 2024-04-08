import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/search/data/models/search_recipes_model.dart';
import 'package:food_recipes/features/search/data/repo/search_repo_impl.dart';

part 'search_recipe_state.dart';

class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  SearchRecipeCubit(this.searchRepoImpl) : super(SearchRecipeInitial());
  final SearchRepoImpl searchRepoImpl;
  TextEditingController searchController = TextEditingController();
  List<Meal> meals = [];

  static SearchRecipeCubit get(context) => BlocProvider.of(context);

  Future<void> getSearchRecipeResult() async {
    emit(SearchRecipeLoading());
    final query = searchController.text;
    if (query.isEmpty) {
      emit(SearchRecipeFailure("Please enter a search query."));
      return;
    }

    final result = await searchRepoImpl.fetchSearchRecipes(query);

    result.fold(
          (error) {
            print(error.errorMessage);
        emit(SearchRecipeFailure(error.errorMessage));
      },
          (data) {
        meals.clear();
        meals.addAll(data.meals);
        emit(SearchRecipeSuccess(data.meals));
      },
    );
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
