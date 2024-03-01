import 'package:flutter/material.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.text, this.textStyle,});
  final void Function()? onPressed ;
  final String text;
  final TextStyle? textStyle;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Text(
          text,
         style:textStyle ??  FontStyles.font11kSecondaryColorRegular,
      ),
    );
  }
}
