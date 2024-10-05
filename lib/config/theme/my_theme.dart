import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTheme {
static final ThemeData lightTheme = ThemeData(
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