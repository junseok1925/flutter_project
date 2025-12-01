import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  PostDetailPage({required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PostDetail')),
      body: Center(child: Text('Post ID : $id')),
    );
  }
}
