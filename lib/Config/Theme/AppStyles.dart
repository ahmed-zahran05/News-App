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
  static  TextStyle SelectedSourceItem = GoogleFonts.exo(color:ColorsManager.white, fontSize: 14 , fontWeight: FontWeight.w400);
  static  TextStyle UnSelectedSourceItem = GoogleFonts.exo(color:ColorsManager.green, fontSize: 14 , fontWeight: FontWeight.w400);
  static  TextStyle ArticleSource = GoogleFonts.poppins(color:ColorsManager.offWhite, fontSize: 12 , fontWeight: FontWeight.w400);
  static  TextStyle ArticleTitle = GoogleFonts.poppins(color:ColorsManager.veryOffWhite, fontSize: 17 , fontWeight: FontWeight.w700);
  static  TextStyle ArticleContent = GoogleFonts.poppins(color:ColorsManager.veryOffWhite, fontSize: 13 , fontWeight: FontWeight.w300);
  static  TextStyle WebButton = GoogleFonts.poppins(color:ColorsManager.veryOffWhite, fontSize: 15 , fontWeight: FontWeight.w500);
  static  TextStyle SearchText = GoogleFonts.poppins(color:ColorsManager.green, fontSize: 14 , fontWeight: FontWeight.w400);
}