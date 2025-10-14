import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StorePage());
  }
}

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Woman',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text('Kids', style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(
                      'Shoes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text('Bags', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            // Image.asset('assets/image1.jpg', fit: BoxFit.fill),
            // Image.asset('assets/image2.jpg', fit: BoxFit.fill),
            Expanded(
              child: Image.asset('assets/image1.jpg', fit: BoxFit.cover),
            ),
            Expanded(
              child: Image.asset('assets/image2.jpg', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
