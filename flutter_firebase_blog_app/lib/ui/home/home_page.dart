import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/ui/detil/detail_page.dart';
import 'package:flutter_firebase_blog_app/ui/home/home_view_model.dart';
import 'package:flutter_firebase_blog_app/ui/write/write_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLOG')),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('최근 글', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final posts = ref.watch(HomeViewModelProvider);
                return Expanded(
                  child: ListView.separated(
                    // 아래 3개는 ListView.separated()에서 필수
                    itemCount: posts.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10), //itemBuilder의 각 위젯들 사이에 배치할 위젯 설정
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return item(post: post);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // 글쓰기 플러팅 버튼 추가 - WritePage로 라우팅
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return WritePage(null);
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class item extends StatelessWidget {
  final Post post;
  const item({super.key, required this.post}); // 전달받을 게시글 데이터

  @override
  Widget build(BuildContext context) {
    // onTap()를 위해 Container를 GestureDetector로 감쌓고 onTap() -> DetailPage로 라우팅
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(post);
            },
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 140,
        child: Stack(
          children: [
            //
            Positioned(
              right: 0,
              width: 120,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(post.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(right: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    post.content,
                    overflow: TextOverflow.ellipsis, // 내용이 길어지면 "..." 처리
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 5),
                  Text(
                    post.createdAt.toIso8601String(),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
