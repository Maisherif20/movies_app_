import 'package:flutter/material.dart';
import '../../../../api/ApiManager.dart';

class RecommendedMovieWidget extends StatelessWidget {
  String posterPath;
  String title;
  String voteAverage;
  String releaseDate;
  RecommendedMovieWidget({required this.posterPath,required this.title, required this.voteAverage, required this.releaseDate});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 97,
        height: 184,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(18, 18, 18, 1),
        ),
      margin:const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  "${ApiManager.imagePath}$posterPath",
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 0,
                  child: InkWell(
                    onTap: (){},
                    child: Stack(children: [
                      Image.asset("assests/images/img_1.png" , height: 36 , width: 27,),
                      const Icon(Icons.add , color: Colors.white,size: 25,)
                    ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star_rate_rounded,color: Colors.yellow,size: 15),
                // const SizedBox(
                //   width: 5,
                // ),
                Text(voteAverage,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: Colors.white),),
              ],
            ),
            // const SizedBox(
            //   height: 6,
            // ),
            Text(title ?? '',style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: Colors.white,),maxLines: 2,),
            // const SizedBox(
            //   height: 6,
            // ),
            Text(releaseDate ?? '',style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 8,color: Colors.white),),
          ],
        ),
    );
  }
}
