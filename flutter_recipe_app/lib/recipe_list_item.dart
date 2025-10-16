import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  RecipeListItem(this.imagePath, this.title); //매개변수로 이미지경로와 제목을 받기 위해 생성자 생성

  String imagePath;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 20), // 위,아래 20씩 padding 주기
      child: Column(
        crossAxisAlignment: // column의 가로정렬 위젯
            CrossAxisAlignment.start, // column의 가로정렬 시작점부터 정렬하기 (왼쪽으로 붙이기)
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect( // 자식 위젯을 둥근 모서리로 잘라내는 위젯임
              borderRadius: BorderRadius.circular(10), // 4모서리 모두 자름
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 10),
          Text('$title Pochita', style: TextStyle(fontSize: 20)),
          SizedBox(height: 5),
          Text(
            ' ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non.  odio facilisis m',
            style: TextStyle(fontSize: 13, color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
