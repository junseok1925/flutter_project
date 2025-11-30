import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedrExampleState();
}

class _AnimatedPositionedrExampleState
    extends State<AnimatedPositionedExample> {
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
        color: Colors.red,
        alignment: Alignment.center,
        child: Stack(
          children: [
            AnimatedPositioned(
              left: selected ? 0 : 100,
              top: selected ? 0 : 100,
              child: Container(width: 50, height: 50, color: Colors.amber),
              duration: Duration(seconds: 2),
            ),
          ],
        ),
      ),
    );
  }
}
