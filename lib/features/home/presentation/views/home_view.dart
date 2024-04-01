import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/widgets/custom_tab_bar.dart';
import 'package:food_recipes/features/home/presentation/views/widgets/home_view_hello_search_sec.dart';
import 'package:food_recipes/features/onboarding/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/routing/routes.dart';

// to test
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit
        .get(context)
        .isLightTheme;
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed(Routes.loginView);
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
          Text(user?.displayName ?? ""),
          BlocConsumer<ThemeCubit, ThemeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () async {
                  ThemeCubit
                      .get(context)
                      .changeTheme();
                },
                icon: const Icon(
                  Icons.exit_to_app,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          children: [
            verticalSpacer(20),
            const HomeViewHalloSearchSec(),
            verticalSpacer(25),
            SizedBox(
              height: 300,
              child: CustomTabBar(
                  tabs: ['Indian',
                'Italian',
                'hh',
                'hh',
                'hh',
                'hhssssssssssss',
                'ssssssss',
                'sss',
              ], children: [
                Column(
                  children: [

                  ],
                ),

              ]),
            )
          ],
        ),
      ),
    );
  }
}
