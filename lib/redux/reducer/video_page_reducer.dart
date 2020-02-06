import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/video_page_state.dart';
import 'package:redux/redux.dart';

final videoPageReducer = combineReducers<VideoPageState>([
  TypedReducer<VideoPageState, ActionVideoLoadMore>(_loadMoreVideoReducer),
]);

VideoPageState _loadMoreVideoReducer(
    VideoPageState state, ActionVideoLoadMore action) {
  return state.copyOf(isLoading: true);
}
