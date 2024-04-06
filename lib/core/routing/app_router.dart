import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/di/dependency_injection.dart';
import 'package:food_recipes/core/helpers/cache_helper.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/features/auth/data/repos/login_repo_implemetation.dart';
import 'package:food_recipes/features/auth/data/repos/sign_up_repo_implementation.dart';
import 'package:food_recipes/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:food_recipes/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:food_recipes/features/auth/presentation/views/login_view.dart';
import 'package:food_recipes/features/auth/presentation/views/sign_up_view.dart';
import 'package:food_recipes/features/category/data/repo/category_repo_impl.dart';
import 'package:food_recipes/features/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:food_recipes/features/category/presentation/views/category_reicpes_view.dart';
import 'package:food_recipes/features/home/data/repos/home_repo_impl.dart';
import 'package:food_recipes/features/home/presentation/manager/new_recipes_cubit/new_recipes_cubit.dart';
import 'package:food_recipes/features/home/presentation/views/new_recipes_view.dart';
import 'package:food_recipes/features/onboarding/presentation/onboarding_view.dart';
import 'package:food_recipes/features/layout/layout_view.dart';

class AppRouter {
  dynamic onBoarding = CacheHelper.getData(key: 'onBoarding');

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialScreen:
        return MaterialPageRoute(
          builder: (_) => onBoarding != null
              ? (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
              ? const LayoutView()
              : BlocProvider(
            create: (context) =>
                LoginCubit(getIt.get<LoginRepoImpl>()),
            child: const LoginView(),
          )
              : const OnboardingView(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.signupView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupCubit(getIt.get<SignupRepoImpl>()),
            child: const SignUpView(),
          ),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
            child: const LoginView(),
          ),
        );
      case Routes.layoutView:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
        );
      case Routes.newRecipesView:
        return  MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => NewRecipesCubit(getIt.get<HomeRepoImpl>())..getNewRecipes(),
            child: const NewRecipesView(),
          ),
        );
      case Routes.categoryRecipesView:
        final arguments = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CategoryCubit(getIt.get<CategoryRepoImpl>())..getCategoryRecipes(arguments),
            child: CategoryRecipesView(categoryName: arguments),
          ),
        );  
      default:
        return null;
    }
  }
}
