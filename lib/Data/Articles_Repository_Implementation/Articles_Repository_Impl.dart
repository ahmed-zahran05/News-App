import 'package:newsapp/Common/Result/Result.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';
import 'package:newsapp/Data/DataSource/Data_Source_Contract/Articles_Data_Source_Interface.dart';
import 'package:newsapp/Repositry_Contract/Articles_Repositry_Contarct.dart';

class ArticlesRepositoryImpl extends Articles_Repository_Interface{
  ArticlesDataSource articlesDataSource ;
  ArticlesRepositoryImpl({required this.articlesDataSource});
  @override
  Future<Result<List<Article>>> getArticles(String sourceId) async{
    var result = await articlesDataSource.getArticles(sourceId);
   switch(result){
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }

}