import 'dart:convert';
import 'dart:math';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  // Future로 나중에 비동기 작업이 완료되면 List<Book>을 반환
  Future<List<Book>> searchBooks(String query) async {
    final client = Client();
    // http 패키지의 CLient를 이용해서 GET요청 수행
    final response = await client.get(
      Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$query'),
      // 네이버 OpenAPI 인증용 ID,secret 지정
      headers: {
        'X-Naver-Client-Id': 'TRS79OnXRAcUT0Wn2ycH',
        'X-Naver-Client-Secret': '5AbMeIyyfd',
      },
    );
    // Get 요청 성공 시 -> 200
    // 응답코드가 200일때 JSON 문자열 → jsonDecode로 Map 변환
    // body 데이터를 jsonDecode 함수 사용해서 map으로 바꾼 후 List<Book>으로 반환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);

      // Mappediterable 이라는 클래스에 함수를 넘겨줄테니
      // 나중에 요청하면, 그때 List(items)들을 하나씩 반복문을 돌려서
      // 내가 넘겨준 함수를 실행키셔서 새로운 리스트로 돌려줘라
      final iterable = items.map((e) {
        return Book.fromJson(e);
      });

      final list = iterable.toList();
      return list;
    }

    // 아닐때 빈 리스트 반환
    return [];
  }

  Future<List<Book>?> search(String query) async {}
}
