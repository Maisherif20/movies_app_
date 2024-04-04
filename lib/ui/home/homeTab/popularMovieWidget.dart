import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/ApiManager.dart';

class PopularMovieWidget extends StatelessWidget {
  String title;
  String image;
  String releaseDate;
  int resultCount;
  PopularMovieWidget(
      {required this.title, required this.image, required this.releaseDate , required this.resultCount});
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(18, 18, 18, 1),
          ),
          padding: EdgeInsets.only(left: 10, right: 10 , top: 10),
          width: 450,
          height: 289,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      // width: 412,
                      child: Image.network(
                        "${ApiManager.imagePath}${image}",
                        fit: BoxFit.fill,
                        height: 212,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 150 , top: 10),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14 , fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Text(
                      releaseDate,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(181, 180, 180, 1),
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 70,
                left: 20,
                child: Stack(
                  children: [
                    Image.network(
                      "${ApiManager.imagePath}${image}",
                      width: 129,
                      height: 199,
                    ),
                    Positioned(
                      top: 4,
                      child: InkWell(
                        onTap: (){},
                        child: Stack(children: [
                          Image.asset("assests/images/img_1.png" , height: 36 , width: 27,),
                          Icon(Icons.add , color: Colors.white,size: 25,)
                        ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}



