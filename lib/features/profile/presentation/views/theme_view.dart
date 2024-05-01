import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:food_recipes/features/profile/presentation/views/widgets/custom_radio_container.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomRadioContainer(
                    name: "",
                    leading: "Light",
                    isSelected: ThemeCubit.get(context).isLightTheme,
                    onPressed: () {
                      ThemeCubit.get(context).changeTheme();
                    },
                  ),
                  CustomRadioContainer(
                    name: "",
                    leading: "Dark",
                    isSelected: !ThemeCubit.get(context).isLightTheme,
                    onPressed: () {
                      ThemeCubit.get(context).changeTheme();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
