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
      // home: DetailesScreen(),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.white,
          selectedItemColor: Color.fromRGBO(255, 187, 59, 1),
          unselectedIconTheme:IconThemeData(size: 30),
          selectedIconTheme: IconThemeData( size: 35),
          backgroundColor: Color.fromRGBO(255, 187, 59, 1),
        ),
        useMaterial3: false,
      ),
    );
  }
}
