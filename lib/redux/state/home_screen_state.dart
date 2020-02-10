import 'package:flutter/material.dart';
import 'package:flutter_news/model/home_screen_model/home_screen_model.dart';
import 'package:flutter_news/model/page_model/page_model.dart';
import 'package:flutter_news/view/page/news_page.dart';
import 'package:flutter_news/view/page/video_page.dart';
import 'package:meta/meta.dart';

@immutable
class HomeScreenState {
  final HomeScreenModel model;

  HomeScreenState({
    @required this.model,
  });

  HomeScreenState copyOf({HomeScreenModel model, void Function() backToTop}) {
    return HomeScreenState(
      model: model ?? this.model,
    );
  }

  static initialize() {
    return HomeScreenState(
      model: HomeScreenModel(
        title: "Home Page",
        pagesModel: List<PageModel>.unmodifiable([
          PageModel(
            title: "News",
            icon: Icon(Icons.event_note),
            page: NewsPage(),
          ),
          PageModel(
            title: "Videos",
            icon: Icon(Icons.video_library),
            page: VideoPage(),
          ),
          PageModel(
            title: "Page 3",
            icon: Icon(Icons.details),
            page: Icon(Icons.details),
          ),
        ]),
      ),
    );
  }
}
