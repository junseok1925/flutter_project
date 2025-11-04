// Model Class

class User {
  String name;
  int age;

  User({required this.name, required this.age});

  // 1. 네임드 생성자 (fromJson), 서버에서 받은 JSON 데이터를 User 객체로 바꾸기 위한 생성자이다.
  // 즉, fromJson은 외부(서버) → 내부 객체로 바꾸는 식이다.
  User.fromJson(Map<String, dynamic> map)
    : this(name: map['name'], age: map['age']);

  // 2. toJson 메서드 받은 JSON 데이터를 Map으로 변환
  // 앱 내부의 객체를 서버로 전송할 JSON 형태의 텍스트로 바꿔주는 용도다.
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}
ㅜ