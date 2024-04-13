import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/homeTab/movie_details/more_like_this_section/like_view_model.dart';

import 'like_this_widget.dart';

class LikeThis extends StatefulWidget {
  String id;
  LikeThis({required this.id});

  @override
  State<LikeThis> createState() => _LikeThisState();
}

class _LikeThisState extends State<LikeThis> {
  LikeViewModel viewModel =LikeViewModel();

  void initState() {
    super.initState();
    viewModel.getLike(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeViewModel ,LikeState>(
      bloc: viewModel,
        builder: (context, state) {
          switch(state){
            case LoadingState():{
              return Center(
                          child: CircularProgressIndicator(),
                        );
            }
            case ErrorState():{
              return Column(
                          children: [
                            Text(state.errorMessage),
                            ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                          ],
                        );
            }
            case SuccessState():{
              var resultList = state.resultList;
              return Expanded(
                          flex: 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: resultList!.length,
                            itemBuilder: (context, index) => LikeThisWidget(
                              imagePoster: resultList[index].posterPath??" ",
                              id: resultList![index].id!.toString(),
                              title: '${resultList[index].title}',
                              date: '${resultList[index].releaseDate}',
                              vote: '${resultList[index].voteAverage}', releaseDate: resultList[index].releaseDate!,
                            ),
                          ));
            }
          }
        },);


      // FutureBuilder(
      //   future: LikeApiManager.getLikeData(id),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (snapshot.hasError || snapshot.data?.message == 'error') {
      //       return Column(
      //         children: [
      //           Text(snapshot.data?.message ?? snapshot.error.toString()),
      //           ElevatedButton(onPressed: () {}, child: Text('Try Again')),
      //         ],
      //       );
      //     }
      //     var resultList = snapshot.data?.results;
      //     return Expanded(
      //         flex: 1,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: resultList!.length,
      //           itemBuilder: (context, index) => LikeThisWidget(
      //             imagePoster: resultList[index].posterPath??" ",
      //             id: resultList![index].id!.toString(),
      //             title: '${resultList[index].title}',
      //             date: '${resultList[index].releaseDate}',
      //             vote: '${resultList[index].voteAverage}',
      //           ),
      //         ));
      //   });
  }
}
