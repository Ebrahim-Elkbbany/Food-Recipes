import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
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
          child:Column(
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
    );
  }
}
