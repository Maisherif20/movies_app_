import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/homeTab/recommendedMovies/recommendedMovieWidget.dart';
import '../../../../api/ApiManager.dart';

class RecommendedMoviesGetData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:ApiManager.getRecommendedMovies(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError || snapshot.data?.status_message == 'error'){
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.status_message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: (){}, child:const Text('Try Again')),
              ],
            ),
          );
        }
        var movieList = snapshot.data?.results;
        return Expanded(child: ListView.builder(
          itemBuilder: (context,index) => RecommendedMovieWidget(
              posterPath: movieList![index].posterPath!,
              title: movieList[index].title!,
              voteAverage: movieList[index].voteAverage!.toString(),
              releaseDate: movieList[index].releaseDate!),
          itemCount: movieList?.length ?? 0,
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
        ));
      },
    );
  }
}
