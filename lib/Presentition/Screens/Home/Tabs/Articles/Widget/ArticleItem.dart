import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Core/Utills/RoutesManager.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.articleobject}) ;
  Article articleobject;
  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap: () {
      Navigator.pushNamed(context, RoutesManager.articlesDetails, arguments: articleobject);
    },
        child: Container(
        margin: REdgeInsets.symmetric(horizontal: 8 , vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: articleobject.urlToImage ?? "",
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                ),),
            SizedBox(height: 4.h,),
            Text(articleobject.source?.name ?? '' , style: AppStyles.ArticleSource, ),
            SizedBox(height: 8.h,),
            Text(articleobject.title ?? '' ,style: AppStyles.ArticleTitle, ),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    );
  }
}
