import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/home_screen_state.dart';
import 'package:redux/redux.dart';

final homeScreenStateReducer = combineReducers<HomeScreenState>([
  // TODO
  TypedReducer<HomeScreenState, ActionVideoLoadMore>(_x),
]);

HomeScreenState _x(HomeScreenState state, ActionVideoLoadMore action) {
  return state;
}
