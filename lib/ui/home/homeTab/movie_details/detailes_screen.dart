import 'package:flutter/material.dart';
import 'package:movies_app/api/DetailesApi.dart';
import 'package:movies_app/ui/home/homeTab/movie_details/more_like_this_section/like_this.dart';

class DetailesScreen extends StatelessWidget {
  String id;

  DetailesScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DetailesApi.getDetailes(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || snapshot.data?.message == 'error') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        }
        var details = snapshot.data;
        return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  '${details?.title}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(

                            // height: 217,
                            //sq width: 412,
                            alignment: Alignment.center,
                            child: Image.network(
                                height: 217,
                                width: 412,
                                fit: BoxFit.fill,
                                '${DetailesApi.imagePath}${details?.posterPath}')),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${details?.title}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${details?.releaseDate}',
                          style: TextStyle(
                            color: Color(0xFFB5B4B4),
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                    width: 129,
                                    height: 199,
                                    '${DetailesApi.imagePath}${details?.posterPath}'),
                                // Image.network(
                                //   width: 129,
                                //   height: 199,
                                // ),
                                Positioned(
                                  top: 4,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          "assests/images/img_1.png",
                                          height: 36,
                                          width: 27,
                                        ),
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
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
                                          '${details!.genres![1].name}',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFFCBCBCB)),
                                        )),
                                    SizedBox(
                                      width: 6,
                                    ),
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
                                          '${details!.genres![2].name}',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFFCBCBCB)),
                                        )),
                                    SizedBox(
                                      width: 6,
                                    ),
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
                                          '${details!.genres![3].name}',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFFCBCBCB)),
                                        )),
                                  ],
                                ),
                                Container(
                                    width: 250,
                                    child: Text(
                                      '${details.overview}',
                                      style: TextStyle(
                                        color: Color(0xFFCBCBCB),
                                        fontSize: 13,
                                      ),
                                    )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFFFBB3B),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '${details?.popularity}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
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
                          color: Color(0xFF707070),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
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
                              LikeThis(id: id),
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
              ),
        );
      },
    );
  }
}
