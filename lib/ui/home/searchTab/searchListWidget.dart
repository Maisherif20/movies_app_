import 'package:flutter/material.dart';

import '../../../api/ApiManager.dart';

class SearchListWdget extends StatelessWidget {
  String title;
  String image;
  String overView;
  String releaseDate;
  SearchListWdget(
      {required this.title,
      required this.image,
      required this.releaseDate,
      required this.overView});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            bottom: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.network(
                    "${PopularApiManager.imagePath}${image}",
                    width: 100,
                    height: 100,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          """$title""",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(releaseDate,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              // Divider(
              //   color: Colors.white,
              //   height: 2,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
