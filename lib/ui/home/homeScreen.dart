import 'package:flutter/material.dart';
import 'package:movies_app/model/PopularMovie.dart';
import 'package:movies_app/ui/home/browseTab/browseTab.dart';
import 'package:movies_app/ui/home/homeTab/homeTab.dart';
import 'package:movies_app/ui/home/searchTab/searchTab.dart';
import 'package:movies_app/ui/home/watchListTab/watchListTab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home Screen";


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndexTab=0;
  PopularMovie popularMovie = PopularMovie();
  List<Widget> tabs=[HomeTab(), SearchTab(), BrowseTab(),WatchListTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndexTab,
        onTap: (index){
          selectedIndexTab=index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(Icons.movie), label: "Browse"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.collections_bookmark), label: "WatchList"),
        ],
      ),
      body: tabs[selectedIndexTab],
    );
  }
}
