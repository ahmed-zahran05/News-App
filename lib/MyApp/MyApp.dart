import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Config/Theme/Theme.dart';
import 'package:newsapp/Core/Utills/RoutesManager.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes ,
        initialRoute: RoutesManager.splash,
        theme: AppTheme.LightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
