import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/core/widgets/custom_error_widget.dart';
import 'package:food_recipes/core/widgets/custom_shimmer_for_loading.dart';
import 'package:food_recipes/features/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:food_recipes/features/category/presentation/views/widgets/category_card_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        var cubit = CategoryCubit.get(context);
        if (state is CategoryFailure) {
          return Center(
              child: CustomErrorWidget(
            errorMessage: state.errorMessage,
            width: 200.w,
            height: 200.h,
          ));
        } else {
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
              return state is CategorySuccess
                  ? GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          Routes.categoryRecipesView,
                          arguments: cubit.categories[index].strCategory,
                        );
                      },
                      child: CategoryCardItem(
                        category: cubit.categories[index],
                      ),
                    )
                  : CustomShimmerForLoading(
                      height: 180.h,
                      width: 180.w,
                      radius: 12,
                    );
            },
          );
        }
      },
    );
  }
}
