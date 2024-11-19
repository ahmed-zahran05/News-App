import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Data_Model/CategoryDataModel.dart';

class Categorywidget extends StatelessWidget {
   Categorywidget({super.key , required this.category , required this.index});
CategoryDm category;
int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.bgColor,
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
          bottomLeft:Radius.circular(index.isEven ? 25.r : 0.r),
          bottomRight:Radius.circular(index.isEven ? 0.r : 25.r),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(category.imagePath , width:  132.w, height: 116.h,),
          Text(category.title , textAlign: TextAlign.center, style: AppStyles.CategoryItemTitle,)
        ],
      ),
    );
  }
}
