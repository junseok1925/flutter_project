import 'package:flutter/material.dart';
import 'package:flutter_throttling_debouncing_example/debouncer.dart';
import 'package:flutter_throttling_debouncing_example/dummy_repository.dart';
import 'package:flutter_throttling_debouncing_example/throttler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final nicknameController = TextEditingController();
  final searchController = TextEditingController();
  final dummyRepository = DummyRepository();

  late final throttler = Throttler(
    duration: Duration(seconds: 2),
    callback: () async {
      final result = await dummyRepository.search(searchController.text);
      print('throttler $result');
    },
  );

  late final debouncer = Debouncer(
    duration: Duration(seconds: 2),
    action: () async {
      final result = await dummyRepository.nicknameCK(nicknameController.text);
      print('debouncer $result');
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('닉네임 체크'),
          TextField(
            controller: nicknameController,
            onChanged: (value) {
              print('debouncer.run()');
              debouncer.run();
            },
          ),
          Text('검색'),
          TextField(
            controller: searchController,
            onSubmitted: (value) {
              print('throttler.run()');
              throttler.run();
            },
          ),
        ],
      ),
    );
  }
}
