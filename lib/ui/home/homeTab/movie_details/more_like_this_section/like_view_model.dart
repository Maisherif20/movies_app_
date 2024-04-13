import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/LikeApiManager.dart';

import '../../../../../model/LikeResponse.dart';

class LikeViewModel extends Cubit<LikeState>{

  LikeViewModel(): super(LoadingState(message: 'Loading'));

   void getLike(String id)async{
    try{
      var response = await LikeApiManager.getLikeData(id);
      if(response.message == 'error'){
        emit(ErrorState(errorMessage: response.message!));
      }else{
        emit(SuccessState(resultList: response.results));
      }

    }catch(e){
      ErrorState(errorMessage: e.toString());
    }

  }
}

sealed class LikeState{}
class LoadingState extends LikeState{
  String? message;
  LoadingState({this.message});
}
class SuccessState extends LikeState{
  List<Results>? resultList;
  SuccessState({required this.resultList});
}
class ErrorState extends LikeState{
  String errorMessage;
  ErrorState({required this.errorMessage});
}
