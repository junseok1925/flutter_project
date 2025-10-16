import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatBottom extends StatelessWidget {
  SeatBottom(this.selectedRow, this.selectedCol);
  int? selectedRow;
  int? selectedCol;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double
          .infinity, // container의 크기는 자식요소의 크기에 맞게 설정되므로 width를 가능한 최대 넓이로 설정
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            selectedRow == null && selectedCol == null
                ? '선택된 좌석 없음 '
                : '선택 좌석: $selectedRow - $selectedCol번',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //버튼 클릭 시 실행 될 함수 - 예매 확인 alert 창
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('예약확인'),
                      content: Text(
                        '$selectedRow - $selectedCol번 좌석 예매하시겠습니까?',
                      ),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true, //기본 버튼 스타일 적용 (굵은 텍스트)
                          // 취소버튼 클릭 시
                          onPressed: () {
                            Navigator.of(context).pop(); //뒤로가기
                          },
                          child: Text('취소'),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true, // 주의/삭제/확정 성격의 버튼 (빨간색)
                          // 확인버튼 클릭 시
                          onPressed: () {},
                          child: Text('확인'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text('예약하기'),
            ),
          ),
        ],
      ),
    );
  }
}
