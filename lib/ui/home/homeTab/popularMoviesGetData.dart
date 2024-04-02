import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/homeTab/popularMovieWidget.dart';

import '../../../api/popularApiManager.dart';

class PopularMoviesGetData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PopularApiManager.getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data?.message == "error") {
            return Center(
                child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {
                      PopularApiManager.getPopularMovies();
                    },
                    child: Text("Try again"))
              ],
            ));
          }
          var resultList = snapshot.data?.results;
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => PopularMovieWidget(
                    title: resultList![index].title!,
                    image: resultList![index].posterPath!,
                    releaseDate: resultList![index].releaseDate!,
                  resultCount: resultList.length,
                ),
                itemCount: resultList?.length ?? 0),
          );
        });
  }
}
// PopularMovieWidget(
// title: resultList![0].title!,
// image: resultList![0].posterPath!,
// releaseDate: resultList![0].releaseDate!);
