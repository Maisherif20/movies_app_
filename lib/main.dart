import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/homeScreen.dart';
import 'package:movies_app/ui/splash_screen/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
