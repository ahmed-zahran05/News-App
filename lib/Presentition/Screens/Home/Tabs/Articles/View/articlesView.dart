import 'package:flutter/material.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/Sources.dart';
import 'package:newsapp/Presentition/Screens/Home/Tabs/Articles/View_Model/ArticlesVM.dart';
import 'package:provider/provider.dart';
import '../Widget/ArticleItem.dart';

class ArticlesList extends StatefulWidget {
  ArticlesList({super.key , required this.source});
  Sources source ;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  var viewModel = ArticlesVM();
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getArticlesBySourceId(widget.source.id!);
  }
  @override
  void didUpdateWidget(covariant ArticlesList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.source.id != widget.source.id){
    viewModel.getArticlesBySourceId(widget.source.id!);
    }
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel ,
        child: Consumer<ArticlesVM>(builder: (context, value, child) {
          if(viewModel.isLoading!){
            return const Center(child: CircularProgressIndicator());
          }
          if(viewModel.errorMessage != null){
            return Text("${viewModel.errorMessage}");
          }
          List<Articles> articles = viewModel.articles ?? [] ;
          return Expanded(child: ListView.builder(itemBuilder: (context, index) => ArticleItem(articleobject: articles[index]) , itemCount: articles.length,));
        }
        )
    );
  }
}


