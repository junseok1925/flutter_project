import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/pages/home/home_page.dart';
import 'package:flutter_bmi_app/pages/result/widgets/result_gauge.dart';
import 'package:flutter_bmi_app/pages/result/widgets/result_text.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmi);

  double bmi;

  @override
  Widget build(BuildContext context) {
    // home_page.dart에서 보낸 bmi값을 받아온다 해당 값은 null이 될 수 있어서, nullable(?) 표시를 해준다. (생성자로도 받을 수 있어서 비활함)
    // final bmi = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('BMI 계산기')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(),
            ResultGauge(bmi),
            SizedBox(height: 50),
            ResultText(bmi),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(
                    // 다시 homePage로 이동
                    context,
                  );
                },
                child: Text('다시 계산하기'),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
