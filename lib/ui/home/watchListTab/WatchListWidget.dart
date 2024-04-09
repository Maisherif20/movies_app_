import 'package:flutter/material.dart';

import '../../../api/ApiManager.dart';
import '../../../modelForFireStore/movie.dart';
import '../../../modelForFireStore/movieDao.dart';

class WatchListWdget extends StatelessWidget {
  String title;
  String id;
  String image;
  String releaseDate;
  WatchListWdget(
      {required this.title,
        required this.id,
        required this.image,
        required this.releaseDate,
      });
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as Movie;
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
                      width: 150,
                      height: 120,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        """$title""",
                        style: const TextStyle(color: Colors.white , fontSize: 20),
                      ),
                      SizedBox(height: 5,),
                      Text(releaseDate, style: const TextStyle(color: Colors.white , fontSize: 17)),
                    ],
                  ),
                ),
                InkWell(
                    onTap: (){
                      // Movie movie = Movie();
                      MovieDao.deleteMovie(id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete , color: Color.fromRGBO(255, 187, 59, 1),size: 30,),
                    ))
              ],
            ),
            SizedBox(height: 10,),
            Divider(color: Colors.white,height: 2,)
          ],
        ),
      ),
    );
  }
}