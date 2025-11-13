import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/data/repository/post_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'write_view_model.g.dart';

// 상태 클래스
class WritePageState {
  final bool isWriting;
  final String? imageUrl;
  WritePageState(this.isWriting, this.imageUrl);
}

// ViewModel 정의
@riverpod
class WriteViewModel extends _$WriteViewModel {
  final repository = PostRepository();

  @override
  WritePageState build(Post? arg) {
    // 초기 상태: 작성 중 아님
    return WritePageState(false, arg?.imageUrl);
  }

  // 글쓰기 또는 수정
  Future<bool> insert({
    required String writer,
    required String title,
    required String content,
  }) async {
    if (state.imageUrl == null) return false; // 이미지 필수
    // 수정 모드일 때 동일 내용이면 건너뛰기
    if (post != null &&
        post!.content == content &&
        post!.title == title &&
        writer == post!.writer) {
      return false;
    }

    // 작성 중 상태로 전환
    state = WritePageState(true, state.imageUrl);

    // Firestore에 insert 또는 update
    bool result;
    if (post == null) {
      // 새 글 작성
      result = await repository.insert(
        writer: writer,
        title: title,
        content: content,
        imageUrl: state.imageUrl!,
      );
    } else {
      // 기존 글 수정
      result = await repository.update(
        id: post!.id,
        writer: writer,
        title: title,
        content: content,
        imageUrl: state.imageUrl!,
      );
    }

    // 약간의 지연 후 상태 초기화
    await Future.delayed(Duration(seconds: 1));
    state = WritePageState(false, null);
    return result;
  }

  void uploadImage(XFile xFile) async {
    try {
      // storege 사용법
      // 1. firebaseStorage 객체 가져오기
      final storage = FirebaseStorage.instance;
      // 2. 스토리지 참조 만들기
      Reference ref = storage.ref();
      // 3. 파일 참조 만들기 (중복되면 안되서 백만분의 1초 단위로 현재 시간으로 파일명 지정)
      Reference fileRef = ref.child(
        '${DateTime.now().microsecondsSinceEpoch}_${xFile.name}',
      );
      // 4. 쓰기
      await fileRef.putFile(File(xFile.path));
      // 5. 파일에 접근할 수 있는 URL 받기
      String imageUrl = await fileRef.getDownloadURL();
      state = WritePageState(state.isWriting, imageUrl);
    } catch (e) {
      //
      print(e);
    }
  }
}
