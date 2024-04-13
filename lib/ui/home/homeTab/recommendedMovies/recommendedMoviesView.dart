import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/homeTab/recommendedMovies/recommendedMovieWidget.dart';
import 'package:movies_app/ui/home/homeTab/recommendedMovies/recommendedMoviesViewModel.dart';

class RecommendedMoviesView extends StatefulWidget {
  const RecommendedMoviesView({super.key});

  @override
  State<RecommendedMoviesView> createState() => _RecommendedMoviesViewState();
}

class _RecommendedMoviesViewState extends State<RecommendedMoviesView> {
  RecommendedMoviesViewModel viewModel = RecommendedMoviesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadResult();
  }
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future:ApiManager.getRecommendedMovies(),
    //   builder: (context,snapshot){
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return const Center(child: CircularProgressIndicator(),);
    //     }
    //     if(snapshot.hasError || snapshot.data?.code == 'error'){
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data?.code ?? snapshot.error.toString()),
    //             ElevatedButton(onPressed: (){}, child:const Text('Try Again')),
    //           ],
    //         ),
    //       );
    //     }
    //     var movieList = snapshot.data?.results;
    //     return Expanded(child: ListView.builder(
    //       itemBuilder: (context,index) => RecommendedMovieWidget(
    //           posterPath: movieList![index].posterPath!,
    //           id: movieList![index].id.toString()!,
    //           title: movieList[index].title!,
    //           voteAverage: movieList[index].voteAverage!.toString(),
    //           releaseDate: movieList[index].releaseDate!),
    //       itemCount: movieList?.length ?? 0,
    //       scrollDirection: Axis.horizontal,
    //
    //     ));
    //   },
    // );
    return BlocBuilder<RecommendedMoviesViewModel,RecommendedMoviesState>(
        bloc: viewModel,
        builder: (context,state){
          switch (state){
            case LoadingState():{
              return const Center(child: CircularProgressIndicator(),);
            }
            case ErrorState():{
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(onPressed: (){}, child:const Text('Try Again')),
                  ],
                ),
              );
            }
            case SuccessState():{
              var movieList = state.resultList;
              return Expanded(child: ListView.builder(
                itemBuilder: (context,index) => RecommendedMovieWidget(
                    posterPath: movieList![index].posterPath!,
                    id: movieList![index].id.toString()!,
                    title: movieList[index].title!,
                    voteAverage: movieList[index].voteAverage!.toString(),
                    releaseDate: movieList[index].releaseDate!),
                itemCount: movieList?.length ?? 0,
                scrollDirection: Axis.horizontal,

              ));
            }
          }
        }
    );
  }
}