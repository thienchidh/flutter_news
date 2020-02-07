import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/common_drawer.dart';
import 'package:flutter_news/viewmodel/home_screen_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) =>
          HomeScreenViewModel.fromStore(store),
      builder: (BuildContext context, HomeScreenViewModel viewModel) {
        return DefaultTabController(
          length: viewModel.pagesModel.length,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: viewModel.backToTop,
              child: Icon(Icons.keyboard_arrow_up),
              mini: true,
              isExtended: true,
            ),
            drawer: CommonDrawer(),
            appBar: AppBar(
              title: Text(viewModel.title),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  ...viewModel.pagesModel.map((pageModel) => Tab(
                        icon: pageModel.icon,
                        text: pageModel.title,
                      )),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ...viewModel.pagesModel
                    .map((pageViewModel) => pageViewModel.page),
              ],
            ),
          ),
        );
      },
    );
  }
}
