import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/Data/Api/Models/ArticlesResponse/ArticlesResponse.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/SourcesResponse.dart';
class apiManager{
  static const baseUrl = "newsapi.org";
  static const apiKey = "ea73304812554206bff587b15fd51f1a";
  static const sourceEndPoint = "/v2/top-headlines/sources";
  static const articlesEndPoint = "/v2/everything";
  static Future<SourcesResponse> getSources(String categoryId)async{
    Uri url = Uri.https(
        baseUrl,
        sourceEndPoint,{
      'apiKey':apiKey,
      'category':categoryId
    });
     var response = await http.get(url);
     String bodyString = response.body;
     var json = jsonDecode(bodyString);
     SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
     return sourcesResponse ;
  }
  static Future<ArticlesResponse> getArticles(String sourceId)async {
    Uri url = Uri.https(
        baseUrl,
        articlesEndPoint,{
      'apiKey':apiKey,
      'sources':sourceId
    });
     http.Response response = await http.get(url);
     String bodyString = response.body;
     Map<String,dynamic> json = jsonDecode(bodyString);
     ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
     return articlesResponse ;
  }
}