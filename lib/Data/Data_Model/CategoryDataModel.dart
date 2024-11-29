import 'package:flutter/material.dart';
import 'package:newsapp/Core/Utills/AssetsManager.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/Core/Utills/Constantsmanager.dart';
import 'package:newsapp/Core/Utills/StringsManager.dart';

class CategoryDm{
  String id;
  String title;
  String imagePath;
  Color bgColor;
  CategoryDm({
    required this.id,
    required this.title,
    required this.bgColor,
    required this.imagePath,
});
 static List<CategoryDm> getAllCategories()=>[
    CategoryDm(
         id: ConstantManager.sportsId,
         title: StringsManager.sports,
         bgColor: ColorsManager.green,
         imagePath: assetsManager.sports
     ),
    CategoryDm(
         id: ConstantManager.generalId,
         title: StringsManager.general,
         bgColor: ColorsManager.darkBlue,
         imagePath: assetsManager.politics
     ),
    CategoryDm(
        id: ConstantManager.healthId,
        title: StringsManager.health,
        bgColor: ColorsManager.pink,
        imagePath: assetsManager.health
    ),
   CategoryDm(
       id: ConstantManager.businessId,
       title: StringsManager.business,
       bgColor: ColorsManager.gold,
       imagePath: assetsManager.business
   ),
   CategoryDm(
       id: ConstantManager.entertainmentId,
       title: StringsManager.entertainment,
       bgColor: Colors.red,
       imagePath: assetsManager.entertainment
   ),
   CategoryDm(
       id: ConstantManager.scienceId,
       title: StringsManager.science,
       bgColor: ColorsManager.yellow,
       imagePath: assetsManager.science
   ),
   CategoryDm(
       id: ConstantManager.techId,
       title: StringsManager.tech,
       bgColor: Colors.deepPurpleAccent,
       imagePath: assetsManager.technology
   ),
 ];
}