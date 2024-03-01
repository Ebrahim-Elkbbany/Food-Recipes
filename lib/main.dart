import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/bloc_observer.dart';
import 'package:food_recipes/core/di/dependency_injection.dart';
import 'package:food_recipes/core/helpers/cache_helper.dart';
import 'package:food_recipes/core/routing/app_router.dart';
import 'package:food_recipes/core/theming/app_theme.dart';
import 'core/routing/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(const FoodRecipesApp());
}

class FoodRecipesApp extends StatelessWidget {
  const FoodRecipesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        initialRoute: Routes.initialScreen,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}

