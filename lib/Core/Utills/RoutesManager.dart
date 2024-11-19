import 'package:flutter/material.dart';
import 'package:newsapp/Presentition/Screens/Home/Home.dart';
import 'package:newsapp/Presentition/Screens/Splash/Splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/homoe';


 static Route? router (RouteSettings settings) {
    switch(settings.name){
      case splash :
        return MaterialPageRoute(builder: (context) => Splash(),);
      case home :
        return MaterialPageRoute(builder: (context) => Home(),);
    }
  }


}