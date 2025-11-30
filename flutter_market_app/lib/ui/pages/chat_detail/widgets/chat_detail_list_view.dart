import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/chat_detail_receive_item.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/chat_detail_send_item.dart';

class ChatDetailListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = [
      ChatDetailReceiveItem(
        imgUrl: 'https://picsum.photos/200/300',
        showProfile: true,
        content: '안녕',
        dateTime: DateTime.now(),
      ),
      ChatDetailSendItem(content: '응 안녕', dateTime: DateTime.now()),
      ChatDetailSendItem(content: '깎아줭', dateTime: DateTime.now()),
    ];

    return Expanded(
      child: ListView.separated(
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
        separatorBuilder: (context, index) => SizedBox(height: 6),

        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
