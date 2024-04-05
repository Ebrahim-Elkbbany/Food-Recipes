import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/widgets/custom_error_widget.dart';
import 'package:food_recipes/core/widgets/custom_shimmer_for_loading.dart';
import 'package:food_recipes/core/widgets/app_grid_view_card.dart';
import 'package:food_recipes/features/home/presentation/manager/new_recipes_cubit/new_recipes_cubit.dart';

class NewRecipesView extends StatelessWidget {
  const NewRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Recipes'),
      ),
      body: BlocBuilder<NewRecipesCubit, NewRecipesState>(
        builder: (context, state) {
          var cubit = NewRecipesCubit.get(context);
          if (state is NewRecipesFailure) {
            return Center(
              child: CustomErrorWidget(
                height: 200.h,
                width: 250.w,
                errorMessage: state.errorMessage,
              ),
            );
          } else {
            return GridView.builder(
              itemCount: cubit.newRecipesList.isNotEmpty
                  ? cubit.newRecipesList.length
                  : 6,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                childAspectRatio: 115 / 150,
              ),
              itemBuilder: (context, index) => state is NewRecipesSuccess
                  ? GridViewCard(recipesMeal: cubit.newRecipesList[index])
                  : CustomShimmerForLoading(
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
