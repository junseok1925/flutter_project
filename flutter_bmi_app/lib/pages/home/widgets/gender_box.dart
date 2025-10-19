import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  GenderBox(this.isMale, this.onChanged);

  bool isMale;
  void Function(bool newValue) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        gender(context, Icons.male, '남성', isMale, true),
        SizedBox(width: 10),
        gender(context, Icons.female, '여성', !isMale, false),
      ],
    );
  }

  Widget gender(
    BuildContext context,
    IconData icon,
    String text,
    bool selected, // 클릭 여부
    bool isMaleBox, // 선택된 박스가 여자인지 남자인지 구분하기 위해 저장
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onChanged(isMaleBox);
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Stack(
            //
            children: [
              Positioned(
                top: 10,
                left: 10,
                // 투명도
                child: Opacity(
                  opacity: selected ? 1 : 0.3, // 0~1
                  child: Icon(icon, size: 80),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Opacity(
                  opacity: selected ? 1 : 0.5,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
