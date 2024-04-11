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
      required this.imageBack});
  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  bool isAddedToWatchlist = false;

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadWatchlistState();
  }

  Future<void> _loadWatchlistState() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      isAddedToWatchlist =
          _prefs.getBool(widget.id) ?? false;
    });
  }

  Future<void> _saveWatchlistState() async {
    await _prefs.setBool(widget.id, isAddedToWatchlist);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailesScreen(id: widget.id)));
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
                        setState(() {
                          isAddedToWatchlist = !isAddedToWatchlist;
                        });
                        await _saveWatchlistState();
                        if (isAddedToWatchlist)
                          {
                            Movie movie = Movie(
                              id: widget.id,
                              title: widget.title,
                              posterImagePath: widget.imagePoster,
                              releaseData: widget.releaseDate,
                              isSelected: true,
                            );
                            // isFav=  await MovieDao.checkInFireBase(movie.id!) ;
                            await MovieDao.addMovieToFireBase(movie, widget.id);
                            await MovieDao.updateMovie(movie);
                          }
                      },
                      child: Stack(
                        children: [
                          isAddedToWatchlist
                              ? Image.asset(
                                  "assests/images/img_3.png",
                                  height: 36,
                                  width: 28,
                                )
                              : Image.asset(
                                  "assests/images/img_1.png",
                                  height: 36,
                                  width: 28,
                                ),
                          // Icon(Icons.bookmark , size: 50, color: moviee.isSelected==false?Color.fromRGBO(81, 79, 79, 1):Color.fromRGBO(247, 181, 57, 1),),
                          Icon(
                            isAddedToWatchlist ? Icons.check : Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
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
}
// Future<bool?> updateInFirebase(
//     String title, String imagePoster, String releaseDate, String id) async {
//   Movie movie = Movie(
//     id: id,
//     title: title,
//     posterImagePath: imagePoster,
//     releaseData: releaseDate,
//     isSelected: true,
//   );
//   // print("jjjjjjjjjj ${movie.isSelected}");
//   // widget.moviee= movie;
//   // print("mmmmmmmmmmmmmm ${widget.moviee?.isSelected}");
//   await MovieDao.addMovieToFireBase(movie, id);
//   await MovieDao.updateMovie(movie);
//   return movie.isSelected;
// }
