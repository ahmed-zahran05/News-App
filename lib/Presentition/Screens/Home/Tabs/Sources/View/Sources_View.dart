import 'package:flutter/material.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/Sources.dart';
import 'package:newsapp/Data_Model/CategoryDataModel.dart';
import 'package:newsapp/Presentition/Screens/Home/Tabs/Sources/Widget/SourcesTap.dart';
import 'package:newsapp/Presentition/Screens/Home/Tabs/Sources/View_Model/Sources_VM.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  final CategoryDm categoryDm ;
  const SourcesView({super.key , required this.categoryDm});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {

  var viewModel = SourcesVM();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDm.id);
  }
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider.value(
        value: viewModel ,
        child: Consumer<SourcesVM>(builder: (context, value, child) {
          if(viewModel.isLoading!){
            return Center(child: CircularProgressIndicator());
          }
          if(viewModel.errorMessage != null){
            return Text("${viewModel.errorMessage}");
          }
          List<Sources> sources = viewModel.sources ?? [];
          return Sourcestap(sources: sources,);
        }
        )
    );
  }
}
