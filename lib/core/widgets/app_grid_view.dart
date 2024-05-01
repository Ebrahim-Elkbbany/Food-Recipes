import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGridView extends StatelessWidget {
  const AppGridView({Key? key, required this.itemCount, required this.itemBuilder}) : super(key: key);
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          itemCount: itemCount,
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(20),
            horizontal: ScreenUtil().setWidth(20),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ScreenUtil().screenWidth > 600 ? 4 : 2,
            mainAxisSpacing: ScreenUtil().setHeight(20),
            crossAxisSpacing: ScreenUtil().setWidth(10),
            childAspectRatio: 110 / 150,
          ),
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
