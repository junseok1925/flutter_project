// View Class

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mvvm/home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          final HomeState = ref.watch(HomeViewModelProvider);

          return Column(
            children: [
              Text('name: ${HomeState.user?.name}'),
              Text('age: ${HomeState.user?.age}'),
              ElevatedButton(
                onPressed: () {
                  final viewModel = ref.read(HomeViewModelProvider.notifier);
                  viewModel.getUser();
                },
                child: Text('get Data'),
              ),
            ],
          );
        },
      ),
    );
  }
}
