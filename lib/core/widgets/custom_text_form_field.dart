import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final IconData? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function()? suffixIconTap;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.suffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical:19.h,horizontal: 20.w),
        isDense: true,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.kPrimaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.kWhiteColorD9,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: hintStyle ?? FontStyles.font13WhiteD9Regular,
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: suffixIconTap,
          child: Icon(
            suffixIcon,
            color: AppColors.kPrimaryColor,
          ),
        ),
        fillColor: backgroundColor ?? Colors.white,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: FontStyles.font13Black12Regular,
      cursorColor:    AppColors.kPrimaryColor,
      validator: (value) {
        return validator(value);
      },
    );
  }
}