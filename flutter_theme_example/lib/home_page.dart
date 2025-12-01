import 'package:flutter/material.dart';
import 'package:flutter_theme_example/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: context.appColor.main,
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: context.appColor.mainLight,
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: context.appColor.sub,
          ),
        ],
      ),
    );
  }
}
