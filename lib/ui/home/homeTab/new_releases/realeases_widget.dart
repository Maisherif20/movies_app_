import 'package:flutter/material.dart';
import 'package:movies_app/api/releases_api.dart';
import 'package:movies_app/ui/home/homeTab/movie_details/detailes_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../modelForFireStore/movie.dart';
import '../../../../modelForFireStore/movieDao.dart';

class RealeasesWidget extends StatefulWidget {
  //var resultList = snapshot.data?.results;
  String imagePoster;
  String title;
  String releaseDate;
  String id;

  RealeasesWidget(
      {required this.imagePoster,
      required this.id,
      required this.title,
      required this.releaseDate});

  @override
  State<RealeasesWidget> createState() => _RealeasesWidgetState();
}

class _RealeasesWidgetState extends State<RealeasesWidget> {
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
      isAddedToWatchlist = _prefs.getBool(widget.id) ??
          false; // Load watchlist state from SharedPreferences
    });
  }

  Future<void> _saveWatchlistState() async {
    await _prefs.setBool(widget.id,
        isAddedToWatchlist); // Save watchlist state to SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailesScreen(id: widget.id)));
        },
        child: Container(
          child: Stack(
              // alignment: Alignment.topLeft,
              children: [
                Image.network('${ReleasesApi.imagePath}${widget.imagePoster}'),
                InkWell(
                  onTap: () async {
                    setState(() {
                      isAddedToWatchlist = !isAddedToWatchlist;
                    });
                    await _saveWatchlistState();
                    if (isAddedToWatchlist) {
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
              ]),
        ),
      ),
    );
  }
}
