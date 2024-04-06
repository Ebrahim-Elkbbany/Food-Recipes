import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/widgets/app_grid_view.dart';
import 'package:food_recipes/core/widgets/app_grid_view_card.dart';
import 'package:food_recipes/core/widgets/custom_error_widget.dart';
import 'package:food_recipes/core/widgets/custom_shimmer_for_loading.dart';
import 'package:food_recipes/features/category/presentation/manager/category_cubit/category_cubit.dart';

class CategoryRecipesView extends StatelessWidget {
  const CategoryRecipesView({super.key, required this.categoryName,});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var cubit = CategoryCubit.get(context);
          if (state is CategoryRecipesFailure) {
            return CustomErrorWidget(
              height: 200.h,
              width: 250.w,
              errorMessage: state.errorMessage,
            );
          } else {
            return AppGridView(
              itemCount: state is CategoryRecipesSuccess ? cubit
                  .categoryRecipe.length : 6,
              itemBuilder: (context, index) =>
              state is CategoryRecipesSuccess ? AppGridViewCard(
                recipesMeal: cubit.categoryRecipe[index],
              ) : CustomShimmerForLoading(
                height: 176.h,
                width: 150.w,
                radius: 12,
              ),
            );
          }
        },
      ),
    );
  }
}
