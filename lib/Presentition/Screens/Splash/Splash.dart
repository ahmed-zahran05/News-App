import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Core/Utills/AssetsManager.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/Core/Utills/RoutesManager.dart';
import 'package:newsapp/MyApp/MyApp.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, RoutesManager.home);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorsManager.white,
          child: Image.asset(
            assetsManager.Pattern,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Image.asset(
              alignment: Alignment.center,
              assetsManager.logo,
              width: 199.w,
              height: 208.h,
            ),
            Spacer(),
            Image.asset(
              assetsManager.Group7,
              width: 213.w,
              height: 128.h,
            ),
          ],
        )
      ],
    );
  }
}
