import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/searchTab/searchListWidget.dart';
import '../../../api/ApiManager.dart';
import '../../../model/genresMovies/Genres.dart';

class CategoryMoviesList extends StatelessWidget {
  static const String routeName ='Movies_List';

  @override
  Widget build(BuildContext context) {
    var  args = ModalRoute.of(context)!.settings.arguments as Genres;
    return FutureBuilder(
        future: ApiManager.getCategoryMovieList(args.id!),
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
                          ApiManager.getCategoryMovieList(args.id!);
                        },
                        child: const Text("Try again"))
                  ],
                ));
          }
          var movieList = snapshot.data?.results;


          return Scaffold(
            backgroundColor: Colors.black,
            body: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => SearchListWdget(
                  title:movieList![index].originalTitle!,
                  image: movieList[index].posterPath!,
                  releaseDate: movieList[index].releaseDate!,
                  overView: movieList[index].overview!,
                ),
                itemCount: movieList?.length),
          );
        });
  }
}
