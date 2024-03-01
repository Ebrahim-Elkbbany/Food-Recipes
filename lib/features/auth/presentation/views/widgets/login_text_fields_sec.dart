import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/helpers/app_regex.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/widgets/custom_text_form_field.dart';
import 'package:food_recipes/features/auth/presentation/manager/login_cubit/login_cubit.dart';

class LoginTextFieldSec extends StatelessWidget {
  const LoginTextFieldSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: FontStyles.font14Black12Regular,
          ),
          verticalSpacer(5),
          AppTextFormField(
            controller: context.read<LoginCubit>().email,
            hintText: 'Enter Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpacer(30),
          Text(
            'Enter Password',
            style: FontStyles.font14Black12Regular,
          ),
          verticalSpacer(5),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return AppTextFormField(
                controller: context.read<LoginCubit>().password,
                hintText: 'Enter Password',
                isObscureText: context.read<LoginCubit>().isPassword,
                suffixIconTap: () {
                  context.read<LoginCubit>().changePasswordVisibility();
                },
                suffixIcon: context.read<LoginCubit>().suffix,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
