import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';

class MyTheme {
static final ThemeData lightTheme = ThemeData(
  canvasColor: ColorsManager.canvasGrey,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    backgroundColor: ColorsManager.canvasGrey,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(
      fontSize: 8.sp,
      fontWeight: FontWeight.w400
    ),
    unselectedLabelStyle: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.w400
    ),
    elevation: 20,
    selectedItemColor: ColorsManager.goldColor,
    unselectedItemColor: Colors.white,
    selectedIconTheme:IconThemeData(
      size: 25
    ),
    unselectedIconTheme: IconThemeData(
      size: 25,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white
    ),
    titleSmall: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xffB5B4B4)
    ),
  )
);
}