import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_detail/product_detail_page.dart';

class ProductListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailPage();
            },
          ),
        );
      },
      child: Container(
        height: 120,
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              // 자식 사진요소 테두리 둥글게하는 위젯
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('상품명임', style: TextStyle(fontSize: 15)),
                  Text(
                    '인창동 1분전',
                    style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                  ),
                  Text(
                    '1000원',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    // 자식 요소 오른쪽 끝에
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(CupertinoIcons.heart, size: 16),
                      SizedBox(width: 4),
                      Text('0', style: TextStyle(fontSize: 12, height: 1)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
