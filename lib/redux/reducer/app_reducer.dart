import 'package:flutter_news/redux/reducer/drawer_reducer.dart';
import 'package:flutter_news/redux/reducer/home_screen_reducer.dart';
import 'package:flutter_news/redux/reducer/news_page_reducer.dart';
import 'package:flutter_news/redux/reducer/video_page_reducer.dart';
import 'package:flutter_news/redux/state/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    homeScreenState: homeScreenStateReducer(state.homeScreenState, action),
    drawerState: drawerReducer(state.drawerState, action),
    videoPageState: videoPageReducer(state.videoPageState, action),
    newsPageState: newsPageReducer(state.newsPageState, action),
  );
}
