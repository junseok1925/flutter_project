import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_blog_app/data/model/post.dart';

class PostRepository {
  Future<List<Post>> getAll() async {
    // 1. 파이어스토어 인스턴스 가져와서 생성
    final firestore = FirebaseFirestore.instance;
    // 2. post 컬렉션 참조 만들기
    final collectionRef = firestore.collection('posts');
    // 3. 모든 문서 가져오기
    final result = await collectionRef.get();
    // 4. QuerySnapshot 안의 문서 목록 가져오기
    final docs = result.docs;

    // Firebase에서 불러온 각 문서를 Post 객체로 바꾼다
    //
    return docs.map((doc) {
      final map = doc.data();
      doc.id;
      final newMap = {'id': doc.id, ...map}; // 문서 Id와 나머지 요소를 합쳐 newMap 생성
      return Post.fromJson(newMap); // Post 객체로 변환
    }).toList();
  }

  // 1. creat: 데이터 쓰기
  // 해당 매서드의 성공/실패 여부를 bool 타입으로 리턴받아 추가 작업
  Future<bool> insert({
    required String title,
    required String content,
    required String writer,
    required String imageUrl,
  }) async {
    // firestore와 통신오류가 날 경우를 대비해 try/catch 문으로 실행
    try {
      // firestore 인스턴스 가져오기
      final firestore = FirebaseFirestore.instance;
      // 컬렉견 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 문서 참조 만들기
      final docRef = collectionRef.doc();
      // 값 쓰기
      docRef.set({
        'title': title,
        'content': content,
        'writer': writer,
        'imageUrl': imageUrl,
        'createdAt': DateTime.now()
            .toIso8601String(), // "2025-11-09T20:51:23.801260"
      });
      // 통신성공
      return true;
    } catch (e) {
      // 통신실패
      print(e);
      return false;
    }
  }

  // 2. Read : 특정 ID로 하나의 문서 가져오기
  Future<Post?> getOne(String id) async {
    try {
      // firebase firestore 인스턴스 가져오기
      final firestore = FirebaseFirestore.instance;
      // 컬렉션 참조
      final collectionRef = firestore.collection('posts');
      // 문서 참조
      final docRef = collectionRef.doc(id);
      // 데이터 가져오기
      final doc = await docRef.get();
      return Post.fromJson({'id': doc.id, ...doc.data()!});
    } catch (e) {
      print(e);
      return null; // 오류가 나면 null을 반환하여 아무것도 안가져오기
    }
  }

  // 3.Update
  Future<bool> update({
    required String id,
    required String writer,
    required String title,
    required String content,
    required String imageUrl,
  }) async {
    try {
      // firebase firestore 인스턴스 가져오기
      final firestore = FirebaseFirestore.instance;
      // 컬렉션 참조
      final collectionRef = firestore.collection('posts');
      // 문서 참조
      final docRef = collectionRef.doc(id);
      // 값 업데이트하기 (set) : id에 해당하는 문서가 없을 때 새로 생성 됨
      // docRef.set(data);
      // update : id에 해당하는 문서가 없을 때 에러 발생
      docRef.update({
        'writer': writer,
        'title': title,
        'content': content,
        'imageUrl': imageUrl,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 4. delete
  Future<bool> delete(String id) async {
    try {
      // firebase firestore 인스턴스 가져오기
      final firestore = FirebaseFirestore.instance;
      // 컬렉션 참조
      final collectionRef = firestore.collection('posts');
      // 문서 참조 (id로 삭제할 문서를 판별하기 때문에 id추가)
      final docRef = collectionRef.doc(id);
      // 삭제
      docRef.delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
