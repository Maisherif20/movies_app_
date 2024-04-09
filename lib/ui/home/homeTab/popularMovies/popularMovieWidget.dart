import 'package:flutter/material.dart';
import 'package:movies_app/api/ApiManager.dart';
import 'package:movies_app/modelForFireStore/movie.dart';
import 'package:movies_app/modelForFireStore/movieDao.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../movie_details/detailes_screen.dart';

class PopularMovieWidget extends StatefulWidget {
  String title;
  String id;
  String imagePoster;
  String imageBack;
  String releaseDate;
  PopularMovieWidget(
      {required this.title,
        required this.id,
        required this.imagePoster,
        required this.releaseDate,
        required this.imageBack  });
  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  bool? isSelected  = false;
  @override
  Widget build(BuildContext context) {

    // late var  args  = ModalRoute.of(context)!.settings.arguments as Movie;
    // var provider = Provider.of<SaveProvider>(context);

    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailesScreen(id: widget.id)));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(18, 18, 18, 1),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: 450,
        height: 200,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // width: 412,
                    child: Image.network(
                      "${ApiManager.imagePath}${widget.imageBack}",
                      fit: BoxFit.fill,
                      height: 212,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 150, top: 10),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: Text(
                    widget.releaseDate,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                    "${ApiManager.imagePath}${widget.imagePoster}",
                    width: 129,
                    height: 199,
                  ),
                  Positioned(
                    top: 3,
                    child: InkWell(
                      onTap: () async {
                        Movie movie = Movie(
                          id: widget.id,
                          title: widget.title,
                          posterImagePath: widget.imagePoster,
                          releaseData: widget.releaseDate,
                          isSelected: true,
                        );
                        isSelected=true;
                        await MovieDao.addMovieToFireBase(movie, widget.id);
                        await MovieDao.updateMovie(movie);
                        // moviee.isSelected = !moviee.isSelected!;
                        // widget.moviee=Movie(isSelected: true , id: widget.id);
                        // widget.moviee.isSelected = !widget.moviee.isSelected!;
                        // updateInFirebase(widget.title, widget.imagePoster, widget.releaseDate, widget.id);
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        prefs.setBool("isSelected", isSelected!);
                        isSelected=prefs.getBool("isSelected")!;
                        print(isSelected);
                        setState(() {
                        });
                      },
                      child: Stack(
                        children: [
                          // widget.movie.isSelected == false ? Text("${widget.movie.isSelected}" ,style: TextStyle(fontSize: 50),)
                          //     : Text(""),
                          isSelected == false ? Image.asset("assests/images/img_1.png", height: 36,
                            width: 28,)
                              : Image.asset("assests/images/img_3.png" ,height: 36,
                            width: 28,),
                          // Icon(Icons.bookmark , size: 50, color: moviee.isSelected==false?Color.fromRGBO(81, 79, 79, 1):Color.fromRGBO(247, 181, 57, 1),),
                          Icon(
                            isSelected == false ? Icons.add : Icons.check,
                            color: Colors.white,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?>updateInFirebase(String title , String imagePoster, String releaseDate  , String id )async{
    Movie movie = Movie(
      id: id,
      title: title,
      posterImagePath: imagePoster,
      releaseData: releaseDate,
      isSelected: true,
    );
    // print("jjjjjjjjjj ${movie.isSelected}");
    // widget.moviee= movie;
    // print("mmmmmmmmmmmmmm ${widget.moviee?.isSelected}");
    await MovieDao.addMovieToFireBase(movie, id);
    await MovieDao.updateMovie(movie);
    return movie.isSelected;
  }
// onClicked(var args, context) async {}
// Future<void> saveIsSelected(Movie movie)async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool("isSelected", movie.isSelected!);
// }
// Future<bool?> getIsSelected()async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool? selected = await prefs.getBool("isSelected");
//   print("lllllllllllll$selected");
//   return selected;
// }
}