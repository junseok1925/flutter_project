import 'package:flutter/material.dart';

class ChatDetailProductArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: Colors.grey)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      // DefaultTextStyle : 안에 있는 Text()위젯의 스타일을 통일
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black, // 컬러 필수요소임
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('팝니다'), SizedBox(height: 3), Text('2025.01.01')],
        ),
      ),
    );
  }
}
