import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/home/data/models/area_catogeries_model.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';
import 'package:food_recipes/features/home/data/repos/home_repo_impl.dart';

part 'area_category_and_recipes_state.dart';

class AreaCategoryAndRecipesCubit extends Cubit<AreaCategoryAndRecipesState> {
  AreaCategoryAndRecipesCubit(this.homeRepoImpl) : super(AreaCategoryAndRecipesInitial());
  final HomeRepoImpl homeRepoImpl;

  static AreaCategoryAndRecipesCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Meal> tabBarAreaList = [];

  List<RecipesMeal> areaCategoryRecipesList = [];

  int tabBarIndex = 0;

  void changeTabBar(int index) {
    tabBarIndex = index;
    getAreaCategoryRecipes();
    emit(ChangeTabBarState());
  }

  Future getAreaCategory() async {
    emit(AreaCategoryLoading());
    var data = await homeRepoImpl.fetchAreaCategory();
    data.fold((error) {
      emit(AreaCategoryFailure(error.errorMessage));
    }, (data) {
      tabBarAreaList = data.meals;
      getAreaCategoryRecipes();
      emit(AreaCategorySuccess());
    });
  }

  Future getAreaCategoryRecipes() async {
    emit(AreaCategoryRecipesLoading());
    var data = await homeRepoImpl.fetchAreaCategoryRecipes(tabBarAreaList[tabBarIndex].strArea);
    data.fold((error) {
      emit(AreaCategoryRecipesFailure(error.errorMessage));
    }, (data) {
      areaCategoryRecipesList =data.meals;
      emit(AreaCategoryRecipesSuccess());
    });
  }
}
