import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:newsapp/Core/Utills/AssetsManager.dart';
import 'package:newsapp/Core/Utills/ColorsManager.dart';
import 'package:newsapp/Core/Utills/RoutesManager.dart';
import 'package:newsapp/Core/Utills/StringsManager.dart';
import 'package:newsapp/Data/Api/Models/SearchRespnse/Articles.dart';
import 'package:newsapp/Data_Model/CategoryDataModel.dart';
import 'package:newsapp/Presentition/Screens/Home/Tabs/Categories/CategoryDetails/CategoryDetails.dart';
import 'package:http/http.dart' as http;
import 'HomeDrawer/Home_Drawer.dart';
import 'Tabs/Categories/CategoryScreen/categoriesScreen.dart';
import 'Tabs/Settings/settings.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearched = false;
  late Widget SelectedWidget;
  List<dynamic> searchResults = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    SelectedWidget = categories(
      onCategoryItemClicked: onCategoryClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          image: AssetImage(assetsManager.Pattern),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: isSearched ? TextField(
            autofocus: true,
            style: AppStyles.SearchText,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorsManager.white,
              hintText: 'Search Article',
              hintStyle: AppStyles.SearchText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                    color: ColorsManager.white, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                    color: ColorsManager.white, width: 2),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                searchArticles(value);
              } else {
                setState(() {
                  searchResults = [];
                });
              }
            },)
              : const Text(StringsManager.appBarTitle),
          actions: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isSearched = !isSearched;
                    if (!isSearched) {
                      searchResults = [];
                    }
                  });
                },
                child: Icon(
                  isSearched ? Icons.close : Icons.search,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        drawer: HomeDrawer(onMenuItemClicked: onDrawerItemClick),
        body: isSearched ? buildSearchResults() : SelectedWidget,
      ),
    );
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.Categories) {
      SelectedWidget = categories(
        onCategoryItemClicked: onCategoryClicked,
      );
    } else if (item == MenuItem.Settings) {
      SelectedWidget = settings();
    }
    setState(() {});
  }

  onCategoryClicked(CategoryDm category) {
    SelectedWidget = Categorydetails(category: category);
    setState(() {});
  }

  Widget buildSearchResults() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (searchResults.isEmpty) {
      return const Center(child: Text('No articles found!'));
    }
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final article = searchResults[index];
        return ListTile(
          title: Text(article['title']),
          subtitle: Text(article['description'] ?? 'No description available'),
          onTap: () {
            Navigator.pushNamed(context, RoutesManager.articlesDetails);
          },
        );
      },
    );
  }

  Future<void> searchArticles(String query) async {
    setState(() {
      isLoading = true;
    });
    try {
      final url = Uri.parse('https://newsapi.org/v2/everything?q=${query}&apiKey=ea73304812554206bff587b15fd51f1a');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          searchResults = data[Articles];
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching search results: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
