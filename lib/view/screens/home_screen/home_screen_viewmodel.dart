import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/viewmodel/drawer_viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class ScreenViewModel {
  final String title;
  final DrawerViewModel drawerViewModel;

  ScreenViewModel({
    @required this.title,
    @required this.drawerViewModel,
  });
}

@immutable
class HomeScreenViewModel extends ScreenViewModel {
  final List<PageViewModel> pagesViewModel;

  HomeScreenViewModel({
    @required this.pagesViewModel,
    @required drawerViewModel,
    @required String title,
  }) : super(title: title, drawerViewModel: drawerViewModel);

  static HomeScreenViewModel defaultValue() {
    return HomeScreenViewModel(
      title: "Home Page",
      drawerViewModel: DrawerViewModel.defaultValue(),
      pagesViewModel: <PageViewModel>[
        PageViewModel(
          title: "Page 1",
//          icon: Icon(Icons.home),
          page: Icon(Icons.home),
        ),
        PageViewModel(
          title: "Page 2",
//          icon: Icon(Icons.details),
          page: Icon(Icons.details),
        ),
        PageViewModel(
//          title: "Page 3",
          icon: Icon(Icons.details),
          page: Icon(Icons.details),
        ),
      ],
    );
  }

  static HomeScreenViewModel fromStore(Store store) {
    return defaultValue();
    // TODO
//    store.state.homeScreenState;
  }
}

@immutable
class PageViewModel {
  final String title;
  final Icon icon;
  final Widget page;

  PageViewModel({
    this.title,
    this.icon,
    @required this.page,
  }) : assert(title != null || icon != null);
}
