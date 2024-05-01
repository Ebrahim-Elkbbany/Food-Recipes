import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import '../../../../../core/helpers/responsive_spacing.dart';
import '../../../../../core/theming/font_styles.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';

class ProfileAccountDataSec extends StatelessWidget {
  const ProfileAccountDataSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        var cubit = ThemeCubit
            .get(context);
        return Column(
          children: [
            CircleAvatar(
              radius: 37.h,
              backgroundImage: NetworkImage(
                user?.photoURL ??
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
              ),
            ),
            verticalSpacer(5),
            Text(
              user!.displayName!,
              textAlign: TextAlign.center,
              style: FontStyles.font16WhiteSemiBold.copyWith(
                  color:
                  cubit.isLightTheme ? AppColors.kBlackColor : AppColors.kWhiteColor),
            ),
            Text(
              user.email!,
              textAlign: TextAlign.center,
              style: FontStyles.font13Black12Regular.copyWith(
                  color: cubit.isLightTheme
                      ? AppColors.kBlack12Color
                      : AppColors.kWhiteColorD9),
            ),
          ],
        );
      },
    );
  }
}
