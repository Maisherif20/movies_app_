import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/homeTab/popularMovies/popularMovieWidget.dart';
import '../../../../api/ApiManager.dart';
import '../../../../model/Result.dart';
import '../../../../modelForFireStore/movie.dart';

class PopularMoviesGetData extends StatelessWidget {
  Movie? movie;
  @override
  Widget build(BuildContext context) {
    // var args  = ModalRoute.of(context)!.settings.arguments as Movie;

    return FutureBuilder(
        future: ApiManager.getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
                          ApiManager.getPopularMovies();
                        },
                        child: Text("Try again"))
                  ],
                ));
          }
          var resultList = snapshot.data?.results;
          return Expanded(
            flex: 2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => PopularMovieWidget(
                  title: resultList![index].title!,
                  id: resultList![index].id.toString()!,
                  imagePoster: resultList[index].posterPath!,
                  releaseDate: resultList[index].releaseDate!,
                  imageBack: resultList[index].backdropPath!,
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