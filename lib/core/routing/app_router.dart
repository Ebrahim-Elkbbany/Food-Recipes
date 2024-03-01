import 'package:flutter/material.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/features/onboarding/presentation/onboarding_view.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      default:
        return null;
    }
  }
}
