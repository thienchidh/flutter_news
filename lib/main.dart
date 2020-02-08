import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/redux/store/store.dart';
import 'package:flutter_news/view/screens/detail_screen.dart';
import 'package:flutter_news/view/screens/home_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(
      StoreProvider<AppState>(
        store: store,
        child: Application(),
      ),
    );

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesName.HOME_PAGE,
      routes: {
        RoutesName.HOME_PAGE: (context) => HomeScreen(),
        RoutesName.NEWS_PAGE: (context) => HomeScreen(),
        RoutesName.DETAIL_NEWS_PAGE: (context) => DetailScreen(),
      },
    );
  }
}

class RoutesName {
  static const String HOME_PAGE = "/";
  static const String NEWS_PAGE = "/news_page";
  static const String DETAIL_NEWS_PAGE = "/detail_news_page";
}
