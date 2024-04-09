import 'package:flutter/material.dart';
import '../../../../api/ApiManager.dart';
import '../../../../modelForFireStore/movie.dart';
import '../../../../modelForFireStore/movieDao.dart';
import '../movie_details/detailes_screen.dart';

class RecommendedMovieWidget extends StatefulWidget {
  String posterPath;
  String id;
  String title;
  String voteAverage;
  String releaseDate;

  RecommendedMovieWidget(
      {required this.posterPath, required this.id,required this.title, required this.voteAverage, required this.releaseDate});

  @override
  State<RecommendedMovieWidget> createState() => _RecommendedMovieWidgetState();
}

class _RecommendedMovieWidgetState extends State<RecommendedMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 110,
        color: Color.fromRGBO(18, 18, 18, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DetailesScreen(id: widget.id)));
                },
                child: Container(
                  // height: 160,
                  //   width: 80,
                    child: Image.network(
                      '${ApiManager.imagePath}${widget.posterPath}',
                      width: 110,
                      height: 120,
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () async{
                  Movie movie = Movie(
                    id: widget.id,
                    title: widget.title,
                    posterImagePath: widget.posterPath,
                    releaseData: widget.releaseDate,
                    isSelected: true,
                  );
                  await MovieDao.addMovieToFireBase(movie, widget.id);
                  await MovieDao.updateMovie(movie);
                },
                child: Stack(alignment: Alignment.center, children: [
                  ImageIcon(
                    AssetImage(
                      'assests/images/img_1.png',
                    ),
                    color: Color(0xFF514F4F),
                    size: 32,
                  ),
                  Icon(
                    Icons.add,
                    size: 17,
                    color: Colors.white,
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
                  '${widget.voteAverage}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Container(
                // width: 50,
                child: Text(
                  '${widget.title}',
                  style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                maxLines: 2,)),
            Row(
              children: [
                Text(
                  '${widget.releaseDate}',
                  style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFFB5B4B4),
                      fontWeight: FontWeight.bold),
                maxLines: 2,),
              ],
            )
          ],
        ),
      ),
    );
  }
}