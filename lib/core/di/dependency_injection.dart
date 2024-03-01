

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/features/auth/data/repos/login_repo_implemetation.dart';
import 'package:food_recipes/features/auth/data/repos/sign_up_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  getIt.registerSingleton<SignupRepoImpl>(
    SignupRepoImpl(
        FirebaseAuth.instance
    ),
  );
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
        FirebaseAuth.instance
    ),
  );
}
