import 'package:flutter/material.dart';
import 'package:movies_app/api/LikeApiManager.dart';
import 'package:movies_app/ui/home/homeTab/movie_details/more_like_this_section/like_this_widget.dart';

class LikeThis extends StatelessWidget {
  String id;

  LikeThis({required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LikeApiManager.getLikeData(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data?.message == 'error') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again')),
              ],
            );
          }
          var resultList = snapshot.data?.results;
          return Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: resultList?.length,
                itemBuilder: (context, index) => LikeThisWidget(
                  imagePoster: resultList![index].posterPath!,
                  id: resultList![index].id!.toString(),
                  title: '${resultList[index].title}',
                  date: '${resultList[index].releaseDate}',
                  vote: '${resultList[index].voteAverage}',
                ),
              ));
        });
  }
}
