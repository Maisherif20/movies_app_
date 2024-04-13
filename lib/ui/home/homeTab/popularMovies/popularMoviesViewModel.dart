import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/ApiManager.dart';
import '../../../../model/Result.dart';

class PopularMoviesViewModel extends Cubit<PopularMoviesState>{
  PopularMoviesViewModel():super(LoadingState(message: 'Loading....'));
  void loadResult() async{
    try{
      var response = await ApiManager.getPopularMovies();
      if(response.message == 'error'){
        emit(ErrorState(errorMessage: response.message!));
      }else{
        emit(SuccessState(resultList: response.results));
      }
    }catch(e){
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class PopularMoviesState{}

class LoadingState extends PopularMoviesState{
  String? message;
  LoadingState({this.message});
}

class SuccessState extends PopularMoviesState{
  List<Result>? resultList;
  SuccessState({this.resultList});
}

class ErrorState extends PopularMoviesState{
  String errorMessage;
  ErrorState({required this.errorMessage});
}