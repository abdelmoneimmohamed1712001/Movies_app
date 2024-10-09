
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/my_theme.dart';
import 'package:movies_app/presentation/home/home_screen.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/movies_screen/view/movies_screen.dart';

import 'core/utils/routes_manager/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 892),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        theme: MyTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {
          RoutesManager.homeRoute : (context) => HomeScreen(),
          RoutesManager.moviesRoute:(context) => MoviesScreen(),
        },
        initialRoute: RoutesManager.homeRoute,
      ),

    );
  }
}
