import 'package:newsapp/Common/Result/Result.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';
import 'package:newsapp/Data/Api/api_manager/api_mannager.dart';

import '../Data_Source_Contract/Articles_Data_Source_Interface.dart';

class ArticleApiDataSourceImpl extends ArticlesDataSource{
  apiManager ApiManger;
  ArticleApiDataSourceImpl({required this.ApiManger});
  @override
  Future<Result<List<Article>>> getArticles(String sourceId) async{
    var result = await  ApiManger.getArticles(sourceId);
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