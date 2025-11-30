import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HeroPage()),
        );
      },
      child: Container(
        child: Row(
          children: [
            Hero(
              tag: 'smaple-image',
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://picsum.photos/200/200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text('상품명'),
            SizedBox(width: 10),
            Text('20만원'),
          ],
        ),
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: 'smaple-image',
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                'https://picsum.photos/200/200',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
