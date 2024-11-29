import 'package:flutter/material.dart';
import 'package:newsapp/Data/Data_Model/CategoryDataModel.dart';
import 'package:newsapp/Presentition/Screens/Home/Tabs/Sources/View/Sources_View.dart';
import 'package:newsapp/Presentition/Screens/Home/Tabs/Sources/View_Model/Sources_VM.dart';


class Categorydetails extends StatelessWidget {
  Categorydetails({super.key, required this.category});

  CategoryDm category;

    var viewModel = SourcesVM();

  @override
  Widget build(BuildContext context) {
    return SourcesView(categoryDm: category);
  }
}