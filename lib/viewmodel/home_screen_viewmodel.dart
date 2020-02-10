import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/model/home_screen_model/home_screen_model.dart';
import 'package:flutter_news/model/page_model/page_model.dart';
import 'package:flutter_news/redux/action/action_bind.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class HomeScreenViewModel {
  final HomeScreenModel screenModel;
  final void Function(void Function()) bindBackToTopFunc;
  final void Function(void Function(double)) bindScrollToFunc;

  HomeScreenViewModel({
    @required this.screenModel,
    @required this.bindBackToTopFunc,
    @required this.bindScrollToFunc,
  });

  String get title => screenModel.title;

  List<PageModel> get pagesModel => screenModel.pagesModel;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeScreenViewModel &&
          runtimeType == other.runtimeType &&
          screenModel == other.screenModel &&
          bindBackToTopFunc == other.bindBackToTopFunc &&
          bindScrollToFunc == other.bindScrollToFunc;

  @override
  int get hashCode =>
      screenModel.hashCode ^
      bindBackToTopFunc.hashCode ^
      bindScrollToFunc.hashCode;

  static HomeScreenViewModel fromStore(Store<AppState> store) {
    final state = store.state.homeScreenState;

    return HomeScreenViewModel(
      screenModel: state.model,
      bindBackToTopFunc: (func) {
        store.dispatch(ActionBindBackToTopFunc(func));
      },
      bindScrollToFunc: (func) {
        store.dispatch(ActionBindScrollFunc(func));
      },
    );
  }
}
