import 'dart:convert';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('book model test', () {
    String dummyData = """
{
    "title": "Lieben kennt kein Alter (Harry)",
    "link": "https://search.shopping.naver.com/book/catalog/57232975287",
    "image": "https://shopping-phinf.pstatic.net/main_5723297/57232975287.20251015111529.jpg",
    "author": "",
    "discount": "30580",
    "publisher": "tredition",
    "pubdate": "20251010",
    "isbn": "9783384709325",
    "description": "Harry ist ein uberzeugter Junggeselle. Sein Leben ist sehr geregelt und ruhig. Bei einem Golfturnier lernt er Frieda kennen, die Ehefrau eines Golfkollegen. Frieda will in ihrem letzten Lebensabschnitt all das nachholen, was sie in ihrer Jugend verpasst hat. Sie hat eine To - do Liste geschrieben und an erster Stelle steht: Sex mit einem anderen Mann. Harry amusiert sich koniglich uber ihre Fantasie. Er macht sich lustig uber sie und flirtet mit ihr. Daraus wird mehr. Aber einfach ist es nie..."
  }
""";

    // 1. Map 으로 변환
    Map<String, dynamic> map = jsonDecode(dummyData);

    // 2. 객체로 변환
    Book book = Book.fromJson(map);

    expect(book.discount, '30580');
  });
}
