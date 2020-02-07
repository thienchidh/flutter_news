import 'package:flutter_news/redux/action/action_bind.dart';
import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/video_page_state.dart';
import 'package:redux/redux.dart';

final videoPageReducer = combineReducers<VideoPageState>([
  TypedReducer<VideoPageState, ActionVideoLoadMore>(_loadMoreVideoReducer),
  TypedReducer<VideoPageState, ActionChangeVideoListViewPosition>(
      _changeVideoListViewPositionReducer),
  TypedReducer<VideoPageState, ActionVideoBindBackToTopFunc>(
      _bindVideoBackToTopFunc),
]);

VideoPageState _loadMoreVideoReducer(
    VideoPageState state, ActionVideoLoadMore action) {
  return state.copyOf(isLoading: true);
}

VideoPageState _changeVideoListViewPositionReducer(
    VideoPageState state, ActionChangeVideoListViewPosition action) {
  return state.copyOf(currentScrollOffset: action.pixel);
}

VideoPageState _bindVideoBackToTopFunc(
    VideoPageState state, ActionVideoBindBackToTopFunc action) {
  return state.copyOf(backToTop: action.backToTop);
}
