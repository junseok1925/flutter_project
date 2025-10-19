import 'package:flutter/material.dart';

class SliderBox extends StatelessWidget {
  // 3개 이상 매개변수를 받을 때는 네임드 속성으로 받는게 편함(넘겨줄때 순서 안지켜두됨)
  SliderBox({
    required this.label,
    required this.unit,
    required this.value,
    required this.onChanged,
  });

  String label;
  double value;
  String unit;
  void Function(double newValue) onChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(label, style: TextStyle(fontSize: 15)),
            Spacer(),
            Text(
              value.toStringAsFixed(0), // 소수점 n자리까지 toString해줌
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(unit, style: TextStyle(fontSize: 15)),
          ],
        ),
        Slider(value: value, onChanged: onChanged, min: 0, max: 250),
      ],
    );
  }
}
