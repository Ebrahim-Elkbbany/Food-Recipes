import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/theming/font_weight_helper.dart';
import 'package:food_recipes/features/onboarding/presentation/manager/theme_cubit/theme_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.children,
  });

  final List<String> tabs;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit
        .get(context)
        .isLightTheme;
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: <Widget>[
          PreferredSize(
            preferredSize: TabBar(

              tabs: [
                for (var i = 0; i < tabs.length; i++) Tab(text: tabs[i])
              ],
            ).preferredSize,
            child: Material(
              color: isLightTheme ? AppColors.kWhiteColor :Colors.black,
              child: Theme(
                data: ThemeData(),
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  physics: const BouncingScrollPhysics(),
                  indicatorPadding: EdgeInsets.symmetric(vertical: 5.h),
                  isScrollable: true,

                  tabs: [
                    for (var i = 0; i < tabs.length; i++) Tab(text: tabs[i])
                  ],
                  labelStyle: FontStyles.font13Black12Regular.copyWith(
                      fontWeight: FontWeightHelper.semiBold
                  ),
                  unselectedLabelStyle: FontStyles.font13Black12Regular.copyWith(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                  unselectedLabelColor: AppColors.kPrimaryColor,
                  labelColor: AppColors.kWhiteColor,
                  indicator: BoxDecoration(
                   shape: BoxShape.rectangle,
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [for (var i = 0; i < children.length; i++) children[i]],
            ),
          ),
        ],
      ),
    );
  }
}
