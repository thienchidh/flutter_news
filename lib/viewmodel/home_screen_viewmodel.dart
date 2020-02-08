import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/model/home_screen_model.dart';
import 'package:flutter_news/redux/action/action_bind.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class HomeScreenViewModel {
  final String title;
  final UnmodifiableListView<PageModel> pagesModel;
  final HomeScreenModel screenModel;
  final void Function(void Function()) bindBackToTopFunc;
  final void Function(void Function(double)) bindScrollToFunc;

  HomeScreenViewModel({
    @required this.title,
    @required this.screenModel,
    @required this.pagesModel,
    @required this.bindBackToTopFunc,
    @required this.bindScrollToFunc,
  });

  static HomeScreenViewModel fromStore(Store<AppState> store) {
    final state = store.state.homeScreenState;
    final model = state.model;

    return HomeScreenViewModel(
      screenModel: model,
      title: model.title,
      pagesModel: model.pagesModel,
      bindBackToTopFunc: (func) {
        store.dispatch(ActionBindBackToTopFunc(func));
      },
      bindScrollToFunc: (func) {
        store.dispatch(ActionBindScrollFunc(func));
      },
    );
  }
}
