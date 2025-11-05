// 1. 상태 클래스 만들기
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/data/model/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//화면(HomePage)에서 필요한 데이터(여기서는 `List<Book>`)를 저장
class HomeState {
  List<Book> books;
  HomeState(this.books);
}

// 2. view 모델 만들기 - Notifier 상속
// Notifier<HomeState>를 상속 → 상태(`HomeState`)를 관리하는 객체가 됨.
class HomeViewModel extends Notifier<HomeState> {
  // build()는 ViewModel이 처음 만들어질 때 초기 상태를 정의한다.
  // → 여기서는 HomeState([]) (즉, “아직 검색 전”)
  @override
  HomeState build() {
    return HomeState([]);
  }

  // searchBooks()는 검색 로직:
  // BookRepository로부터 데이터를 가져옴.
  // state를 새 HomeState(books)로 교체 → UI 자동 업데이트.
  Future<void> searchBooks(String query) async {
    final bookRepository = BookRepository();
    final books = await bookRepository.searchBooks(query);
    state = HomeState(books);
  }
}

// 3. view 모델 관리자 만들기 -NotifierProvider 객체
// ViewModel을 앱 전체에서 접근하게 하는 공급자
// 비유: Provider는 “전원 콘센트”다.
// 어디서든 ViewModel(전기)을 꽂아서 쓸 수 있게 만들어준다.
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
