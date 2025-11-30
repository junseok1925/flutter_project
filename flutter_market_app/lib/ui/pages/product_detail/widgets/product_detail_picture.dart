import 'package:flutter/material.dart';

class ProductDetailPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder( // 감싸는 부모 요소의 크기가 존재해야함
        itemCount: 5,
        itemBuilder: (context, index) {
          return Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
