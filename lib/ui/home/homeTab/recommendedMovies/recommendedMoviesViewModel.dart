import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/ApiManager.dart';
import '../../../../model/Result.dart';

class RecommendedMoviesViewModel extends Cubit<RecommendedMoviesState>{
  RecommendedMoviesViewModel():super(LoadingState(message: 'Loading....'));
  void loadResult()async{
    try{
      var response = await ApiManager.getRecommendedMovies();
      if(response.message == 'error'){
        emit( ErrorState(errorMessage: response.message!));
      }else{
        emit(SuccessState(resultList:response.results));
      }
    }
    catch(e){
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

}

sealed class RecommendedMoviesState{}

class LoadingState extends RecommendedMoviesState{
  String? message;
  LoadingState({this.message});
}

class SuccessState extends RecommendedMoviesState{
  List<Result>? resultList;
  SuccessState({this.resultList});
}

class ErrorState extends RecommendedMoviesState{
  String errorMessage;
  ErrorState({required this.errorMessage});
}