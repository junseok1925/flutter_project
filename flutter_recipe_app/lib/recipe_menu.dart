import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 추출한 MenuItem 위젯을 재사용.
        // 아이콘과 텍스트만 다르게 전달해 동일한 디자인의 다른 메뉴 생성.
        MenuItem(icon: Icons.heart_broken, text: 'A'),
        MenuItem(icon: Icons.check, text: 'B'),
        MenuItem(icon: Icons.star, text: 'C'),
        MenuItem(icon: Icons.cake_rounded, text: 'D'),
      ],
    );
  }
}

// 하나의 메뉴 아이템을 표현하는 독립적인 위젯
// StatelessWidget으로 만들어, 고정된 UI 구조를 유지하고
// 외부에서 데이터(아이콘, 텍스트)만 전달받아 표시함
class MenuItem extends StatelessWidget {
  final IconData icon; // 외부에서 아이콘 데이터를 받기 위한 필드
  final String text; // 외부에서 텍스트 데이터를 받기 위한 필드

  const MenuItem({
    super.key,
    required this.icon, // 반드시 전달받아야 함 (required)
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 전달받은 아이콘 데이터로 위젯 생성
          Icon(icon, color: Colors.redAccent, size: 30),
          SizedBox(height: 5),
          // 전달받은 텍스트 데이터로 위젯 생성
          Text(
            text,
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
