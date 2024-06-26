import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/homeScreen.dart';
import 'package:movies_app/ui/home/watchListTab/watchListTab.dart';
import 'package:movies_app/ui/splash_screen/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        WatchListTab.routeName:(context)=>WatchListTab(),
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
