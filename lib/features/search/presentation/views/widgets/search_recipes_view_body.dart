import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/widgets/app_text_form_field.dart';
import 'package:food_recipes/features/search/presentation/manager/search_recipe_cubit.dart';
import 'package:food_recipes/features/search/presentation/views/widgets/search_recipe_shimmer.dart';
import 'package:food_recipes/features/search/presentation/views/widgets/search_recipes_card.dart';

class SearchRecipesViewBody extends StatelessWidget {
  const SearchRecipesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchRecipeCubit>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'you should enter you search word or letter';
              }
            },
            controller: searchCubit.searchController,
            onChange: (value) {
              searchCubit.getSearchRecipeResult();
            },
            hintText: 'Search recipe',
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
            suffixIcon: Icons.search,
            suffixIconColor: AppColors.kGrayColorA9,
            suffixIconSize: 22.w,
          ),
          verticalSpacer(20),
          Expanded(
            child: BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
              builder: (context, state) {
                if (state is SearchRecipeLoading) {
                  return const ShimmerGridView();
                } else if (state is SearchRecipeFailure) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else if (state is SearchRecipeSuccess) {
                  if (searchCubit.meals.isNotEmpty) {
                    return GridView.builder(
                      itemCount: state.meals.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 110 / 110,
                      ),
                      itemBuilder: (context, index) {
                        return SearchRecipeCard(meal: state.meals[index]);
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No results found'),
                    );
                  }
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
