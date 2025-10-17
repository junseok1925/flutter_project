import 'package:flutter/material.dart';
import 'package:test_app/seat_bottom.dart';
import 'package:test_app/seat_select_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SeatPage());
  }
}

class SeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [SeatSelectBox(), SeatBottom()]),
    );
  }
}
