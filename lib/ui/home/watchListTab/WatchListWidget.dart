import 'package:flutter/material.dart';

import '../../../api/ApiManager.dart';
import '../../../modelForFireStore/movie.dart';
import '../../../modelForFireStore/movieDao.dart';

class WatchListWdget extends StatelessWidget {
  String title;
  String image;
  String releaseDate;
  WatchListWdget(
      {required this.title,
        required this.image,
        required this.releaseDate,
        });
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
                Stack(
                  children: [
                    Image.network(
                      "${ApiManager.imagePath}${image}",
                      width: 100,
                      height: 100,
                    ),
                    Positioned(
                      left:15,
                      child: Stack(
                        children: [
                          Image.asset("assests/images/img_3.png" , height: 36 , width: 28,),
                          const Icon(Icons.check , color: Colors.white,size: 25,)
                        ],
                      ) ,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                       Text(
                         """$title""",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(releaseDate, style: const TextStyle(color: Colors.white)),

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