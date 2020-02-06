import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/drawer_state.dart';
import 'package:redux/redux.dart';

final drawerReducer = combineReducers<DrawerState>([
  //TODO
  TypedReducer<DrawerState, ActionVideoLoadMore>(_x),
]);

DrawerState _x(DrawerState state, ActionVideoLoadMore action) {
  return state;
}
