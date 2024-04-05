import 'package:flutter/material.dart';
import 'package:food_recipes/core/widgets/app_grid_view.dart';

class CategoryRecipesView extends StatelessWidget {
  const CategoryRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name'),
      ),
      body: AppGridView(
        itemCount: 6,
        itemBuilder: (context, index) => Text('data'),
      ),
    );
  }
}
