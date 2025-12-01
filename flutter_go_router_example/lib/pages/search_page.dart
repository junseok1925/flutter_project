import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SearchPage')),
      body: Center(child: Text('text : $text')),
    );
  }
}
