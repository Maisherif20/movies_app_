import 'dart:async';

import 'package:flutter/material.dart';

import '../home/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();

    // Navigate after animation completes
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Opacity(
            opacity: animation.value,
            child: Image.asset(
              "assests/images/img.png", // Corrected the asset path
              fit: BoxFit.none,
            ),
          ),
        );
      },
    );
  }
}


// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import '../home/homeScreen.dart';
//
// class SplashScreen extends StatefulWidget {
//   static String routeName = "splashScreen";
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, HomeScreen.routeName);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.black,
//         image:
//             DecorationImage(image: Image.asset("assests/images/img.png").image),
//       ),
//     );
//   }
// }

