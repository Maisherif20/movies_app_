import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api/DetailesApi.dart';
import '../../../../model/DetailesResponse.dart';
import '../../../../modelForFireStore/movie.dart';
import '../../../../modelForFireStore/movieDao.dart';
import 'more_like_this_section/like_this.dart';

class DetailsWidget extends StatefulWidget {
  // String? title;
  String id;
  // String? backdropPath;
  // String? releaseDate;
  // String? posterPath;
  // String? overview;
  // String? popularity;
  // List? generes;
  DetailesResponse detailesResponse;
  //required this.title , required this.id,required this.backdropPath , required this.releaseDate, required this.posterPath, required this.overview ,required this.popularity , required this.generes

  DetailsWidget({ required this.detailesResponse  , required this.id});

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
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
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            '${widget.detailesResponse.title}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 217,
                       width: 412,
                        alignment: Alignment.center,
                        child: Image.network(
                          width: double.infinity,
                            fit: BoxFit.fill,
                            '${DetailesApi.imagePath}${widget.detailesResponse.backdropPath}')),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${widget.detailesResponse.title}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),maxLines: 5,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${widget.detailesResponse.releaseDate}',
                      style: TextStyle(
                        color: Color(0xFFB5B4B4),
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.network(
                                  width: 129,
                                  height: 199,
                                  '${DetailesApi.imagePath}${widget.detailesResponse.posterPath}'),
                            ),
                            // Image.network(
                            //   width: 129,
                            //   height: 199,
                            // ),
                            Positioned(
                              top: 4,
                              left: 10,
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
                                      title: widget.detailesResponse.title,
                                      posterImagePath: widget.detailesResponse.posterPath,
                                      releaseData: widget.detailesResponse.releaseDate,
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

                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                            Expanded(
                              child: ListView.builder( scrollDirection: Axis.horizontal,itemBuilder: (context , index)=>Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Color(0xFF514F4F),
                                          side: BorderSide(
                                              color: Color(0xFF514F4F)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                        ),
                                        child: Text(
                                          '${widget.detailesResponse.genres?[index].name}',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFFCBCBCB)),
                                        )),
                                  ],
                                ),
                              ),  itemCount:widget.detailesResponse.genres?.length ,),
                            ),
                              SingleChildScrollView(
                                child: Text(
                                  '${widget.detailesResponse.overview}',
                                  style: TextStyle(
                                    color: Color(0xFFCBCBCB),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFBB3B),
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${widget.detailesResponse.popularity}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Column(
              children: [
                SizedBox(
                  height: 245,
                  child: Container(
                    color: Color.fromRGBO(18, 18, 18, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5 , top: 5),
                          child: Text(
                            'More Like This',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        LikeThis(id: widget.id),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20,)
          ],
        )

      //
    );
  }
}
