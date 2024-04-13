import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/ReleasesResponse.dart';
import '../../../../api/releases_api.dart';


class RealeasesViewModel extends Cubit<RealeasesStates>{
  RealeasesViewModel(): super(LoadingState(message: 'Loading...'));

  void getRealeasesM()async{
    try{
      var response = await ReleasesApi.getReleases();
      if(response.message == 'error'){
        emit(ErrorState(errorMessage: response.message));
      }else{
        emit(SuccessState(resultList: response.results));
      }

    }catch(e){
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

}

sealed class RealeasesStates{}
class LoadingState extends RealeasesStates{
  String? message;
  LoadingState({this.message});
}
class SuccessState extends RealeasesStates{
  List<Results>? resultList;
  SuccessState({required this.resultList});
}
class ErrorState extends RealeasesStates{
  String? errorMessage;
  ErrorState({this.errorMessage});
}