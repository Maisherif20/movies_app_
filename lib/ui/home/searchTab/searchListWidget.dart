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
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Image.network(
                  "${ApiManager.imagePath}${image}",
                  width: 140,
                  height: 120,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        """$title""",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5,),
                      Text(releaseDate, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
