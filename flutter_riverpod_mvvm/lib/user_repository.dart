// repository class
import 'dart:convert';
import 'package:flutter_riverpod_mvvm/user.dart';

class UserRepository {
  Future<User> getUser() async {
    // 서버에서 데이터를 가져올 때는 항상 비동기로 가져온다
    await Future.delayed(Duration(seconds: 1));

    String dummy = """
{
  "name" : "jun",
  "age" : 20
}
""";

    // 이때는 문자열을 먼저 Map으로 바꿔야만 User.fromJson()에 넣을 수 있다.
    // 즉, jsonDecode() 없으면 "jun" 같은 문자열을 해석할 수 없다.

    // 1. jsonDecode 함수 사용해서 Map으로 변환
    Map<String, dynamic> map = jsonDecode(dummy);
    // -> {name: jun, age: 20}

    // 2. map ->  User 객체로 변환
    return User.fromJson(map);
  }
}
