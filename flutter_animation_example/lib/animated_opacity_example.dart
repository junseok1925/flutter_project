import 'package:flutter/material.dart';

class AnimatedOpacityrExample extends StatefulWidget {
  @override
  State<AnimatedOpacityrExample> createState() =>
      _AnimatedOpacityrExampleState();
}

class _AnimatedOpacityrExampleState extends State<AnimatedOpacityrExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        height: 300,
        width: double.infinity,
        color: Colors.green,
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: selected ? 0.3 : 1,
          curve: Curves.easeIn,
          duration: Duration(seconds: 1),
          child: Container(width: 50, height: 50, color: Colors.amber),
        ),
      ),
    );
  }
}
