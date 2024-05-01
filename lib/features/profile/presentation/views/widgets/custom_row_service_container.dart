import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';

class CustomRowServiceContainer extends StatelessWidget {
  const CustomRowServiceContainer({
    super.key,
    required this.onPressed,
    required this.name,
    required this.iconName,
    this.isLast = false,
  });

  final void Function() onPressed;
  final String name;
  final IconData iconName;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ThemeCubit, ThemeState>(
  builder: (context, state) {
    var cubit = ThemeCubit
        .get(context);
    return Padding(
      padding:  EdgeInsets.only(top: 12.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
        decoration: ShapeDecoration(
          color: cubit.isLightTheme ? AppColors.kWhiteColor : AppColors.kBlackColor,
          shadows:  [
            BoxShadow(
              color:  cubit.isLightTheme ?  const Color(0x14000000) :Colors.grey[700]!,
              blurRadius: 3,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconName,
              color: Colors.grey,
              size: 26.w,
            ),
            horizontalSpacer(24),
            Text(
              name,
              style: FontStyles.font16WhiteSemiBold.copyWith(
                fontWeight: FontWeight.w400,
                color: cubit.isLightTheme ? AppColors.kBlackColor :AppColors.kWhiteColor ,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onPressed,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.w,
                color: AppColors.kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  },
);
  }
}
