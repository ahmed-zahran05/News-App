import 'package:flutter/material.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';
import 'package:newsapp/Data/Api/api_manager/api_mannager.dart';

class ArticlesVM extends ChangeNotifier{
  List<Articles>? articles ;
  String? errorMessage;
  bool? isLoading;

  Future<void>  getArticlesBySourceId(String SourceID) async {
    try{
      isLoading = true ;
      notifyListeners();
      var response = await apiManager.getArticles(SourceID);
      isLoading = false ;
      if(response.status == 'ok'){
        articles = response.articles ;
      }
      else{
        errorMessage = "SomeThing Went Wrong" ;
      }
      notifyListeners();
    }
    catch(e){
      isLoading = false ;
      errorMessage = "Check Internet Connection" ;
      notifyListeners();
    }
  }
}