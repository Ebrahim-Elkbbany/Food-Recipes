import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGridView extends StatelessWidget {
  const AppGridView({super.key, required this.itemCount, required this.itemBuilder});
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        childAspectRatio: 115 / 150,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
