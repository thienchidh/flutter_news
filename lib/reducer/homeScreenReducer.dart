import 'package:flutter_news/state/home_screen_state.dart';
import 'package:redux/redux.dart';

final homeScreenStateReducer = combineReducers<HomeScreenState>([
  //TypedReducer<HomeScreenState, > (_changeXYZ)
]);

//TODO
HomeScreenState _changeXYZ(HomeScreenState state, dynamic action) {
  // TODO
  return state.copyOf();
}
