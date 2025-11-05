import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HomeViewModel test', () async {
    // 앱내에서는 ProviderScope 안에서 뷰모델을 관리
    // 테스트 환경에서 Widget을 생성하지 않고 테스트 할 수 있게 ProviderContainer 제공
    final providerContainer = ProviderContainer();

    // provider 테스트에서 제공하는 함수 - 테스트가 끝나면 실행될 함수
    addTearDown(providerContainer.dispose);
    final homeVM = providerContainer.read(homeViewModelProvider.notifier);

    // 처음 HomeViewModel의 상태 => 빈 리스트 인 것을 테스트
    final firstState = providerContainer.read(homeViewModelProvider);
    expect(firstState.books.isEmpty, true);

    // HomeViewModel에서 searchBooks 메서드 호출 후 상태가 변경이 정상적으로 되는지 테스트
    await homeVM.searchBooks('harry');
    final afterState = providerContainer.read(homeViewModelProvider);
    expect(afterState.books.isEmpty, false);

    afterState.books.forEach((element) {
      print(element.toJson());
    });
  });
}
