import 'package:flutter_news/redux/state/drawer_state.dart';
import 'package:flutter_news/redux/state/news_page_state.dart';
import 'package:flutter_news/redux/state/video_page_state.dart';
import 'package:meta/meta.dart';

import 'home_screen_state.dart';

@immutable
class AppState {
  final HomeScreenState homeScreenState;
  final DrawerState drawerState;
  final NewsPageState newsPageState;
  final VideoPageState videoPageState;

  AppState({
    @required this.homeScreenState,
    @required this.drawerState,
    @required this.newsPageState,
    @required this.videoPageState,
  });

  AppState copyOf({
    HomeScreenState homePageState,
    DrawerState drawerState,
    NewsPageState newsPageState,
    VideoPageState videoPageState,
  }) {
    return AppState(
      homeScreenState: homePageState ?? this.homeScreenState,
      drawerState: drawerState ?? this.drawerState,
      newsPageState: newsPageState ?? this.newsPageState,
      videoPageState: videoPageState ?? this.videoPageState,
    );
  }

  static init() {
    return AppState(
      homeScreenState: HomeScreenState.initialize(),
      drawerState: DrawerState.initialize(),
      newsPageState: NewsPageState.initialize(),
      videoPageState: VideoPageState.initialize(),
    );
  }
}
