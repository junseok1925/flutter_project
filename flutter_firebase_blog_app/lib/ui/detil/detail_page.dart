import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/ui/detil/detail_view_model.dart';
import 'package:flutter_firebase_blog_app/ui/write/write_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  DetailPage(this.post);
  Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(post));

    // state가 아직 null이면 로딩 화면만 보여줌
    if (state == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          iconButton((Icons.delete), () async {
            print('delete tap');
            final vm = ref.read(detailViewModelProvider(post).notifier);
            final result = await vm.deletePost();
            if (result) {
              Navigator.pop(context);
            }
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
          Image.network(state.imageUrl, fit: BoxFit.cover),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Column(
              // 왼쪽 정렬
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 9),
                Text(
                  state.writer,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  state.createdAt.toIso8601String(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w200,
                  ), //얇게
                ),
                SizedBox(height: 15),
                Text(state.content, style: TextStyle(fontSize: 16)),
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
