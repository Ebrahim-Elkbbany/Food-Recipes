import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/cache_helper.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Image.asset(
            'assets/images/food_recipe_onboarding.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Text(
                'Get \nCooking',
                textAlign: TextAlign.center,
                style: FontStyles.font50WhiteSemiBold,
              ),
              verticalSpacer(20),
              Text(
                'Simple way to find Tasty Recipe',
                textAlign: TextAlign.center,
                style: FontStyles.font16WhiteD9Regular,
              ),
              verticalSpacer(64),
              CustomButton(
                buttonName: 'Start Cooking',
                width: 243.w,
                onPressed: () {
                  CacheHelper.saveData(
                    key: 'onBoarding',
                    value: true,
                  ).then((value) {
                    if (value == true) {
                      context.pushNamedAndRemoveUntil(
                        Routes.loginView,
                        predicate: (route) => false,
                      );
                    }
                  });
                },
              ),
              verticalSpacer(50),
            ],
          ),
        ]),
      ),
    );
  }
}
