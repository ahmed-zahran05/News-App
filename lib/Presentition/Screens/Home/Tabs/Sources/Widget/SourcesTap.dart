import 'package:flutter/material.dart';
import 'package:newsapp/Data/Api/Models/SourcsesResponse/Sources.dart';
import 'package:newsapp/Presentition/Screens/Home/Tabs/Articles/View/articlesView.dart';

import 'Sourceitem.dart';

class Sourcestap extends StatefulWidget {
   Sourcestap({super.key , required this.sources});
  List<Sources> sources ;

  @override
  State<Sourcestap> createState() => _SourcestapState();
}

class _SourcestapState extends State<Sourcestap> {
   int tappedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        TapsOfSources() ,
        ArticlesList(source: widget.sources[tappedIndex],),
      ],
    );
    }
  Widget TapsOfSources(){
    return  DefaultTabController(
      length: widget.sources.length,
      child: TabBar(
        onTap: (index) {
          tappedIndex = index ;
          setState(() {});
        },
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.all(8),
        dividerColor: Colors.transparent,
        indicatorColor:   Colors.transparent,

        isScrollable: true,
        tabs: widget.sources.map(
              (source) => Sourceitem(source: source, isSelected: widget.sources.indexOf(source) == tappedIndex),
        ).toList(),
      ),
    );
    }
}

