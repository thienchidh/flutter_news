import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/model/home_screen_model.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class HomeScreenViewModel {
  final HomeScreenModel screenModel;

  HomeScreenViewModel({
    @required this.screenModel,
  });

  static HomeScreenViewModel fromStore(Store<AppState> store) {
    final AppState appState = store.state;
    return HomeScreenViewModel(
      screenModel: appState.homeScreenState.model,
    );
  }
}
