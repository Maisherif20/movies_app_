import 'package:flutter/material.dart';
import 'package:movies_app/api/LikeApiManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../modelForFireStore/movie.dart';
import '../../../../../modelForFireStore/movieDao.dart';

class LikeThisWidget extends StatefulWidget {
  String imagePoster;
  String id;
  String title;
  String date;
  String vote;
  String releaseDate;


  LikeThisWidget({
    required this.id,
    required this.imagePoster,
    required this.title,
    required this.date,
    required this.vote,
    required this.releaseDate
  });

  @override
  State<LikeThisWidget> createState() => _LikeThisWidgetState();
}

class _LikeThisWidgetState extends State<LikeThisWidget> {
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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: Color.fromRGBO(18, 18, 18, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(height: 10,),
              Container(
                  // height: 160,
                  //   width: 80,
                  child: Image.network(
                '${LikeApiManager.imagePath}${widget.imagePoster}',
                height: 140,
              )),
              InkWell(
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
                child: Stack(alignment: Alignment.center, children: [
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
                ]),
              ),
            ]),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xFFFFBB3B),
                  size: 20,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  '${widget.vote}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Container(
                width: 80,
                child: Text(
                  '${widget.title}',
                  style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            Row(
              children: [
                Text(
                  '${widget.date}',
                  style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFFB5B4B4),
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
