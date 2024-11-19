import 'package:flutter/material.dart';
import 'package:newsapp/Core/Utills/AssetsManager.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/Core/Utills/StringsManager.dart';
import 'package:newsapp/Presentition/Screens/Home/Home_Drawer.dart';
import 'Tabs/Categories/categories.dart';
import 'Tabs/Settings/settings.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget SelectedWidget = categories();

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
        ),
        drawer:  HomeDrawer(onMenuItemClicked: onDrawerItemClick ),
        body: SelectedWidget ,
      ),
    );
  }

  void onDrawerItemClick (MenuItem item) {
    Navigator.pop(context);
    if(item==MenuItem.Categories){
      SelectedWidget = categories();
    }
    else if(item==MenuItem.Settings){
      SelectedWidget = settings();
    }
    setState(() {

    });
}
}
