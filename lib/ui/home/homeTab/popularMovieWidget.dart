import 'package:flutter/material.dart';
import 'package:movies_app/api/ApiManager.dart';

class PopularMovieWidget extends StatefulWidget {
  String title;
  String imagePoster;
  String imageBack;
  String releaseDate;

  PopularMovieWidget(
      {required this.title,
      required this.imagePoster,
      required this.releaseDate,
      required this.imageBack});

  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(18, 18, 18, 1),
      ),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: 400,
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
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
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
                  top: 4,
                  child: InkWell(
                    onTap: () {},
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



