import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Core/Utills/AssetsManager.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/Data/Api/Models/ArticlesResponse/Articles.dart';

import 'NavigateToWebsiteButton.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Articles article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          image: AssetImage(assetsManager.Pattern),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(article.title ?? ""),),
        body: Padding(
          padding:  REdgeInsets.symmetric(vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? " ",
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
                ),),
              SizedBox(height: 6.h,),
              Text(article.source?.name ?? '', style: AppStyles.ArticleSource,),
              SizedBox(height: 8.h,),
              Text(article.title ?? '', style: AppStyles.ArticleTitle,),
              SizedBox(height: 8.h,),
              Text(article.content ?? '' , style: AppStyles.ArticleContent,),
              SizedBox(height: 10.h,),
              NavigateToWebsiteButton(url: article.url ?? "",)
            ],
          ),
        ),
      ),
    );
  }
}