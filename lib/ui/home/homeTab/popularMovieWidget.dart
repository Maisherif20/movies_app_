import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/ApiManager.dart';
import 'package:movies_app/modelForFireStore/movie.dart';
import 'package:movies_app/modelForFireStore/movieDao.dart';
import 'package:movies_app/ui/home/watchListTab/watchListTab.dart';

class PopularMovieWidget extends StatefulWidget {
  String title;
  String imagePoster;
  String imageBack;
  String releaseDate;
  PopularMovieWidget(
      {required this.title, required this.imagePoster, required this.releaseDate  , required this.imageBack });

  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  bool isSelected = false;

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
                        "${PopularApiManager.imagePath}${widget.imageBack}",
                        fit: BoxFit.fill,
                        height: 212,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 150 , top: 10),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14 , fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Text(
                      widget.releaseDate,
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
                      "${PopularApiManager.imagePath}${widget.imagePoster}",
                      width: 129,
                      height: 199,
                    ),
                    Positioned(
                      top:3,
                      child: InkWell(
                        onTap: ()async{
                          isSelected = true;
                          Movie movie = Movie(title: widget.title , posterImagePath: widget.imagePoster, releaseData: widget.releaseDate);
                          await MovieDao.addMovieToFireBase(movie);
                          setState(() {
                          });
                        },
                        child: Stack(children: [
                          Image.asset(isSelected==false?"assests/images/img_1.png":"assests/images/img_3.png" , height: 36 , width: 28,),
                          // Icon(Icons.bookmark , size: 50, color: isSelected==false?Color.fromRGBO(81, 79, 79, 1):Color.fromRGBO(247, 181, 57, 1),),
                          Icon(isSelected==false?Icons.add:Icons.check , color: Colors.white,size: 25,)
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



