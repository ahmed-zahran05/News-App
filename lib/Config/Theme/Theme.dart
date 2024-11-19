import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/MyApp/MyApp.dart';

class AppTheme {
  static ThemeData LightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: ColorsManager.white
      ),
      color: ColorsManager.green,
      centerTitle: true,
      titleTextStyle: AppStyles.appBar,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.r),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
