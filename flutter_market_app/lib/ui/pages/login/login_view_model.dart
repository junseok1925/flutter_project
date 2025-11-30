import 'package:flutter/material.dart';
import 'package:flutter_market_app/data/repository/user_repository.dart';

class HomeViewModel {
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final userRepository = UserRepository();

    return await userRepository.login(username: username, password: password);
  }
}
