import 'package:freezed_annotation/freezed_annotation.dart';
part 'main.freezed.dart';
part 'main.g.dart';

@freezed
abstract class UserModel with _$Person {
  const factory Person({
    required String name,
    required String email,
    required int age,
    @JsonKey(name: 'count_number') required int countNumber,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
