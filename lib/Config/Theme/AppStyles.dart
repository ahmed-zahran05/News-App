import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Core/Utills/ColorsManager.dart';

class AppStyles {
  static  TextStyle appBar = GoogleFonts.exo(
    color: ColorsManager.white,
fontWeight: FontWeight.w400,
fontSize: 22.sp,
  );
  static  TextStyle DrawerTitle = GoogleFonts.poppins(
    color: Colors.white,
fontWeight: FontWeight.w400,
fontSize: 24.sp,
  );
  static  TextStyle DrawerItem = GoogleFonts.poppins(
    color: Colors.black,
fontWeight: FontWeight.w700,
fontSize: 24.sp,
  );
  static  TextStyle CategotyTitle = GoogleFonts.poppins(
    color: Colors.black,
fontWeight: FontWeight.w700,
fontSize: 24.sp,
  );
  static  TextStyle CategoryItemTitle = GoogleFonts.exo(
    color: Colors.white,
fontWeight: FontWeight.w400,
fontSize: 22.sp,
  );
}