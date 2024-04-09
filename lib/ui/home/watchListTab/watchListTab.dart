import 'package:flutter/material.dart';
import 'package:movies_app/modelForFireStore/movieDao.dart';
import 'package:movies_app/ui/home/watchListTab/WatchListWidget.dart';
import '../../../model/Result.dart';
import '../searchTab/searchListWidget.dart';

class WatchListTab extends StatelessWidget {
  static String routeName = "WatchList";
  @override
  Widget build(BuildContext context) {
    //var args = ModalRoute.of(context)!.settings.arguments as Result;

    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: const Text('Watch List',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.white),),
          ),
          Expanded(
            child: StreamBuilder(
              stream: MovieDao.listenForMovie(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        const Text('SomeThing went wrong'),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Try again"))
                      ],
                    ),
                  );
                }
                var movieList = snapshot.data;
                return ListView.builder(
                  itemBuilder:(context,index) => WatchListWdget(
                      title: movieList[index].title!,
                      id: movieList[index].id.toString(),
                      image: movieList[index].posterImagePath!,
                      releaseDate: movieList[index].releaseData!),
                  itemCount: movieList!.length ?? 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}