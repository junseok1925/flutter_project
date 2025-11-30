import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<int> {
  @override
  int build() {
    return 0; // 초기 index
  }

  void onIndexChanged(int newIndex) {
    state = newIndex;
  }
}

final homeViewModelProvider = NotifierProvider.autoDispose<HomeViewModel, int>(
  () {
    return HomeViewModel();
  },
);
