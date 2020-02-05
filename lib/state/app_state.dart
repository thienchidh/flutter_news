import 'package:meta/meta.dart';

import 'home_screen_state.dart';

@immutable
class AppState {
  final HomeScreenState homeScreenState;

  AppState({
    @required this.homeScreenState,
  });

  AppState copyOf({HomeScreenState homePageState}) {
    return AppState(
      homeScreenState: homePageState ?? this.homeScreenState,
    );
  }

  static init() {
    return AppState(
      homeScreenState: HomeScreenState.init(),
    );
  }
}
