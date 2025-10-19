import 'dart:math';

import 'package:flutter/material.dart';

class ResultGauge extends StatelessWidget {
  ResultGauge(this.bmi);

  double bmi;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center, // 전체 센터로 정렬
      children: [
        // square : 넓이, 높이 동일한 sizedBox 생성 시
        SizedBox.square(
          dimension: 250,
          child: CircularProgressIndicator(
            value: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
        SizedBox.square(
          dimension: 250,
          child: CircularProgressIndicator(
            value: min(
              bmi / 35,
              1,
            ), // (a,b)에서 a와 b중 더 작은 값을 리턴 -> bmi/35가 1보다 크면 그냥 1을 리턴
            color: Theme.of(context).highlightColor,
          ),
        ),
        Text(
          bmi.toStringAsFixed(1),
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
