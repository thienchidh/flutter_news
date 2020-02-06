import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_news/main.dart';
import 'package:flutter_news/model/drawer_model.dart';
import 'package:meta/meta.dart';

@immutable
class DrawerState {
  final DrawerModel model;

  DrawerState({
    @required this.model,
  });

  DrawerState copyOf({model}) {
    return DrawerState(
      model: model ?? this.model,
    );
  }

  static DrawerState initialize() {
    return DrawerState(
      model: DrawerModel(
        header: DrawerHeaderModel(title: "Title of header"),
        items: UnmodifiableListView<DrawerBodyModel>([
          DrawerBodyModel(
            icon: Icon(Icons.add),
            title: "home page",
            routeName: RoutesName.HOME_PAGE,
          ),
          DrawerBodyModel(
            icon: Icon(Icons.filter_9_plus),
            title: "news page",
            routeName: RoutesName.NEWS_PAGE,
          ),
          DrawerBodyModel(
            icon: Icon(Icons.add),
            title: "Detail page",
            routeName: RoutesName.DETAIL_NEWS_PAGE,
          ),
        ]),
      ),
    );
  }
}
