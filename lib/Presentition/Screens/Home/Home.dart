import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Core/Utills/AssetsManager.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/Core/Utills/RoutesManager.dart';
import 'package:newsapp/Core/Utills/StringsManager.dart';
import 'package:newsapp/Data/Data_Model/CategoryDataModel.dart';

import 'HomeDrawer/Home_Drawer.dart';
import 'Tabs/Categories/CategoryDetails/CategoryDetails.dart';
import 'Tabs/Categories/CategoryScreen/categoriesScreen.dart';
import 'Tabs/Settings/settings.dart';


class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearched  = false ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SelectedWidget = categories(
      onCategoryItemClicked: onCategoryClicked,
    );
  }

  late Widget SelectedWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          image: AssetImage(assetsManager.Pattern),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.appBarTitle),
          actions: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManager.Search);
                },
                child: Icon(Icons.search , size: 30,),
              ),
            )
          ],
        ),
        drawer: HomeDrawer(onMenuItemClicked: onDrawerItemClick),
        body: SelectedWidget,
      ),
    );
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.Categories) {
      SelectedWidget = categories(
        onCategoryItemClicked: onCategoryClicked,
      );
    } else if (item == MenuItem.Settings) {
      SelectedWidget = settings();
    }
    setState(() {});
  }

  onCategoryClicked(CategoryDm category) {
    SelectedWidget = Categorydetails(category: category);
    setState(() {});
  }
}