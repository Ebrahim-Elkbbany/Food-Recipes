import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/home/data/models/recipes_model.dart';
import 'package:food_recipes/features/home/data/repos/home_repo_impl.dart';
part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.homeRepoImpl) : super(BannersInitial());
  final HomeRepoImpl homeRepoImpl;

  static BannersCubit get(context) {
    return BlocProvider.of(context);
  }


  List<String> bannersImageUrls = [];

  List<RecipesMeal> newRecipesList = [];


  Future getBanners()async{
    emit(BannersLoading());
    var data = await homeRepoImpl.fetchBanners();
    data.fold((error) {
      emit(BannersFailure(error));
    }, (result) {
      bannersImageUrls = result;
      emit(BannersSuccess());
    });
  }
}
