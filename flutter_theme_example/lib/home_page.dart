import 'package:flutter/material.dart';
import 'package:flutter_theme_example/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      // ListView로 3개의 색상 박스를 표시
      body: ListView(
        children: [
          /// AppThemeExtension.main 색상 적용
          /// context.appColor → BuildContext extension을 통해
          /// ThemeExtension(AppThemeExtension)을 직접 가져오는 방식
          Container(
            height: 100,
            width: double.infinity,
            color: context.appColor.main,
          ),

          /// mainLight 색상 적용
          Container(
            height: 100,
            width: double.infinity,
            color: context.appColor.mainLight,
          ),

          /// sub 색상 적용
          Container(
            height: 100,
            width: double.infinity,
            color: context.appColor.sub,
          ),
        ],
      ),
    );
  }
}
