import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/Common/Result/Result.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/ArticlesResponse.dart';
import 'package:newsapp/Data/Api/Models/SearchResponse/SearchResponse.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/Source.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/SourcesResponse.dart';
class apiManager {
  static const baseUrl = "newsapi.org";
  static const apiKey = "ea73304812554206bff587b15fd51f1a";
  static const sourceEndPoint = "/v2/top-headlines/sources";
  static const articlesEndPoint = "/v2/everything";

  static Future<Result<List<Source>>> getSources(String categoryId) async {
    Uri url = Uri.https(
      baseUrl,
      sourceEndPoint,
      {'apiKey': apiKey, 'category': categoryId},
    );

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);

        if (sourcesResponse.status == 'ok') {
          return Success(data: sourcesResponse.sources ?? []);
        } else {
          return ServerError(
            code: sourcesResponse.code ?? 'unknown',
            message: sourcesResponse.message ?? 'An error occurred',
          );
        }
      } else {
        return ServerError(
          code: response.statusCode.toString(),
          message: response.reasonPhrase ?? 'Unknown error',
        );
      }
    } catch (e) {
      return Error(exception: Exception(e));
    }
  }

  static Future<Result<List<Article>>> getArticles(String sourceId) async {
    Uri url = Uri.https(
        baseUrl,
        articlesEndPoint, {
      'apiKey': apiKey,
      'sources': sourceId
    });
    try {
      var response = await http.get(url);
      String bodyString = response.body;
      var json = jsonDecode(bodyString);
      ArticlesResponse Response = ArticlesResponse.fromJson(json);
      if (Response.status == 'ok') {
        return Success(data: Response.articles!);
      }

      else {
        return ServerError(code: Response.code!, message: Response.message!);
      }
    } catch (e) {
      return Error(exception: Exception(e));
    }
  }

  static Future<List<ArticleModel>> getNewsBySearch(String query) async {
    final url = 'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey';
    final Response = await http.get(Uri.parse(url));
    if (Response.statusCode == 200) {
      final data = json.decode(Response.body);

      if (data['articles'] != null && data['articles'].isNotEmpty) {
        List<ArticleModel> articles = (data['articles'] as List)
            .map((articleData) => ArticleModel.fromJson(articleData))
            .toList();
        return articles;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load news');
    }
  }
}