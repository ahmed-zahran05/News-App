import 'package:flutter/material.dart';
import 'package:newsapp/Presentition/Screens/ArticleDetails/ArticleDetails.dart';
import 'package:newsapp/Presentition/Screens/Home/Home.dart';
import 'package:newsapp/Presentition/Screens/Search/Search.dart';
import 'package:newsapp/Presentition/Screens/Splash/Splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String articlesDetails = '/articlesDetails';
  static const String Search = '/searchScreen';


  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const Splash(),
    home: (context) => Home(),
    articlesDetails: (context) => const ArticleDetails(),
    Search: (context) =>  SearchScreen(),
  };
}

