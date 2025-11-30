import 'package:flutter/material.dart';

class ExplictAnimationExample extends StatefulWidget {
  @override
  State<ExplictAnimationExample> createState() =>
      _ExplictAnimationExampleState();
}

class _ExplictAnimationExampleState extends State<ExplictAnimationExample>
    with TickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 10),
  );

  late final animation = Tween<double>(
    begin: 0,
    end: 300,
  ).animate(animationController);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (details) {
        animationController.forward();
      },
      onLongPressEnd: (details) {
        animationController.stop();
      },
      onLongPressCancel: () {
        animationController.stop();
      },
      onDoubleTap: () {
        animationController.reset();
      },
      child: Container(
        width: double.infinity,
        height: 300,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(width: 50, height: 300, color: Colors.red),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                print('animation value: ${animation.value}');
                return Container(
                  width: 50,
                  height: animation.value,
                  color: Colors.green,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
