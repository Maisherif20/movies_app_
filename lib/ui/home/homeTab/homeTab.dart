import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/homeTab/new_releases/new_releases.dart';
import 'package:movies_app/ui/home/homeTab/popularMovies/popularMoviesGetData.dart';
import 'package:movies_app/ui/home/homeTab/recommendedMovies/recommendedMoviesGetData.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Color.fromRGBO(18, 18, 18, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopularMoviesGetData(),
          NewReleases(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text("Recommended" , textAlign: TextAlign.start, style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 3,),
          RecommendedMoviesGetData(),
        ],
      ),
    );
  }
}
