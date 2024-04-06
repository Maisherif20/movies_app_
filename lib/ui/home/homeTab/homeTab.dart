import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/homeTab/new_releases/new_releases.dart';
import 'package:movies_app/ui/home/homeTab/popularMoviesGetData.dart';


class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularMoviesGetData(),
        NewReleases(),
      ],
    );
  }
}