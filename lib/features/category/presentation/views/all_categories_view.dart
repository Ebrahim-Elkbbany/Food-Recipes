import 'package:flutter/material.dart';
import 'package:food_recipes/features/category/presentation/views/widgets/category_view_body.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
      ),
      body: const CategoryViewBody(),
    );
  }
}
