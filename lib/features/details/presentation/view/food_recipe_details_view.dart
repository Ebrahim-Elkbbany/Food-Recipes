import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/widgets/custom_error_widget.dart';
import 'package:food_recipes/features/details/presentation/manager/details_cubit.dart';
import 'package:food_recipes/features/details/presentation/view/widgets/food_recipe_details_view_first_sec.dart';
import 'package:food_recipes/features/details/presentation/view/widgets/food_recipe_details_view_instrutions_sec.dart';
import 'package:food_recipes/features/details/presentation/view/widgets/food_reipe_details_view_ingredient_sec.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';

class FoodRecipesDetailsView extends StatelessWidget {
  const FoodRecipesDetailsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    var isLightTheme = ThemeCubit.get(context).isLightTheme;
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        var cubit = DetailsCubit.get(context);
        if (state is DetailsSuccess ||
            state is IsDownInstructions ||
            state is IsDownIngredient) {
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.meal!.strMeal),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FoodRecipeDetailsFirstSec(
                    isLightTheme: isLightTheme,
                    mealDetails: cubit.meal!,
                  ),
                  verticalSpacer(15),
                  DetailsViewIngredientSec(
                    ingredient: cubit.ingredients,
                    measure: cubit.measures,
                    isDownIngredient: cubit.isDownIngredient,
                    onPressed: () {
                      cubit.chaneDownIngredient();
                    },
                  ),
                  verticalSpacer(5),
                  FoodRecipeDetailsInstructionsSec(
                    isLightTheme: isLightTheme,
                    instructions: cubit.meal!.strInstructions,
                    isDownInstructions: cubit.isDownInstructions,
                    onPressed: () {
                      cubit.chaneDownInstructions();
                    },
                  )
                ],
              ),
            ),
          );
        } else if (state is DetailsFailure) {
          return Scaffold(
            body: Center(
              child: CustomErrorWidget(errorMessage: state.errorMessage),
            ),
          );
        } else {
          return  const Scaffold(
            body:    Center(

      child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
