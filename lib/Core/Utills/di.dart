import 'package:newsapp/Data/Api/api_manager/api_mannager.dart';
import 'package:newsapp/Data/Articles_Repository_Implementation/Articles_Repository_Impl.dart';
import 'package:newsapp/Data/DataSource/Articles_Data_Source_Impl/Articles_Data_Source_Implemention.dart';

ArticlesRepositoryImpl getArticlesRepositry(){
  return ArticlesRepositoryImpl(articlesDataSource:getArticlesDataSource() );
}
ArticleApiDataSourceImpl getArticlesDataSource(){
  return ArticleApiDataSourceImpl(ApiManger:getApiManager() );
}
apiManager getApiManager(){
  return apiManager();
}