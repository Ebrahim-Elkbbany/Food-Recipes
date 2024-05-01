import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/app_regex.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/theming/font_styles.dart';
import 'package:food_recipes/core/widgets/app_text_form_field.dart';
import 'package:food_recipes/core/widgets/custom_button.dart';
import 'package:food_recipes/core/widgets/custom_text_filed_name.dart';
import 'package:food_recipes/features/profile/presentation/manager/account_cubit.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';

import '../../../../../core/theming/app_colors.dart';

class AccountViewTextFieldsSec extends StatelessWidget {
  const AccountViewTextFieldsSec({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool isLightTheme = ThemeCubit
        .get(context)
        .isLightTheme;
    var cubit = AccountCubit.get(context);
    return Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 37.h,
                backgroundImage: NetworkImage(
                  cubit.newUserImageUrl ?? user?.photoURL ??
                      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(
                      37.h,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      AccountCubit.get(context).pickImage();
                    }, icon: const Icon(
                    Icons.camera_enhance,
                    color: Colors.black,
                  ),
                  ),
                ),
              ),
            ),
            verticalSpacer(30),
            Text(
              'Name',
              style: FontStyles.font14Black12Regular.copyWith(
                  color: isLightTheme ? null : AppColors.kWhiteColor),
            ),
            verticalSpacer(5),
            AppTextFormField(
              controller: cubit.name,
              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                },
            ),
            verticalSpacer(20),
            Text(
              'Phone',
              style: FontStyles.font14Black12Regular.copyWith(
                  color: isLightTheme ? null : AppColors.kWhiteColor),
            ),
            verticalSpacer(5),
            AppTextFormField(
              controller: cubit.phone,
              hintText: 'Enter Phone Number',
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPhoneNumberValid(value)) {
                  return 'Please enter a valid number';
                }
              },
            ),
            verticalSpacer(20),
            Text(
              'Enter Password',
              style: FontStyles.font14Black12Regular.copyWith(
                  color: isLightTheme ? null : AppColors.kWhiteColor),
            ),
            verticalSpacer(5),
            BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextFormField(
                      controller: cubit.password,
                      hintText: 'Enter Password',
                      isObscureText: cubit.isPassword,
                      suffixIcon: cubit.suffix,
                      suffixIconTap: () {
                        cubit.changePasswordVisibility();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                      },
                    ),
                    verticalSpacer(20),
                    Text(
                      'Confirm Password',
                      style: FontStyles.font14Black12Regular.copyWith(
                          color: isLightTheme ? null : AppColors.kWhiteColor),
                    ),
                    verticalSpacer(5),
                    AppTextFormField(
                      controller: cubit.confirmPassword,
                      hintText: 'Retype Password',
                      isObscureText: cubit.isPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (cubit.confirmPassword.text !=
                            cubit.password.text) {
                          return 'Passwords are not same';
                        }
                      },
                    ),
                  ],
                );
              },
            ),

          ],
        )
    );
  }
}
