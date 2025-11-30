class DummyRepository {
  // 메서드 호출했을 때 일정시간 후에 문자열을 리턴해주는 가상의 검색 메서드

  Future<String> search(String query) async {
    await Future.delayed(Duration(milliseconds: 500));
    return '검색결과: $query';
  }

  // 메서드 호출했을 때 일정기한 후에 ture 리턴해주는 가상의 닉네임 검사하는 메서드
  Future<bool> nicknameCK(String nickname) async {
    await Future.delayed(Duration(milliseconds: 500));
    return true;
  }
}
