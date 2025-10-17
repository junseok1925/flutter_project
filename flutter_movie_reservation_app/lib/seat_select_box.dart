import 'package:flutter/material.dart';

class SeatSelectBox extends StatelessWidget {
  SeatSelectBox(this.selectedRow, this.selectedCol, this.onSelected);

  int? selectedRow;
  int? selectedCol;
  void Function(int row, int col) onSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          seatRow(1),
          SizedBox(height: 10),
          seatRow(2),
          SizedBox(height: 10),
          seatRow(3),
          SizedBox(height: 10),
          seatRow(4),
          SizedBox(height: 10),
          seatRow(5),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              label('빈좌석', Colors.grey),
              SizedBox(width: 10),
              label('예약완료', Colors.amber),
            ],
          ),
        ],
      ),
    );
  }

  // 하단 선택 된 좌석과 예약하기 버튼 구역
  Row label(String text, Color color) {
    return Row(
      children: [
        Text(text),
        SizedBox(width: 5),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }

  // 좌석 한줄
  Widget seatRow(int rowNum) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$rowNum',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          seat(rowNum, 1),
          seat(rowNum, 2),
          seat(rowNum, 3),
          seat(rowNum, 4),
          seat(rowNum, 5),
          seat(rowNum, 6),
          seat(rowNum, 7),
          seat(rowNum, 8),
          seat(rowNum, 9),
          seat(rowNum, 10),
        ],
      ),
    );
  }

  // 좌석 하나
  Widget seat(int rowNum, int colNum) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: GestureDetector(
          //좌석 선택 시 반응 추가
          onTap: () {
            onSelected(rowNum, colNum);
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                // 선택한 죄석과 rowNum이 같으면 amber, 아니면 grey (선택한 좌석 컬러 amber주기)
                color: rowNum == selectedRow && colNum == selectedCol
                    ? Colors.amber
                    : Colors.grey,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
