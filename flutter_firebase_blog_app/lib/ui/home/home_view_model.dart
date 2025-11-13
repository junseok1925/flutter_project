import 'dart:async';

import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 1. 상태 클래스 만들기

// 2. 뷰 모델 만들기

class HomeViewModel extends Notifier<List<Post>> {
  @override
  List<Post> build() {
    getAllPosts();
    return [];
  }

  void getAllPosts() async {
    final postRepo = PostRepository();
    // final posts = await postRepo.getAll();
    // state = posts ?? [];
    final stream = postRepo.postListStream();
    final streamSub = stream.listen((posts) {
      //
      state = posts;
    });

    // 이 뷰모델이 없어질 때 실행됨, 넘겨준 함수 호출
    ref.onDispose(() {
      // 구독하고 있는 Stream의 구독을 끊어주어야 메모리에서 안전하게 제거
      // Stream Listen할땨 리턴 받는 StreamSubscription 클래스의 cancel
      streamSub.cancel();
    });
  }
}

// 3. 뷰 모델 관리자 만들기
final HomeViewModelProvider = NotifierProvider<HomeViewModel, List<Post>>(() {
  return HomeViewModel();
});
