import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/redux/store/store.dart';
import 'package:flutter_news/view/screens/detail_screen.dart';
import 'package:flutter_news/view/screens/home_screen.dart';
import 'package:flutter_news/view/screens/photo_gallery.dart';
import 'package:flutter_news/view/screens/video_screen_detail.dart';
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
        RoutesName.PHOTO_GALLERY_PAGE: (context) => PhotoGallery(),
        RoutesName.VIDEO_DETAIL_PAGE: (context) =>
            VideoScreenDetail(
              model: ModalRoute
                  .of(context)
                  .settings
                  .arguments,
            ),
      },
    );
  }
}

class RoutesName {
  static const String HOME_PAGE = "/";
  static const String NEWS_PAGE = "/news_page";
  static const String DETAIL_NEWS_PAGE = "/detail_news_page";
  static const String PHOTO_GALLERY_PAGE = "/photo_gallery";
  static const String VIDEO_DETAIL_PAGE = "/video_detail_page";

  RoutesName._();
}
