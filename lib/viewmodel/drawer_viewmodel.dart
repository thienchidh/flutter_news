import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/model/drawer_model.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class DrawerViewModel {
  final DrawerModel drawerModel;

  DrawerViewModel({@required this.drawerModel});

  static DrawerViewModel fromStore(Store<AppState> store) {
    return DrawerViewModel(
      drawerModel: store.state.drawerState.model,
    );
  }
}
