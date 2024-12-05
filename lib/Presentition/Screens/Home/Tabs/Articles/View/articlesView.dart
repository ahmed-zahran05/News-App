import 'package:flutter/material.dart';
import 'package:newsapp/Common/Base/Base_State.dart';
import 'package:newsapp/Common/Widget/LoadingWidget.dart';
import 'package:newsapp/Core/Utills/di.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/Source.dart';
import 'package:newsapp/Presentition/Screens/Home/Tabs/Articles/View_Model/ArticlesVM.dart';
import 'package:provider/provider.dart';

import '../Widget/ArticleItem.dart';

class ArticlesList extends StatefulWidget {
  ArticlesList({super.key, required this.source});

  Source source;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  var viewModel = ArticlesVM(repositry: getArticlesRepositry());

  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getArticlesBySourceId(widget.source.id!);
  }

  @override
  void didUpdateWidget(covariant ArticlesList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getArticlesBySourceId(widget.source.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<ArticlesVM>(builder: (context, viewModel, child) {
          var state = viewModel.state;

          switch (state) {
            case SuccessState():
              return Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) =>
                    ArticleItem(articleobject: state.data[index]),
                itemCount: state.data.length,
              ));
            case LoadingState():
              return Loadingwidget();
            case ErrorState():
              return ErrorWidget(state.error!);
          }
        }));
  }
}
