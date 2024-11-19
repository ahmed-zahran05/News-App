import 'package:flutter/material.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Core/Utills/StringsManager.dart';
import 'package:newsapp/Data_Model/CategoryDataModel.dart';

import 'CategoryWidget/CategoryWidget.dart';

class categories extends StatelessWidget {
   categories({super.key});
  List<CategoryDm> categorieslist = CategoryDm.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(StringsManager.contentBodyCategoryScreen , style: AppStyles.CategotyTitle,),
          Expanded(
            flex: 8,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) => Categorywidget(category:categorieslist[index] , index: index,),
              itemCount: categorieslist.length,
            ),
          )
        ],
      ),
    );
  }
}
