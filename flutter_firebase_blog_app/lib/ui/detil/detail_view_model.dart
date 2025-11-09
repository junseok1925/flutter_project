import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/data/repository/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailViewModel extends _$DetailViewModel {
  final _repo = PostRepository();

  /// build()는 family로 전달받은 post를 초기 상태로 설정한다.
  @override
  Post? build(Post post) {
    return post;
  }

  /// Firestore에서 게시글 삭제
  Future<bool> deletePost() async {
    if (state == null) return false; // state가 비었을 경우 예외 방지
    return await _repo.delete(state!.id);
  }
}
