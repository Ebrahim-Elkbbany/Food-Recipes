import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/theming/font_weight_helper.dart';
import 'package:food_recipes/core/widgets/app_text_form_field.dart';
import 'package:food_recipes/features/onboarding/presentation/manager/theme_cubit/theme_cubit.dart';

class HomeViewHalloSearchSec extends StatelessWidget {
  const HomeViewHalloSearchSec({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = ThemeCubit
        .get(context)
        .isLightTheme;
    User? user = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo ${user!.displayName}',
                  style: FontStyles.font20Black12Regular.copyWith(
                    color: isLightTheme
                        ? AppColors.kBlackColor
                        : AppColors.kWhiteColor,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
                Text(
                  'What are you cooking today?',
                  style: FontStyles.font11kSecondaryColorRegular.copyWith(
                    color: isLightTheme
                        ? AppColors.kGrayColorA9
                        : AppColors.kWhiteColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.network(
              user.photoURL ??
                  'https://cdn-icons-png.flaticon.com/512/149/149071.png',
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            ),
            horizontalSpacer(20)
          ],
        ),
        verticalSpacer(20),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: AppTextFormField(
            hintText: 'Search recipe',
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
            suffixIcon: Icons.search,
            suffixIconColor: AppColors.kGrayColorA9,
            suffixIconSize: 22.w,
          ),
        ),
      ],
    );
  }
}
