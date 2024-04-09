import 'package:flutter/material.dart';
import 'package:movies_app/api/releases_api.dart';
import 'package:movies_app/ui/home/homeTab/movie_details/detailes_screen.dart';

import '../../../../modelForFireStore/movie.dart';
import '../../../../modelForFireStore/movieDao.dart';

class RealeasesWidget extends StatefulWidget {
  //var resultList = snapshot.data?.results;
  String imagePoster;
  String title;
  String releaseDate;
  String id;

  RealeasesWidget({required this.imagePoster, required this.id , required this.title , required this.releaseDate});

  @override
  State<RealeasesWidget> createState() => _RealeasesWidgetState();
}

class _RealeasesWidgetState extends State<RealeasesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailesScreen(id: widget.id)));
        },
        child: Container(
          child: Stack(
              // alignment: Alignment.topLeft,
              children: [
                Image.network('${ReleasesApi.imagePath}${widget.imagePoster}'),
                InkWell(
                  onTap: () async{
                    Movie movie = Movie(
                      id: widget.id,
                      title: widget.title,
                      posterImagePath: widget.imagePoster,
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
                      color: Color.fromRGBO(18, 18, 18, 1),
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
        ),
      ),
    );
  }
}
