import 'package:flutter/material.dart';
import 'package:newsapp/Common/Base/Base_State.dart';
import 'package:newsapp/Common/Base/Base_VM.dart';
import 'package:newsapp/Common/Result/Result.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';
import 'package:newsapp/Data/Api/api_manager/api_mannager.dart';
import 'package:newsapp/Repositry_Contract/Articles_Repositry_Contarct.dart';


class ArticlesVM extends BaseVm {
  Articles_Repository_Interface repositry ;
  ArticlesVM({required this.repositry}) ;

  Future<void> getArticlesBySourceId(String SourceID) async {
    emit(LoadingState());
    var result = await repositry.getArticles(SourceID);

    switch (result) {
      case Success<List<Article>>():
        emit(SuccessState(data: result.data));

      case ServerError<List<Article>>():
        emit(ErrorState(serverError: result));

      case Error<List<Article>>():
        emit(ErrorState(error: result));
    }
  }
}
