import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/helpers/responsive_spacing.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/widgets/custom_button.dart';
import 'package:food_recipes/features/profile/presentation/manager/account_cubit.dart';
import 'package:food_recipes/features/profile/presentation/views/widgets/account_view_text_fields_sec.dart';

class AccountEditingView extends StatelessWidget {
  const AccountEditingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My account"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<AccountCubit, AccountState>(
          listener: (context, state) {
            if(state is EditAccountLoading){
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Column(
                children: [
                  verticalSpacer(40),
                  const AccountViewTextFieldsSec(),
                  verticalSpacer(30),
                  AbsorbPointer(
                    absorbing: state is UploadNewUserImageLoadingState,
                    child: CustomButton(
                      buttonName: "Save changes",
                      onPressed: () {
                        if (AccountCubit.get(context).formKey.currentState!.validate()) {
                          saveChanged(context);
                        }

                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void saveChanged(BuildContext context) {
    AwesomeDialog(
      context: context,
      title: 'Are you sure to save changed?',
      desc: "Save your Editing Account",
      animType: AnimType.bottomSlide,
      btnCancelOnPress: () {},
      dialogType: DialogType.question,
      btnOkText: 'Yes',
      btnOkColor: AppColors.kPrimaryColor,
      btnCancelText: 'No',
      btnOkOnPress: () async{
        await AccountCubit.get(context).updateUserData();
        context.pushNamedAndRemoveUntil(Routes.layoutView,
            predicate: (route) => false);
      },
    ).show();
  }
}
