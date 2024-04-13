import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/homeTab/popularMovies/popularMovieWidget.dart';
import 'package:movies_app/ui/home/homeTab/popularMovies/popularMoviesViewModel.dart';
import '../../../../api/ApiManager.dart';
import '../../../../model/Result.dart';
import '../../../../modelForFireStore/movie.dart';

class PopularMoviesView extends StatefulWidget {
  const PopularMoviesView({super.key});

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  Movie? movie;
  PopularMoviesViewModel viewModel = PopularMoviesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadResult();
  }
  @override
  Widget build(BuildContext context) {
    // var args  = ModalRoute.of(context)!.settings.arguments as Movie;
    // return FutureBuilder(
    //     future: ApiManager.getPopularMovies(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (snapshot.hasError || snapshot.data?.message == "error") {
    //         return Center(
    //             child: Column(
    //               children: [
    //                 Text(snapshot.data?.message ?? snapshot.error.toString()),
    //                 ElevatedButton(
    //                     onPressed: () {
    //                       ApiManager.getPopularMovies();
    //                     },
    //                     child: Text("Try again"))
    //               ],
    //             ));
    //       }
    //       var resultList = snapshot.data?.results;
    //       return Expanded(
    //         flex: 2,
    //         child: ListView.builder(
    //             scrollDirection: Axis.horizontal,
    //             physics: PageScrollPhysics(),
    //             shrinkWrap: true,
    //             itemBuilder: (context, index) => PopularMovieWidget(
    //               title: resultList![index].title!,
    //               id: resultList![index].id.toString()!,
    //               imagePoster: resultList[index].posterPath!,
    //               releaseDate: resultList[index].releaseDate!,
    //               imageBack: resultList[index].backdropPath!,
    //               // isSelected: resultList![index].isSelected,
    //             ),
    //             itemCount: resultList?.length ?? 0),
    //       );
    //     });
    return BlocBuilder<PopularMoviesViewModel,PopularMoviesState>(
      bloc: viewModel,
      builder: (context,state){
        switch (state){
          case LoadingState():{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          case ErrorState():{
            return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getPopularMovies();
                        },
                        child: Text("Try again"))
                  ],
                ));
          }
          case SuccessState():{
            var resultList = state.resultList;
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
                    // isSelected: resultList![index].isSelected,
                  ),
                  itemCount: resultList?.length ?? 0),
            );
          }
        }
      },
    );
  }
}

// PopularMovieWidget(
// title: resultList![0].title!,
// image: resultList![0].posterPath!,
// releaseDate: resultList![0].releaseDate!);