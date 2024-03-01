import 'package:flutter/material.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/widgets/custom_text_button.dart';

class LoginDontHaveAccountSec extends StatelessWidget {
  const LoginDontHaveAccountSec({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: FontStyles.font11kSecondaryColorRegular
              .copyWith(color: Colors.black),
        ),
        CustomTextButton(
          text: '  Sign up',
          onPressed: () {
            context.pushReplacementNamed(Routes.signupView);
          },
        ),
      ],
    );
  }
}
