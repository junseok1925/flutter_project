// 재사용 하기 위해서 디바운싱 기능하는 클래스를 만들어 준다.
import 'dart:async';

class Debouncer {
  Debouncer({required this.duration, required this.action});

  // 디바운싱 시간을 설정할 객체
  final Duration duration;
  // 전달받음 듀레이션을 카운팅을 진행해서 전달받은 callback 함수 실핼시켜줄 객체
  Timer? _timer;
  // 시간이 되면 실행될 함수
  final Function() action;

  // 외부에서 디바운서 객체 생성해서 호출할 함수
  // Duration 후 callback이 실행되게 구현
  void run() {
    //
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
