import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/category/data/models/all_categories_model.dart';
import 'package:food_recipes/features/category/data/repo/category_repo.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());
  final CategoryRepo categoryRepo;

  static CategoryCubit get(context) => BlocProvider.of(context);
  List<Category> categories = [];

  Future getAllCategories() async {
    emit(CategoryLoading());
    var result = await categoryRepo.fetchAllCategories();
    result.fold(
          (error) {
        emit(
          CategoryFailure(error.errorMessage),
        );
      },
          (data) {
        categories = data.categories;
        emit(
          CategorySuccess(),
        );
      },
    );
  }

  List<RecipesMeal> categoryRecipe = [];

  Future getCategoryRecipes(String categoryName) async {
    emit(CategoryRecipesLoading());
    var result = await categoryRepo.fetchCategoryRecipes(categoryName);
    result.fold((error) {
      emit(CategoryRecipesFailure(error.errorMessage),);
    }, (data) {
      categoryRecipe = data.meals;
      emit(CategoryRecipesSuccess());
    },);
  }
}
