import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/pages/home/widgets/gender_box.dart';
import 'package:flutter_bmi_app/pages/home/widgets/slider_box.dart';
import 'package:flutter_bmi_app/pages/result/result_page.dart';

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
                onPressed: () {
                  // bmi 구하는 식
                  final meterHeight = height / 100;
                  final bmi = weight / (meterHeight * meterHeight);
                  // 계산하기 버튼 누르면 ResultPage로 이동하기
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(bmi);
                      },
                      // 계산된 bmi값을 ResultPage에서 사용할 수 있게 전달한다. (생성자로 보낼 수 있어서 일단 비활)
                      // settings: RouteSettings(arguments: bmi),
                    ),
                  );
                },
                child: Text('계산하기'),
              ), // 배경색,그림자,입체감,그림자있는 주 액션 버튼
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
