import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/widgets/user_profile_image.dart';

class ProductDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileArea(),
          Divider(),
          Text(
            '팝니다',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          Text('12분전', style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 10),
          Text('팝니다', style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  Row profileArea() {
    return Row(
          children: [
            UserProfileImage(
              dimension: 50,
              imgUrl: 'https://picsum.photos/200/300',
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '강준석',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '인창동',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}
