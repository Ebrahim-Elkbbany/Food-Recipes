import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/category/presentation/views/all_categories_view.dart';
import 'package:food_recipes/features/favourites/presentation/view/favourites_view.dart';
import 'package:food_recipes/features/home/presentation/views/home_view.dart';
import 'package:food_recipes/features/profile/presentation/views/profile_view.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context){
    return BlocProvider.of(context);
  }

  int currentIndex=0;
  void changeBottomScreen(index){
    currentIndex=index;
    emit(ChangeBottomScreen());
  }
  List<Widget>bottomScreen=const[HomeView(),AllCategoriesView(),FavouritesView(),ProfileView()];
}
