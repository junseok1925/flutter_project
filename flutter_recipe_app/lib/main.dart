import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/recipe_list%20item.dart';
import 'package:flutter_recipe_app/recipe_menu.dart';
import 'package:flutter_recipe_app/recipe_title.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'NotoSansKR'),
        home: RecipePage());
  }
}

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            CupertinoIcons.search,
            color: Colors.blue,
            size: 24,
          ),
          SizedBox(width: 5),
          Icon(
            CupertinoIcons.heart,
            color: Colors.red,
            size: 24,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeTitle(),
          RecipeMenu(),
          RecipeListItem(),
          RecipeListItem(),
          RecipeListItem(),
          RecipeListItem(),
          RecipeListItem(),
        ],
      ),
    );
  }
}