import 'package:flutter_book_search_app/data/model/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BookRepository test', () async {
    // bookRepository 불러옴
    BookRepository bookRepository = BookRepository();

    // bookRepository의 searchBooks('jun')의 값을 books변수에 할당
    final books = await bookRepository.searchBooks('jun');

    // 리스트가 비어있지 않아야 한다(검색 결과가 하나 이상 있어야 한다)
    expect(books.isEmpty, false);

    //결과로 받은 Book 객체를 JSON 형태로 출력 (테스트용 확인)
    for (var book in books) {
      print(book.toJson());
    }
  });
}
