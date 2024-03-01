import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFaceGoogleContainer extends StatelessWidget {
  const CustomFaceGoogleContainer(
      {super.key, required this.isGoogle, this.onTap});

  final bool isGoogle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 44.w,
        height: 44.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19696969),
              blurRadius: 5,
              offset: Offset(0, 0),
              spreadRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            isGoogle ? 'assets/images/google.svg' : 'assets/images/face.svg',
            width: 20.w,
            height: 20.h,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
