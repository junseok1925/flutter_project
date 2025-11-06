import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/ui/write/write_page.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          iconButton((Icons.delete), () {
            print('123');
          }),
          iconButton((Icons.edit), () {
            // 편집 아이콘 클릭 시 wirte_page로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WritePage();
                },
              ),
            );
          }),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 400),
        children: [
          Image.network('https://picsum.photos/200/300', fit: BoxFit.cover),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Column(
              // 왼쪽 정렬
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '제목 부분입니다',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 9),
                Text(
                  '강준석',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '25.11.02 20:30',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w200,
                  ), //얇게
                ),
                SizedBox(height: 15),
                Text(
                  '내용내용내용내용내용내용내용내용내용내용내용내용' * 10,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Icon(icon),
      ),
    );
  }
}
