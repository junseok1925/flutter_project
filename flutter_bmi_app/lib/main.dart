import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/pages/home/home_page.dart';
import 'package:flutter_bmi_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark, // 사용할 다크/라이트 테마 설정
      // themeMode: ThemeMode.light, // 사용할 다크/라이트 테마 설정
      themeMode: ThemeMode.system, // 사용할 다크/라이트 테마 설정 - 시스템 설정 테마로 지정
      theme: lightTheme, // 기본 테마
      darkTheme: dartTheme, // 다크 테마
      home: HomePage(),
    );
  }
}
