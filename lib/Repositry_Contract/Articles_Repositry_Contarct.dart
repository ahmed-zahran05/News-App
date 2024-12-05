import 'package:newsapp/Common/Result/Result.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';

abstract class Articles_Repository_Interface{
  Future<Result<List<Article>>> getArticles(String sourceId);
}