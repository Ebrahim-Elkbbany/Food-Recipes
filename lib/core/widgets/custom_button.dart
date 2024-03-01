
import 'package:flutter/material.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';





class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      this.onPressed,
       this.height,
       this.width=double.infinity,
       this.radius, this.style,
      });

  final String buttonName;
  final void Function()? onPressed;
  final double ?height;
  final double ?width;
  final double ?radius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 54,
        width: width ?? double.infinity,

        decoration:  BoxDecoration(
           color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(
          radius ?? 10,
        ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: style ?? FontStyles.font16WhiteSemiBold,
          ),
        ),
      ),
    );
  }
}
