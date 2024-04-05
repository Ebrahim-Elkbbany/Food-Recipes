import 'package:flutter/material.dart';
import 'package:food_recipes/core/theming/font_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage, this.height, this.width});

  final String errorMessage;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Text(
          errorMessage,
          style: FontStyles.font16WhiteSemiBold.copyWith(
            color: Colors.red
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
