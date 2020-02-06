import 'package:flutter_news/redux/reducer/drawer_reducer.dart';
import 'package:flutter_news/redux/state/app_state.dart';

import 'home_screen_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    homeScreenState: homeScreenStateReducer(state.homeScreenState, action),
    drawerState: drawerReducer(state.drawerState, action),
  );
}
