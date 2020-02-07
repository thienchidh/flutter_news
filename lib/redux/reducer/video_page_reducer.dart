import 'package:flutter_news/redux/action/action_bind.dart';
import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/video_page_state.dart';
import 'package:redux/redux.dart';

final videoPageReducer = combineReducers<VideoPageState>([
  TypedReducer<VideoPageState, ActionVideoLoadMoreLoading>(
      _loadMoreVideoReducer),
  TypedReducer<VideoPageState, ActionVideoLoadMoreSuccess>(
      _loadMoreVideoSuccessReducer),
  TypedReducer<VideoPageState, ActionVideoLoadMoreError>(
      _loadMoreVideoErrorReducer),
  TypedReducer<VideoPageState, ActionChangeVideoListViewPosition>(
      _changeVideoListViewPositionReducer),
  TypedReducer<VideoPageState, ActionVideoBindBackToTopFunc>(
      _bindVideoBackToTopFunc),
]);

VideoPageState _loadMoreVideoReducer(
    VideoPageState state, ActionVideoLoadMoreLoading action) {
  return state.copyOf(
    isLoading: true,
    isError: false,
    error: null,
  );
}

VideoPageState _loadMoreVideoSuccessReducer(
    VideoPageState state, ActionVideoLoadMoreSuccess action) {
  return state.copyOf(
    isLoading: false,
    model: action.data,
    isError: false,
    error: null,
  );
}

VideoPageState _loadMoreVideoErrorReducer(
    VideoPageState state, ActionVideoLoadMoreError action) {
  return state.copyOf(
    isLoading: false,
    isError: true,
    error: action.error,
  );
}

VideoPageState _changeVideoListViewPositionReducer(
    VideoPageState state, ActionChangeVideoListViewPosition action) {
  return state.copyOf(currentScrollOffset: action.pixel);
}

VideoPageState _bindVideoBackToTopFunc(
    VideoPageState state, ActionVideoBindBackToTopFunc action) {
  return state.copyOf(backToTop: action.backToTop);
}
