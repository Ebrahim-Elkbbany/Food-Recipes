import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/cache_helper.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/widgets/custom_button.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:food_recipes/features/profile/presentation/views/widgets/profile_account_data_sec.dart';
import 'package:food_recipes/features/profile/presentation/views/widgets/profile_second_container_sec.dart';
import '../../../../core/routing/routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Column(
                children: [
                  const ProfileAccountDataSec(),
                  verticalSpacer(30),
                  const ProfileSecondContainerSec(),
                  verticalSpacer(30),
                  CustomButton(
                    buttonName: "Log out",
                    onPressed: () {
                      logoutDialog(context);
                    },
                  ),
                  verticalSpacer(40),
                ],
              );
            },
          ),
        ));
  }

  void logoutDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      title: 'Are you sure you want to logout ?',
      desc: "If you logged out you would need to re-enter the Email and password if you want to enter again. ",
      animType: AnimType.bottomSlide,
      btnCancelOnPress: () {},
      dialogType: DialogType.question,
      btnOkText: 'Yes',
      btnOkColor: AppColors.kPrimaryColor,
      btnCancelText: 'No',
      btnOkOnPress: () {
        CacheHelper.removeData(key: 'token');
        context.pushNamedAndRemoveUntil(Routes.loginView,
            predicate: (route) => false);
      },

    ).show();
  }
}
