import 'package:flutter/material.dart';
import 'package:flutter_animation_example/animated_align_example.dart';
import 'package:flutter_animation_example/animated_container_example.dart';
import 'package:flutter_animation_example/animated_opacity_example.dart';
import 'package:flutter_animation_example/animated_positioned_example.dart';
import 'package:flutter_animation_example/explict_animation_example.dart';
import 'package:flutter_animation_example/hero_example.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ExplictAnimationExample(),
          // AnimatedAlignExample(),
          // AnimatedContainerExample(),
          // AnimatedOpacityrExample(),
          // AnimatedPositionedExample(),
          // HeroExample(),
        ],
      ),
    );
  }
}
