import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/Core/Utills/StringsManager.dart';
typedef OnMenuItemClicked = void Function(MenuItem);
class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onMenuItemClicked});

  OnMenuItemClicked onMenuItemClicked;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: ColorsManager.green,
            width: double.infinity,
            height: 110.h,
            child: Text(
              StringsManager.drawerTitle,
              style: AppStyles.DrawerTitle,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BulidDrawerItem(
            Icons.list_outlined,
            text: StringsManager.categoriesDrawerItem,
            item: MenuItem.Categories,
            onClicked: onMenuItemClicked,
          ),
          const SizedBox(
            height: 15,
          ),
          BulidDrawerItem(
            Icons.settings,
            text: StringsManager.settingsDrawerItem,
            item: MenuItem.Settings,
            onClicked: onMenuItemClicked,
          ),
        ],
      ),
    );
  }
  BulidDrawerItem(
      IconData icon,
      {required String text
        , required MenuItem item,
        required OnMenuItemClicked onClicked
      }) {
    return InkWell(
      onTap: () {
        onClicked(item);
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 26,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: AppStyles.DrawerItem,
          ),
        ],
      ),
    );
  }
}
enum MenuItem {
  Categories,
  Settings,
}
