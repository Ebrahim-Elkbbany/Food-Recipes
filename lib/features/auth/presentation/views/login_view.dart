import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/features/auth/presentation/views/widgets/login_bloc_listener.dart';
import 'package:food_recipes/features/auth/presentation/views/widgets/login_dont_have_account_sec.dart';
import 'package:food_recipes/features/auth/presentation/views/widgets/login_forget_pass_and_button_sec.dart';
import 'package:food_recipes/features/auth/presentation/views/widgets/login_text_fields_sec.dart';
import 'package:food_recipes/features/auth/presentation/views/widgets/login_with_social.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(50),
              Text(
                'Hello,',
                style: FontStyles.font30BlackSemiBold,
              ),
              Text(
                'Welcome Back!',
                style: FontStyles.font20Black12Regular,
              ),
              verticalSpacer(57),
              const LoginTextFieldSec(),
              verticalSpacer(20),
              const LoginForgetPassAndButtonSec(),
              verticalSpacer(23),
              const LoginWithSocialSec(),
              verticalSpacer(55),
              const LoginDontHaveAccountSec(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
