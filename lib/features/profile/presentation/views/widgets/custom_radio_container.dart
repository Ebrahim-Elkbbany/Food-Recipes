import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';


class CustomRadioContainer extends StatelessWidget {
  const CustomRadioContainer({
    super.key,
    this.onPressed,
    required this.name,
    required this.leading,
    required this.isSelected,
  });

  final void Function()? onPressed;
  final String name;
  final String leading;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = !BlocProvider.of<ThemeCubit>(context).isLightTheme;
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          verticalSpacer(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                leading,
                style: FontStyles.font18Black18SemiBold.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDarkTheme ? AppColors.kPrimaryColor : null,
                ),
              ),
              horizontalSpacer(24),
              Text(
                name,
                style: FontStyles.font16WhiteSemiBold.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDarkTheme ? AppColors.kPrimaryColor : null,
                ),
              ),
              const Spacer(),
              if (isSelected == true)
                Icon(
                  Icons.check,
                  size: 20.w,
                  color: AppColors.kPrimaryColor,
                )
            ],
          ),
          verticalSpacer(10),
          Divider(
            thickness: 0.5.w,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
