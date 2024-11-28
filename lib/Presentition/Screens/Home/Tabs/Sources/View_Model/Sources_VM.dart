import 'package:flutter/material.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/Sources.dart';
import 'package:newsapp/Data/Api/api_manager/api_mannager.dart';

class SourcesVM extends ChangeNotifier{
       List<Sources>? sources ;
       String? errorMessage;
       bool? isLoading;

    Future<void>   getSourcesByCategoryId(String CategoryId) async {
           try{
             isLoading = true ;
             notifyListeners();
             var response = await apiManager.getSources(CategoryId);
             isLoading = false ;
             if(response.status == 'ok'){
               sources = response.sources ;
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