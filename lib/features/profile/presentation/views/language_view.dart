import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/profile/presentation/views/widgets/custom_radio_container.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child:  const Column(
            children: [
              CustomRadioContainer(name: "English", leading: "En",isSelected: true),
              CustomRadioContainer(name: "Arabic", leading: "Ar", isSelected: false, ),
            ],
          ),
        ),
      ),
    );
  }
}
