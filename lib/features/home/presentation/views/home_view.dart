import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/di/dependency_injection.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/features/home/data/repos/home_repo_impl.dart';
import 'package:food_recipes/features/home/presentation/manager/area_category_and_recipes_cubit/area_category_and_recipes_cubit.dart';
import 'package:food_recipes/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:food_recipes/features/home/presentation/manager/new_recipes_cubit/new_recipes_cubit.dart';
import 'package:food_recipes/features/home/presentation/views/widgets/home_view_new_reipes_sec.dart';
import 'package:food_recipes/features/home/presentation/views/widgets/home_view_hello_search_sec.dart';
import 'package:food_recipes/features/home/presentation/views/widgets/home_view_tab_bar_list_view_sec.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.w),
          child: MultiBlocProvider(
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
            ],
            child: Column(
              children: [
                verticalSpacer(20),
                const HomeViewHalloSearchSec(),
                verticalSpacer(17),
                const HomeViewTabBarListViewSec(),
                verticalSpacer(10),
                const HomeViewNewRecipesSec(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
