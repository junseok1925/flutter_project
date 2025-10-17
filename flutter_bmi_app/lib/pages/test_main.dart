import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/pages/home/home_page.dart';

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
      themeMode: ThemeMode.light, // 사용할 다크/라이트 테마 설정
      // 라이트 테마 설정
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        // 해당 테마일때 사용할 컬러 지정
        dividerColor: Colors.black38,

        highlightColor: Colors.blueAccent,

        // 슬라이더 테마 지정
        sliderTheme: SliderThemeData(
          thumbColor: Colors.blueAccent, // 슬라이더 점 색상
          activeTrackColor: Colors.black38, // 슬라이더 선택 된 부분 막대 색상(왼쪽)
          inactiveTrackColor: Colors.black12, // 슬라이더 선택 안된 부분 막대 색상(오른쪽)
          trackHeight: 1, // 슬라이더 굵기
        ),

        // Elevated, Outlined Button 테마 설정
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
            backgroundColor: WidgetStatePropertyAll(
              Colors.blueAccent,
            ), // WidgetStatePropertyAll : 어떤 상태든(버튼눌리든 말든) 항상 backgroundColor: 배경색 지정
            foregroundColor: WidgetStatePropertyAll(
              Colors.white,
            ), // WidgetStatePropertyAll : 어떤 상태든(버튼눌리든 말든) 항상 foregroundColor: 배튼 위의 텍스트, 아이콘 색상 지정
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
            side: WidgetStatePropertyAll(BorderSide(color: Colors.black38)),
          ),
        ),
      ),

      // 타크 테마 설정
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        // 해당 테마일때 사용할 컬러 지정
        dividerColor: Colors.white38,

        highlightColor: Colors.blueAccent,

        // 해당 테마일때 사용할 슬라이더 테마 지정
        sliderTheme: SliderThemeData(
          thumbColor: Colors.blueAccent, // 슬라이더 점 색상
          activeTrackColor: Colors.white54, // 슬라이더 선택 된 부분 막대 색상(왼쪽)
          inactiveTrackColor: Colors.white54, // 슬라이더 선택 안된 부분 막대 색상(오른쪽)
          trackHeight: 1, // 슬라이더 굵기
        ),

        // Elevated, Outlined Button 테마 설정
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
            backgroundColor: WidgetStatePropertyAll(
              Colors.blueAccent,
            ), // WidgetStatePropertyAll : 어떤 상태든(버튼눌리든 말든) 항상 backgroundColor: 배경색 지정
            foregroundColor: WidgetStatePropertyAll(
              Colors.white,
            ), // WidgetStatePropertyAll : 어떤 상태든(버튼눌리든 말든) 항상 foregroundColor: 배튼 위의 텍스트, 아이콘 색상 지정
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
            side: WidgetStatePropertyAll(BorderSide(color: Colors.white24)),
            foregroundColor: WidgetStatePropertyAll(
              Colors.white,
            ), // WidgetStatePropertyAll : 어떤 상태든(버튼눌리든 말든) 항상 foregroundColor: 배튼 위의 텍스트, 아이콘 색상 지정
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
