import 'package:flutter/material.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Core/Utills/StringsManager.dart';
import 'package:newsapp/Data_Model/CategoryDataModel.dart';
import '../Widget/CategoryWidget.dart';

typedef OnCategoryItemClicked = void Function(  CategoryDm category );
class categories extends StatelessWidget {
   categories({super.key , required this.onCategoryItemClicked });
  List<CategoryDm> categoriesList = CategoryDm.getAllCategories();

   OnCategoryItemClicked onCategoryItemClicked;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryItemClicked(categoriesList[index]);
                  },
                    child: Categorywidget(category:categoriesList[index] , index: index,)),
                itemCount: categoriesList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
