import 'package:flutter/material.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/features/category/presentation/views/widgets/category_card_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 14,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 115 / 100,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.pushNamed(Routes.categoryRecipesView);
          },
          child: const CategoryCardItem(),
        );
      },
    );
  }
}
