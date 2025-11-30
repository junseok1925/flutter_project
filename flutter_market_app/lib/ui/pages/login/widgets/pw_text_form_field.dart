import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/validator_util.dart';

class PwTextFormField extends StatelessWidget {
  PwTextFormField({required this.controller, super.key});
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(hintText: '비밀번호를 입력해 주세요'),
      validator: ValidatorUtil.validatorPassword,
    );
  }
}
