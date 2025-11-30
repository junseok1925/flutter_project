import 'package:flutter/material.dart';

class SnackbarUtill {
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        //floating으로 보여줌
        behavior: SnackBarBehavior.floating,
        //닫기버튼 활성화
        showCloseIcon: true,
      ),
    );
  }
}
