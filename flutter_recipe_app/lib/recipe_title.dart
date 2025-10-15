import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        'Pochita',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
