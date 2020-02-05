import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/main.dart';
import 'package:flutter_news/model/DrawerModel.dart';
import 'package:meta/meta.dart';

@immutable
class DrawerViewModel {
  final DrawerHeaderModel header;
  final List<DrawerBodyModel> items;

  DrawerViewModel({
    @required this.header,
    @required this.items,
  });

  static DrawerViewModel defaultValue() {
    return DrawerViewModel(
      header: DrawerHeaderModel(title: "Title of header"),
      items: <DrawerBodyModel>[
        DrawerBodyModel(
          icon: Icon(Icons.add),
          title: "home page",
          routeName: RoutesName.HOME_PAGE,
        ),
        DrawerBodyModel(
          icon: Icon(Icons.add),
          title: "news page",
          routeName: RoutesName.NEWS_PAGE,
        ),
        DrawerBodyModel(
          icon: Icon(Icons.add),
          title: "Detail page",
          routeName: RoutesName.DETAIL_NEWS_PAGE,
        ),
      ],
    );
  }
}
