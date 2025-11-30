import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_utill.dart';
import 'package:flutter_market_app/ui/widgets/user_profile_image.dart';

class MyProfileBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserProfileImage(
          dimension: 50,
          imgUrl: 'https://picsum.photos/200/300',
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            '강준석',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            SnackbarUtill.showSnackBar(context, '준비중...');
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.grey),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              '프로필 수정',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
