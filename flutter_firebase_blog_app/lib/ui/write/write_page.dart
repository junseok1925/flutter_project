import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  // 제목,작성자,내용
  TextEditingController writeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void dispose() {
    writeController.dispose();
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면 클릭시 키보드 내려가도록 GestureDetector로 전체를 감쌓음
    return GestureDetector(
      // 탭하면 키보드 내려가도록
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                //
                print('완료 클릭됨');
                //TextFormField의 값이 유효성에 맞으면 true, 아니면 false 반환
                final result =
                    formKey.currentState?.validate() ??
                    false; // currentState가 null이면 false
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  '완료',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              TextFormField(
                controller: writeController,
                // 키보드에 완료 버튼 생성
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: '작성자'),
                validator: (value) {
                  // 문자열의 앞,뒤 공백을 지워줌
                  if (value?.trim().isEmpty ?? true) {
                    return '작성자를 입력하시오.';
                  }
                  // 유효성 검사 성공
                  return null;
                },
              ),
              TextFormField(
                controller: titleController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: '제목'),
                validator: (value) {
                  // 문자열의 앞,뒤 공백을 지워줌
                  if (value?.trim().isEmpty ?? true) {
                    return '제목을 입력하시오.';
                  }
                  // 유효성 검사 성공
                  return null;
                },
              ),
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: contentController,
                  maxLines: null, // 반드시 null로 할당 (개행할 때 - 다음줄로 넘어갈때)
                  expands: true, // 부모 위젯의 크기까지 크기 차지 - 반드시 크기를 늘릴려면 설정 필요
                  textInputAction: TextInputAction.newline, // 다음줄로 넘김 (개행)
                  decoration: InputDecoration(hintText: '내용'),
                  validator: (value) {
                    // 문자열의 앞,뒤 공백을 지워줌
                    if (value?.trim().isEmpty ?? true) {
                      return '내용을 입력하시오.';
                    }
                    // 유효성 검사 성공
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30),
              // ListView위젯의 자식은 크기를 설정해도 가로 최대크기로 늘어남, 정렬위젯(Align)으로 감싸서 정렬이 필요함
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Icon(Icons.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
