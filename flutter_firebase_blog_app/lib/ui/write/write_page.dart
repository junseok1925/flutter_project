import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/ui/write/write_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class WritePage extends ConsumerStatefulWidget {
  WritePage(this.post);
  final Post? post;

  @override
  ConsumerState<WritePage> createState() => _WritePageState();
}

class _WritePageState extends ConsumerState<WritePage> {
  // 제목,작성자,내용
  // 이 write 클래스가 전체 초기화 된 후에 컨트롤러 할당 되도록 late처리
  late TextEditingController writeController = TextEditingController(
    // 글 수정을 위해서, 새 글이면 null일테니 ''반환 아니면 그대로 써있는 텍스트 반환
    text: widget.post?.writer ?? '',
  );
  late TextEditingController titleController = TextEditingController(
    text: widget.post?.title ?? '',
  );
  late TextEditingController contentController = TextEditingController(
    text: widget.post?.content ?? '',
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void dispose() {
    writeController.dispose();
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ConsumerStatefulWidget은 widget.으로 가져와야 함
    final writeState = ref.watch(writeViewModelProvider(widget.post));
    final vm = ref.read(writeViewModelProvider(widget.post).notifier);
    if (writeState.isWriting) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
              onTap: () async {
                //
                print('완료 클릭됨');
                //TextFormField의 값이 유효성에 맞으면 true, 아니면 false 반환
                final result =
                    formKey.currentState?.validate() ??
                    false; // currentState가 null이면 false

                if (result) {
                  final insertResult = await vm.insert(
                    writer: writeController.text,
                    title: titleController.text,
                    content: contentController.text,
                  );
                  // 글 작성(insert)이 정상적으로 된다면
                  if (insertResult) {
                    Navigator.pop(context);
                  }
                }
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
                child: GestureDetector(
                  onTap: () async {
                    //image_picker 객체 생성
                    ImagePicker imagePicker = ImagePicker();
                    //image_picker 객체의 pickImage메서드 호출
                    XFile? xFile = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    print('경로 : ${xFile?.path}');
                    if (xFile != null) {
                      //
                      vm.uploadImage(xFile);
                    }
                  },
                  child: writeState.imageUrl == null
                      ? Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: Icon(Icons.image),
                        )
                      : SizedBox(
                          height: 100,
                          child: Image.network(writeState.imageUrl!),
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
