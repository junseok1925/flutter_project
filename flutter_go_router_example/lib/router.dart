import 'package:flutter_go_router_example/pages/error_page.dart';
import 'package:flutter_go_router_example/pages/home_page.dart';
import 'package:flutter_go_router_example/pages/post_detail_page.dart';
import 'package:flutter_go_router_example/pages/post_list_page.dart';
import 'package:flutter_go_router_example/pages/search_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) {
    return ErrorPage();
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'post',
          builder: (context, state) => PostListPage(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = int.tryParse(state.pathParameters['id'] ?? '');
                if (id == null) {
                  return ErrorPage();
                }
                return PostDetailPage(id: id);
              },
            ),
          ],
        ),

        GoRoute(
          path: 'search',
          builder: (context, state) {
            //
            final text = state.uri.queryParameters['text'] ?? '';
            if (text.trim().isEmpty) {
              return ErrorPage();
            }
            return SearchPage(text: text);
          },
        ),
      ],
    ),
  ],
);
