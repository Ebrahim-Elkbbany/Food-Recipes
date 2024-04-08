import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/di/dependency_injection.dart';
import 'package:food_recipes/features/search/data/repo/search_repo_impl.dart';
import 'package:food_recipes/features/search/presentation/manager/search_recipe_cubit.dart';
import 'package:food_recipes/features/search/presentation/views/widgets/search_recipes_view_body.dart';

class SearchRecipesView extends StatelessWidget {
  const SearchRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search recipes'),
      ),
      body: BlocProvider(
        create: (context) => SearchRecipeCubit(getIt.get<SearchRepoImpl>()),
        child: const SearchRecipesViewBody(),
      ),
    );
  }
}
