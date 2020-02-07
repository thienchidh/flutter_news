import 'package:flutter_news/redux/action/action_bind.dart';
import 'package:flutter_news/redux/state/home_screen_state.dart';
import 'package:redux/redux.dart';

final homeScreenStateReducer = combineReducers<HomeScreenState>([
  // TODO
  TypedReducer<HomeScreenState, ActionBindBackToTopFunc>(_bindBackToTopFunc),
]);

HomeScreenState _bindBackToTopFunc(
    HomeScreenState state, ActionBindBackToTopFunc action) {
  if (state.backToTop != action.backToTop) {
    return state.copyOf(backToTop: action.backToTop);
  }
  return state;
}
