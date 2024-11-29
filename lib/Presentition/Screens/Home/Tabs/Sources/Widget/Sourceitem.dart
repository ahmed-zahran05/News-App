import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/Source.dart';

class Sourceitem extends StatelessWidget {
   Sourceitem({super.key , required this.source , required this.isSelected});
  Source source ;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 12 , horizontal: 19),
      margin: REdgeInsets.symmetric(vertical : 6),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.green : ColorsManager.white ,
         borderRadius: BorderRadius.circular(25),
        border: Border.all(color: ColorsManager.green , width: 2.w , )
      ),
      child:  Text(source.name ?? "" , style: isSelected ? AppStyles.SelectedSourceItem : AppStyles.UnSelectedSourceItem,),
    );
  }
}
