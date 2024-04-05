import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/helpers/cache_helper.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context){
    return BlocProvider.of(context);
  }

  bool isLightTheme =  CacheHelper.getData(key: 'isLightTheme')?? true;

  void changeTheme(){
    isLightTheme =!isLightTheme;
    CacheHelper.saveData(key: 'isLightTheme', value: isLightTheme);
    emit(ChangeThemeSuccess());
  }


}
