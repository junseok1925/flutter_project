import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  Book book;
  DetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title, maxLines: 1)),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(book.link)),
        // Flutter InAppWebView는 기본적으로 디바이스의 기본 user-agent (모바일용) 을 사용한다.
        // 따라서 아래 코드를 지우면 자동으로 모바일 웹으로 이동한다.

        // initialSettings: InAppWebViewSettings(
        // Windows용 Chrome 브라우저의 user agent
        //   userAgent:
        //       'Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36',
        // ),
      ),
    );
  }
}
