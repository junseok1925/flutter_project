import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SeatSelectBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text('1')),
              seat(),
              seat(),
              seat(),
              seat(),
              seat(),
              seat(),
              seat(),
              seat(),
              seat(),
              seat(),
            ],
          ),
        ],
      ),
    );
  }

  Widget seat() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
