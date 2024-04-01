import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/helpers/cache_helper.dart';
import 'package:food_recipes/core/theming/app_colors.dart';
import 'package:food_recipes/core/theming/font_styles.dart';





ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 24.w),
      unselectedIconTheme: IconThemeData(size: 24.w),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.kWhiteColor,
      selectedItemColor: AppColors.kPrimaryColor,
      elevation: 2,
      unselectedItemColor: AppColors.kWhiteColorD9,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: FontStyles.font18Black18SemiBold,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.kBlack12Color, size: 24.w),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight:
      64.h,
    ),
    iconTheme: IconThemeData(size: 24.w),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins"
);

ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 24.w),
      unselectedIconTheme: IconThemeData(size: 24.w),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.kBlackColor,
      selectedItemColor: AppColors.kPrimaryColor,
      elevation: 2,
      unselectedItemColor: AppColors.kWhiteColorD9,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: FontStyles.font18Black18SemiBold,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.kWhiteColor, size: 24.w),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      toolbarHeight:
      64.h,
    ),
    iconTheme: IconThemeData(size: 24.w),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: "Poppins"
);

bool isLightThemeCache = CacheHelper.getData(key: 'isLightTheme')?? true;


