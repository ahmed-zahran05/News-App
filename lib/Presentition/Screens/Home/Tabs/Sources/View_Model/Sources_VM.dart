import 'package:flutter/material.dart';
import 'package:newsapp/Common/Base/Base_State.dart';
import 'package:newsapp/Common/Result/Result.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/Source.dart';
import 'package:newsapp/Data/Api/api_manager/api_mannager.dart';

class SourcesVM extends ChangeNotifier{

   BaseState state = LoadingState();
   void emit(BaseState newState){
     state = newState;
     notifyListeners();
   }


    Future<void> getSourcesByCategoryId(String CategoryId) async {
          emit(LoadingState());
          var result = await apiManager.getSources(CategoryId);

          switch(result){
              case Success<List<Source>>():
              emit(SuccessState(data: result.data));

              case ServerError<List<Source>>():
              emit(ErrorState(serverError: result));

             case Error<List<Source>>():
              emit(ErrorState(error: result));
          }
       }
}

