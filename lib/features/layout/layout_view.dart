import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/di/dependency_injection.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/features/category/data/repo/category_repo_impl.dart';
import 'package:food_recipes/features/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:food_recipes/features/favourites/data/repos/favourites_recipe_repo.dart';
import 'package:food_recipes/features/favourites/presentation/manager/favourites_cubit.dart';
import 'package:food_recipes/features/home/data/repos/home_repo_impl.dart';
import 'package:food_recipes/features/home/presentation/manager/area_category_and_recipes_cubit/area_category_and_recipes_cubit.dart';
import 'package:food_recipes/features/home/presentation/manager/new_recipes_cubit/new_recipes_cubit.dart';
import 'package:food_recipes/features/onboarding/presentation/manager/theme_cubit/theme_cubit.dart';
import 'manager/layout_cubit.dart';
import 'package:food_recipes/features/home/presentation/manager/banners_cubit/banners_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var isLightTheme = ThemeCubit.get(context).isLightTheme;
    SystemChrome.setSystemUIOverlayStyle(isLightTheme
        ? SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: AppColors.kWhiteColor,
          )
        : SystemUiOverlayStyle.light
            .copyWith(statusBarColor: AppColors.kBlackColor));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BannersCubit(getIt.get<HomeRepoImpl>())..getBanners(),
        ),
        BlocProvider(
          create: (context) =>
              AreaCategoryAndRecipesCubit(getIt.get<HomeRepoImpl>())
                ..getAreaCategory(),
        ),
        BlocProvider(
          create: (context) => NewRecipesCubit(
            getIt.get<HomeRepoImpl>(),
          )..getNewRecipes(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryCubit(getIt.get<CategoryRepoImpl>())..getAllCategories(),
        ),
        BlocProvider(
          create: (context) =>
          FavouritesCubit(getIt.get<FavouritesRecipeRepo>())..getAllFavourites(),
        ),
      ],
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomScreen(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      cubit.currentIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      cubit.currentIndex == 1
                          ? Icons.category
                          : Icons.category_outlined,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      cubit.currentIndex == 2
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      cubit.currentIndex == 3
                          ? Icons.person
                          : Icons.person_outlined,
                    ),
                    label: ''),
              ],
              //
            ),
          );
        },
      ),
    );
  }
}
