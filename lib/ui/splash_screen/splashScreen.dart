import 'dart:async';

import 'package:flutter/material.dart';

import '../home/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image:
            DecorationImage(image: Image.asset("assests/images/img.png").image),
      ),
    );
  }
}
