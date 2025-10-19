import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/pages/home/wodgets/gender_box.dart';
import 'package:flutter_bmi_app/pages/home/wodgets/slider_box.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  void onGenderChanged(bool male) {
    setState(() {
      isMale = male;
    });
  }

  double height = 175;
  void onHeightChanged(double newHeight) {
    setState(() {
      height = newHeight;
    });
  }

  double weight = 82;
  void onWeightChanged(double newWeight) {
    setState(() {
      weight = newWeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI 계산기')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ), // 양 옆, 위 아래 padding을 준다
        child: Column(
          children: [
            GenderBox(isMale, onGenderChanged),
            Spacer(),
            SliderBox(
              label: '신장',
              value: height,
              unit: 'CM',
              onChanged: onHeightChanged,
            ),
            Spacer(),
            SliderBox(
              label: '체중',
              value: weight,
              unit: 'KG',
              onChanged: onWeightChanged,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity, // 해당 버튼 크기 가로 최대로
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('계산하기'),
              ), // 배경색,그림자,입체감,그림자있는 주 액션 버튼
            ),
          ],
        ),
      ),
    );
  }
}
