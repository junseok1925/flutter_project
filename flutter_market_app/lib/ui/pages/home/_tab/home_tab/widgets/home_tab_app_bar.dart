import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_utill.dart';

class HomeTabAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bottom 속성 사용 못함 -> Scaffold의 appBar에서 사용 가능
    return AppBar(
      title: Text('인창동'),
      // centerTitle: false, // 타이틀 center(x), 왼쪽 배치 됨
      actions: [
        GestureDetector(
          onTap: () {
            // 스낵바 구현
            SnackbarUtill.showSnackBar(context, '준비중...');
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
