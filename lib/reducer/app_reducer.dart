import 'package:flutter_news/reducer/homeScreenReducer.dart';
import 'package:flutter_news/state/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    homeScreenState: homeScreenStateReducer(state.homeScreenState, action),
  );
}
